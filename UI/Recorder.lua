local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local ITEM_LINK_REGEX = "(.+)"
local ITEM_ID_REGEX = "(.+)Hitem:([0-9]+):(.+)"
local LOOT_ITEM_SELF_REGEX = LOOT_ITEM_SELF:gsub("%%s", ITEM_LINK_REGEX)
local LOOT_ITEM_SELF_MULTIPLE_REGEX = LOOT_ITEM_SELF_MULTIPLE:gsub("%%s", ITEM_LINK_REGEX):gsub("%%d", "(%%d+)")
local LOOT_ITEM_PUSHED_SELF_REGEX = LOOT_ITEM_PUSHED_SELF:gsub("%%s", ITEM_LINK_REGEX)
local LOOT_ITEM_PUSHED_SELF_MULTIPLE_REGEX = LOOT_ITEM_PUSHED_SELF_MULTIPLE:gsub("%%s", ITEM_LINK_REGEX):gsub("%%d", "(%%d+)")
local LOOT_ITEM_SELF_ITEMID_REGEX = LOOT_ITEM_SELF:gsub("%%s", ITEM_ID_REGEX)
local LOOT_ITEM_SELF_ITEMID_MULTIPLE_REGEX = LOOT_ITEM_SELF_MULTIPLE:gsub("%%s", ITEM_ID_REGEX):gsub("%%d", "(%%d+)")
local LOOT_ITEM_PUSHED_SELF_ITEMID_REGEX = LOOT_ITEM_PUSHED_SELF:gsub("%%s", ITEM_ID_REGEX)
local LOOT_ITEM_PUSHED_SELF_ITEMID_MULTIPLE_REGEX = LOOT_ITEM_PUSHED_SELF_MULTIPLE:gsub("%%s", ITEM_ID_REGEX):gsub("%%d", "(%%d+)")
local LOOT_ITEM_REGEX = LOOT_ITEM:gsub("%%s", ITEM_LINK_REGEX)
local LOOT_ITEM_MULTIPLE_REGEX = LOOT_ITEM_MULTIPLE:gsub("%%s", ITEM_LINK_REGEX):gsub("%%d", "(%%d+)")
local LOOT_ITEM_ITEMID_REGEX = LOOT_ITEM:gsub("%%s", ITEM_LINK_REGEX, 1):gsub("%%s", ITEM_ID_REGEX)
local LOOT_ITEM_ITEMID_MULTIPLE_REGEX = LOOT_ITEM_MULTIPLE:gsub("%%s", ITEM_LINK_REGEX, 1):gsub("%%s", ITEM_ID_REGEX):gsub("%%d", "(%%d+)")
local BPET_ID_REGEX = "Hbattlepet:(%d+):"

local GOLD_AMOUNT_REGEX = GOLD_AMOUNT:gsub("%%d", "(%%d+)")
local SILVER_AMOUNT_REGEX = SILVER_AMOUNT:gsub("%%d", "(%%d+)")
local COPPER_AMOUNT_REGEX = COPPER_AMOUNT:gsub("%%d", "(%%d+)")

local self = nil
local UpdateUI = nil

function core.NewCustomFarmId()
    return "C" .. string.format("%06d", math.random(1, 999999)) .. time()
end

local function NewSession()
    return {
        Id = core.NewCustomFarmId(),
        StartTime = nil,
        Time = 0,
        CurrentTime = nil,
        IsRunning = false,
        IsPaused = false,
        NameMapId = core.LocationHelper.GetPlayerCurrentMapId(),
        Mode = "location",
        MapId = core.LocationHelper.GetPlayerCurrentMapId(),
        Money = 0,
        IsCustom = true,
        Results = {}
    }
end

local function GetCurrentDuration()
    local seconds = self.Session.Time

    if self.Session.IsRunning then
        seconds = seconds + time() - self.Session.StartTime
    end

    return seconds
end

local function ResumeSession()
    if not self.Session.IsRunning then
        self.Session.IsRunning = true
        self.Session.IsPaused = false

        self.Session.StartTime = time()
        self.Session.CurrentTime = self.Session.StartTime
    end

    UpdateUI()
end

local function PauseSession()
    if self.Session.IsRunning then
        self.Session.IsRunning = false
        self.Session.IsPaused = true

        self.Session.Time = self.Session.Time + time() - self.Session.StartTime
        self.Session.StartTime = nil
    end

    UpdateUI()
end

local function StopSession()
    self.Session.IsPaused = false

    if self.Session.IsRunning then
        self.Session.IsRunning = false

        self.Session.Time = self.Session.Time + time() - self.Session.StartTime
        self.Session.StartTime = nil
    end

    UpdateUI()
end

UpdateUI = function()
    local seconds = GetCurrentDuration()
    local isFarmEnded = false
    if self.Session.IsRunning and self.Session.Timer and self.Session.Timer <= seconds then
        StopSession()
        PlaySound(15757, "master")
        return
    end

    if self.Session.Timer then
        seconds = self.Session.Timer - seconds
        if seconds <= 0 then
            isFarmEnded = true
            seconds = GetCurrentDuration()
        end
    end

    local hours = math.floor(seconds / 60 / 60)
    seconds = seconds - hours * 60 * 60
    local minutes = math.floor(seconds / 60)
    seconds = seconds - minutes * 60

    local timeResource = isFarmEnded and "FarmEndedFormat" or self.Session.Timer and "TimeLeftFormat" or "TimeLabelFormat"

    self.UI.TimeLabel:SetText(string.format(core.GetString(timeResource), hours, minutes, seconds))
    self.UI.TimeLabel:SetWidth(self.UI.TimeLabel.label:GetStringWidth() + 5)
    self.UI.ButtonsPanel:DoLayout()

    local location = ""

    if self.Session.MapId then
        location = core.LocationHelper.GetMapName(self.Session.MapId)
    end

    local name = self.Session.Mode == "location" and core.LocationHelper.GetMapName(self.Session.NameMapId)
        or self.Session.Mode == "item" and (self.Session.ItemLink or core.TSMHelper.GetItemLink(self.Session.ItemId))
        or self.Session.Name

    self.UI.TitleLabel:SetText(string.format(core.GetString("NameLabelFormat"), name))

    self.UI.LocationLabel:SetText(string.format(core.GetString("LocationLabelFormat"), location))

    self.UI.MoneyLabel:SetText(string.format(core.GetString("RawGoldLabelFormat"), core.TSMHelper.ToMoneyString(self.Session.Money)))

    local itemValue = 0

    for _, item in pairs(self.Session.Results) do
        local unitPrice = core.TSMHelper.GetItemPrice(item.Id == core.TSMHelper.PetCageItemId and 'p:'.. item.PetId or item.Id) or 0
        itemValue = itemValue + unitPrice * item.Quantity
    end

    self.UI.ItemValueLabel:SetText(string.format(core.GetString("ItemsValueLabelFormat"), core.TSMHelper.ToMoneyString(itemValue)))
    self.UI.TotalValueLabel:SetText(string.format(core.GetString(self.Mode == "Compact" and  "TotalValueLabelFormatCompact" or "TotalValueLabelFormat"), core.TSMHelper.ToMoneyString(itemValue + self.Session.Money)))
    self.UI.IsGroupFarmCheckBox:SetValue(self.Session.IsGroupFarm or false)
    self.UI.IsGroupFarmCheckBox:SetLabel(string.format(core.GetString(self.Session.IsGroupFarm and "TrackGroupLootPlayers" or "TrackGroupLoot"), self.Session.NumberOfPlayers or 1))

    local route = self.Session.RouteZone ~= nil and {
        Name = self.Session.RouteName,
        Data = self.Session.RouteData,
        Zone = { Id = self.Session.RouteZone, Name = C_Map.GetMapInfo(self.Session.RouteZone).name }
    } or nil
    self.UI.RoutePicker:SetValue(route)

    self.UI.PlayButton:Toggle(not self.Session.IsRunning and not isFarmEnded)
    self.UI.PauseButton:Toggle(self.Session.IsRunning)
    self.UI.StopButton:Toggle(self.Session.IsRunning or self.Session.IsPaused)

    self.LastUpdated = time()
end

local function ResetSession()
    self.Session = NewSession()
    core.Config.SetCurrentRecorderSession(self.Session)

    if self.UI.LootGrid then
        self.UI.LootGrid.Show(self.Session.Results)
    end

    UpdateUI()
end

local function NormaliseSession(session, createCopy)
    session = createCopy and core.TableHelper.DeepCopy(session) or session
    session.Mode = session.Mode or session.ItemId and "item" or session.NameMapId and "location" or "text"

    if session.Mode == "location" then
        session.Name = nil
        session.ItemId = nil
    elseif session.Mode == "item" then
        session.Name = nil
        session.NameMapId = nil
    else
        session.ItemId = nil
        session.NameMapId = nil
        session.Name = session.Name or ""
    end

    if session.Routes and #session.Routes == 1 then
        session.RouteZone = session.Routes[1].RouteZone
        session.RouteKey = session.Routes[1].RouteKey
        session.RouteName = session.Routes[1].RouteName
        session.RouteData = session.Routes[1].RouteData
        session.Routes = nil
    end

    return session
end

local function SetCurrentLocation()
    self.Session.MapId = core.LocationHelper.GetPlayerCurrentMapId()
    UpdateUI()
end

local function SetNameAsCurrentLocation()
    self.Session.NameMapId = core.LocationHelper.GetPlayerCurrentMapId()
    self.Session.ItemId = nil
    self.Session.PetId = nil
    self.Session.ItemLink = nil
    self.Session.Name = nil
    self.Session.Mode = "location"
    UpdateUI()
end

local function SetFarmName()
    local type, id, itemLink = GetCursorInfo()
	if type == 'item' then
        if id == core.TSMHelper.PetCageItemId then
            self.Session.PetId = tonumber(itemLink:match(BPET_ID_REGEX))
            self.Session.ItemLink = itemLink
        else
            self.Session.PetId = nil
            self.Session.ItemLink = nil
        end
        self.Session.ItemId = id
        self.Session.Name = nil
        self.Session.NameMapId = nil
        self.Session.Mode = "item"
        UpdateUI()
    else
        if IsShiftKeyDown() and self.Session.Mode == "item" and self.Session.ItemId then
            ChatEdit_InsertLink(self.Session.ItemLink or core.TSMHelper.GetItemLink(self.Session.ItemId))
            return
        end

        local onAccept = function(dialog)
            local name = dialog.editBox:GetText()

            if strlen(name) > 0 then
                self.Session.Name = name
                self.Session.ItemId = nil
                self.Session.PetId = nil
                self.Session.ItemLink = nil
                self.Session.NameMapId = nil
                self.Session.Mode = "text"
                UpdateUI()
            end
        end

        core.UI.ShowDialog({
            Text = core.GetString("SetFarmNameMessage"),
            Button1 = core.GetString("Set"),
            Button2 = core.GetString("Cancel"),
            Button3 = core.GetString("UseLocation"),
            HasEditBox = true,
            TextBoxValue = self.Session.Name or "",
            OnAccept = onAccept,
            OnAlt = SetNameAsCurrentLocation
        })
	end
end

local function SetRawGold()
    core.UI.InputDialog({ Text = core.GetString("ChangeRawGoldMessage"), HasEditBox = true, IsNumeric = true, TextBoxValue = tostring(self.Session.Money), OnAccept = function(dialog)
        local value = tonumber(dialog.editBox:GetText())
        if value ~= nil then
            self.Session.Money = value
            UpdateUI()
        end
    end })
end

local function SetTime()
    if self.Session.IsRunning then
        print(core.GetString("RecordingInProgress"))
        return
    end
    local currentTime = math.ceil(GetCurrentDuration() / 60)

    core.UI.InputDialog({ Text = core.GetString("SetTimeMessage"), HasEditBox = true, IsNumeric = true, TextBoxValue = tostring(currentTime), OnAccept = function(dialog)
        local value = tonumber(dialog.editBox:GetText())
        if value ~= nil then
            self.Session.Time = value * 60
            UpdateUI()
        end
    end })
end

local function SetTimer()
    if self.Session.IsRunning then
        print(core.GetString("RecordingInProgress"))
        return
    end
    local currentTimer = self.Session.Timer and math.ceil(self.Session.Timer / 60) or 60
    local onAccept = function(dialog)
        local value = tonumber(dialog.editBox:GetText())
        if value ~= nil and value ~= 0 then
            self.Session.Timer = value * 60
            UpdateUI()
        end
    end
    local onAlt = function(dialog)
        self.Session.Timer = nil
        UpdateUI()
    end

    core.UI.InputDialog({
        Text = core.GetString("SetTimerMessage"),
        Button3 = core.GetString("ClearTimer"),
        HasEditBox = true,
        IsNumeric = true,
        TextBoxValue = tostring(currentTimer),
        OnAccept = onAccept,
        OnAlt = onAlt
    })
end

function SortJunk(row)
    for _, item in pairs(core.TableHelper.ShallowCopy(self.Session.Results)) do
        if not item.PetId and core.ScrapHelper.IsJunk(item.Id) then
            local itemSellPrice = nil
            if item.ItemLink then
                _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(item.ItemLink)
            end
            itemSellPrice = itemSellPrice or core.TSMHelper.GetItemVendorSellPrice(item.Id)
            self.Session.Money = self.Session.Money + (itemSellPrice or 0) * (item.Quantity or 0)
            core.TableHelper.RemoveValue(self.Session.Results, item)
        end
    end

    self.UI.LootGrid.ClearCache()
    self.UI.LootGrid.Reload()
    UpdateUI()
end

local function SetIsGroupFarm(isGroup)
    if isGroup then
        self.UI.IsGroupFarmCheckBox:SetValue(false)
        core.UI.InputDialog({ Text = core.GetString("SetNumberOfPlayers"), HasEditBox = true, IsNumeric = true, TextBoxValue = self.Session.NumberOfPlayers or "5", OnAccept = function(dialog)
            local value = tonumber(dialog.editBox:GetText())
            if value ~= nil and value > 0 and value <= 50 then
                self.Session.NumberOfPlayers = value
                self.Session.IsGroupFarm = true
                UpdateUI()
            end
        end })
    else
        self.Session.IsGroupFarm = false
    end

    UpdateUI()
end

local function SetupRoute(session)
    if session.RouteZone and session.RouteKey and session.RouteName and session.RouteData then
        local route = {
            RouteZone = session.RouteZone,
            RouteKey = session.RouteKey,
            RouteName = session.RouteName,
            RouteData = session.RouteData
        }

        session.Routes = { route }
        session.RouteZone = nil
        session.RouteKey = nil
        session.RouteName = nil
        session.RouteData = nil
    end
end

local function Save()
    local farms = core.Config.GetUserFarms()
    local data = NormaliseSession(self.Session, true)
    SetupRoute(data)

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

local function OnRouteChanged(s, event, route)
    self.Session.RouteZone = route and route.Zone.Id or nil
    self.Session.RouteKey = route and route.Name:gsub("%s", "\255") or nil
    self.Session.RouteName = route and route.Name or nil
    self.Session.RouteData = route and route.Data or nil
end

local function ClearRoute()
    self.Session.RouteZone = nil
    self.Session.RouteKey = nil
    self.Session.RouteName = nil
    self.Session.RouteData = nil

    self.ImportedRouteLabel:SetText(GetRouteName())
end

local function ProcessItem(itemId, quantity, itemLink, itemRarity, bindType, itemSellPrice)
    local addItem = (bindType ~= 1 or core.TSMHelper.HasCustomPrice(itemId)) and not core.ScrapHelper.IsJunk(itemId) and itemRarity >= core.Config.GetRecorderMinQuality() and (core.TSMHelper.GetItemPrice(itemId) or -1) >= core.Config.GetRecorderMinPrice()

    if addItem then
        local item
        for _, i in pairs(self.Session.Results) do
            if i.Id == itemId then
                item = i
            end
        end

        if item then
            item.Quantity = item.Quantity + quantity
        else
            table.insert(self.Session.Results, { Id = itemId, Quantity = quantity, ItemLink = itemLink })
        end
    else
        self.Session.Money = self.Session.Money + (itemSellPrice or 0) * quantity
    end

    self.UI.LootGrid.ClearCache()
    self.UI.LootGrid.Reload()
    UpdateUI()
end

local function OnEvent(_, event, arg)
    if self.Session.IsPaused and (event == "CHAT_MSG_MONEY" or (event == "CHAT_MSG_LOOT" and arg:match(LOOT_ITEM_SELF_REGEX))) then
        ResumeSession()
    end

    if not self.Session.IsRunning then return end

	if event == "CHAT_MSG_LOOT" then
		local itemId, quantity, itemLink

        _, itemId, _, quantity = arg:match(LOOT_ITEM_SELF_ITEMID_MULTIPLE_REGEX)
        itemLink = arg:match(LOOT_ITEM_SELF_MULTIPLE_REGEX)

		if not itemId then
			_, itemId = arg:match(LOOT_ITEM_SELF_ITEMID_REGEX)
            itemLink, sss = arg:match(LOOT_ITEM_SELF_REGEX)
			quantity = 1
		end

		if not itemId then
            _, itemId, _, quantity = arg:match(LOOT_ITEM_PUSHED_SELF_ITEMID_MULTIPLE_REGEX)
            itemLink = arg:match(LOOT_ITEM_PUSHED_SELF_MULTIPLE_REGEX)
		end

		if not itemId then
            _, itemId, _, quantity = arg:match(LOOT_ITEM_PUSHED_SELF_ITEMID_REGEX)
            itemLink, sss = arg:match(LOOT_ITEM_PUSHED_SELF_REGEX)
			quantity = 1
		end

        if not itemId and self.Session.IsGroupFarm then
            _, _, itemId, _, quantity = arg:match(LOOT_ITEM_ITEMID_MULTIPLE_REGEX)
            _, itemLink = arg:match(LOOT_ITEM_MULTIPLE_REGEX)

		    if not itemId then
			    _, _, itemId = arg:match(LOOT_ITEM_ITEMID_REGEX)
                _, itemLink, sss = arg:match(LOOT_ITEM_REGEX)
			    quantity = 1
		    end
        end

        if itemId then
            itemId = tonumber(itemId)

            if type(quantity) == "string" then quantity = tonumber(quantity)  end

            local itemName, _, itemRarity, _, _, _, _, _, _, _, itemSellPrice, _, _, bindType = GetItemInfo(itemLink)
            
            if itemName ~= nil then
                ProcessItem(itemId, quantity, itemLink, itemRarity, bindType, itemSellPrice)
            else
                local queuedItem = {}

                for i, item in pairs(self.ItemQueue) do
                    if item.Id == itemId then
                        queuedItem = tremove(farms, i)
                    end
                end

                queuedItem.Id = itemId
                queuedItem.Quantity = (queuedItem.Quantity or 0) + quantity
                queuedItem.ItemLink = itemLink

                table.insert(self.ItemQueue, queuedItem)
            end
        end

        UpdateUI()
    elseif event == "GET_ITEM_INFO_RECEIVED" then
        for i, item in pairs(self.ItemQueue) do
            if item.Id == arg then
                local itemName, _, itemRarity, _, _, _, _, _, _, _, itemSellPrice, _, _, bindType = GetItemInfo(item.ItemLink)

                if itemName ~= nil then
                    ProcessItem(item.Id, item.Quantity, item.ItemLink, itemRarity, bindType, itemSellPrice)
                    tremove(self.ItemQueue, i)
                end
            end
        end
    elseif event == "CHAT_MSG_MONEY" then
        local gold = arg:match(GOLD_AMOUNT_REGEX)
        local silver = arg:match(SILVER_AMOUNT_REGEX)
        local copper = arg:match(COPPER_AMOUNT_REGEX)

        local sum = ((gold or 0)*100 + (silver or 0))*100 + (copper or 0)

        self.Session.Money = self.Session.Money + sum

        UpdateUI()
	end
end

local function LoadSession(session)
    self.Session = NormaliseSession(session, true)
    core.Config.SetCurrentRecorderSession(self.Session)
    self.UI.LootGrid.Show(self.Session.Results)
    UpdateUI()
end

local function OnUpdate()
    if self.Session.IsRunning and self.LastUpdated ~= time() then
        UpdateUI()
    end
end

local function AddItem()
    local type, id, itemLink = GetCursorInfo()
	if type == 'item' then
        local item
        local petId = (id == core.TSMHelper.PetCageItemId and tonumber(itemLink:match(BPET_ID_REGEX))) or nil

        for _, i in pairs(self.Session.Results) do
            if i.Id == id and i.PetId == petId then
                item = i
            end
        end

        if item then
            item.Quantity = item.Quantity + 1
        else
            item = { Id = id, Quantity = 1, ItemLink = itemLink }
            if petId then
                item.PetId = petId
            end
            table.insert(self.Session.Results, item)
        end

        self.UI.LootGrid.ClearCache()
        self.UI.LootGrid.Reload()
	end
end

local function SetMode(mode)
    self.Mode = mode
    WITDB.Settings.Recorder.Mode = mode

    self.UI.CompactModeButton:Enable()
    self.UI.DetailsModeButton:Enable()
    self.UI.EditModeButton:Enable()

    if mode == "Compact" then
        self.UI.CompactModeButton:Disable()
        self.UI.Frame:SetWidth(155)
        self.UI.Frame:SetHeight(130)
    elseif mode == "Details" then
        self.UI.DetailsModeButton:Disable()
        self.UI.Frame:SetWidth(285)
        self.UI.Frame:SetHeight(155)
    elseif mode == "Edit" then
        self.UI.EditModeButton:Disable()
        self.UI.Frame:SetWidth(420)
        self.UI.Frame:SetHeight(536)
    end

    if WITDB.Settings.Recorder.Top then
        self.UI.Frame:ClearAllPoints()
		self.UI.Frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", WITDB.Settings.Recorder.Left, WITDB.Settings.Recorder.Top)
    end

    wipe(self.UI.Frame.children)
    wipe(self.UI.Hidden.children)

    local compactTarget = self.UI.Frame
    local detailsTarget = mode == "Compact" and self.UI.Hidden or self.UI.Frame
    local editTarget = mode == "Edit" and self.UI.Frame or self.UI.Hidden

    compactTarget:AddChild(self.UI.ButtonsPanel)

    detailsTarget:AddChild(self.UI.TitleLabel)

    detailsTarget:AddChild(self.UI.LocationLabel)
    editTarget:AddChild(self.UI.RoutePicker)
    detailsTarget:AddChild(self.UI.MoneyLabel)
    detailsTarget:AddChild(self.UI.ItemValueLabel)
    compactTarget:AddChild(self.UI.TotalValueLabel)
    editTarget:AddChild(self.UI.IsGroupFarmCheckBox)

    editTarget:AddChild(self.UI.AddItemIcon)
    editTarget:AddChild(self.UI.LootFrame)
    self.UI.LootGrid.Show(self.Session.Results)
    self.UI.LootFrame:DoLayout()

    editTarget:AddChild(self.UI.SortJunkButton)

    compactTarget:AddChild(self.UI.ResetInstancesButton)

    UpdateUI()
end

local function SetFrameTooltip(frame, text)
    frame:SetScript("OnEnter", function()
        GameTooltip:SetOwner(frame, "ANCHOR_PRESERVE")
	    GameTooltip:ClearAllPoints()
	    GameTooltip:SetPoint("TOP", frame, "BOTTOM")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(text)
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end

local function lootContextMenu(module, row)
    return {
        {
            Name = "SetQuantity",
            DisplayName = core.GetString("SetQuantity"),
            Action = function(row)
                core.UI.InputDialog({ Text = core.GetString("SetQuantityMessage"), HasEditBox = true, IsNumeric = true, Data = row.Data, TextBoxValue = tostring(row.Data.Quantity), OnAccept = function(dialog, data)
                    local value = tonumber(dialog.editBox:GetText())
                    if value ~= nil and value > 0 then
                        data.Quantity = value
                        self.UI.LootGrid.ClearCache()
                        self.UI.LootGrid.Reload()
                        UpdateUI()
                    end
                end })
            end,
            ActionArg = row,
        },
        {
            Name = "Vendor",
            DisplayName = core.GetString("Vendor"),
            Action = function(row)
                local itemSellPrice = nil

                if row.Data.ItemLink then
                    _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(row.Data.ItemLink)
                end

                itemSellPrice = itemSellPrice or core.TSMHelper.GetItemVendorSellPrice(row.Data.Id)
                self.Session.Money = self.Session.Money + (itemSellPrice or 0) * (row.Data.Quantity or 0)
                core.TableHelper.RemoveValue(self.Session.Results, row.Data)
                self.UI.LootGrid.ClearCache()
                self.UI.LootGrid.Reload()
                UpdateUI()
            end,
            ActionArg = row,
        },
        {
            Name = "Remove",
            DisplayName = core.GetString("Remove"),
            Action = function(row)
                core.TableHelper.RemoveValue(self.Session.Results, row.Data)
                self.UI.LootGrid.ClearCache()
                self.UI.LootGrid.Reload()
                UpdateUI()
            end,
            ActionArg = row,
        },
    }
end

local function timerMenu()
    return {
        Children =
        {
            {
                Name = "Change",
                DisplayName = core.GetString("Change"),
                Action = SetTime
            },
            {
                Name = "SetTimer",
                DisplayName = core.GetString("SetTimer"),
                Action = SetTimer
            },
        }
    }
end

local function Init()
    self.UI = {}

    self.UI.Frame = AceGUI:Create("Window")
    self.UI.Frame:SetTitle(core.GetString("Recorder"))
    self.UI.Frame.titletext:SetJustifyH("LEFT")
    self.UI.Frame:EnableResize(false)

    if WITDB.Settings.Recorder.Top then
        self.UI.Frame:ClearAllPoints()
		self.UI.Frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", WITDB.Settings.Recorder.Left, WITDB.Settings.Recorder.Top)
    end
    
    self.UI.Frame.title:HookScript("OnMouseUp", function() 
        WITDB.Settings.Recorder.Top = self.UI.Frame.frame:GetTop()
        WITDB.Settings.Recorder.Left = self.UI.Frame.frame:GetLeft()
    end)

    self.UI.EditModeButton = CreateFrame("Button", nil, self.UI.Frame.frame, "UIPanelButtonTemplate")
	self.UI.EditModeButton:SetPoint("TOPRIGHT", self.UI.Frame.closebutton, "TOPLEFT", 4, -4)
    self.UI.EditModeButton:SetWidth(24)
    self.UI.EditModeButton:SetNormalTexture("Interface\\AddOns\\WIT\\Images\\Icons\\mode_edit")
    self.UI.EditModeButton:SetScript("OnClick", function() SetMode("Edit") end)
    SetFrameTooltip(self.UI.EditModeButton, core.GetString("EditMode"))

    self.UI.DetailsModeButton = CreateFrame("Button", nil, self.UI.Frame.frame, "UIPanelButtonTemplate")
	self.UI.DetailsModeButton:SetPoint("TOPRIGHT", self.UI.EditModeButton, "TOPLEFT")
    self.UI.DetailsModeButton:SetWidth(24)
    self.UI.DetailsModeButton:SetNormalTexture("Interface\\AddOns\\WIT\\Images\\Icons\\mode_details")
    self.UI.DetailsModeButton:SetScript("OnClick", function() SetMode("Details") end)
    SetFrameTooltip(self.UI.DetailsModeButton, core.GetString("StandardMode"))

    self.UI.CompactModeButton = CreateFrame("Button", nil, self.UI.Frame.frame, "UIPanelButtonTemplate")
	self.UI.CompactModeButton:SetPoint("TOPRIGHT", self.UI.DetailsModeButton, "TOPLEFT")
    self.UI.CompactModeButton:SetWidth(24)
    self.UI.CompactModeButton:SetNormalTexture("Interface\\AddOns\\WIT\\Images\\Icons\\mode_compact")
    self.UI.CompactModeButton:SetScript("OnClick", function() SetMode("Compact") end)
    SetFrameTooltip(self.UI.CompactModeButton, core.GetString("CompactMode"))

    self.UI.Frame.title:SetPoint("BOTTOMRIGHT", self.UI.CompactModeButton, "BOTTOMLEFT")
    
    self.UI.NewButton = core.UI.ActionIcon({ Icon = "Interface\\AddOns\\WIT\\Images\\Icons\\new" })
    self.UI.NewButton:OnClick(function()
        core.UI.ConfirmableDialog({ Text = core.GetString("NewSessionConfirmationMessage"), OnAccept = function()
            ResetSession()
        end })
    end)
    self.UI.SaveButton = core.UI.ActionIcon({ Icon = "Interface\\AddOns\\WIT\\Images\\Icons\\save" })
    self.UI.SaveButton:OnClick(Save)
    self.UI.PlayButton = core.UI.ActionIcon({ Icon = "Interface\\AddOns\\WIT\\Images\\Icons\\play" })
    self.UI.PlayButton:OnClick(ResumeSession)
    self.UI.PauseButton = core.UI.ActionIcon({ Icon = "Interface\\AddOns\\WIT\\Images\\Icons\\pause" })
    self.UI.PauseButton:OnClick(PauseSession)
    self.UI.StopButton = core.UI.ActionIcon({ Icon = "Interface\\AddOns\\WIT\\Images\\Icons\\stop" })
    self.UI.StopButton:OnClick(StopSession)

    self.UI.RoutePicker = core.UI.RoutePicker()
    self.UI.RoutePicker:SetCallback("OnValueChanged", OnRouteChanged)

    self.UI.TimeLabel = AceGUI:Create("InteractiveLabel")
    core.UI.ApplyContextMenuToFrame(self.UI.TimeLabel, timerMenu())

    self.UI.TitleLabel = AceGUI:Create("InteractiveLabel")
    self.UI.TitleLabel:SetFullWidth(true)
    self.UI.TitleLabel:SetCallback("OnClick", SetFarmName)
    self.UI.TitleLabel:SetCallback("OnEnter", function()
        GameTooltip:SetOwner(self.UI.TitleLabel.frame, "ANCHOR_PRESERVE")
	    GameTooltip:ClearAllPoints()
        if self.Session.Mode == "item" and self.Session.ItemId then
            local x = self.UI.TitleLabel.label:GetStringWidth() + 5
	        GameTooltip:SetPoint("LEFT", self.UI.TitleLabel.frame, "LEFT", x, 0)
            if self.Session.PetId then
                BattlePetToolTip_ShowLink(self.Session.ItemLink)
            else
                GameTooltip:SetHyperlink("item:" .. self.Session.ItemId)
                GameTooltip:Show()
            end
        else
            GameTooltip:SetPoint("TOP", self.UI.TitleLabel.frame, "BOTTOM")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(core.GetString("SetFarmNameTooltip"))
            GameTooltip:Show()
        end
    end)
    self.UI.TitleLabel:SetCallback("OnLeave", function()
        if self.Session.PetId then
            BattlePetTooltip:Hide()
        else
            GameTooltip:Hide()
        end
    end)

    self.UI.LocationLabel = AceGUI:Create("InteractiveLabel")
    self.UI.LocationLabel:SetFullWidth(true)
    self.UI.LocationLabel:SetCallback("OnClick", function() core.UI.ConfirmableDialog({ Text = core.GetString("SessionSetCurrentLocationConfirmationMessage"), OnAccept = SetCurrentLocation }) end)

    self.UI.MoneyLabel = AceGUI:Create("InteractiveLabel")
    self.UI.MoneyLabel:SetFullWidth(true)
    self.UI.MoneyLabel:SetCallback("OnClick", SetRawGold)
    self.UI.ItemValueLabel = AceGUI:Create("Label")
    self.UI.ItemValueLabel:SetFullWidth(true)
    self.UI.TotalValueLabel = AceGUI:Create("Label")
    self.UI.TotalValueLabel:SetFullWidth(true)

    self.UI.IsGroupFarmCheckBox = AceGUI:Create("CheckBox")
    self.UI.IsGroupFarmCheckBox:SetLabel(core.GetString("TrackGroupLoot"))
    self.UI.IsGroupFarmCheckBox:SetCallback("OnValueChanged", function(_, _, isChecked) SetIsGroupFarm(isChecked) end)
    SetFrameTooltip(self.UI.IsGroupFarmCheckBox.frame, core.GetString("TrackGroupLootTooltip"))

    self.UI.ResetInstancesButton = AceGUI:Create("Button")
    self.UI.ResetInstancesButton:SetText(core.GetString("ResetAllInstances"))
    self.UI.ResetInstancesButton:SetFullWidth(true)
    self.UI.ResetInstancesButton:SetCallback("OnClick", ResetInstances)

    self.UI.SortJunkButton = AceGUI:Create("Button")
    self.UI.SortJunkButton:SetText(core.GetString("SortJunk"))
    self.UI.SortJunkButton:SetFullWidth(true)
    self.UI.SortJunkButton:SetCallback("OnClick", SortJunk)
    self.UI.SortJunkButton:SetCallback("OnEnter", function()
        GameTooltip:SetOwner(self.UI.SortJunkButton.frame, "ANCHOR_PRESERVE")
	    GameTooltip:ClearAllPoints()
	    GameTooltip:SetPoint("LEFT", self.UI.SortJunkButton.frame, "RIGHT")
        GameTooltip:ClearLines()
        GameTooltip:AddLine(core.GetString("SortJunkTooltip"))
        GameTooltip:Show()
    end)
    self.UI.SortJunkButton:SetCallback("OnLeave", function()
        GameTooltip:Hide()
    end)
    self.UI.SortJunkButton:SetDisabled(not core.ScrapHelper.IsScrapAvailable())

    self.UI.ButtonsPanel = AceGUI:Create("SimpleGroup")
    self.UI.ButtonsPanel:SetLayout("Flow")
    self.UI.ButtonsPanel:SetFullWidth(true)

    self.UI.ButtonsPanel:AddChild(self.UI.NewButton)
    self.UI.ButtonsPanel:AddChild(self.UI.SaveButton)
    self.UI.ButtonsPanel:AddChild(self.UI.PlayButton)
    self.UI.ButtonsPanel:AddChild(self.UI.PauseButton)
    self.UI.ButtonsPanel:AddChild(self.UI.StopButton)
    self.UI.ButtonsPanel:AddChild(self.UI.TimeLabel)

    self.UI.AddItemIcon = AceGUI:Create("Icon")
    self.UI.AddItemIcon:SetLabel(core.GetString("AddItem"))
    self.UI.AddItemIcon:SetImageSize(48, 48)
    self.UI.AddItemIcon:SetFullWidth(true)
    self.UI.AddItemIcon:SetImage("Interface\\BUTTONS\\UI-EmptySlot")
    self.UI.AddItemIcon:SetCallback("OnClick", AddItem)

    self.UI.LootFrame = AceGUI:Create("SimpleGroup")
    self.UI.LootFrame:SetFullWidth(true)
    self.UI.LootFrame:SetHeight(250)
    self.UI.LootFrame:SetLayout("Fill")

    local scrollFrame = AceGUI:Create("WITScrollFrame")
    scrollFrame:SetLayout("WITList")

    local columns = {
        core.GridColumns.ContextMenuColumn({ GetMenu = lootContextMenu }),
        core.GridColumns.ItemNameColumn({ ItemIdProperty = "Id" }),
        core.GridColumns.ItemValueColumn()
    }
    local options = {
        MinWidth = 390,
        Columns = columns,
        Sort = { Column = columns[2], Direction = "ASC" }
    }
    self.UI.LootGrid = core.UI.Grid(options)
    self.UI.LootGrid.Show(self.Session.Results)
    self.UI.LootGrid:SetCallback("OnReload", function() scrollFrame:DoLayout() scrollFrame:FixScroll() end)

    scrollFrame:AddChild(self.UI.LootGrid)
    self.UI.LootFrame:AddChild(scrollFrame)
    
    self.UI.Hidden = AceGUI:Create("SimpleGroup")
    self.UI.Hidden.frame:Hide()
end

function core.ResetRecorderPosition()
    wipe(WITDB.Settings.Recorder)

    if self then
        self.UI.Frame:ClearAllPoints()
        self.UI.Frame:SetPoint("CENTER",UIParent,"CENTER")
    end
end

function core.Recorder()
    if self then return self end
    self = {}

    self.ItemQueue = {}
    self.Session = NormaliseSession(core.Config.GetCurrentRecorderSession() or NewSession())
    core.Config.SetCurrentRecorderSession(self.Session)

    if self.Session.IsRunning and self.Session.CurrentTime ~= nil then
        self.Session.Time = self.Session.Time + self.Session.CurrentTime - self.Session.StartTime
        self.Session.IsRunning = false
    end

    Init()

    SetMode(WITDB.Settings.Recorder.Mode or "Details")

    self.UI.Frame.frame:RegisterEvent("CHAT_MSG_LOOT")
    self.UI.Frame.frame:RegisterEvent("CHAT_MSG_MONEY")
    self.UI.Frame.frame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    self.UI.Frame.frame:SetScript("OnEvent", OnEvent)
    self.UI.Frame.frame:SetScript("OnUpdate", OnUpdate)

    self.Show = function(mode)
        self.UI.Frame:Show()
    end

    self.LoadSession = LoadSession

    return self
end