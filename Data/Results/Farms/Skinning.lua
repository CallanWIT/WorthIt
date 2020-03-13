local WIT, core = ...

-- Vanilla

core.Data.Results.Farms.LightLeather = {
    Id = 'LightLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.LightLeather,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.Wetlands },
    Routes = { core.Data.Routes.Skinning.LightMediumLeatherWetlands },
    Results = {
        { Id = core.Items.Skins.LightLeather, Quantity = 443 },
		{ Id = core.Items.Skins.MediumLeather, Quantity = 403 },
    }
}

core.Data.Results.Farms.HeavyLeather = {
    Id = 'HeavyLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.HeavyLeather,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Feralas },
    Routes = { core.Data.Routes.Skinning.HeavyThickLeatherFeralas },
    Results = {
        { Id = core.Items.Skins.HeavyLeather, Quantity = 292 },
		{ Id = core.Items.Skins.ThickLeather, Quantity = 112 },
    }
}

core.Data.Results.Farms.RuggedLeather = {
    Id = 'RuggedLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.RuggedLeather,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.EasternKingdoms.SunkenTemple },
    Routes = { core.Data.Routes.Skinning.RuggedLeatherSwampOfSorrows },
    Results = {
        { Id = core.Items.Skins.RuggedLeather, Quantity = 349 },
		{ Id = core.Items.Skins.ThickLeather, Quantity = 280 },
    }
}


-- BC 

core.Data.Results.Farms.KnothideLeather = {
    Id = 'KnothideLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.KnothideLeather,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.Netherstorm },
    Routes = { core.Data.Routes.Skinning.KnothideLeatherNetherstorm },
    Results = {
        { Id = core.Items.Skins.KnothideLeather, Quantity = 489 },
    }
}


-- WOTLK 

core.Data.Results.Farms.BoreanLeather = {
    Id = 'BoreanLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.BoreanLeather,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Oculus },
    Routes = { core.Data.Routes.Skinning.BoreanLeatherBoreanTundra },
    Results = {
        { Id = core.Items.Skins.BoreanLeather, Quantity = 254 },
		{ Id = core.Items.Skins.ArcticFur, Quantity = 5 },
    }
}


-- Cata

core.Data.Results.Farms.SavageLeather = {
    Id = 'SavageLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.SavageLeather,
    Content = core.Content.Cata,
    Locations = { core.Locations.Cata.Firelands },
    Routes = { core.Data.Routes.Skinning.SavageLeatherMountHyjal },
    Results = {
        { Id = core.Items.Skins.SavageLeather, Quantity = 467 },
    }
}

-- Mop 

core.Data.Results.Farms.ExoticLeather = {
    Id = 'ExoticLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.ExoticLeather,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.IsleOfGiants },
    Routes = { core.Data.Routes.Skinning.ExoticLeatherIsleOfGiants },
    Results = {
        { Id = core.Items.Skins.ExoticLeather, Quantity = 908 },
		{ Id = core.Items.Skins.GiantDinosaurBones, Quantity = 7224 },
    }
}

-- Wod

core.Data.Results.Farms.RawBeastHide = {
    Id = 'RawBeastHide',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.RawBeastHide,
    Content = core.Content.WoD,
    Locations = { core.Locations.Draenor.ShadowmoonValley },
    Routes = { core.Data.Routes.Skinning.RawBeastHideShadowmoonValley },
    Results = {
        { Id = core.Items.Skins.RawBeastHide, Quantity = 1446 },
		{ Id = core.Items.Skins.SumptuousFur, Quantity = 1109 },
    }
}

-- Legion

core.Data.Results.Farms.StonehideLeather = {
    Id = 'StonehideLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.StonehideLeather,
    Content = core.Content.Legion,
    Locations = { core.Locations.BrokenIsles.Azsuna },
    Routes = { core.Data.Routes.Skinning.StonehideLeatherAzsuna },
    Results = {
        { Id = core.Items.Skins.StonehideLeather, Quantity = 1725 },
    }
}

core.Data.Results.Farms.Stormscale = {
    Id = 'Stormscale',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.Stormscale,
    Content = core.Content.Legion,
    Locations = { core.Locations.BrokenIsles.Highmountain },
    Routes = { core.Data.Routes.Skinning.StormscaleHighmountain },
    Results = {
        { Id = core.Items.Skins.Stormscale, Quantity = 829 },
    }
}

core.Data.Results.Farms.FeindishLeather = {
    Id = 'FeindishLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.FeindishLeather,
    Content = core.Content.Legion,
    Locations = { core.Locations.Argus.Krokunn },
    Routes = { core.Data.Routes.Skinning.FiendishLeatherKrokuun },
    Results = {
        { Id = core.Items.Skins.FeindishLeather, Quantity = 538 },
    }
}

-- BFA 

core.Data.Results.Farms.CoarseLeather = {
    Id = 'CoarseLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.CoarseLeather,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Drustvar },
    Routes = { core.Data.Routes.Skinning.CoarseLeatherDrustvar },
    Results = {
        { Id = core.Items.Skins.CoarseLeather, Quantity = 1396 },
    }
}

core.Data.Results.Farms.DredgedLeather = {
    Id = 'DredgedLeather',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.DredgedLeather,
    Content = core.Content.BFA,
    Locations = { core.Locations.Pandaria.ValeofEternalBlossoms },
    Routes = { core.Data.Routes.Skinning.DredgedLeatherNazjatar },
    Results = {
        { Id = core.Items.Skins.DredgedLeather, Quantity = 853 },
		{ Id = core.Items.Skins.Bloodstainedbone, Quantity = 347 },
		{ Id = core.Items.Skins.TempestHide, Quantity = 93 },
		{ Id = core.Items.Skins.Calcifiedbone, Quantity = 81 },
		{ Id = core.Items.Skins.QuestionableMeat, Quantity = 214 },
    }
}

core.Data.Results.Farms.DredgedLeatherSpotTwo = {
    Id = 'DredgedLeather2',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Skins.DredgedLeather,
    Content = core.Content.BFA,
    Locations = { core.Locations.Kalimdor.Uldum },
    Routes = { core.Data.Routes.Skinning.DredgedLeatherNazjatar },
    Results = {
        { Id = core.Items.Skins.DredgedLeather, Quantity = 846 },
		{ Id = core.Items.Skins.Bloodstainedbone, Quantity = 323 },
		{ Id = core.Items.Skins.TempestHide, Quantity = 70 },
		{ Id = core.Items.Skins.Calcifiedbone, Quantity = 62 },
		{ Id = core.Items.Skins.QuestionableMeat, Quantity = 202 },
    }
}





-- Showdowlands hehe! 