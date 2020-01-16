local WIT, core = ...

function core.FarmResultModule(name, data, category)
    local self = core.GridModule(name, data, category)

    local resultColumn = core.GridColumns.ResultsValueColumn()

    self.Columns = {
        core.GridColumns.ItemNameColumn(),
        resultColumn,
        core.GridColumns.LocationsColumn(),
        core.GridColumns.ItemSellRateColumn(),
        core.GridColumns.RoutesColumn(),
    }

    self.Sort = {
        Column = resultColumn,
        Direction = "DESC",
    }
    
    return self
end
