local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ExpandRowColumn(options)
    options = options or {}
    options.IsFixedSize = options.IsFixedSize == nil and true or options.IsFixedSize
    options.Sortable = options.Sortable or false

    local self = GridColumns.GridColumn(options)
    
    function self.GetColumnMinWidth(rows)
        return 12
    end

    function self.Value(data)
        return 0
    end

    local baseIsVisible = self.IsVisible
    function self.IsVisible(module)
        return baseIsVisible() and module.IsExpandabled
    end

    function self.GetCell(row, module)
        local group = AceGUI:Create("SimpleGroup")
        group:SetLayout("Flow")
        group:SetHeight(10)

        local frame = CreateFrame("Button", nil, UIParent)
        local width = 10
        local height = 10
        frame:SetWidth(width)
        frame:SetHeight(height)

	    local image = frame:CreateTexture(nil, "BACKGROUND")
        image:SetTexture(row.Expanded and "Interface\\AddOns\\WIT\\Images\\Icons\\minus" or "Interface\\AddOns\\WIT\\Images\\Icons\\plus")
	    image:SetAllPoints(frame)

        frame:SetScript("OnClick", function(self)
            row.Expanded = not row.Expanded
            module.Reload()
        end)

        local widget = {
		    frame = frame,
		    type  = "DynamicIcon"
	    }

        widget.OnAcquire = function() end
        widget.alignoffset = -5

        group:AddChild(AceGUI:RegisterAsWidget(widget))

        return group
    end
    
    return self
end