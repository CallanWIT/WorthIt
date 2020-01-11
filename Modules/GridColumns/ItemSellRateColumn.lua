local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemSellRateColumn()
    local self = GridColumns.GridColumn('SellRate')

    self.Description = core.GetString('SellRateDescription')

    function self.Value(data)
        return data.ItemId and core.TSMHelper.GetItemSellRate(data.ItemId) or ''
    end
    
    return self
end
