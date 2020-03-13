local WIT, core = ...

local TSMHelper = {}

core.TSMHelper = TSMHelper

local cache = { ItemValues = {}, ItemVendorBuyPrice = {}, ItemVendorSellPrice = {}, ItemDestroyingPrice = {}, ItemSellRates = {}, ItemNames = {} }
local version = nil
local priceSource = nil

local priceSources = {
    'DBMarket',
    'DBMinBuyout',
    'DBRegionHistorical',
    'DBRegionMarketAvg',
    'DBRegionMinBuyoutAvg',
    'DBRegionSaleAvg'
}

TSMHelper.PetCageItemId = 82800

function TSMHelper.Initialize()
    version = GetAddOnMetadata("TradeSkillMaster", "Version")
    priceSource = WITDB.Settings.PricingSelect
end

function TSMHelper.GetItemPrice(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if not priceSource or priceSource ~= WITDB.Settings.PricingSelect then
        if not WITDB.Settings.PricingSelect or not TSM_API.IsCustomPriceValid(WITDB.Settings.PricingSelect) then
            error("Invalid price source")
        end

        priceSource = WITDB.Settings.PricingSelect

        TSMHelper.ClearValueCache()
    end

    if cache.ItemValues[item] ~= nil then
        return cache.ItemValues[item]
    end

    local itemId = type(item) == "number" and "i:" .. item or item
    local itemPriceSource = item > 152500 and WITDB.Settings.PricingSelect or WITDB.Settings.LegacyPricingSelect

    cache.ItemValues[item] = TSM_API.GetCustomPriceValue(itemPriceSource, itemId)

    return cache.ItemValues[item]
end

function TSMHelper.GetItemVendorBuyPrice(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if cache.ItemVendorBuyPrice[item] ~= nil then
        return cache.ItemVendorBuyPrice[item]
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    cache.ItemVendorBuyPrice[item] = TSM_API.GetCustomPriceValue('vendorBuy', itemId)

    return cache.ItemVendorBuyPrice[item]
end

function TSMHelper.GetItemVendorSellPrice(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if cache.ItemVendorSellPrice[item] ~= nil then
        return cache.ItemVendorSellPrice[item]
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    cache.ItemVendorSellPrice[item] = TSM_API.GetCustomPriceValue('vendorSell', itemId)

    return cache.ItemVendorSellPrice[item]
end

function TSMHelper.GetItemDestroyingPrice(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if cache.ItemDestroyingPrice[item] ~= nil then
        return cache.ItemDestroyingPrice[item]
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    cache.ItemDestroyingPrice[item] = TSM_API.GetCustomPriceValue('Destroy', itemId)

    return cache.ItemDestroyingPrice[item]
end

function TSMHelper.GetItemSellRate(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if cache.ItemSellRates[item] ~= nil then
        return cache.ItemSellRates[item]
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    cache.ItemSellRates[item] = TSM_API.GetCustomPriceValue('DBregionsaleRate*100', itemId)

    return cache.ItemSellRates[item]
end

function TSMHelper.GetItemSoldPerDay(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if cache.ItemSellRates[item] ~= nil then
        return cache.ItemSellRates[item]
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    cache.ItemSellRates[item] = TSM_API.GetCustomPriceValue('DBRegionSoldPerDay', itemId)

    return cache.ItemSellRates[item]
end

function TSMHelper.GetItemLink(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    local id = type(item) == "number" and "i:" .. item or item

    return TSM_API.GetItemLink(id)
end

function TSMHelper.GetItemName(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if cache.ItemNames[item] ~= nil then
        return cache.ItemNames[item]
    end

    local id = type(item) == "number" and "i:" .. item or item

    cache.ItemNames[item] = TSM_API.GetItemName(id)

    return cache.ItemNames[item]
end

function TSMHelper.ToMoneyString(value)
    if not TSM_API then
        error("TSM addon not found")
    end

    return value ~= nil and TSM_API.FormatMoneyString(value) or ''
end

local function GetItemBelowTresholdValue()
    local price = core.TSMHelper.GetItemVendorSellPrice(id)
end

function TSMHelper.GetInventoryValue()
    local sum = 0
    local isValidData = true

    for bag = 0, 4 do
        local slots=GetContainerNumSlots(bag)

        for slot=1,slots do
            local _,c,_,q,_,_,link,_,_,id = GetContainerItemInfo(bag,slot)

            if c and id then
                local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bag, slot))
                local price = nil

                if isBound or (q ~= nil and q or -1) < core.Config.GetBagValueMinQuality() or (core.TSMHelper.GetItemPrice(id) or 0) < core.Config.GetBagValueMinPrice() * 10000 then
                    local belowTresholdValue = core.Config.GetBelowTresholdValue()
                    if belowTresholdValue == 1 then
                        price = core.TSMHelper.GetItemVendorSellPrice(id) or 0
                    elseif belowTresholdValue == 2 then
                        price = core.TSMHelper.GetItemDestroyingPrice(id) or core.TSMHelper.GetItemVendorSellPrice(id) or 0
                    else
                        price = 0
                    end
                else
                    price = core.TSMHelper.GetItemPrice(id)
                end

                if price ~= nil then
                    sum = sum + price * c;
                elseif not isBound then
                    core.GetString("NoPriceForItem"):format(link)
                end
            elseif GetContainerItemID(bag,slot) then
                isValidData = false
            end
        end
    end
    
    if isValidData then
        return sum
    else
        return nil
    end
end

function TSMHelper.GetPriceSources()
    return priceSources
end

function TSMHelper.DefaultPriceSource()
    return priceSources[1]
end

function TSMHelper.IsTSMAPIAvailable()
    return TSM_API ~= nil
end

function TSMHelper.IsTSMDBAvailable()
    -- checks if historical price for copper ore or current content ore is available
    return (TSM_API.GetCustomPriceValue('DBHistorical', "i:2770") or TSM_API.GetCustomPriceValue('DBHistorical', "i:152512")) ~= nil
end

function TSMHelper.ClearValueCache()
    cache.ItemValues = {}
    cache.ItemSellRates = {}
end