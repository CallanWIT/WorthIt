local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.GuideModule(name, sections, category)
    local self = core.Module(name, category)

    self.Sections = sections

    function self.Draw(container)
        local frame = AceGUI:Create("ScrollFrame")
        container:AddChild(frame)

        for _, section in pairs(self.Sections) do
            section.Draw(frame)
        end
    end
    
    return self
end
