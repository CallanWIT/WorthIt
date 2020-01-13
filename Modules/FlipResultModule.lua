local WIT, core = ...

function core.FlipResultModule(name, data, category)
    local self = core.GridModule(name, data, category)

    self.Columns = {
        core.GridColumns.ItemNameColumn(),
        core.GridColumns.CostColumn(),
        core.GridColumns.ResultsValueColumn("FlipResult"),
        core.GridColumns.ItemSoldPerDayColumn(),
        core.GridColumns.TomTomColumn(),
    }
    
    return self
end
