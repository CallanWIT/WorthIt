local WIT, core = ...

function core.FlipResultModule(name, data, category)
    local self = core.GridModule(name, data, category)

    self.Columns = {
        core.GridColumns.ItemNameColumn(),
        core.GridColumns.ResultsValueColumn("FlipResult"),
        core.GridColumns.CostColumn(),
        core.GridColumns.ItemSoldPerDayColumn(),
    }
    
    return self
end
