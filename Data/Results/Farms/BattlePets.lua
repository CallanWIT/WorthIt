local WIT, core = ...

core.Data.Results.Farms.EmeraldWhelplingFeralas = {
    Id = "EmeraldWhelplingFeralas",
    Activity = core.Activity.BattlePets,
    ItemId = core.Items.PetCageItemId,
    PetId = 59,
	ItemLink = "|cff0070dd|Hbattlepet:59:1:3:161:10:11:0000000000000000:6291|h[Emerald Whelpling]|h|r",
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Feralas },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 59, ItemLink = "|cff0070dd|Hbattlepet:59:1:3:161:10:11:0000000000000000:6291|h[Emerald Whelpling]|h|r", Quantity = 1 }
    }
}