local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemTotalQuantityColumn(options)
    options = options or {}
    options.Name = options.Name or 'TotalQuantity'

    local self = GridColumns.GridColumn(options)

    self.ItemIdProperty = options.ItemIdProperty or "ItemId"
    self.Description = core.GetString('TotalQuantityDescription')
    self.IsHidden = true

    function self.GetFilterValue(row)
        return self.Value(row.Data)
    end

    function self.Value(data)
        return data.PetId and core.PriceSourceHelper.GetItemTotalQuantity('p:'.. data.PetId) or data[self.ItemIdProperty] and core.PriceSourceHelper.GetItemTotalQuantity(data[self.ItemIdProperty]) or ''
    end

    local baseIsVisible = self.IsVisible
    function self.IsVisible(module, rows)
        if not baseIsVisible() or core.PriceSourceHelper.GetCurrentPriceSource() ~= core.TSMHelper then return false end

        if rows == nil then
            return true
        end

        for _, row in pairs(rows) do
            if row.Data.PetId or row.Data[self.ItemIdProperty] then
                return true
            end
        end

        return false
    end
    
    return self
end