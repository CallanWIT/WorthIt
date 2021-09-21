local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.ResultsValueColumn(options)
    options = options or {}
    options.Name = options.Name or 'Result'

    local self = GridColumns.GridColumn(options)

    self.PriceSource = options.PriceSource
    self.Description = core.GetString(options.Name .. 'Description')

    function self.GetItemList(data)
        return data.Results
    end

    function self.GetItemPrice(item)
        return core.TSMHelper.GetItemPrice(item.Id == core.TSMHelper.PetCageItemId and 'p:'.. item.PetId or item.Id, self.PriceSource)
    end

    function self.Value(data)
        local list = self.GetItemList(data)
        local hours = data.Time and data.Time > 0 and (data.Time / 3600) or 1
        local players = data.IsGroupFarm and data.NumberOfPlayers or 1
        local sum = data.Money or 0
        local isValueValid = true

        if not list then return sum / hours end

        for _, item in pairs(list) do
            local price = self.GetItemPrice(item)

            if price ~= nil then
                sum = sum + price * item.Quantity
            else
                isValueValid = false
            end
        end

        return isValueValid and (sum / hours / players) or nil
    end

    function self.GetRowText(row)
        row[self.Name] = row[self.Name] or self.Value(row.Data)

        return core.TSMHelper.ToMoneyString(row[self.Name])
    end
    
    return self
end