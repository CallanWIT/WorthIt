local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ProfitColumn(costColumn, valueColumn)
    local self = GridColumns.GridColumn('Profit')

    self.CostColumn = costColumn
    self.ValueColumn = valueColumn
    self.Description = core.GetString('ProfitDescription')

    function self.Value(data)
        local value = self.ValueColumn.Value(data)
        local cost = self.CostColumn.Value(data)

        return value ~= nil and cost ~= nil and (value - cost) or nil
    end

    function self.GetRowText(row)
        row[self.Name] = row[self.Name] or self.Value(row.Data)
        local moneyString = core.TSMHelper.ToMoneyString(row[self.Name])

        if row[self.Name] ~= nil and row[self.Name] < 0 then
            moneyString = "|cFFFF0000" .. moneyString:gsub("|r", "|cFFFF0000") .. "|r"
        end

        return moneyString
    end
    
    return self
end
