local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local function ConfigurationModule()
    local self = core.Module('Configuration', 'Configuration')

    local function CreateDropDown(name, values, valueToSelect, onChangedCallback)
        local priceSources = core.TSMHelper.GetPriceSources()
        local selectedPriceSource = core.Config.GetPriceSource()

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

    function createBagValueGroup()
        local group = AceGUI:Create("InlineGroup")
        group:SetTitle(core.GetString("BagValueTreshold"))
        group:SetLayout("List")

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

        group:AddChild(minValueTextBox)

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

        group:AddChild(minQualityDropDown)

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

        group:AddChild(minValueDropDown)

        return group
    end

    function createPriceSourceGroup()
        local group = AceGUI:Create("InlineGroup")
        group:SetTitle(core.GetString("TSM"))
        group:SetLayout("List")

        local priceSourcesLabel = core.GetString("PriceSource")
        local priceSources = core.TSMHelper.GetPriceSources()
        local selectedPriceSource = core.Config.GetPriceSource()

        local priceSorceDropDown = CreateDropDown(priceSourcesLabel, priceSources, selectedPriceSource, function(self)
            local value = self:GetValue()
            if value then
                core.Config.SetPriceSource(priceSources[value])
            end
        end)

        group:AddChild(priceSorceDropDown)

        return group
    end

    function self.Draw(frame)
        local header = AceGUI:Create("SimpleGroup")
        header:SetFullWidth(true)
        header:SetHeight(35)

        local intro = AceGUI:Create("Label")
            
        intro:SetText(core.GetString("ConfigurationIntro"))
        intro:SetFullWidth()

        header:AddChild(intro)
        frame:AddChild(header)

        local priceSourceSection = createPriceSourceGroup()
        local bagValueSection = createBagValueGroup()

        local height = math.max(priceSourceSection.frame:GetHeight(), bagValueSection.frame:GetHeight())
        priceSourceSection:SetHeight(height)
        bagValueSection:SetHeight(height)

        frame:AddChild(priceSourceSection)
        frame:AddChild(bagValueSection)
    end
    
    return self
end

core.ConfigurationModule = ConfigurationModule()
table.insert(core.Modules, core.ConfigurationModule)