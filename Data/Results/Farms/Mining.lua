local WIT, core = ...

core.Data.Results.Farms.CopperOre = {
    Id = 'CopperOre',
    Activity = core.Activity.Mining,
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
    Id = 'TinOre',
    Activity = core.Activity.Mining,
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
    Id = 'IronOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Iron,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.WesternPlaguelands },
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
    Id = 'ThoriumOre',
    Activity = core.Activity.Mining,
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
    Id = 'DarkIronOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.DarkIron,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.MoltenCore },
    Results = {
        { Id = core.Items.Ores.DarkIron, Quantity = 303 },
        { Id = core.Items.Gems.BloodOfTheMountain, Quantity = 3 },
    }
}

core.Data.Results.Farms.FelIronOre = {
    Id = 'FelIronOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.FelIron,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.TerokkarForest },
    Routes = { core.Data.Routes.Mining.FelIronOreTerokkarForest },
    Results = {
        { Id = core.Items.Ores.FelIron, Quantity = 131 },
        { Id = core.Items.Ores.Adamantite, Quantity = 168 },
        { Id = core.Items.Ores.Eternium, Quantity = 21 },
        { Id = core.Items.Ores.Khorium, Quantity = 5 },
        { Id = core.Items.Misc.PrimalEarth, Quantity = 15 },
        { Id = core.Items.Misc.PrimalFire, Quantity = 4.3 },
        { Id = core.Items.Gems.AzureMoonstone, Quantity = 2 },
        { Id = core.Items.Gems.NobleTopaz, Quantity = 1 },
        { Id = core.Items.Gems.FlameSpessarite, Quantity = 2 },
        { Id = core.Items.Gems.ShadowDraenite, Quantity = 3 },
    }
}

core.Data.Results.Farms.CobaltOre = {
    Id = 'CobaltOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Cobalt,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.BoreanTundra },
    Routes = { core.Data.Routes.Mining.CobaltOreBoreanTundra },
    Results = {
        { Id = core.Items.Ores.Cobalt, Quantity = 226 },
    }
}

core.Data.Results.Farms.SaroniteOre = {
    Id = 'SaroniteOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Saronite,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Wintergrasp },
    Routes = { core.Data.Routes.Mining.SaroniteOreWintergrasp },
    Results = {
        { Id = core.Items.Ores.Saronite, Quantity = 425 },
        { Id = core.Items.Ores.Titanium, Quantity = 31 },
        { Id = core.Items.Misc.EternalWater, Quantity = 3.7 },
        { Id = core.Items.Misc.EternalAir, Quantity = 2.9 },
        { Id = core.Items.Misc.EternalEarth, Quantity = 15.5 },
        { Id = core.Items.Misc.EternalFire, Quantity = 2.1 },
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
    Id = 'ObsidiumOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Obsidium,
    Content = core.Content.Cata,
    Locations = { core.Locations.Others.Vashjir },
    Routes = { core.Data.Routes.Mining.ObsidiumOreAbyssalDepths },
    Results = {
        { Id = core.Items.Ores.Obsidium, Quantity = 403 },
        { Id = core.Items.Misc.VolatileEarth, Quantity = 18 },
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
    Id = 'ElementiumOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Elementium,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.Uldum },
    Routes = { core.Data.Routes.Mining.PyriteOreUldum },
    Results = {
        { Id = core.Items.Ores.Elementium, Quantity = 447 },
        { Id = core.Items.Ores.Pyrite, Quantity = 59 },
        { Id = core.Items.Misc.VolatileEarth, Quantity = 23 },
        { Id = core.Items.Misc.VolatileWater, Quantity = 12 },
        { Id = core.Items.Misc.VolatileFire, Quantity = 17 },
        { Id = core.Items.Gems.Alicite, Quantity = 1 },
        { Id = core.Items.Gems.Nightstone, Quantity = 2 },
        { Id = core.Items.Gems.Amberjewel, Quantity = 1 },
        { Id = core.Items.Gems.Zephyrite, Quantity = 3 },
        { Id = core.Items.Gems.Hessonite, Quantity = 3 },
        { Id = core.Items.Gems.Carnelian, Quantity = 1 },
    }
}

core.Data.Results.Farms.GhostIronOre = {
    Id = 'GhostIronOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.GhostIron,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.ValleyOfTheFourWinds },
    Routes = { core.Data.Routes.Mining.GhostIronOreValleyOfTheFourWinds },
    Results = {
        { Id = core.Items.Ores.GhostIron, Quantity = 706 },
    }
}

core.Data.Results.Farms.BlackrockOre = {
    Id = 'BlackrockOre',
    Activity = core.Activity.Mining,
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
    Id = 'Felslate',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Felslate,
    Content = core.Content.Legion,
    Locations = { core.Locations.BrokenIsles.Suramar },
    Routes = { core.Data.Routes.Mining.FelslateSuramar },
    Results = {
        { Id = core.Items.Ores.Felslate, Quantity = 220 },
        { Id = core.Items.Ores.Leystone, Quantity = 485 },
    }
}

core.Data.Results.Farms.Empyrium = {
    Id = 'Empyrium',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Empyrium,
    Content = core.Content.Legion,
    Locations = { core.Locations.Argus.Krokunn },
    Routes = { core.Data.Routes.Mining.EmpyriumOreKrokuun },
    Results = {
        { Id = core.Items.Ores.Empyrium, Quantity = 185 },
    }
}

core.Data.Results.Farms.MoneliteOre = {
    Id = 'MoneliteOre',
    Activity = core.Activity.Mining,
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
    Id = 'OsmeniteOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.Osmenite,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Nazjatar },
    Routes = { core.Data.Routes.Mining.OsmeniteOreNazjatar },
    Results = {
        { Id = core.Items.Ores.Osmenite, Quantity = 210 },
    }
}


-- Shadowlands

core.Data.Results.Farms.SinvyrOre = {
    Id = 'SinvyrOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.SinvyrOre,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Revendreth },
    Routes = { core.Data.Routes.Mining.SinvyrOreRoute },
    Results = {
        { Id = core.Items.Ores.SinvyrOre, Quantity = 441 },
		{ Id = core.Items.Ores.PorousStone, Quantity = 115 },
		{ Id = core.Items.Ores.LaestriteOre, Quantity = 500 },
		{ Id = core.Items.Ores.ElethiumOre, Quantity = 23 },
		{ Id = core.Items.Ores.ShadedStone, Quantity = 22 },
    }
}

core.Data.Results.Farms.OxxeinOre = {
    Id = 'OxxeinOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.OxxeinOre,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Maldraxxus },
    Routes = { core.Data.Routes.Mining.OxxeinOreRoute },
    Results = {
        { Id = core.Items.Ores.OxxeinOre, Quantity = 154 },
		{ Id = core.Items.Ores.LaestriteOre, Quantity = 340 },
		{ Id = core.Items.Ores.PorousStone, Quantity = 65 },
		{ Id = core.Items.Ores.ElethiumOre, Quantity = 19 },
		{ Id = core.Items.Ores.ShadedStone, Quantity = 8 },
    }
}

core.Data.Results.Farms.PhaedrumOre = {
    Id = 'PhaedrumOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.PhaedrumOre,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Ardenweald },
    Routes = { core.Data.Routes.Mining.PhaedrumOreRoute },
    Results = {
        { Id = core.Items.Ores.PhaedrumOre, Quantity = 187 },
		{ Id = core.Items.Ores.ElethiumOre, Quantity = 21 },
		{ Id = core.Items.Ores.LaestriteOre, Quantity = 268 },
		{ Id = core.Items.Ores.PorousStone, Quantity = 37 },
		{ Id = core.Items.Ores.TwilightBark, Quantity = 15 },
    }
}


core.Data.Results.Farms.SoleniumOre = {
    Id = 'SoleniumOre',
    Activity = core.Activity.Mining,
    ItemId = core.Items.Ores.SoleniumOre,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Bastion },
    Routes = { core.Data.Routes.Mining.SoleniumOreRoute },
    Results = {
        { Id = core.Items.Ores.SoleniumOre, Quantity = 178 },
		{ Id = core.Items.Ores.LaestriteOre, Quantity = 276 },
		{ Id = core.Items.Ores.PorousStone, Quantity = 73 },
		{ Id = core.Items.Ores.ShadedStone, Quantity = 16 },
		{ Id = core.Items.Ores.ElethiumOre, Quantity = 10 },
    }
}


