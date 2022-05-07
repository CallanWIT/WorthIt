local WIT, core = ...

local PriceSourceHelper = {}
core.PriceSourceHelper = PriceSourceHelper

PriceSourceHelper.PetCageItemId = 82800

function PriceSourceHelper.Initialize()
    core.TSMHelper.Initialize()
    core.TUJHelper.Initialize()
end

function PriceSourceHelper.GetCurrentPriceSource()
    return core.Config.GetDataSource() == 2 and core.TUJHelper or core.TSMHelper
end

function PriceSourceHelper.IsValidCustomPrice(customPrice)
    return PriceSourceHelper.GetCurrentPriceSource().IsValidCustomPrice(customPrice)
end

function PriceSourceHelper.HasCustomPrice(itemId)
    return PriceSourceHelper.GetCurrentPriceSource().HasCustomPrice(itemId)
end

function PriceSourceHelper.GetCustomPrice(itemId)
    return PriceSourceHelper.GetCurrentPriceSource().GetCustomPrice(itemId)
end

function PriceSourceHelper.GetItemPrice(item, priceSource)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemPrice(item, priceSource)
end

function PriceSourceHelper.GetItemVendorBuyPrice(item)
    for _, material in pairs(core.Items.MaterialPrices) do
        if material.Id == item then
            return material.Price
        end
    end

    return PriceSourceHelper.GetCurrentPriceSource().GetItemVendorBuyPrice(item)
end

function PriceSourceHelper.GetItemVendorSellPrice(item)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemVendorSellPrice(item)
end

function PriceSourceHelper.GetItemDestroyingPrice(item)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemDestroyingPrice(item)
end

function PriceSourceHelper.GetItemSellRate(item)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemSellRate(item)
end

function PriceSourceHelper.GetItemSoldPerDay(item)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemSoldPerDay(item)
end

function PriceSourceHelper.GetItemLink(item)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemLink(item)
end

function PriceSourceHelper.GetItemName(item)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemName(item)
end

function PriceSourceHelper.GetItemTotalQuantity(item)
    return PriceSourceHelper.GetCurrentPriceSource().GetItemTotalQuantity(item)
end

function PriceSourceHelper.ToMoneyString(value)
    return PriceSourceHelper.GetCurrentPriceSource().ToMoneyString(value)
end

function PriceSourceHelper.ToColoredMoneyString(value)
    return PriceSourceHelper.GetCurrentPriceSource().ToColoredMoneyString(value)
end

function PriceSourceHelper.GetInventoryValue(priceSource)
    return PriceSourceHelper.GetCurrentPriceSource().GetInventoryValue(priceSource)
end

function PriceSourceHelper.GetInventoryContent(priceSource)
    return PriceSourceHelper.GetCurrentPriceSource().GetInventoryContent(priceSource)
end

function PriceSourceHelper.GetBankValue(priceSource)
    return PriceSourceHelper.GetCurrentPriceSource().GetBankValue(priceSource)
end

function PriceSourceHelper.GetBagsValue(bags, priceSource)
    return PriceSourceHelper.GetCurrentPriceSource().GetBagsValue(bags, priceSource)
end

function PriceSourceHelper.GetBagsContent(bags, priceSource)
    return PriceSourceHelper.GetCurrentPriceSource().GetBagsContent(bags, priceSource)
end

function PriceSourceHelper.GetPriceSources()
    return PriceSourceHelper.GetCurrentPriceSource().GetPriceSources()
end

function PriceSourceHelper.DefaultPriceSource()
    return PriceSourceHelper.GetCurrentPriceSource().DefaultPriceSource()
end

function PriceSourceHelper.IsAPIAvailable()
    return PriceSourceHelper.GetCurrentPriceSource().IsAPIAvailable()
end

function PriceSourceHelper.IsDBAvailable()
    return PriceSourceHelper.GetCurrentPriceSource().IsDBAvailable()
end
