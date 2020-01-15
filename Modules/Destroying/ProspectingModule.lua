local WIT, core = ...

local prospectData = {
    core.Data.Results.Flips.ProspectingCopperOre,
    core.Data.Results.Flips.ProspectingTinOre,
    core.Data.Results.Flips.ProspectingIronOre,
    core.Data.Results.Flips.ProspectingThoriumOre,
    core.Data.Results.Flips.ProspectingFelIronOre,
    core.Data.Results.Flips.ProspectingSaroniteOre,
    core.Data.Results.Flips.ProspectingGhostIronOre,
    core.Data.Results.Flips.ProspectingLeystone,
    core.Data.Results.Flips.ProspectingFelslate,
    core.Data.Results.Flips.ProspectingMoneliteOre,
    core.Data.Results.Flips.ProspectingOsmeniteOre,
}

table.insert(core.Modules, core.DestroyingResultModule('Prospecting', prospectData, 'Flipping'))
