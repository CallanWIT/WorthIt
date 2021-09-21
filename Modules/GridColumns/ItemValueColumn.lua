local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.ItemValueColumn(options)
    options = options or {}
    options.Name = options.Name or 'Value'

    local self = GridColumns.GridColumn(options)

    self.PriceSource = options.PriceSource

    function self.Value(data)
        local id = data.ItemId or data.Id
        return (core.TSMHelper.GetItemPrice(id == core.TSMHelper.PetCageItemId and 'p:'.. data.PetId or id, self.PriceSource) or 0) * (data.Quantity or 1)
    end

    function self.GetRowText(row)
        row[self.Name] = row[self.Name] or self.Value(row.Data)

        return core.TSMHelper.ToMoneyString(row[self.Name])
    end
    
    return self
end