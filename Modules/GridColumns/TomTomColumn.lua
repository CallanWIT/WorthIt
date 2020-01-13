local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.TomTomColumn()
    local self = GridColumns.GridColumn('Waypoints')

    self.Description = core.GetString('WaypointsDescription')

    function self.Value(data)
        return data.Waypoints and core.TomTomHelper.IsTomTomAvailable()
    end

    function self.GetRowText(row)
        return self.Value(row.Data) and ("|cFF00A2E8" .. core.GetString("AddWaypoints")) or ''
    end

    local baseIsVisible = self.IsVisible
    function self.IsVisible(rows)
        if not baseIsVisible or not core.TomTomHelper.IsTomTomAvailable() then return false end

        for _, row in pairs(rows) do
            if row.Data.Waypoints then
                return true
            end
        end

        return false
    end

    function self.GetCell(row)
        local container = AceGUI:Create("SimpleGroup")
        local cell = AceGUI:Create("InteractiveLabel")
        local value = self.Value(row.Data)
        cell:SetText(value and self.GetRowText(row) or '')
        cell:SetWidth(cell.label:GetStringWidth() + 5)
        cell:SetUserData("waypoints", row.Data.Waypoints)

        if value then
            cell:SetCallback("OnClick", function(item)
                local waypoints = item:GetUserData("waypoints")
                core.TomTomHelper.AddWaypoints(waypoints)
            end)
        end

        container:AddChild(cell)

        return container
    end
    
    return self
end
