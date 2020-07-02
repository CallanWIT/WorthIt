local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.UI.Label()
    local label = AceGUI:Create("Label")
    label:SetFont(label:GetFont(), 16)
    return label
end

function core.UI.InteractiveLabel()
    local label = AceGUI:Create("InteractiveLabel")
    label:SetFont(label:GetFont(), 16)
    return label
end
