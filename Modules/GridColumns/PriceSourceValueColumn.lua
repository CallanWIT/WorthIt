local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.PriceSourceValueColumn(options)
    options = options or {}
    options.Name = options.Name or 'Value'

    local self = GridColumns.GridColumn(options)

    function self.Value(data)
        local priceSource = data.PriceSource == "" and core.Config.GetPriceSourceString() or data.PriceSource
        return core.TSMHelper.GetItemPrice(data.ItemId == core.TSMHelper.PetCageItemId and 'p:'.. data.PetId or data.ItemId, priceSource)
    end

    function self.GetRowText(row)
        row[self.Name] = row[self.Name] or self.Value(row.Data)

        return core.TSMHelper.ToMoneyString(row[self.Name])
    end
    
    return self
end