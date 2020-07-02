local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.LocationsColumn(options)
    options = options or {}
    options.Name = options.Name or 'Locations'

    local self = GridColumns.GridColumn(options)

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

    function self.GetFilterValue(row)
        return strlower(self.GetSortValue(row))
    end
    
    return self
end