local WIT, core = ...

function core.FlipResultModule(name, data, category)
    local self = core.GridModule(name, data, category)

    local costColumn = core.GridColumns.CostColumn()
    local resultColumn = core.GridColumns.ResultsValueColumn("FlipResult")
    local profitColumn = core.GridColumns.ProfitColumn(costColumn, resultColumn)

    self.Columns = {
        core.GridColumns.ItemNameColumn(),
        profitColumn,
        costColumn, 
        resultColumn,
        core.GridColumns.ItemSoldPerDayColumn(),
        core.GridColumns.TomTomColumn(),
    }

    self.Sort = {
        Column = profitColumn,
        Direction = "DESC",
    }
    
    return self
end