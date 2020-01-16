local WIT, core = ...

local soHWaypoints = {
    { MapId = core.Maps.ValeOfEternalBlossoms, X = 61.69, Y = 21.68, Name = "Vendor", Faction = core.Factions.Horde },
    { MapId = core.Maps.ValeOfEternalBlossoms, X = 84.60, Y = 60.38, Name = "Vendor", Faction = core.Factions.Alliance },
}

core.Data.Results.Flips.SoHWhiteTrilliumOre = {
    ItemId = core.Items.Ores.WhiteTrillium,
    Quantity = 200,
    Content = core.Content.MOP,
    Materials = {
        { Id = core.Items.Misc.SpiritOfHarmony, Quantity = 40 },
    },
    Results = {
        { Id = core.Items.Ores.WhiteTrillium, Quantity = 200 },
    },
    Waypoints = soHWaypoints,
}

core.Data.Results.Flips.SoHBlackTrilliumOre = {
    ItemId = core.Items.Ores.BlackTrillium,
    Quantity = 200,
    Content = core.Content.MOP,
    Materials = {
        { Id = core.Items.Misc.SpiritOfHarmony, Quantity = 40 },
    },
    Results = {
        { Id = core.Items.Ores.BlackTrillium, Quantity = 200 },
    },
    Waypoints = soHWaypoints,
}

core.Data.Results.Flips.SoHStarlightInk = {
    ItemId = core.Items.Inscription.StarlightInk,
    Quantity = 200,
    Content = core.Content.MOP,
    Materials = {
        { Id = core.Items.Misc.SpiritOfHarmony, Quantity = 200 },
    },
    Results = {
        { Id = core.Items.Inscription.StarlightInk, Quantity = 200 },
    },
    Waypoints = soHWaypoints,
}

core.Data.Results.Flips.SoHWindwoolCloth = {
    ItemId = core.Items.Cloths.WindwoolCloth,
    Quantity = 200,
    Content = core.Content.MOP,
    Materials = {
        { Id = core.Items.Misc.SpiritOfHarmony, Quantity = 10 },
    },
    Results = {
        { Id = core.Items.Cloths.WindwoolCloth, Quantity = 200 },
    },
    Waypoints = soHWaypoints,
}

core.Data.Results.Flips.SoHGoldenLotus = {
    ItemId = core.Items.Herbs.GoldenLotus,
    Quantity = 200,
    Content = core.Content.MOP,
    Materials = {
        { Id = core.Items.Misc.SpiritOfHarmony, Quantity = 100 },
    },
    Results = {
        { Id = core.Items.Herbs.GoldenLotus, Quantity = 200 },
    },
    Waypoints = soHWaypoints,
}

core.Data.Results.Flips.SoHSerpentsEye = {
    ItemId = core.Items.Gems.SerpentsEye,
    Quantity = 200,
    Content = core.Content.MOP,
    Materials = {
        { Id = core.Items.Misc.SpiritOfHarmony, Quantity = 200 },
    },
    Results = {
        { Id = core.Items.Gems.SerpentsEye, Quantity = 200 },
    },
    Waypoints = soHWaypoints,
}