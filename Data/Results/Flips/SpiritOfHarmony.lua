local WIT, core = ...

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
    Waypoints = {
        { MapId = core.Maps.ValeOfEternalBlossoms, X = 61.69, Y = 21.68, Name = "Vendor", Faction = core.Factions.Horde },
        { MapId = core.Maps.ValeOfEternalBlossoms, X = 84.60, Y = 60.38, Name = "Vendor", Faction = core.Factions.Alliance },
    },
}
