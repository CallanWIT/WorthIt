local WIT, core = ...

core.GuideSections = {}

local AceGUI = LibStub("AceGUI-3.0")

function core.GuideSections.Text(resourceKey)
    local self = {
        ResourceKey = resourceKey,
    }

    function self.Draw(frame)
        self.Text = self.Text or core.GetString(self.ResourceKey)

        local widget = AceGUI:Create("Label")
        widget:SetFullWidth(true)
        widget:SetText(self.Text)

        frame:AddChild(widget)
    end

    return self
end