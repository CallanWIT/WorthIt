local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ContextMenuColumn(options)
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

    function self.GetMenu(row)
        return {
            Name = "RowContextMenu",
            DisplayName = "Context Menu",
            Icon = "Interface\\AddOns\\WIT\\Images\\Icons\\menu",
            IconWidth = 12,
            Children = options.GetMenu(self, row)
        }
    end

    function self.GetCell(row)
        local group = AceGUI:Create("SimpleGroup")
        group:SetLayout("Flow")
        group:SetHeight(10)

        local menu = core.UI.ContextMenuButton(self.GetMenu(row))
        menu.alignoffset = -10
        group:AddChild(menu)

        return group
    end
    
    return self
end