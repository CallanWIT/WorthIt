local WIT, core = ...

local mountsData = {
core.Data.Results.Farms.Posidious,
core.Data.Results.Farms.NokKarosh,
core.Data.Results.Farms.Goldenmane,
core.Data.Results.Farms.Bloodfeaster,
core.Data.Results.Farms.DuneScavenger,
core.Data.Results.Farms.PackMule,
core.Data.Results.Farms.Skate,
}

table.insert(core.Modules, core.FarmResultModule('Mounts', mountsData, 'Farming'))