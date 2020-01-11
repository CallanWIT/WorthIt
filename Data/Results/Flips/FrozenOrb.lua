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
    }
}
