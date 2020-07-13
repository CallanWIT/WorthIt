local WIT, core = ...

-- Cata

core.Data.Results.Farms.Posidious = {
    Id = 'Posidious',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Mounts.Posidious,
    Content = core.Content.Cata,
    Locations = { core.Locations.Others.Vashjir },
    Routes = { core.Data.Routes.Mounts.Posidious },
    Results = {
        { Id = core.Items.Mounts.Posidious, Quantity = 1 },
    }
}

-- WOD

core.Data.Results.Farms.NokKarosh = {
    Id = 'NokKarosh',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Mounts.NokKarosh,
    Content = core.Content.WoD,
    Locations = { core.Locations.Draenor.FrostfireRidge },
    Routes = { core.Data.Routes.Mounts.NokKarosh },
    Results = {
        { Id = core.Items.Mounts.NokKarosh, Quantity = 3 },
    }
}

-- BFA

core.Data.Results.Farms.Goldenmane = {
    Id = 'Goldenmane',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Mounts.Goldenmane,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.StormsongValley },
    Routes = { core.Data.Routes.Mounts.Goldenmane },
    Results = {
        { Id = core.Items.Mounts.Goldenmane, Quantity = 1 },
    }
}

core.Data.Results.Farms.Bloodfeaster = {
    Id = 'Bloodfeaster',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Mounts.Bloodfeaster,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Nazmir },
    Routes = { core.Data.Routes.Mounts.Bloodfeaster },
    Results = {
        { Id = core.Items.Mounts.Bloodfeaster, Quantity = 1 },
    }
}

core.Data.Results.Farms.DuneScavenger = {
    Id = 'DuneScavenger',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Mounts.DuneScavenger,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Voldun },
    Routes = { core.Data.Routes.Mounts.DuneScavenger },
    Results = {
        { Id = core.Items.Mounts.DuneScavenger, Quantity = 1 },
    }
}

core.Data.Results.Farms.PackMule = {
    Id = 'PackMule',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Mounts.PackMule,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Drustvar },
    Routes = { core.Data.Routes.Mounts.PackMule },
    Results = {
        { Id = core.Items.Mounts.PackMule, Quantity = 1 },
    }
}

core.Data.Results.Farms.Skate = {
    Id = 'Skate',
    Activity = core.Activity.Skinning,
    ItemId = core.Items.Mounts.Skate,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Zandalar },
    Routes = { core.Data.Routes.Mounts.Skate },
    Results = {
        { Id = core.Items.Mounts.Skate, Quantity = 1 },
    }
}