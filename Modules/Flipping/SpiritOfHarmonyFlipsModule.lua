local WIT, core = ...

local sohDataData = {
    core.Data.Results.Flips.SoHWhiteTrilliumOre
}

table.insert(core.Modules, core.FlipResultModule('SpiritOfHarmonyFlips', sohDataData, 'Flipping'))
