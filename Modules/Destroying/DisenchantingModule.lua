local WIT, core = ...

local deData = {
    core.Data.Results.Flips.DEGreenLinenBracers
}

table.insert(core.Modules, core.DestroyingResultModule('Disenchanting', deData, 'Flipping'))
