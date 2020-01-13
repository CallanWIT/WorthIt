local WIT, core = ...

core.Data.Results.Flips.DEGreenLinenBracers = {
    ItemId = core.Items.Tailoring.GreenLinenBracers,
    Quantity = 100,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Cloths.LinenCloth, Quantity = 600 },
    },
    Results = {
        { Id = core.Items.Enchanting.LesserMagicEssence, Quantity = 40 },
        { Id = core.Items.Enchanting.StrangeDust, Quantity = 120 },
    }
}
