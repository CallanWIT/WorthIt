local WIT, core = ...

function core.FarmResultModule(name, data, category)
    local self = core.GridModule(name, data, category)

    self.Columns = {
        core.GridColumns.ItemNameColumn(),
        core.GridColumns.ResultsValueColumn(),
        core.GridColumns.LocationsColumn(),
        core.GridColumns.ItemSoldPerDayColumn(),
        core.GridColumns.RoutesColumn(),
    }
    
    return self
end
