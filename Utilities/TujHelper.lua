local WIT, core = ...

local TUJHelper = {}

core.TUJHelper = TUJHelper

local version = nil

local priceSources = {
    'Custom',
    'recent',
    'market',
    'globalMean',
    'globalMedian'
}

local statistics = {
    'recent',
    'market',
    'globalStdDev',
    'stddev',
    'globalMean',
    'globalMedian'
}

TUJHelper.PetCageItemId = 82800

function TUJHelper.Initialize()
    version = GetAddOnMetadata("TheUndermineJournal", "Version")
end

function TUJHelper.IsValidCustomPrice(customPriceString)
    local customPrice = strlower(customPriceString)

    for _, f in pairs(statistics) do
        local pattern = strlower(f) .. '%(%a*:?%d+%)'
        customPrice = gsub(customPrice, pattern, '112233')
        customPrice = gsub(customPrice, strlower(f), '112233')
    end

    customPrice = gsub(customPrice,'(%d)g','%10000')
    customPrice = gsub(customPrice,'(%d)s','%100')
    customPrice = gsub(customPrice,'(%d)c','%1')

    local stripped = gsub(customPrice, 'min(', '(')
    stripped = gsub(stripped, 'max(', '(')
    stripped = gsub(stripped, 'abs(', '(')
    stripped = gsub(stripped, 'floor(', '(')
    stripped = gsub(stripped, 'ceil(', '(')

    if (strfind(stripped, '%a')) then
        return false
    end

    local res, ret = pcall(loadstring('return ' .. customPrice))

    return res and type(ret) == 'number'
end

function TUJHelper.HasCustomPrice(itemId)
    return TUJHelper.GetCustomPrice(itemId) ~= nil
end

function TUJHelper.GetCustomPrice(itemId)
    if type(itemId) == "string" then
        local petId = strsub(itemId, 3)
        for _, item in pairs(core.Config.GetCustomItemPrices()) do
            if item.PetId == petId then
                return item.PriceSource == "" and core.Config.GetPriceSourceString() or item.PriceSource
            end
        end
    else
        for _, item in pairs(core.Config.GetCustomItemPrices()) do
            if item.ItemId == itemId then
                return item.PriceSource == "" and core.Config.GetPriceSourceString() or item.PriceSource
            end
        end
    end

    return nil
end

local function calculateCustomPrice(itemId, customPriceString)
    local customPrice = strlower(customPriceString)

    if (type(itemId) == 'string') then
        itemId = strlower(itemId)
        itemId = gsub(itemId,'p:','battlepet:')
        itemId = gsub(itemId,'i:','item:')
    end

    local itemPrice = TUJMarketInfo(itemId)

    for _, f in pairs(statistics) do
        if customPrice == strlower(f) then
            return itemPrice[f]
        end
    end

    for _, f in pairs(statistics) do
        local pattern = strlower(f) .. '(%(%a*:?%d+%))'
        repeat
            local number = strmatch(customPrice, pattern)
            if (number ~= nil) then
                number = strsub(number, 2, strlen(number))
                number = gsub(number,'p:','battlepet:')
                number = gsub(number,'i:','item:')
                customPrice = gsub(customPrice, pattern, tostring(TUJMarketInfo(number)[f] or 0), 1)
            end
        until (number == nil)

        customPrice = gsub(customPrice, strlower(f), tostring(itemPrice[f] or 0))
    end

    customPrice = gsub(customPrice,'(%d)g','%10000')
    customPrice = gsub(customPrice,'(%d)s','%100')
    customPrice = gsub(customPrice,'(%d)c','%1')

    local res, ret = pcall(loadstring('return ' .. customPrice))

    return res and ret or nil
end

local function getPriceSourceForItem(itemId)
    local priceSource = TUJHelper.GetCustomPrice(itemId)

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

function TUJHelper.GetItemPrice(item, priceSource)
    if not TUJHelper.IsTUJAPIAvailable() then
        error("TUJ addon not found")
    end

    local itemId = type(item) == "number" and "i:" .. item or item

    if not priceSource or TUJHelper.HasCustomPrice(item) then
        priceSource = getPriceSourceForItem(item)
    end

    if not TUJHelper.IsValidCustomPrice(priceSource) then
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

function TUJHelper.GetItemVendorBuyPrice(item)
    if (type(item) == 'string') then
        item = strlower(item)
        item = gsub(item,'p:','battlepet:')
        item = gsub(item,'i:','item:')
    end

    return 0
end

function TUJHelper.GetItemVendorSellPrice(item)
    if (type(item) == 'string') then
        item = strlower(item)
        item = gsub(item,'p:','battlepet:')
        item = gsub(item,'i:','item:')
    end

    local _, _, _, _, _, _, _, _, _, _, itemSellPrice = GetItemInfo(item)

    return itemSellPrice or 0
end

function TUJHelper.GetItemDestroyingPrice(item)
    return 0
end

function TUJHelper.GetItemSellRate(item)
    return 0
end

function TUJHelper.GetItemSoldPerDay(item)
    return 0
end

function TUJHelper.GetItemLink(item)
    if (type(item) == 'string') then
        item = gsub(item,'p:','battlepet:')
        item = gsub(item,'i:','item:')
    end

    local _, link = GetItemInfo(item)

    if link ~= nil then
        return link
    end

    if (strfind(stripped, '%a')) then
        return false
    end

    local isPet = type(item) == 'string' and strfind(item, 'battlepet:')

    if (type(item) == 'string') then
        item = tonumber(strmatch('item', '%d+'))
    end

    if isPet then
        return "\124cffff0000\124Hbattlepet:" .. item ..":1:3:158::::\124h[Item is loading]\124h\124r"
    end

    return "\124cffff0000\124Hitem:" .. item .."::::::::60:::::\124h[Item is loading]\124h\124r"
end

function TUJHelper.GetItemName(item)
    if (type(item) == 'string') then
        item = gsub(item,'p:','battlepet:')
        item = gsub(item,'i:','item:')
    end

    local _, _, name = GetItemInfo(item)

    return name or 'Item is loading'
end

function TUJHelper.ToMoneyString(value)
    if value == nil then
        return ''
    end

    value = floor(tonumber(value) or 0)
    local gold = floor(value / 10000)
    local silver = floor(value % 10000 / 100)
    local copper = value % 100

    local goldText = gold > 0 and ('%d|cffffd70ag|r'):format(gold) or nil
    local silverText = silver > 0 and (silver < 10 and '0' or '') .. ('%d|cffc7c7cfs|r'):format(silver) or nil
    local copperText = (copper < 10 and '0' or '') .. ('%d|cffeda55fc|r'):format(copper or 0)

    return (goldText and goldText .. ' ' or '') .. (silverText and silverText .. ' ' or '') 
end

function TUJHelper.ToColoredMoneyString(value)
    local moneyString = core.TUJHelper.ToMoneyString(value)

    if value ~= nil and value < 0 then
        moneyString = "|cFFFF0000" .. moneyString:gsub("|r", "|cFFFF0000") .. "|r"
    end

    return moneyString or ''
end

function TUJHelper.GetInventoryValue(priceSource)
    for i = 1, 10 do
        local value = TUJHelper.GetBagsValue({0, 1, 2, 3, 4}, priceSource)
        if value ~= nil then
            return value
        end
    end

    return nil
end

function TUJHelper.GetInventoryContent(priceSource)
    for i = 1, 10 do
        local list = TUJHelper.GetBagsContent({0, 1, 2, 3, 4}, priceSource)
        if list ~= nil then
            return list
        end
    end

    return nil
end

function TUJHelper.GetBankValue(priceSource)
    local bags = { BANK_CONTAINER }
    local bankSlots = GetNumBankSlots()
    for num = NUM_BAG_SLOTS+1, NUM_BAG_SLOTS+bankSlots do
        table.insert(bags, num)
    end

    for i = 1, 10 do
        local value = TUJHelper.GetBagsValue(bags, priceSource)
        if value ~= nil then
            return value
        end
    end

    return nil
end

function TUJHelper.GetBagsValue(bags, priceSource)
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
                local itemId = id == TUJHelper.PetCageItemId and 'p:'.. strmatch(link,"Hbattlepet:(%d+):") or id
                if (isBound and not TUJHelper.HasCustomPrice(itemId)) or core.ScrapHelper.IsJunk(id) or (q ~= nil and q or -1) < core.Config.GetBagValueMinQuality() or (core.TUJHelper.GetItemPrice(itemId, priceSource) or 0) < core.Config.GetBagValueMinPrice() * 10000 then
                    local belowThresholdValue = core.Config.GetBelowThresholdValue()
                    if belowThresholdValue == 1 then
                        price = itemSellPrice or 0
                    elseif belowThresholdValue == 2 then
                        price = itemSellPrice or 0
                    else
                        price = 0
                    end
                else
                    price = core.TUJHelper.GetItemPrice(itemId, priceSource)
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

function TUJHelper.GetBagsContent(bags, priceSource)
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
                local itemId = id == TUJHelper.PetCageItemId and 'p:'.. strmatch(link,"Hbattlepet:(%d+):") or id
                if (isBound and not TUJHelper.HasCustomPrice(itemId)) or core.ScrapHelper.IsJunk(id) or (q ~= nil and q or -1) < core.Config.GetBagValueMinQuality() or (core.TUJHelper.GetItemPrice(itemId, priceSource) or 0) < core.Config.GetBagValueMinPrice() * 10000 then
                    local belowThresholdValue = core.Config.GetBelowThresholdValue()
                    if belowThresholdValue == 1 then
                        price = itemSellPrice or 0
                    elseif belowThresholdValue == 2 then
                        price = itemSellPrice or 0
                    else
                        price = 0
                    end
                else
                    price = core.TUJHelper.GetItemPrice(itemId, priceSource)
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

function TUJHelper.GetPriceSources()
    return priceSources
end

function TUJHelper.DefaultPriceSource()
    return priceSources[3]
end

function TUJHelper.IsTUJAPIAvailable()
    return TUJMarketInfo ~= nil
end

function TUJHelper.IsTUJDBAvailable()
    -- checks if historical price for copper ore or current content ore is available
    return TUJHelper.IsTUJAPIAvailable() and (TUJMarketInfo(2770)['globalMean'] or TUJMarketInfo(152512)['globalMean']) ~= nil
end
