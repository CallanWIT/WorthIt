local WIT, core = ...

core.Data.Results.Flips.FOEternalFire = {
    ItemId = core.Items.Elements.EternalFire,
    Quantity = 200,
    Content = core.Content.WotLK,
    Materials = {
        {
            Id = core.Items.Misc.FrozenOrb,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 200
        },
    },
    Results = {
        { Id = core.Items.Elements.EternalFire, Quantity = 200 },
    },
    Waypoints = {
        { MapId = core.Maps.Dalaran, X = 40.04, Y = 28.30, Name = "Vendor" },
        { MapId = core.Maps.Dalaran, X = 65.54, Y = 22.67, Name = "Vendor", Faction = core.Factions.Horde },
        { MapId = core.Maps.Dalaran, X = 36.92, Y = 55.02, Name = "Vendor", Faction = core.Factions.Alliance },
    },
}
