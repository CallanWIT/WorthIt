local WIT, core = ...

local sohData = {
    core.Data.Results.Flips.SoHWhiteTrilliumOre
}

table.insert(core.Modules, core.FlipResultModule('SpiritOfHarmonyFlips', sohData, 'Flipping'))
