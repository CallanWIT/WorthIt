local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemSellRateColumn()
    local self = GridColumns.GridColumn('SellRate')

    self.Description = core.GetString('SellRateDescription')

    local baseGetRowText = self.GetRowText
    function self.GetRowText(row)
        return baseGetRowText(row) or '?'
    end

    function self.Value(data)
        return data.ItemId and (core.TSMHelper.GetItemSellRate(data.ItemId) / 100) or ''
    end
    
    return self
end
