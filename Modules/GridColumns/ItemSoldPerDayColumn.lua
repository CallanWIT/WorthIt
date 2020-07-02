local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemSoldPerDayColumn(options)
    options = options or {}
    options.Name = options.Name or 'SoldPerDay'

    local self = GridColumns.GridColumn(options)

    self.Description = core.GetString('SoldPerDayDescription')

    function self.Value(data)
        return data.ItemId and core.TSMHelper.GetItemSoldPerDay(data.ItemId) or ''
    end
    
    return self
end
