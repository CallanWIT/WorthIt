local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemSellRateColumn(options)
    options = options or {}
    options.Name = options.Name or 'SellRate'

    local self = GridColumns.GridColumn(options)

    self.Description = core.GetString('SellRateDescription')

    local baseGetRowText = self.GetRowText
    function self.GetRowText(row)
        return baseGetRowText(row) or '?'
    end

    local function MainItemSellRate(data)
        return data.ItemId and (core.PriceSourceHelper.GetItemSellRate(data.ItemId) / 1000) or ''
    end

    local baseIsVisible = self.IsVisible
    function self.IsVisible()
        return baseIsVisible() and core.PriceSourceHelper.GetCurrentPriceSource() == core.TSMHelper
    end

    local function AvgSellRate(data)
        if not data.Results or #(data.Results) == 0 then return 0 end

        local totalValue = 0
        local totalSellRate = 0

        for _, item in pairs(data.Results) do
            local id = item.Id == core.PriceSourceHelper.PetCageItemId and 'p:'.. item.PetId or item.Id
            local value = core.PriceSourceHelper.GetItemPrice(id) or 0
            local sellRate = core.PriceSourceHelper.GetItemSellRate(id) or 0

            totalValue = totalValue + value
            totalSellRate = totalSellRate + (sellRate * value / 1000)
        end

        return totalSellRate / (totalValue > 0 and totalValue or 1)
    end

    function self.Value(data)
        return data.Results and #(data.Results) > 0 and string.format("%0.2f", AvgSellRate(data)) or MainItemSellRate(data)
    end
    
    return self
end
