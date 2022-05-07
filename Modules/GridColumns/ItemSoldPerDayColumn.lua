local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemSoldPerDayColumn(options)
    options = options or {}
    options.Name = options.Name or 'SoldPerDay'

    local self = GridColumns.GridColumn(options)

    self.Description = core.GetString('SoldPerDayDescription')

    function self.Value(data)
        return data.ItemId and core.PriceSourceHelper.GetItemSoldPerDay(data.ItemId) or ''
    end

    local baseIsVisible = self.IsVisible
    function self.IsVisible()
        return baseIsVisible() and core.PriceSourceHelper.GetCurrentPriceSource() == core.TSMHelper
    end
    
    return self
end
