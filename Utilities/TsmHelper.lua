local WIT, core = ...

local TSMHelper = {}

core.TSMHelper = TSMHelper

local version = nil

local priceSources = {
    'Custom',
    'DBMinBuyout',
    'DBMarket',
    'DBHistorical',
    'DBRegionMinBuyoutAvg',
    'DBRegionMarketAvg',
    'DBRegionHistorical',
    'DBRegionSaleAvg'
}

TSMHelper.PetCageItemId = 82800

function TSMHelper.Initialize()
    version = GetAddOnMetadata("TradeSkillMaster", "Version")
end

function TSMHelper.IsValidCustomPrice(customPrice)
    return TSM_API.IsCustomPriceValid(customPrice)
end

function TSMHelper.HasCustomPrice(itemId)
    return TSMHelper.GetCustomPrice(itemId) ~= nil
end

function TSMHelper.GetCustomPrice(itemId)
    if type(itemId) == "string" then
        local petId = strsub(itemId, 3)
        for _, item in pairs(core.Config.GetCustomItemPrices()) do
            if item.PetId == petId then
                return item.PriceSource
            end
        end
    else
        for _, item in pairs(core.Config.GetCustomItemPrices()) do
            if item.ItemId == itemId then
                return item.PriceSource
            end
        end
    end

    return nil
end

local function getPriceSourceForItem(itemId)
    local priceSource = TSMHelper.GetCustomPrice(itemId)

    if not priceSource and (type(itemId) == "string" or itemId > 152500) then
        priceSource = core.Config.GetPriceSource()
        
        if priceSource == priceSources[1] then
            priceSource = core.Config.GetCustomPriceSource()
        end
    end

    if not priceSource and itemId <= 152500 then
        priceSource = core.Config.GetLegacyPriceSource()
        
        if priceSource == priceSources[1] then
            priceSource = core.Config.GetLegacyCustomPriceSource()
        end
    end

    return priceSource
end

function TSMHelper.GetItemPrice(item, priceSource)
    if not TSM_API then
        error("TSM addon not found")
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    if not priceSource or TSMHelper.HasCustomPrice(item) then
        priceSource = getPriceSourceForItem(item)
    end

    if not TSMHelper.IsValidCustomPrice(priceSource) then
        error("Invalid price source")
    end

    local value = TSM_API.GetCustomPriceValue(priceSource, itemId)

    if value == nil or value == 0 then
        local isMoreGeneral = false

        for _, alternativePriceSource in pairs(priceSources) do
            if isMoreGeneral and (value == nil or value == 0) then
                value = TSM_API.GetCustomPriceValue(alternativePriceSource, itemId)
            end

            if alternativePriceSource == priceSource then
                isMoreGeneral = true
            end
        end
    end

    return value
end

function TSMHelper.GetItemVendorBuyPrice(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    return TSM_API.GetCustomPriceValue('vendorBuy', itemId)
end

function TSMHelper.GetItemVendorSellPrice(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    return TSM_API.GetCustomPriceValue('vendorSell', itemId)
end

function TSMHelper.GetItemDestroyingPrice(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    return TSM_API.GetCustomPriceValue('Destroy', itemId)
end

function TSMHelper.GetItemSellRate(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    return TSM_API.GetCustomPriceValue('DBregionsaleRate*1000', itemId) or 0
end

function TSMHelper.GetItemSoldPerDay(item)
    if not TSM_API then
        error("TSM addon not found")
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    return TSM_API.GetCustomPriceValue('DBRegionSoldPerDay', itemId)
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

    local id = type(item) == "number" and "i:" .. item or item

    return TSM_API.GetItemName(id)
end

function TSMHelper.ToMoneyString(value)
    if not TSM_API then
        error("TSM addon not found")
    end

    return value ~= nil and TSM_API.FormatMoneyString(value) or ''
end

function TSMHelper.ToColoredMoneyString(value)
    if not TSM_API then
        error("TSM addon not found")
    end

    local moneyString = core.TSMHelper.ToMoneyString(value)

    if value ~= nil and value < 0 then
        moneyString = "|cFFFF0000" .. moneyString:gsub("|r", "|cFFFF0000") .. "|r"
    end

    return moneyString or ''
end

local function GetItemBelowThresholdValue()
    local price = core.TSMHelper.GetItemVendorSellPrice(id)
end

function TSMHelper.GetInventoryValue(priceSource)
    for i = 1, 10 do
        local value = TSMHelper.GetBagsValue({0, 1, 2, 3, 4}, priceSource)
        if value ~= nil then
            return value
        end
    end

    return nil
end

function TSMHelper.GetInventoryContent(priceSource)
    for i = 1, 10 do
        local list = TSMHelper.GetBagsContent({0, 1, 2, 3, 4}, priceSource)
        if list ~= nil then
            return list
        end
    end

    return nil
end

function TSMHelper.GetBankValue(priceSource)
    local bags = { BANK_CONTAINER }
    local bankSlots = GetNumBankSlots()
    for num = NUM_BAG_SLOTS+1, NUM_BAG_SLOTS+bankSlots do
        table.insert(bags, num)
    end

    for i = 1, 10 do
        local value = TSMHelper.GetBagsValue(bags, priceSource)
        if value ~= nil then
            return value
        end
    end

    return nil
end

function TSMHelper.GetBagsValue(bags, priceSource)
    local sum = 0
    local isValidData = true

    for _, bag in pairs(bags) do
        local slots=GetContainerNumSlots(bag)

        for slot=1,slots do
            local _,c,_,q,_,_,link,_,_,id = GetContainerItemInfo(bag,slot)

            if c and id then
                local _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(link)
                local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bag, slot))
                local price = nil
                local itemId = id == TSMHelper.PetCageItemId and 'p:'.. strmatch(link,"Hbattlepet:(%d+):") or id
                if (isBound and not TSMHelper.HasCustomPrice(itemId)) or core.ScrapHelper.IsJunk(id) or (q ~= nil and q or -1) < core.Config.GetBagValueMinQuality() or (core.TSMHelper.GetItemPrice(itemId, priceSource) or 0) < core.Config.GetBagValueMinPrice() * 10000 then
                    local belowThresholdValue = core.Config.GetBelowThresholdValue()
                    if belowThresholdValue == 1 then
                        price = itemSellPrice or 0
                    elseif belowThresholdValue == 2 then
                        price = core.TSMHelper.GetItemDestroyingPrice(id) or itemSellPrice or 0
                    else
                        price = 0
                    end
                else
                    price = core.TSMHelper.GetItemPrice(itemId, priceSource)
                end

                if price ~= nil then
                    sum = sum + price * c;
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

function TSMHelper.GetBagsContent(bags, priceSource)
    local list = {}
    local isValidData = true

    for _, bag in pairs(bags) do
        local slots=GetContainerNumSlots(bag)

        for slot=1,slots do
            local _,c,_,q,_,_,link,_,_,id = GetContainerItemInfo(bag,slot)

            if c and id then
                local _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(link)
                local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bag, slot))
                local price = nil
                local itemId = id == TSMHelper.PetCageItemId and 'p:'.. strmatch(link,"Hbattlepet:(%d+):") or id
                if (isBound and not TSMHelper.HasCustomPrice(itemId)) or core.ScrapHelper.IsJunk(id) or (q ~= nil and q or -1) < core.Config.GetBagValueMinQuality() or (core.TSMHelper.GetItemPrice(itemId, priceSource) or 0) < core.Config.GetBagValueMinPrice() * 10000 then
                    local belowThresholdValue = core.Config.GetBelowThresholdValue()
                    if belowThresholdValue == 1 then
                        price = itemSellPrice or 0
                    elseif belowThresholdValue == 2 then
                        price = core.TSMHelper.GetItemDestroyingPrice(id) or itemSellPrice or 0
                    else
                        price = 0
                    end
                else
                    price = core.TSMHelper.GetItemPrice(itemId, priceSource)
                end

                if price ~= nil and price > 0 then
                    local item
                    for _, i in pairs(list) do
                        if i.Id == itemId then
                            item = i
                        end
                    end

                    if item then
                        item.Quantity = item.Quantity + c
                    else
                        table.insert(list, { Id = itemId, ItemLink = link, Quantity = c, Price = price })
                    end
                end
            elseif GetContainerItemID(bag,slot) then
                isValidData = false
            end
        end
    end
    
    if isValidData then
        return list
    else
        return nil
    end
end

function TSMHelper.GetPriceSources()
    return priceSources
end

function TSMHelper.DefaultPriceSource()
    return priceSources[3]
end

function TSMHelper.IsTSMAPIAvailable()
    return TSM_API ~= nil
end

function TSMHelper.IsTSMDBAvailable()
    -- checks if historical price for copper ore or current content ore is available
    return (TSM_API.GetCustomPriceValue('DBHistorical', "i:2770") or TSM_API.GetCustomPriceValue('DBHistorical', "i:152512")) ~= nil
end
