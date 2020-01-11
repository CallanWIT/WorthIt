local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local function ConfigurationModule()
    local self = core.Module('Configuration', 'Configuration')

    local function CreatePriceSorceDropDown()
        local priceSources = core.TSMHelper.GetPriceSources()
        local selectedPriceSource = core.Config.GetPriceSource()
        local priceSourceDropDown = AceGUI:Create("Dropdown")
        priceSourceDropDown:SetLabel(core.GetString("PriceSource"))

        priceSourceDropDown:SetList(priceSources)

        for value, text in pairs(priceSources) do
            if text == selectedPriceSource then
                priceSourceDropDown:SetValue(value)
            end
        end

        priceSourceDropDown:SetCallback("OnValueChanged", function(self)
            local value = self:GetValue()
            if value then
                core.Config.SetPriceSource(priceSources[value])
            end
        end)

        return priceSourceDropDown
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

        frame:AddChild(CreatePriceSorceDropDown())
    end
    
    return self
end

core.ConfigurationModule = ConfigurationModule()
--core.ConfigurationModule.IsDisabled = true
table.insert(core.Modules, core.ConfigurationModule)