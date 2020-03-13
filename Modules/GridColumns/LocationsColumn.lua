local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.LocationsColumn()
    local self = GridColumns.GridColumn('Locations')

    function self.Value(data)
        local locations = {}

        if data.Locations then
            for _, location in pairs(data.Locations) do
                table.insert(locations, core.LocationHelper.GetAreaName(location))
            end
        elseif data.MapId then
            table.insert(locations, core.LocationHelper.GetMapName(data.MapId))
        end

        return table.concat(locations, ", ")
    end
    
    return self
end