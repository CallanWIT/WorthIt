local WIT, core = ...

-- Vanilla

core.Data.Results.Farms.EssenceOfFire = {
    ItemId = core.Items.Misc.EssenceOfFire,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.MoltenCore },
    Routes = { core.Data.Routes.Misc.EssenceOfFireEarthBurningSteppes },
    Results = {
        { Id = core.Items.Misc.EssenceOfFire, Quantity = 17 },
		{ Id = core.Items.Misc.EssenceOfEarth, Quantity = 20 },
    }
}

core.Data.Results.Farms.EssenceOfWater = {
    ItemId = core.Items.Misc.EssenceOfWater,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.SwampOfSorrows },
    Routes = { core.Data.Routes.Misc.EssenceOfWaterSwampOfSorrows },
    Results = {
        { Id = core.Items.Misc.EssenceOfWater, Quantity = 44 },
    }
}

core.Data.Results.Farms.EssenceOfAir = {
    ItemId = core.Items.Misc.EssenceOfAir,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Silithus },
    Routes = { core.Data.Routes.Misc.EssenceOfAirSilithus },
    Results = {
        { Id = core.Items.Misc.EssenceOfAir, Quantity = 21 },
		{ Id = core.Items.Misc.ElementalAir, Quantity = 46 },
		{ Id = core.Items.Misc.BreathOfWind, Quantity = 37 },
    }
}

core.Data.Results.Farms.EssenceOfUndeath = {
    ItemId = core.Items.Misc.EssenceOfUndeath,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Winterspring },
    Routes = { core.Data.Routes.Misc.EssenceOfUndeathWinterspring },
    Results = {
        { Id = core.Items.Misc.EssenceOfUndeath, Quantity = 30 },
    }
}

core.Data.Results.Farms.LivingEssence = {
    ItemId = core.Items.Misc.LivingEssence,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.BlastedLands },
    Routes = { core.Data.Routes.Misc.LivingEssenceBlastedLands },
    Results = {
        { Id = core.Items.Misc.LivingEssence, Quantity = 30 },
    }
}

-- BC 

core.Data.Results.Farms.PrimalEarth = {
    ItemId = core.Items.Misc.PrimalEarth,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.Nagrand },
    Routes = { core.Data.Routes.Misc.PrimalEarthNagrand },
    Results = {
        { Id = core.Items.Misc.PrimalEarth, Quantity = 13 },
    }
}

core.Data.Results.Farms.PrimalLife = {
    ItemId = core.Items.Misc.PrimalLife,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.Underbog },
    Routes = { core.Data.Routes.Misc.PrimalLifeZangarmarsh },
    Results = {
        { Id = core.Items.Misc.PrimalLife, Quantity = 14 },
    }
}

core.Data.Results.Farms.PrimalMana = {
    ItemId = core.Items.Misc.PrimalMana,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.Netherstorm },
    Routes = { core.Data.Routes.Misc.PrimalManaNetherstorm },
    Results = {
        { Id = core.Items.Misc.PrimalMana, Quantity = 44 },
    }
}

core.Data.Results.Farms.PrimalShadow = {
    ItemId = core.Items.Misc.PrimalShadow,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.HellfirePeninsula },
    Routes = { core.Data.Routes.Misc.PrimalShadowHellfirePeninsula },
    Results = {
        { Id = core.Items.Misc.PrimalShadow, Quantity = 29 },
    }
}

core.Data.Results.Farms.PrimalWater  = {
    ItemId = core.Items.Misc.PrimalWater,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.BlackTemple },
    Routes = { core.Data.Routes.Misc.PrimalWaterShadowmoonValley },
    Results = {
        { Id = core.Items.Misc.PrimalWater, Quantity = 20 },
    }
}

core.Data.Results.Farms.PrimalFire = {
    ItemId = core.Items.Misc.PrimalFire,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.HellfirePeninsula },
    Routes = { core.Data.Routes.Misc.PrimalFireHellfirePeninsula },
    Results = {
        { Id = core.Items.Misc.PrimalFire, Quantity = 23 },
    }
}

core.Data.Results.Farms.PrimalAir = {
    ItemId = core.Items.Misc.PrimalAir,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.ShadowmoonValleyOld },
    Routes = { core.Data.Routes.Misc.PrimalAirShadowmoonValley },
    Results = {
        { Id = core.Items.Misc.PrimalAir, Quantity = 18 },
    }
}

-- WOTLK 

core.Data.Results.Farms.EternalWater = {
    ItemId = core.Items.Misc.EternalWater,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.ZulDrak },
    Routes = { core.Data.Routes.Misc.EternalWaterZulDrak },
    Results = {
        { Id = core.Items.Misc.EternalWater, Quantity = 38 },
    }
}

core.Data.Results.Farms.EternalAir = {
    ItemId = core.Items.Misc.EternalAir,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.StormPeaks },
    Results = {
        { Id = core.Items.Misc.EternalAir, Quantity = 20 },
    }
}

core.Data.Results.Farms.EternalFire = {
    ItemId = core.Items.Misc.EternalFire,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.StormPeaks },
    Routes = { core.Data.Routes.Misc.EternalFireTheStormPeaks },
    Results = {
        { Id = core.Items.Misc.EternalFire, Quantity = 23 },
    }
}

core.Data.Results.Farms.EternalEarth = {
    ItemId = core.Items.Misc.EternalEarth,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Wintergrasp },
    Results = {
        { Id = core.Items.Misc.EternalEarth, Quantity = 18 },
    }
}

core.Data.Results.Farms.EternalLife = {
    ItemId = core.Items.Misc.EternalLife,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.HowlingFjord },
    Routes = { core.Data.Routes.Misc.EternalLifeHowlingFjord },
    Results = {
        { Id = core.Items.Misc.EternalLife, Quantity = 42 },
    }
}

-- Cata

core.Data.Results.Farms.VolatileFire = {
    ItemId = core.Items.Misc.VolatileFire,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.MtHyjal },
    Routes = { core.Data.Routes.Misc.VolatileFireMountHyjal },
    Results = {
        { Id = core.Items.Misc.VolatileFire, Quantity = 330 },
    }
}

core.Data.Results.Farms.VolatileWater = {
    ItemId = core.Items.Misc.VolatileWater,
    Content = core.Content.Cata,
    Locations = { core.Locations.EasternKingdoms.TwilightHighlands },
    Routes = { core.Data.Routes.Misc.VolatileWaterTwilightHighlands },
    Results = {
        { Id = core.Items.Misc.VolatileWater, Quantity = 306 },
    }
}

core.Data.Results.Farms.VolatileEarth = {
    ItemId = core.Items.Misc.VolatileEarth,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.MtHyjal },
    Routes = { core.Data.Routes.Misc.VolatileEarthMountHyjal },
    Results = {
        { Id = core.Items.Misc.VolatileEarth, Quantity = 404 },
    }
}

core.Data.Results.Farms.VolatileAir = {
    ItemId = core.Items.Misc.VolatileAir,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.VortexPininacle },
    Routes = { core.Data.Routes.Misc.VolatileAirUldum },
    Results = {
        { Id = core.Items.Misc.VolatileAir, Quantity = 210 },
    }
}

core.Data.Results.Farms.VolatileLife = {
    ItemId = core.Items.Misc.VolatileLife,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.Uldum },
    Results = {
        { Id = core.Items.Misc.VolatileLife, Quantity = 210 },
		{ Id = core.Items.Herbs.Whiptail, Quantity = 716 },
    }
}

-- Mop

core.Data.Results.Farms.SpiritOfHarmony = {
    ItemId = core.Items.Misc.SpiritOfHarmony,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.HeartOfFear },
    Routes = { core.Data.Routes.Misc.SpiritOfHarmonyDreadWastes },
    Results = {
        { Id = core.Items.Misc.SpiritOfHarmony, Quantity = 9 },
    }
}

































