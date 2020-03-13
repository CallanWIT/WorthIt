local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local self = nil

local function UpdateItemList()
    self.ItemList:ReleaseChildren()

    for _, item in pairs(self.Data.Results) do
        local container = AceGUI:Create("SimpleGroup")
        container:SetFullWidth(true)
        container:SetLayout("Flow")

        local value = core.TSMHelper.GetItemPrice(item.Id) or core.TSMHelper.GetItemVendorSellPrice(item.Id) or 0

        local itemLabel = AceGUI:Create("InteractiveLabel")
        itemLabel:SetWidth(350)
        itemLabel:SetText(string.format("%sx%d %s", core.TSMHelper.GetItemLink(item.Id), item.Quantity, value > 0 and core.TSMHelper.ToMoneyString(value * item.Quantity) or ''))
        itemLabel:SetCallback("OnEnter", function()
            GameTooltip:SetOwner(itemLabel.frame, "ANCHOR_PRESERVE")
	        GameTooltip:ClearAllPoints()
	        GameTooltip:SetPoint("LEFT", itemLabel.frame, "RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:SetHyperlink("item:" .. item.Id)
            GameTooltip:Show()
        end)
        itemLabel:SetCallback("OnLeave", function()
            GameTooltip:Hide()
        end)
        container:AddChild(itemLabel)

        local quantityTextBox = AceGUI:Create("EditBox")
        quantityTextBox:SetWidth(50)
        quantityTextBox:SetText(item.Quantity)
        quantityTextBox:SetCallback("OnEnterPressed", function()
            local text = quantityTextBox:GetText()
            local number = text and tonumber(text)
            if text and number and number > 0 then
                item.Quantity = number
                itemLabel:SetText(string.format("%sx%d", core.TSMHelper.GetItemLink(item.Id), item.Quantity))
            else
                quantityTextBox:SetText(item.Quantity)
            end
        end)
        container:AddChild(quantityTextBox)

        local removeButton = AceGUI:Create("InteractiveLabel")
        removeButton:SetText("|cFFFF0808X")
        removeButton:SetWidth(removeButton.label:GetStringWidth() + 5)
        removeButton:SetCallback("OnClick", function()
            if not IsShiftKeyDown() then return end
            local farms = core.Config.GetUserFarms()

            for i, it in pairs(self.Data.Results) do
                if it.Id == item.Id then
                    tremove(self.Data.Results, i)
                end
            end

            UpdateItemList()
        end)
        removeButton:SetCallback("OnEnter", function()
            GameTooltip:SetOwner(removeButton.frame, "ANCHOR_PRESERVE")
	        GameTooltip:ClearAllPoints()
	        GameTooltip:SetPoint("LEFT", removeButton.frame, "RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(core.GetString("ShiftToRemove"))
            GameTooltip:Show()
        end)
        removeButton:SetCallback("OnLeave", function()
            GameTooltip:Hide()
        end)
        container:AddChild(removeButton)

        self.ItemList:AddChild(container)
    end
end

local function UpdateLocation()
    local location = ""

    if self.Data.MapId then
        location = C_Map.GetMapInfo(self.Data.MapId).name
    end

    self.LocationLabel:SetText(string.format(core.GetString("LocationLabelFormat"), location))
end

local function Save()
    local farms = core.Config.GetUserFarms()
    local data = core.TableHelper.DeepCopy(self.Data)

    for i, farm in pairs(farms) do
        if farm.Id == data.Id then
            tremove(farms, i)
        end
    end

    table.insert(farms, data)

    core.UserDataModule.ClearCache()
    core.DashboardModule.ClearCache()

    if core.UI.MainWindow.CurrentModule() == core.UserDataModule then
        core.UI.MainWindow.ShowModule(core.UserDataModule)
    elseif core.UI.MainWindow.CurrentModule() == core.DashboardModule then
        core.UI.MainWindow.ShowModule(core.DashboardModule)
    end
end

local function UpdateUI()
    UpdateItemList()

    UpdateLocation()

    self.SaveButton:SetDisabled(not (self.Data.ItemId or self.Data.Name or self.Data.NameMapId))

    self.Duration:SetText(math.ceil(self.Data.Time / 60))

    local gold = math.floor(self.Data.Money / 10000)
    local silver = math.floor((self.Data.Money - gold * 10000) / 100)
    local copper = self.Data.Money - gold * 10000 - silver * 100

    self.Gold:SetText(gold)
    self.Silver:SetText(silver)
    self.Copper:SetText(copper)

    self.NameTabs:SelectTab(self.Data.ItemId and "item" or self.Data.NameMapId and "location" or "text")
end

local function Show(data)
    self.Data = data

    UpdateUI()
end

local function SetItem()
    local type, id, link = GetCursorInfo()
	if type == 'item' and id ~= core.TSMHelper.PetCageItemId then
        self.ItemIcon:SetImageSize(64, 64)
        self.ItemIcon:SetFullWidth(false)
        self.ItemIcon:SetImage(GetItemIcon(id))
        self.Data.ItemId = id
	end

    self.SaveButton:SetDisabled(not (self.Data.ItemId or self.Data.Name or self.Data.NameMapId))
end

local function SetName()
    self.Data.Name = self.NameEditor:GetText()

    self.SaveButton:SetDisabled(not (self.Data.ItemId or self.Data.Name or self.Data.NameMapId))
end

local function SetDuration()
    local text = self.Duration:GetText()
    local number = text and tonumber(text)

    if text and number then
        self.Data.Time = number * 60
    else
        self.Duration:SetText(math.ceil(self.Data.Time / 60))
    end

    self.SaveButton:SetDisabled(not (self.Data.ItemId or self.Data.Name or self.Data.NameMapId))
end

local function AddItem()
    local type, id = GetCursorInfo()
	if type == 'item' and id ~= core.TSMHelper.PetCageItemId then
        local item
        for _, i in pairs(self.Data.Results) do
            if i.Id == id then
                item = i
            end
        end

        if item then
            item.Quantity = item.Quantity + 1
        else
            table.insert(self.Data.Results, { Id = id, Quantity = 1 })
        end

        UpdateItemList()
	end
end

local function SetCurrentLocation()
    local mapId = C_Map.GetBestMapForUnit("player")
    local location = C_Map.GetMapInfo(mapId).name
    self.LocationLabel:SetText(string.format(core.GetString("LocationLabelFormat"), location))

    self.Data.MapId = mapId
end

local function SwitchMode(nameContainer, mode)
    nameContainer:ReleaseChildren()

    if mode == "location" then
        local locationLabel = AceGUI:Create("Label")
        locationLabel:SetFullWidth(true)
        nameContainer:AddChild(locationLabel)

        local locationButton = AceGUI:Create("Button")
        locationButton:SetText(core.GetString("SetCurrent"))
        locationButton:SetFullWidth(true)
        locationButton:SetCallback("OnClick", function()
            local mapId = C_Map.GetBestMapForUnit("player")
            local location = C_Map.GetMapInfo(mapId).name
            locationLabel:SetText(location)

            self.Data.NameMapId = mapId
        end)
        nameContainer:AddChild(locationButton)

        self.Data.Name = nil
        self.Data.ItemId = nil
        self.Data.NameMapId = self.Data.NameMapId or C_Map.GetBestMapForUnit("player")

        local location = C_Map.GetMapInfo(self.Data.NameMapId).name
        locationLabel:SetText(location)

        self.SaveButton:SetDisabled(false)
    elseif mode == "item" then
        self.ItemIcon = AceGUI:Create("Icon")
        self.ItemIcon:SetImageSize(500, 64)
        self.ItemIcon:SetFullWidth(true)
        self.ItemIcon:SetCallback("OnClick", SetItem)
        self.ItemIcon:SetCallback("OnEnter", function()
            GameTooltip:SetOwner(self.ItemIcon.frame, "ANCHOR_PRESERVE")
	        GameTooltip:ClearAllPoints()
	        GameTooltip:SetPoint("LEFT", self.ItemIcon.frame, "RIGHT")
            GameTooltip:ClearLines()
            if self.Data.ItemId ~= nil then
                GameTooltip:SetHyperlink("item:" .. self.Data.ItemId)
            else
                GameTooltip:AddLine(core.GetString("DropItemLocationLabel"))
            end
            GameTooltip:Show()
        end)
        self.ItemIcon:SetCallback("OnLeave", function()
            GameTooltip:Hide()
        end)
        nameContainer:AddChild(self.ItemIcon)
        
        self.Data.Name = nil
        self.Data.NameMapId = nil

        if self.Data.ItemId ~= nil then
            self.ItemIcon:SetImageSize(64, 64)
            self.ItemIcon:SetImage(GetItemIcon(self.Data.ItemId))
        end
    else
        self.NameEditor = AceGUI:Create("EditBox")
        self.NameEditor:SetWidth(400)
        self.NameEditor:SetCallback("OnEnterPressed", SetName)
        nameContainer:AddChild(self.NameEditor)
        
        self.Data.ItemId = nil
        self.Data.NameMapId = nil

        if self.Data.Name ~= nil then
            self.NameEditor:SetText(self.Data.Name)
        end
    end

    self.SaveButton:SetDisabled(not (self.Data.ItemId or self.Data.Name or self.Data.NameMapId))
end

local function DrawEditorFrame(frame)
    local nameContainer = AceGUI:Create("TabGroup")
    self.NameTabs = nameContainer
    nameContainer:SetTitle(core.GetString("Name"))
    nameContainer:SetFullWidth(true)
    nameContainer:SetAutoAdjustHeight(false)
    nameContainer:SetHeight(120)
    nameContainer:SetTabs({
        { text = core.GetString("Text"), value = "text" },
        { text = core.GetString("Item"), value = "item" },
        { text = core.GetString("Location"), value = "location" }
    })
    nameContainer:SelectTab("text")
    nameContainer:SetCallback("OnGroupSelected", function(container, event, group) SwitchMode(nameContainer, group) end)
    frame:AddChild(nameContainer)

    self.Duration = AceGUI:Create("EditBox")
    self.Duration:SetLabel(core.GetString("DurationLabel"))
    self.Duration:SetWidth(400)
    self.Duration:SetCallback("OnEnterPressed", SetDuration)
    frame:AddChild(self.Duration)

    local locationContainer = AceGUI:Create("SimpleGroup")
    locationContainer:SetFullWidth(true)
    locationContainer:SetLayout("Flow")
    frame:AddChild(locationContainer)

    self.LocationLabel = AceGUI:Create("Label")
    self.LocationLabel:SetWidth(350)
    locationContainer:AddChild(self.LocationLabel)

    self.SetLocationButton = AceGUI:Create("Button")
    self.SetLocationButton:SetText(core.GetString("SetCurrent"))
    self.SetLocationButton:SetWidth(150)
    self.SetLocationButton:SetCallback("OnClick", SetCurrentLocation)
    locationContainer:AddChild(self.SetLocationButton)

    self.AddItemIcon = AceGUI:Create("Icon")
    self.AddItemIcon:SetLabel(core.GetString("AddItem"))
    self.AddItemIcon:SetImageSize(500, 64)
    self.AddItemIcon:SetFullWidth(true)
    self.AddItemIcon:SetCallback("OnClick", AddItem)
    frame:AddChild(self.AddItemIcon)

    local container = AceGUI:Create("SimpleGroup")
    container:SetFullWidth(true)
    container:SetHeight(120)
    container:SetLayout("Fill")
    frame:AddChild(container)

    self.ItemList = AceGUI:Create("ScrollFrame")
    self.ItemList:SetFullWidth(true)
    self.ItemList:SetFullHeight(true)
    container:AddChild(self.ItemList)

    local moneyContainer = AceGUI:Create("InlineGroup")
    moneyContainer:SetFullWidth(true)
    moneyContainer:SetLayout("Flow")
    moneyContainer:SetTitle(core.GetString("RawGold"))
    frame:AddChild(moneyContainer)

    self.Gold = AceGUI:Create("EditBox")
    self.Gold:SetWidth(100)
    self.Gold:SetCallback("OnEnterPressed", function()
        local gold = math.floor(self.Data.Money / 10000)
        local silver = math.floor((self.Data.Money - gold * 10000) / 100)
        local copper = self.Data.Money - gold * 10000 - silver * 100
        local text = self.Gold:GetText()
        local number = text and tonumber(text)
        if text and number then
            self.Data.Money = number * 10000 + silver * 100 + copper
        else
            self.Gold:SetText(gold)
        end
    end)
    moneyContainer:AddChild(self.Gold)

    self.Silver = AceGUI:Create("EditBox")
    self.Silver:SetWidth(50)
    self.Silver:SetCallback("OnEnterPressed", function()
        local gold = math.floor(self.Data.Money / 10000)
        local silver = math.floor((self.Data.Money - gold * 10000) / 100)
        local copper = self.Data.Money - gold * 10000 - silver * 100
        local text = self.Silver:GetText()
        local number = text and tonumber(text)
        if text and number and number <= 99 then
            self.Data.Money = gold * 10000 + number * 100 + copper
        else
            self.Silver:SetText(silver)
        end
    end)
    moneyContainer:AddChild(self.Silver)

    self.Copper = AceGUI:Create("EditBox")
    self.Copper:SetWidth(50)
    self.Copper:SetCallback("OnEnterPressed", function()
        local gold = math.floor(self.Data.Money / 10000)
        local silver = math.floor((self.Data.Money - gold * 10000) / 100)
        local copper = self.Data.Money - gold * 10000 - silver * 100
        local text = self.Copper:GetText()
        local number = text and tonumber(text)
        if text and number and number <= 99 then
            self.Data.Money = gold * 10000 + silver * 100 + number
        else
            self.Copper:SetText(copper)
        end
    end)
    moneyContainer:AddChild(self.Copper)

    self.SaveButton = AceGUI:Create("Button")
    self.SaveButton:SetText(core.GetString("Save"))
    self.SaveButton:SetFullWidth(true)
    self.SaveButton:SetCallback("OnClick", Save)
    frame:AddChild(self.SaveButton)
end

function core.Editor(frame)    
    self = {}

    self.Frame = AceGUI:Create("SimpleGroup")
    frame:AddChild(self.Frame)

    DrawEditorFrame(self.Frame)

    self.Show = Show

    return self
end
