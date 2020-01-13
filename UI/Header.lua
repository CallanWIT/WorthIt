local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")
local header = nil
local navMenu = nil
local bagValueButton = nil

local function updateBagValue(label)
    local value = core.TSMHelper.GetInventoryValue()

    for bag = 0, 3 do
        value = core.TSMHelper.GetInventoryValue()
    end

    local text = core.GetString("InventoryValue"):format(core.TSMHelper.ToMoneyString(value))
    label:SetText(text)
end

function core.UI.Header(window)
    if header then return header end

    header = AceGUI:Create("SimpleGroup")
    header:SetLayout("Flow")
    header:SetFullWidth(true)
    header:SetHeight(35)

    navMenu = core.UI.NavigationMenu()

    header:AddChild(navMenu)

    local placeholder  = AceGUI:Create("Label")
    placeholder:SetHeight(30)

    local bagValueContainer  = AceGUI:Create("SimpleGroup")
    bagValueContainer:SetLayout("Flow")
    bagValueContainer:SetHeight(30)
    bagValueContainer:SetWidth(370)

    local bagValue = AceGUI:Create("Label")
    bagValue:SetWidth(200)
    bagValueContainer:AddChild(bagValue)
  
    bagValueButton = AceGUI:Create("Button")
    bagValueButton:SetText(core.GetString("BagValue"))
    bagValueButton:SetWidth(150)
    bagValueButton:SetCallback("OnClick", function() updateBagValue(bagValue) end)
    bagValueContainer:AddChild(bagValueButton)

    placeholder:SetWidth(window.frame:GetWidth() - navMenu.frame:GetWidth() - bagValueContainer.frame:GetWidth() - 74)

    header:AddChild(placeholder)
    header:AddChild(bagValueContainer)

    return header
end

function core.UI.DisableHeader()
    if not header then return end

    navMenu:SetDisabled(true)
    bagValueButton:SetDisabled(true)
end
