local WIT, core = ...

function core.DestroyingResultModule(name, data, category)
    local self = core.GridModule(name, data, category)

    self.Columns = {
        core.GridColumns.ItemNameColumn(),
        core.GridColumns.CostColumn(),
        core.GridColumns.ResultsValueColumn("FlipResult"),
        core.GridColumns.TomTomColumn(),
    }
    
    return self
end
