local WIT, core = ...

core.GuideSections = {}

local AceGUI = LibStub("AceGUI-3.0")

function core.GuideSections.Text(resourceKey)
    local self = {
        ResourceKey = resourceKey,
    }

    self.Draw = function(frame)
        self.Text = self.Text or core.GetString(self.ResourceKey)

        local widget = AceGUI:Create("Label")
        widget:SetFullWidth(true)
        widget:SetText(self.Text)

        frame:AddChild(widget)
    end

    return self
end

function core.GuideSections.Heading(resourceKey)
    local self = {
        ResourceKey = resourceKey,
    }

    self.Draw = function(frame)
        self.Text = self.Text or core.GetString(self.ResourceKey)
        local widget = AceGUI:Create("Heading")
        widget.label:ClearAllPoints()
        widget.label:SetPoint("TOP")
	    widget.label:SetPoint("BOTTOM")
	    widget.label:SetJustifyH("CENTER")
        widget.left:Show()
        widget:SetFullWidth(true)
        widget:SetText(self.Text)
        frame:AddChild(widget)
        return widget
    end

    return self
end

function core.GuideSections.Section(resourceKey)
    local self = core.GuideSections.Heading(resourceKey)

    local oldDraw = self.Draw
    self.Draw = function(frame)
        local widget = oldDraw(frame)
        widget.label:SetPoint("LEFT")
        widget.left:Hide()
        return widget
    end

    return self
end

-- image width and height have to be power of 2 (16, 32, 64, 128, 256, 512, 1024)
function core.GuideSections.Image(path, width, height)
    local self = {
        Path = path,
        Width = width,
        Height = height,
    }

    self.Draw = function(frame)
        local container = AceGUI:Create("SimpleGroup")
        container:SetFullWidth(true)
        frame:AddChild(container)

        local image = AceGUI:Create("Label")
        image:SetWidth(self.Width / core.Config.GetScaling())
        image:SetHeight(self.Height / core.Config.GetScaling() + 10)

        container:AddChild(image)

        local texture = container.frame:CreateTexture(nil, "BACKGROUND")
        texture:SetScale(1 / core.Config.GetScaling())
        texture:SetTexture(self.Path)
        texture:SetPoint("TOPLEFT", container.frame, "TOPLEFT", 10, -5)

        container:SetCallback("OnRelease", function()
            texture:Hide()
            texture = nil
        end)
    end

    return self
end