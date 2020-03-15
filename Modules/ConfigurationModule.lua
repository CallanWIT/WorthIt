local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local function ConfigurationModule()
    local self = core.Module('Configuration', 'Configuration')

    local function CreateDropDown(name, values, valueToSelect, onChangedCallback)
        local priceSources = core.TSMHelper.GetPriceSources()

        local dropDown = AceGUI:Create("Dropdown")
        dropDown:SetLabel(name)
        dropDown.pullout.frame:SetScale(core.Config.GetScaling())

        dropDown:SetList(values)

        for value, text in pairs(values) do
            if value == valueToSelect or text == valueToSelect then
                dropDown:SetValue(value)
            end
        end

        dropDown:SetCallback("OnValueChanged", onChangedCallback)

        return dropDown
    end

    function drawRecorderConfiguration(frame)
        local intro = AceGUI:Create("Label")
        intro:SetFullWidth(true)
        intro:SetText(core.GetString("RecorderConfogurationIntro"))
        frame:AddChild(intro)

        local minValueTextBox = AceGUI:Create("EditBox")
        minValueTextBox:SetLabel(core.GetString("MinItemValue"))
        minValueTextBox:SetText(core.Config.GetBagValueMinPrice())
        minValueTextBox:SetCallback("OnEnterPressed", function(self)
            local text = self:GetText()
            local number = text and tonumber(text)
            if text and number then
                core.Config.SetRecorderMinPrice(number)
            else
                minValueTextBox:SetText(core.Config.GetBagValueMinPrice())
            end
        end)

        frame:AddChild(minValueTextBox)

        local itemQualities = {
            "|cFF9D9D9D"..ITEM_QUALITY0_DESC,
            "|cFFFFFFFF"..ITEM_QUALITY1_DESC,
            "|cFF1EFF00"..ITEM_QUALITY2_DESC,
            "|cFF0070FF"..ITEM_QUALITY3_DESC,
            "|cFFa335ee"..ITEM_QUALITY4_DESC,
            "|cFFff8000"..ITEM_QUALITY5_DESC,
        }
        
        local minQualityDropDown = CreateDropDown(core.GetString("MinQuality"), itemQualities, core.Config.GetBagValueMinQuality() + 1, function(self)
            local value = self:GetValue()
            if value then
                core.Config.SetRecorderMinQuality(value - 1)
            end
        end)

        frame:AddChild(minQualityDropDown)
    end

    function drawBagValueConfiguration(frame)
        local intro = AceGUI:Create("Label")
        intro:SetFullWidth(true)
        intro:SetText(core.GetString("BagValueConfogurationIntro"))
        frame:AddChild(intro)

        local minValueTextBox = AceGUI:Create("EditBox")
        minValueTextBox:SetLabel(core.GetString("MinItemValue"))
        minValueTextBox:SetText(core.Config.GetBagValueMinPrice())
        minValueTextBox:SetCallback("OnEnterPressed", function(self)
            local text = self:GetText()
            local number = text and tonumber(text)
            if text and number then
                core.Config.SetBagValueMinPrice(number)
            else
                minValueTextBox:SetText(core.Config.GetBagValueMinPrice())
            end
        end)

        frame:AddChild(minValueTextBox)

        local itemQualities = {
            "|cFF9D9D9D"..ITEM_QUALITY0_DESC,
            "|cFFFFFFFF"..ITEM_QUALITY1_DESC,
            "|cFF1EFF00"..ITEM_QUALITY2_DESC,
            "|cFF0070FF"..ITEM_QUALITY3_DESC,
            "|cFFa335ee"..ITEM_QUALITY4_DESC,
            "|cFFff8000"..ITEM_QUALITY5_DESC,
        }
        
        local minQualityDropDown = CreateDropDown(core.GetString("MinQuality"), itemQualities, core.Config.GetBagValueMinQuality() + 1, function(self)
            local value = self:GetValue()
            if value then
                core.Config.SetBagValueMinQuality(value - 1)
            end
        end)

        frame:AddChild(minQualityDropDown)

        local priceSources = {
            core.GetString("None"),
            core.GetString("Vendor"),
            core.GetString("Destroying>Vendor"),
        }

        local minValueDropDown = CreateDropDown(core.GetString("UnderTresholdPrice"), priceSources, core.Config.GetBelowTresholdValue() + 1, function(self)
            local value = self:GetValue()
            if value then
                core.Config.SetBelowTresholdValue(value - 1)
            end
        end)

        frame:AddChild(minValueDropDown)
    end

    function drawPriceSourceConfiguration(frame)
        local intro = AceGUI:Create("Label")
        intro:SetFullWidth(true)
        intro:SetText(core.GetString("PriceSourceConfogurationIntro"))
        frame:AddChild(intro)

        local priceSourcesLabel = core.GetString("PriceSource")
        local priceSources = core.TSMHelper.GetPriceSources()
        local selectedPriceSource = core.Config.GetPriceSource()

        local priceSorceDropDown = CreateDropDown(priceSourcesLabel, priceSources, selectedPriceSource, function(self)
            local value = self:GetValue()
            if value then
                core.Config.SetPriceSource(priceSources[value])
            end
        end)

        frame:AddChild(priceSorceDropDown)

        priceSourcesLabel = core.GetString("LegacyPriceSource")
        selectedPriceSource = core.Config.GetLegacyPriceSource()

        local legacyPriceSorceDropDown = CreateDropDown(priceSourcesLabel, priceSources, selectedPriceSource, function(self)
            local value = self:GetValue()
            if value then
                core.Config.SetLegacyPriceSource(priceSources[value])
            end
        end)

        frame:AddChild(legacyPriceSorceDropDown)
    end

    function drawFarm(frame, farm)
        local group = AceGUI:Create("SimpleGroup")
        group:SetLayout("Flow")
        group:SetFullWidth(true)

        local checkbox = AceGUI:Create("CheckBox")
        checkbox:SetWidth(30)
        checkbox:SetValue(core.Config.GetModulesConfig().Dashboard.Farms[farm.Id] or false)
        checkbox:SetCallback("OnValueChanged", function(self, name, value)
            core.Config.GetModulesConfig().Dashboard.Farms[farm.Id] = value or nil
            core.DashboardModule.ClearCache()
        end)
        group:AddChild(checkbox)

        local label = AceGUI:Create("InteractiveLabel")
        local text = farm.ItemId and core.TSMHelper.GetItemLink(farm.ItemId) or farm.NameMapId and core.LocationHelper.GetMapName(farm.NameMapId) or core.GetString(farm.Name)
        label:SetText(text)
        label:SetWidth(label.label:GetStringWidth() + 5)

        if farm.ItemId then
            label:SetCallback("OnEnter", function()
                GameTooltip:SetOwner(label.frame, "ANCHOR_PRESERVE")
	            GameTooltip:ClearAllPoints()
	            GameTooltip:SetPoint("LEFT", label.frame, "RIGHT")
                GameTooltip:SetHyperlink("item:" .. farm.ItemId)
                GameTooltip:Show()
            end)
            label:SetCallback("OnLeave", function()
                GameTooltip:Hide()
            end)
        end

        group:AddChild(label)

        if farm.Activity then
            local activityLabel = AceGUI:Create("Label")
            activityLabel:SetText('(' .. core.GetString("Activity" .. farm.Activity) .. ')')
            group:AddChild(activityLabel)
        end

        frame:AddChild(group)
    end

    function drawDashboardConfiguration(frame, dashboardItems)
        local intro = AceGUI:Create("Label")
        intro:SetFullWidth(true)
        intro:SetText(core.GetString("DashboardConfogurationIntro"))
        frame:AddChild(intro)

        local group = AceGUI:Create("SimpleGroup")
        group:SetLayout("Flow")
        group:SetFullWidth(true)

        local checkbox = AceGUI:Create("CheckBox")
        checkbox:SetWidth(30)
        checkbox:SetValue(core.Config.GetModulesConfig().Dashboard.ShowCurrentContent)
        checkbox:SetCallback("OnValueChanged", function(self, name, value)
            core.Config.GetModulesConfig().Dashboard.ShowCurrentContent = value
            core.DashboardModule.ClearCache()

            for _, i in pairs(dashboardItems) do
                i.disabled = value
            end

            frame.parent:RefreshTree()
        end)
        group:AddChild(checkbox)

        local label = AceGUI:Create("Label")
        label:SetText(core.GetString("ShowCurrentContentFarms"))
        group:AddChild(label)

        frame:AddChild(group)
    end

    function drawDashboardCustomResultsConfiguration(frame)
        for _, farm in pairs(core.Config.GetUserFarms()) do
            drawFarm(frame, farm)
        end
    end

    function drawDashboardContentConfiguration(frame, content)
        if content == "Custom" then return drawDashboardCustomResultsConfiguration(frame) end

        local farms = {}

        for _, farm in pairs(core.Data.Results.Farms) do
            if farm.Content == content and farm.Activity and farm.Activity ~= core.Activity.Transmog then
                table.insert(farms, farm)
            end
        end

        table.sort(farms, function(a, b)
            if a.Activity == b.Activity then
                return a.Id < b.Id
            end

            return a.Activity < b.Activity
        end)

        for _, farm in pairs(farms) do
            drawFarm(frame, farm)
        end
    end

    function drawModulesConfiguration(frame)
        local label = AceGUI:Create("Label")
        label:SetText(core.GetString("NothingToSeeHere"))

        frame:AddChild(label)
    end

    function createDashboardContentItems()
        local contents = {}
        local items = {}

        for k, c in pairs(core.Content) do
            table.insert(contents, { Value = c, Name = k })
        end

        table.sort(contents, function(a, b)
            return a.Value > b.Value
        end)

        local showCurrentContent = core.Config.GetModulesConfig().Dashboard.ShowCurrentContent

        table.insert(items, {
            value = "DashboardCustom",
            text = core.GetString("MyFarms"),
            content = "Custom",
            disabled = showCurrentContent,
        })

        for _, i in pairs(contents) do
            table.insert(items, {
                value = "Dashboard" .. i.Value,
                text = core.GetString(i.Name),
                content = i.Value,
                disabled = showCurrentContent,
            })
        end

        return items
    end

    function createConfigurationPanel(frame)
        local dashboardItems = createDashboardContentItems()
        local tree =
        { 
            {
                value = "WorthIt",
                text = core.GetString("WorthIt"),
                children =
                {
                    { 
                        value = "Recorder", 
                        text = core.GetString("Recorder"),
                    },
                    { 
                        value = "BagValue", 
                        text = core.GetString("BagValue"),
                    },
                    {
                        value = "Modules",
                        text = core.GetString("Modules"),
                        children =
                        {
                            { 
                                value = "Dashboard", 
                                text = core.GetString("Dashboard"),
                                children = dashboardItems
                            },
                        }
                    },
                }
            },
        }

        local treeGroup = AceGUI:Create("TreeGroup")
        treeGroup:SetLayout("Fill")
        treeGroup:SetTree(tree)
        
        treeGroup:SetCallback("OnGroupSelected", function(self, name, group)
            treeGroup:ReleaseChildren()

            local scrollFrame = AceGUI:Create("ScrollFrame")
            treeGroup:AddChild(scrollFrame)

            if group == 'WorthIt' then
                drawPriceSourceConfiguration(scrollFrame)
            elseif group == 'WorthIt\001Recorder' then
                drawRecorderConfiguration(scrollFrame)
            elseif group == 'WorthIt\001BagValue' then
                drawBagValueConfiguration(scrollFrame)
            elseif group == 'WorthIt\001Modules' then
                drawModulesConfiguration(scrollFrame)
            elseif group == 'WorthIt\001Modules\001Dashboard' then
                drawDashboardConfiguration(scrollFrame, dashboardItems)
            else
                for _, i in pairs(dashboardItems) do
                    if group == 'WorthIt\001Modules\001Dashboard\001' .. i.value then
                        drawDashboardContentConfiguration(scrollFrame, i.content)
                        return
                    end
                end
            end
        end)

        treeGroup:SelectByValue('WorthIt')

        return treeGroup
    end

    function self.Draw(frame)
        frame:AddChild(createConfigurationPanel(frame))
    end
    
    return self
end

core.ConfigurationModule = ConfigurationModule()
table.insert(core.Modules, core.ConfigurationModule)