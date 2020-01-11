local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.LocationsColumn()
    local self = GridColumns.GridColumn('Locations')

    function self.Value(data)
        if not data.Locations then return '' end

        local locations = {}

        for _, location in pairs(data.Locations) do
            table.insert(locations, core.LocationHelper.GetAreaName(location))
        end

        return table.concat(locations, ", ")
    end
    
    return self
end