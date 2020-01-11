local WIT, core = ...

function core.GuideModule(name, sections, category)
    local self = core.Module(name, category)

    self.Sections = sections

    function self.Draw(frame)
        for _, section in pairs(self.Sections) do
            section.Draw(frame)
        end
    end
    
    return self
end
