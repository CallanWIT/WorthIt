local WIT, core = ...

local sohData = {
    core.Data.Results.Flips.SoHWhiteTrilliumOre,
    core.Data.Results.Flips.SoHBlackTrilliumOre,
    core.Data.Results.Flips.SoHStarlightInk,
    core.Data.Results.Flips.SoHWindwoolCloth,
    core.Data.Results.Flips.SoHGoldenLotus,
    core.Data.Results.Flips.SoHSerpentsEye,
}

local module = core.FlipResultModule('SpiritOfHarmonyFlips', sohData, 'Flipping')
module.IsExpandabled = false

table.insert(core.Modules, module)
