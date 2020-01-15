local WIT, core = ...

local TSMHelper = {}

core.TSMHelper = TSMHelper

local cache = { ItemValues = {}, ItemVendorBuyPrice = {}, ItemVendorSellPrice = {}, ItemSellRates = {}, ItemNames = {}, ItemLinks = {} }
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

    cache.ItemValues[item] = TSM_API.GetCustomPriceValue(WITDB.Settings.PricingSelect, itemId)

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

function TSMHelper.GetItemSellRate(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    if cache.ItemSellRates[item] ~= nil then
        return cache.ItemSellRates[item]
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    cache.ItemSellRates[item] = TSM_API.GetCustomPriceValue('DBregionsaleRate', itemId)

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

    if cache.ItemLinks[item] ~= nil then
        return cache.ItemLinks[item]
    end

    local id = type(item) == "number" and "i:" .. item or item

    cache.ItemLinks[item] = TSM_API.GetItemLink(id)

    return cache.ItemLinks[item]
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

function TSMHelper.GetInventoryValue()
    local sum = 0
    local isValidData = true

    for bag = 0, 4 do
        local slots=GetContainerNumSlots(bag)

        for slot=1,slots do
            local _,q,locked,_,_,_,link,_,_,id = GetContainerItemInfo(bag,slot)

            if q and id then
                local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bag, slot))
                local price = nil

                if isBound then
                    price = core.TSMHelper.GetItemVendorSellPrice(id)
                else
                    price = core.TSMHelper.GetItemPrice(id)
                end

                if price then
                    sum = sum + price * q;
                elseif not isBound then
                    core.GetString("NoPriceForItem"):format(link)
                end
            elseif GetContainerItemID(bag,slot) then
                isValidData = false
                --print("--------")
                --print("locked: " .. (locked and "true" or "false"))
                --print("q: " .. (q ~= nil and q or "nil"))
                --print("id: " .. (id ~= nil and id or "nil"))
                --print("link: " .. (link ~= nil and link or "nil"))
            end
        end
    end
    
    if isValidData then
        return sum
    else
        return nil
    end
end

function TSMHelper.GetInventoryValue2()
    local sum = 0;
    
    for bag = 0, 4 do
        local slots=GetContainerNumSlots(bag)

        for slot=1,slots do
            local _,q,locked,_,_,_,link,_,_,id = GetContainerItemInfo(bag,slot)

            if q and id then
                local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bag, slot))
                local price = nil

                if isBound then
                    price = core.TSMHelper.GetItemVendorSellPrice(id)
                else
                    price = core.TSMHelper.GetItemPrice(id)
                end

                if price then
                    sum = sum + price * q;
                elseif not isBound then
                    core.GetString("NoPriceForItem"):format(link)
                end
            else
                --print("--------")
                --print("locked: " .. (locked and "true" or "false"))
                --print("q: " .. (q ~= nil and q or "nil"))
                --print("id: " .. (id ~= nil and id or "nil"))
                --print("link: " .. (link ~= nil and link or "nil"))
            end
        end
    end
    
    return sum
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