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
    }
}
