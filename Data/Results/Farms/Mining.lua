local WIT, core = ...

core.Data.Results.Farms.CopperOre = {
    ItemId = core.Items.Ores.Copper,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Durotar },
    Routes = { core.Data.Routes.Mining.CopperOreDurotar },
    Results = {
        { Id = core.Items.Ores.Copper, Quantity = 540 },
        { Id = core.Items.Stones.Rough, Quantity = 504 },
        { Id = core.Items.Gems.Tigerseye, Quantity = 7 },
        { Id = core.Items.Gems.Malachite, Quantity = 6 },
        { Id = core.Items.Gems.Shadowgem, Quantity = 5 },
    }
}

core.Data.Results.Farms.TinOre = {
    ItemId = core.Items.Ores.Tin,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.HillsbradFoothills },
    Routes = { core.Data.Routes.Mining.TinOreAshenvale },
    Results = {
        { Id = core.Items.Ores.Tin, Quantity = 416 },
        { Id = core.Items.Stones.Coarse, Quantity = 474 },
        { Id = core.Items.Gems.LesserMoonstone, Quantity = 5 },
        { Id = core.Items.Gems.MossAgate, Quantity = 5 },
        { Id = core.Items.Gems.Jade, Quantity = 3 },
        { Id = core.Items.Gems.Shadowgem, Quantity = 8 },
        { Id = core.Items.Gems.Aquamarine, Quantity = 1 },
    }
}

core.Data.Results.Farms.IronOre = {
    ItemId = core.Items.Ores.Iron,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Ashenvale },
    Routes = { core.Data.Routes.Mining.IronOreWesternPlaguelands },
    Results = {
        { Id = core.Items.Ores.Iron, Quantity = 538 },
        { Id = core.Items.Ores.Gold, Quantity = 47 },
        { Id = core.Items.Stones.Heavy, Quantity = 628 },
        { Id = core.Items.Gems.Jade, Quantity = 15 },
        { Id = core.Items.Gems.LesserMoonstone, Quantity = 6 },
        { Id = core.Items.Gems.Citrine, Quantity = 10 },
        { Id = core.Items.Gems.Aquamarine, Quantity = 1 },
    }
}

core.Data.Results.Farms.ThoriumOre = {
    ItemId = core.Items.Ores.Thorium,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Silithus },
    Routes = { core.Data.Routes.Mining.ThoriumOreSilithus },
    Results = {
        { Id = core.Items.Ores.Thorium, Quantity = 575 },
        { Id = core.Items.Ores.Truesilver, Quantity = 48 },
        { Id = core.Items.Stones.Dense, Quantity = 777 },
        { Id = core.Items.Gems.ArcaneCrystal, Quantity = 21 },
        { Id = core.Items.Gems.AzerothianDiamond, Quantity = 10 },
        { Id = core.Items.Gems.LargeOpal, Quantity = 3 },
        { Id = core.Items.Gems.Aquamarine, Quantity = 1 },
    }
}

core.Data.Results.Farms.DarkIronOre = {
    ItemId = core.Items.Ores.DarkIron,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.MoltenCore },
    Results = {
        { Id = core.Items.Ores.DarkIron, Quantity = 303 },
        { Id = core.Items.Gems.BloodOfTheMountain, Quantity = 3 },
    }
}

core.Data.Results.Farms.FelIronOre = {
    ItemId = core.Items.Ores.FelIron,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.TerokkarForest },
    Routes = { core.Data.Routes.Mining.FelIronOreTerokkarForest },
    Results = {
        { Id = core.Items.Ores.FelIron, Quantity = 131 },
        { Id = core.Items.Ores.Adamantite, Quantity = 168 },
        { Id = core.Items.Ores.Eternium, Quantity = 21 },
        { Id = core.Items.Ores.Khorium, Quantity = 18 },
        { Id = core.Items.Elements.MoteOfEarth, Quantity = 150 },
        { Id = core.Items.Elements.MoteOfFire, Quantity = 43 },
        { Id = core.Items.Gems.AzureMoonstone, Quantity = 2 },
        { Id = core.Items.Gems.NobleTopaz, Quantity = 1 },
        { Id = core.Items.Gems.FlameSpessarite, Quantity = 2 },
        { Id = core.Items.Gems.ShadowDraenite, Quantity = 3 },
    }
}

core.Data.Results.Farms.CobaltOre = {
    ItemId = core.Items.Ores.Cobalt,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.BoreanTundra },
    Routes = { core.Data.Routes.Mining.CobaltOreBoreanTundra },
    Results = {
        { Id = core.Items.Ores.Cobalt, Quantity = 226 },
    }
}

core.Data.Results.Farms.SaroniteOre = {
    ItemId = core.Items.Ores.Saronite,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Wintergrasp },
    Routes = { core.Data.Routes.Mining.SaroniteOreWintergrasp },
    Results = {
        { Id = core.Items.Ores.Saronite, Quantity = 425 },
        { Id = core.Items.Ores.Titanium, Quantity = 31 },
        { Id = core.Items.Elements.CrystallizedWater, Quantity = 37 },
        { Id = core.Items.Elements.CrystallizedAir, Quantity = 29 },
        { Id = core.Items.Elements.CrystallizedEarth, Quantity = 155 },
        { Id = core.Items.Elements.CrystallizedFire, Quantity = 21 },
        { Id = core.Items.Gems.SkySapphire, Quantity = 1 },
        { Id = core.Items.Gems.TwilightOpal, Quantity = 1 },
        { Id = core.Items.Gems.ScarletRuby, Quantity = 1 },
        { Id = core.Items.Gems.ShadowCrystal, Quantity = 5 },
        { Id = core.Items.Gems.DarkJade, Quantity = 4 },
        { Id = core.Items.Gems.Bloodstone, Quantity = 4 },
        { Id = core.Items.Gems.Chalcedony, Quantity = 5 },
        { Id = core.Items.Gems.SunCrystal, Quantity = 5 },
        { Id = core.Items.Gems.HugeCitrine, Quantity = 7 },
    }
}

core.Data.Results.Farms.ObsidiumOre = {
    ItemId = core.Items.Ores.Obsidium,
    Content = core.Content.Cata,
    Locations = { core.Locations.Others.Vashjir },
    Routes = { core.Data.Routes.Mining.ObsidiumOreAbyssalDepths },
    Results = {
        { Id = core.Items.Ores.Obsidium, Quantity = 403 },
        { Id = core.Items.Elements.VolatileEarth, Quantity = 18 },
        { Id = core.Items.Gems.Alicite, Quantity = 1 },
        { Id = core.Items.Gems.Carnelian, Quantity = 2 },
        { Id = core.Items.Gems.Zephyrite, Quantity = 1 },
        { Id = core.Items.Gems.Jasper, Quantity = 1 },
        { Id = core.Items.Gems.Hessonite, Quantity = 2 },
        { Id = core.Items.Gems.Amberjewel, Quantity = 1 },
        { Id = core.Items.Gems.DreamEmerald, Quantity = 1 },
    }
}

core.Data.Results.Farms.ElementiumOre = {
    ItemId = core.Items.Ores.Elementium,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.Uldum },
    Routes = { core.Data.Routes.Mining.PyriteOreUldum },
    Results = {
        { Id = core.Items.Ores.Elementium, Quantity = 447 },
        { Id = core.Items.Ores.Pyrite, Quantity = 59 },
        { Id = core.Items.Elements.VolatileEarth, Quantity = 23 },
        { Id = core.Items.Elements.VolatileWater, Quantity = 12 },
        { Id = core.Items.Elements.VolatileFire, Quantity = 17 },
        { Id = core.Items.Gems.Alicite, Quantity = 1 },
        { Id = core.Items.Gems.Nightstone, Quantity = 2 },
        { Id = core.Items.Gems.Amberjewel, Quantity = 1 },
        { Id = core.Items.Gems.Zephyrite, Quantity = 3 },
        { Id = core.Items.Gems.Hessonite, Quantity = 3 },
        { Id = core.Items.Gems.Carnelian, Quantity = 1 },
    }
}

core.Data.Results.Farms.GhostIronOre = {
    ItemId = core.Items.Ores.GhostIron,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.ValleyoftheFourWinds },
    Routes = { core.Data.Routes.Mining.GhostIronOreValleyoftheFourWinds },
    Results = {
        { Id = core.Items.Ores.GhostIron, Quantity = 706 },
    }
}

core.Data.Results.Farms.BlackrockOre = {
    ItemId = core.Items.Ores.Blackrock,
    Content = core.Content.WoD,
    Locations = { core.Locations.Draenor.TanaanJungle },
    Routes = { core.Data.Routes.Mining.BlackrockOreTanaanJungle },
    Results = {
        { Id = core.Items.Ores.Blackrock, Quantity = 302 },
        { Id = core.Items.Ores.TrueIron, Quantity = 351 },
    }
}

core.Data.Results.Farms.Felslate = {
    ItemId = core.Items.Ores.Felslate,
    Content = core.Content.WoD,
    Locations = { core.Locations.BrokenIsles.Suramar },
    Routes = { core.Data.Routes.Mining.FelslateSuramar },
    Results = {
        { Id = core.Items.Ores.Felslate, Quantity = 220 },
        { Id = core.Items.Ores.Leystone, Quantity = 485 },
    }
}

core.Data.Results.Farms.Empyrium = {
    ItemId = core.Items.Ores.Empyrium,
    Content = core.Content.Legion,
    Locations = { core.Locations.Argus.Krokunn },
    Routes = { core.Data.Routes.Mining.EmpyriumOreKrokuun },
    Results = {
        { Id = core.Items.Ores.Empyrium, Quantity = 185 },
    }
}

core.Data.Results.Farms.MoneliteOre = {
    ItemId = core.Items.Ores.Monelite,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.TiragardeSound },
    Routes = { core.Data.Routes.Mining.AllBFAOreTiragardeSound },
    Results = {
        { Id = core.Items.Ores.Monelite, Quantity = 393 },
        { Id = core.Items.Ores.StormSilver, Quantity = 182 },
        { Id = core.Items.Ores.Platinum, Quantity = 27 },
    }
}

core.Data.Results.Farms.OsmeniteOre = {
    ItemId = core.Items.Ores.Osmenite,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Nazjatar },
    Routes = { core.Data.Routes.Mining.OsmeniteOreNazjatar },
    Results = {
        { Id = core.Items.Ores.Osmenite, Quantity = 210 },
    }
}