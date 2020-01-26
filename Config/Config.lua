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

        if WITDB.Settings.PricingSelect == 'DBMinBuyout' then
            WITDB.Settings.PricingSelect = core.TSMHelper.DefaultPriceSource()
            print(core.GetString("PriceSourceSetToDefault"):format(core.TSMHelper.ToMoneyString(value)))
        end

        WITDB.minimap = nil
    end

    WITDB.Settings.BagValueMinPrice = WITDB.Settings.BagValueMinPrice or 0
    WITDB.Settings.BagValueMinQuality = WITDB.Settings.BagValueMinQuality or 1
    WITDB.Settings.BelowTresholdValue = WITDB.Settings.BelowTresholdValue or 1

    WITDB.Settings.Modules = WITDB.Settings.Modules or { Dashboard = { ShowCurrentContent = true, Farms = {} }}

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

function Config.GetBelowTresholdValue()
    return WITDB.Settings.BelowTresholdValue
end

function Config.SetBelowTresholdValue(value)
    WITDB.Settings.BelowTresholdValue = value

    core.UI.ClearBagValue()
end

function Config.GetModulesConfig()
    return WITDB.Settings.Modules
end