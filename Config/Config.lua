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