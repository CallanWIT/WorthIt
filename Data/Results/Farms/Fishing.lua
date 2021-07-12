local WIT, core = ...



-- Cata
core.Data.Results.Farms.AlbinoCavefish = {
    Id = 'AlbinoCavefish',
    Activity = core.Activity.Fishing,
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
    Id = 'RedtailLoach',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.RedtailLoach,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Zandalar },
    Results = {
        { Id = core.Items.Fish.GreatSeaCatfish, Quantity = 132 },
		{ Id = core.Items.Fish.RedtailLoach, Quantity = 156 },
    }
}

core.Data.Results.Farms.SandShifter = {
    Id = 'SandShifter',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.SandShifter,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Zandalar },
    Results = {
        { Id = core.Items.Fish.SlimyMackerel, Quantity = 144 },
		{ Id = core.Items.Fish.SandShifter, Quantity = 126 },
    }
}

core.Data.Results.Farms.TiraguardPerch = {
    Id = 'TiraguardPerch',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.TiraguardPerch,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.KulTiras },
    Results = {
        { Id = core.Items.Fish.TiraguardPerch, Quantity = 150 },
		{ Id = core.Items.Fish.GreatSeaCatfish, Quantity = 132 },
    }
}

core.Data.Results.Farms.LaneSnapper = {
    Id = 'LaneSnapper',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.LaneSnapper,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.KulTiras },
    Results = {
        { Id = core.Items.Fish.LaneSnapper, Quantity = 128 },
		{ Id = core.Items.Fish.FrenziedFangtooth, Quantity = 136 },
    }
}

core.Data.Results.Farms.ViperFish = {
    Id = 'ViperFish',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.ViperFish,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Nazjatar },
    Results = {
        { Id = core.Items.Fish.ViperFish, Quantity = 132 },
		{ Id = core.Items.Fish.MauveStinger, Quantity = 130 },
    }
}

core.Data.Results.Farms.MalformedGnasher = {
    Id = 'MalformedGnasher',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.MalformedGnasher,
    Content = core.Content.BFA,
    Locations = { core.Locations.Kalimdor.Uldum },
    Results = {
        { Id = core.Items.Fish.MalformedGnasher, Quantity = 154 },
		{ Id = core.Items.Fish.AberrantVoidfin, Quantity = 100 },
    }
}

core.Data.Results.Farms.AberrantVoidfin = {
    Id = 'MalformedGnasher',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.AberrantVoidfin,
    Content = core.Content.BFA,
    Locations = { core.Locations.Pandaria.ValeofEternalBlossoms },
    Results = {
        { Id = core.Items.Fish.MalformedGnasher, Quantity = 100 },
		{ Id = core.Items.Fish.AberrantVoidfin, Quantity = 154 },
    }
}

-- Darkmoonfaire

core.Data.Results.Farms.DarkmoonDaggermaw = {
    Id = 'DarkmoonDaggermaw',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.DarkmoonDaggermaw,
    Content = core.Content.Cata,
    Locations = { core.Locations.Others.DarkmoonIsland },
    Results = {
        { Id = core.Items.Fish.DarkmoonDaggermaw, Quantity = 316 },
    }
}

-- Shadowlands

core.Data.Results.Farms.PockedBonefish = {
    Id = 'PockedBonefish',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.PockedBonefish,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Maldraxxus },
    Results = {
        { Id = core.Items.Fish.PockedBonefish, Quantity = 180 },
		{ Id = core.Items.Fish.LostSole, Quantity = 60 },
    }
}

core.Data.Results.Farms.SpinefinPiranha = {
    Id = 'SpinefinPiranha',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.SpinefinPiranha,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Revendreth },
    Results = {
        { Id = core.Items.Fish.SpinefinPiranha, Quantity = 88 },
		{ Id = core.Items.Fish.LostSole, Quantity = 62 },
		{ Id = core.Items.Fish.ElysianThade, Quantity = 38 },
    }
}

core.Data.Results.Farms.SilvergillPike = {
    Id = 'SilvergillPike',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.SilvergillPike,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Bastion },
    Results = {
        { Id = core.Items.Fish.SilvergillPike, Quantity = 96 },
		{ Id = core.Items.Fish.LostSole, Quantity = 102 },
		{ Id = core.Items.Fish.ElysianThade, Quantity = 18 },
    }
}

core.Data.Results.Farms.IridescentAmberjack = {
    Id = 'IridescentAmberjack',
    Activity = core.Activity.Fishing,
    ItemId = core.Items.Fish.IridescentAmberjack,
    Content = core.Content.Shadowlands,
    Locations = { core.Locations.Shadowlands.Ardenweald },
    Results = {
        { Id = core.Items.Fish.IridescentAmberjack, Quantity = 36 },
		{ Id = core.Items.Fish.LostSole, Quantity = 164 },
		{ Id = core.Items.Fish.ElysianThade, Quantity = 4 },
    }
}


















