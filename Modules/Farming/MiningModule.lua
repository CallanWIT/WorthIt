local WIT, core = ...

local miningData = {
    core.Data.Results.Farms.CopperOre,
    core.Data.Results.Farms.TinOre,
    core.Data.Results.Farms.IronOre,
    core.Data.Results.Farms.ThoriumOre,
    core.Data.Results.Farms.DarkIronOre,
    core.Data.Results.Farms.FelIronOre,
    core.Data.Results.Farms.CobaltOre,
    core.Data.Results.Farms.SaroniteOre,
    core.Data.Results.Farms.ObsidiumOre,
    core.Data.Results.Farms.ElementiumOre,
    core.Data.Results.Farms.GhostIronOre,
    core.Data.Results.Farms.BlackrockOre,
    core.Data.Results.Farms.Felslate,
    core.Data.Results.Farms.Empyrium,
    core.Data.Results.Farms.MoneliteOre,
    core.Data.Results.Farms.OsmeniteOre,
	
	core.Data.Results.Farms.SinvyrOre,
	core.Data.Results.Farms.OxxeinOre,
	core.Data.Results.Farms.PhaedrumOre,
	core.Data.Results.Farms.SoleniumOre,
}

table.insert(core.Modules, core.FarmResultModule('Mining', miningData, 'Farming'))
