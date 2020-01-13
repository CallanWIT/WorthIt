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
