local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ProfitColumn(options)
    options = options or {}
    options.Name = options.Name or 'Profit'

    local self = GridColumns.GridColumn(options)

    self.CostColumn = options.CostColumn
    self.ValueColumn = options.ValueColumn
    self.Description = core.GetString('ProfitDescription')

    function self.Value(data)
        local value = self.ValueColumn.Value(data)
        local cost = self.CostColumn.Value(data)

        return value ~= nil and cost ~= nil and (value - cost) or nil
    end

    function self.GetRowText(row)
        row[self.Name] = row[self.Name] or self.Value(row.Data)

        return core.PriceSourceHelper.ToColoredMoneyString(row[self.Name])
    end
    
    return self
end
