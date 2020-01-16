local WIT, core = ...



-- Cata
core.Data.Results.Farms.AlbinoCavefish = {
    ItemId = core.Items.Fish.AlbinoCavefish,
    Content = core.Content.Cata,
    Locations = { core.Locations.Others.Deepholm },
    Routes = { core.Data.Routes.Fishing.AlbinoCavefishDeepholm },
    Results = {
        { Id = core.Items.Fish.AlbinoCavefish, Quantity = 104 },
    }
}


-- BFA 

core.Data.Results.Farms.RedtailLoach = {
    ItemId = core.Items.Fish.RedtailLoach,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Zandalar },
    Results = {
        { Id = core.Items.Fish.GreatSeaCatfish, Quantity = 132 },
		{ Id = core.Items.Fish.RedtailLoach, Quantity = 156 },
    }
}

core.Data.Results.Farms.SandShifter = {
    ItemId = core.Items.Fish.SandShifter,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Zandalar },
    Results = {
        { Id = core.Items.Fish.SlimyMackerel, Quantity = 144 },
		{ Id = core.Items.Fish.SandShifter, Quantity = 126 },
    }
}

core.Data.Results.Farms.TiraguardPerch = {
    ItemId = core.Items.Fish.TiraguardPerch,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.KulTiras },
    Results = {
        { Id = core.Items.Fish.TiraguardPerch, Quantity = 150 },
		{ Id = core.Items.Fish.GreatSeaCatfish, Quantity = 132 },
    }
}

core.Data.Results.Farms.LaneSnapper = {
    ItemId = core.Items.Fish.LaneSnapper,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.KulTiras },
    Results = {
        { Id = core.Items.Fish.LaneSnapper, Quantity = 128 },
		{ Id = core.Items.Fish.FrenziedFangtooth, Quantity = 136 },
    }
}

core.Data.Results.Farms.ViperFish = {
    ItemId = core.Items.Fish.ViperFish,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Nazjatar },
    Results = {
        { Id = core.Items.Fish.ViperFish, Quantity = 132 },
		{ Id = core.Items.Fish.MauveStinger, Quantity = 130 },
    }
}

-- Darkmoonfaire

core.Data.Results.Farms.DarkmoonDaggermaw = {
    ItemId = core.Items.Fish.DarkmoonDaggermaw,
    Content = core.Content.Cata,
    Locations = { core.Locations.Others.DarkmoonIsland },
    Results = {
        { Id = core.Items.Fish.DarkmoonDaggermaw, Quantity = 316 },
    }
}