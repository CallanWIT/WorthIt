local WIT, core = ...

local deData = {
    core.Data.Results.Flips.DEGreenLinenBracers,
	core.Data.Results.Flips.RuneclothBelt,
	
	core.Data.Results.Flips.NetherweaveBracers,
	core.Data.Results.Flips.FrostwovenWristwraps,
	core.Data.Results.Flips.DeathsilkBracers,
	core.Data.Results.Flips.WindwoolBelt,
	core.Data.Results.Flips.SumptousCowl,
	core.Data.Results.Flips.SilkweaveEpaulets,
	core.Data.Results.Flips.TidesprayBracers,
}

table.insert(core.Modules, core.DestroyingResultModule('Disenchanting', deData, 'Flipping'))
