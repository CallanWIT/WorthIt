local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.ResultsValueColumn(name)
    local key = name or 'Result'
    local self = GridColumns.GridColumn(key)

    self.Description = core.GetString(key .. 'Description')

    function self.GetItemList(data)
        return data.Results
    end

    function self.GetItemPrice(item)
        return core.TSMHelper.GetItemPrice(item.Id)
    end

    function self.Value(data)
        local list = self.GetItemList(data)
        local hours = data.Time and data.Time > 0 and (data.Time / 3600) or 1
        if not list then return '' end

        local sum = data.Money or 0
        local isValueValid = true

        for _, item in pairs(list) do
            local price = self.GetItemPrice(item)

            if price ~= nil then
                sum = sum + price * item.Quantity
            else
                print(core.GetString("NoPriceForItem"):format(core.TSMHelper.GetItemLink(item.Id)))
                isValueValid = false
            end
        end

        return isValueValid and (sum / hours) or nil
    end

    function self.GetRowText(row)
        row[self.Name] = row[self.Name] or self.Value(row.Data)

        return core.TSMHelper.ToMoneyString(row[self.Name])
    end
    
    return self
end