local WIT, core = ...

-- Vanilla

core.Data.Results.Farms.LinenCloth = {
    Id = 'LinenCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.LinenCloth,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.Wetlands },
    Routes = { core.Data.Routes.Cloth.LinenWoolClothWetlands },
    Results = {
        { Id = core.Items.Cloths.LinenCloth, Quantity = 721 },
		{ Id = core.Items.Cloths.Woolcloth, Quantity = 998 },
    }
}


core.Data.Results.Farms.Silkcloth = {
    Id = 'SilkCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.Silkcloth,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.DustwallowMarsh },
    Routes = { core.Data.Routes.Cloth.SilkClothDustwallowMarsh },
    Results = {
        { Id = core.Items.Cloths.Silkcloth, Quantity = 447 },
    }
}


core.Data.Results.Farms.MageweaveCloth = {
    Id = 'MageweaveCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.MageweaveCloth,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.ZulFarrak },
    Routes = { core.Data.Routes.Cloth.MageweaveClothTanaris },
    Results = {
        { Id = core.Items.Cloths.MageweaveCloth, Quantity = 886 },
    }
}


core.Data.Results.Farms.Runecloth = {
    Id = 'Runecloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.Runecloth,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.BlackrockDepths },
    Routes = { core.Data.Routes.Cloth.RuneclothBurningSteppes },
    Results = {
        { Id = core.Items.Cloths.Runecloth, Quantity = 973 },
    }
}




-- BC 

core.Data.Results.Farms.NetherweaveCloth = {
    Id = 'NetherweaveCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.NetherweaveCloth,
    Content = core.Content.TBC,
    Locations = { core.Locations.EasternKingdoms.Sunwell },
    Routes = { core.Data.Routes.Cloth.NetherweaveClothQuelDanas },
    Results = {
        { Id = core.Items.Cloths.NetherweaveCloth, Quantity = 802 },
    }
}


-- WOTLK 

core.Data.Results.Farms.FrostweaveCloth = {
    Id = 'FrostweaveCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.FrostweaveCloth,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Icecrown },
    Routes = { core.Data.Routes.Cloth.FrostweaveClothIcecrown },
    Results = {
        { Id = core.Items.Cloths.FrostweaveCloth, Quantity = 526 },
    }
}


-- Cata

core.Data.Results.Farms.EmbersilkCloth = {
    Id = 'EmbersilkCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.EmbersilkCloth,
    Content = core.Content.Cata,
    Locations = { core.Locations.EasternKingdoms.BastionOfTwilight },
    Routes = { core.Data.Routes.Cloth.EmbersilkClothTwilightHighlands },
    Results = {
        { Id = core.Items.Cloths.EmbersilkCloth, Quantity = 694 },
    }
}

-- Mop

core.Data.Results.Farms.WindwoolCloth = {
    Id = 'WindwoolCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.WindwoolCloth,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.TownlongSteppes },
    Routes = { core.Data.Routes.Cloth.WindwoolCloth },
    Results = {
        { Id = core.Items.Cloths.WindwoolCloth, Quantity = 1406 },
    }
}

-- Wod

core.Data.Results.Farms.SumptuousFur = {
    Id = 'SumptuousFur',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.SumptuousFur,
    Content = core.Content.WoD,
    Locations = { core.Locations.Draenor.ShadowmoonValley },
    Routes = { core.Data.Routes.Skinning.SumptousFurShadowmoonValley },
    Results = {
        { Id = core.Items.Cloths.SumptuousFur, Quantity = 1686 },
    }
}

-- Legion

core.Data.Results.Farms.ShalDoreiSilk = {
    Id = 'ShalDoreiSilk',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.ShalDoreiSilk,
    Content = core.Content.Legion,
    Locations = { core.Locations.BrokenIsles.Highmountain },
    Routes = { core.Data.Routes.Cloth.ShalDoreiSilkHighmountain },
    Results = {
        { Id = core.Items.Cloths.ShalDoreiSilk, Quantity = 324 },
    }
}

core.Data.Results.Farms.LightweaveCloth = {
    Id = 'LightweaveCloth',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.LightweaveCloth,
    Content = core.Content.Legion,
    Locations = { core.Locations.Argus.Krokunn },
    Results = {
        { Id = core.Items.Cloths.LightweaveCloth, Quantity = 384 },
    }
}

-- BFA 

core.Data.Results.Farms.TidesprayLinen = {
    Id = 'TidesprayLinen',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.TidesprayLinen,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Drustvar },
    Routes = { core.Data.Routes.Cloth.TidesprayLinenStormsongValley },
    Results = {
        { Id = core.Items.Cloths.TidesprayLinen, Quantity = 245 },
		{ Id = core.Items.Cloths.DeepSeaSatin, Quantity = 35 },
    }
}

core.Data.Results.Farms.GildedSeaweave = {
    Id = 'GildedSeaweave',
    Activity = core.Activity.Cloth,
    ItemId = core.Items.Cloths.GildedSeaweave,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Nazjatar },
    Routes = { core.Data.Routes.Cloth.GildedSeaweaveNazjatar },
    Results = {
        { Id = core.Items.Cloths.GildedSeaweave, Quantity = 168 },
    }
}




















