local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.UI.ActionIcon(options)
    options = options or {}
    local width = options.Width or 24
    local height = options.Height or width
    local frame = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
    frame:SetWidth(width)
    frame:SetHeight(height)
    frame:SetNormalTexture(options.Icon)

    local widget = {
		frame = frame,
		type  = "ActionIcon"
	}

    frame:SetScript("OnEnter", function()
        if widget.tooltip then
            GameTooltip:SetOwner(frame, "ANCHOR_PRESERVE")
	        GameTooltip:ClearAllPoints()
	        GameTooltip:SetPoint("LEFT", frame, "RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(widget.tooltip)
            GameTooltip:Show()
        end
    end)
    frame:SetScript("OnLeave", function()
        if widget.tooltip then
            GameTooltip:Hide()
        end
    end)

    widget.OnAcquire = function() end
    widget.OnClick = function(self, action) frame:SetScript("OnClick", action or self) end
    widget.Enable = function() frame:Enable() end
    widget.Disable = function() frame:Disable() end
    widget.Toggle = function(self, show)
        if self ~= widget and self or show then
            frame:Enable()
        else
            frame:Disable()
        end
    end

    return AceGUI:RegisterAsWidget(widget)
end
