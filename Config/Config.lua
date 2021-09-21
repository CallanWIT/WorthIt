local WIT, core = ...
core.Config = {}

local Config = core.Config

function Config.Initialize()
    local version = core.VersionHelper.GetVersion()
    
    if not WITDB then
        WITDB = WITDB or {}
    end

    if not WITDB.Version then
        WITDB.Settings = WITDB.Settings or {}
        WITDB.Settings.PricingSelect = WITDB.Settings.PricingSelect or core.TSMHelper.DefaultPriceSource()
        WITDB.Settings.MinimapIcon = WITDB.minimap or WITDB.Settings.MinimapIcon or {}

        WITDB.minimap = nil
    end

    WITDB.Settings.HideMinimapIcon = WITDB.Settings.HideMinimapIcon or false

    WITDB.Settings.PricingSelect = WITDB.Settings.PricingSelect == 'DBRegionMinBuyoutAvg' and 'DBRegionMarketAvg' or WITDB.Settings.PricingSelect
    WITDB.Settings.LegacyPricingSelect = WITDB.Settings.LegacyPricingSelect == 'DBRegionMinBuyoutAvg' and 'DBRegionMarketAvg' or WITDB.Settings.LegacyPricingSelect or WITDB.Settings.PricingSelect
    WITDB.Settings.BagValueMinPrice = WITDB.Settings.BagValueMinPrice or 0
    WITDB.Settings.BagValueMinQuality = WITDB.Settings.BagValueMinQuality or 1
    WITDB.Settings.BelowTresholdValue = WITDB.Settings.BelowTresholdValue or 1

    WITDB.Settings.CustomPriceSource = WITDB.Settings.CustomPriceSource == 'DBRegionMinBuyoutAvg' and 'DBRegionMarketAvg' or WITDB.Settings.CustomPriceSource or 'DBMinBuyout'
    WITDB.Settings.LegacyCustomPriceSource = WITDB.Settings.LegacyCustomPriceSource == 'DBRegionMinBuyoutAvg' and 'DBRegionMarketAvg' or WITDB.Settings.LegacyCustomPriceSource or 'DBMinBuyout'

    WITDB.Settings.RecorderMinPrice = WITDB.Settings.RecorderMinPrice or 0
    WITDB.Settings.RecorderMinQuality = WITDB.Settings.RecorderMinQuality or 1

    WITDB.Settings.FarmPlannerIds = WITDB.Settings.FarmPlannerIds or {}
    WITDB.Settings.CustomItemPrices = WITDB.Settings.CustomItemPrices or {}

    WITDB.Settings.Recorder = WITDB.Settings.Recorder or {}

    WITDB.Settings.Modules = WITDB.Settings.Modules or { Dashboard = { ShowCurrentContent = true, Farms = {} }}

    WITDB.UserData = WITDB.UserData or { Farms = {}}

    WITDB.UserData.ColumnFilters = WITDB.UserData.ColumnFilters or {}

    WITDB.Version = version
end

function Config.GetScaling()
    return 1.2
end

function Config.GetPriceSource()
    return WITDB.Settings.PricingSelect
end

function Config.SetPriceSource(priceSource)
    WITDB.Settings.PricingSelect = priceSource

    core.ClearCache()
end

function Config.GetCustomPriceSource()
    return WITDB.Settings.CustomPriceSource
end

function Config.GetPriceSourceString()
    return WITDB.Settings.PricingSelect == 'Custom' and WITDB.Settings.CustomPriceSource or WITDB.Settings.PricingSelect
end

function Config.SetCustomPriceSource(priceSource)
    WITDB.Settings.CustomPriceSource = priceSource

    core.ClearCache()
end

function Config.GetLegacyPriceSource()
    return WITDB.Settings.LegacyPricingSelect
end

function Config.SetLegacyPriceSource(priceSource)
    WITDB.Settings.LegacyPricingSelect = priceSource

    core.ClearCache()
end

function Config.GetLegacyCustomPriceSource()
    return WITDB.Settings.LegacyCustomPriceSource
end

function Config.SetLegacyCustomPriceSource(priceSource)
    WITDB.Settings.LegacyCustomPriceSource = priceSource

    core.ClearCache()
end

function Config.GetBagValueMinPrice()
    return WITDB.Settings.BagValueMinPrice
end

function Config.SetBagValueMinPrice(price)
    WITDB.Settings.BagValueMinPrice = price

    core.UI.ClearBagValue()
end

function Config.GetBagValueMinQuality()
    return WITDB.Settings.BagValueMinQuality
end

function Config.SetBagValueMinQuality(quality)
    WITDB.Settings.BagValueMinQuality = quality

    core.UI.ClearBagValue()
end

function Config.GetBelowThresholdValue()
    return WITDB.Settings.BelowTresholdValue
end

function Config.SetBelowThresholdValue(value)
    WITDB.Settings.BelowTresholdValue = value

    core.UI.ClearBagValue()
end

function Config.GetModulesConfig()
    return WITDB.Settings.Modules
end

function Config.GetRecorderMinPrice()
    return WITDB.Settings.RecorderMinPrice
end

function Config.SetRecorderMinPrice(price)
    WITDB.Settings.RecorderMinPrice = price
end

function Config.GetRecorderMinQuality()
    return WITDB.Settings.RecorderMinQuality
end

function Config.SetRecorderMinQuality(quality)
    WITDB.Settings.RecorderMinQuality = quality
end

function Config.GetCurrentRecorderSession()
    return WITDB.Settings.CurrentRecorderSession
end

function Config.SetCurrentRecorderSession(session)
    WITDB.Settings.CurrentRecorderSession = session
end

function Config.GetPlannedFarmIds()
    return WITDB.Settings.FarmPlannerIds
end

function Config.GetCustomItemPrices()
    return WITDB.Settings.CustomItemPrices
end

function Config.GetUserFarms()
    return WITDB.UserData.Farms
end

function Config.GetColumnFilter(key)
    return WITDB.UserData.ColumnFilters[key]
end

function Config.SetColumnFilter(key, filter)
    WITDB.UserData.ColumnFilters[key] = filter
end
