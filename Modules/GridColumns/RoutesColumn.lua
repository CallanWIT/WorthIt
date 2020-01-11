local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.RoutesColumn()
    local self = GridColumns.GridColumn('Routes')

    self.Description = core.GetString('RoutesDescription')

    function self.Value(data)
        return data.Routes and core.RoutesHelper.IsRoutesAvailable()
    end

    function self.GetRowText(row)
        return self.Value(row.Data) and ("|cFF0000FF" .. core.GetString("ImportRoute")) or ''
    end

    local baseIsVisible = self.IsVisible
    function self.IsVisible(rows)
        if not baseIsVisible or not core.RoutesHelper.IsRoutesAvailable() then return false end

        for _, row in pairs(rows) do
            if row.Data.Routes then
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
        cell:SetUserData("routes", row.Data.Routes)

        if value then
            cell:SetCallback("OnClick", function(item)
                local routes = item:GetUserData("routes")
                core.RoutesHelper.ImportRoute(routes.MapId and routes or routes[1])
                ReloadUI()
            end)
        end

        container:AddChild(cell)

        return container
    end
    
    return self
end
