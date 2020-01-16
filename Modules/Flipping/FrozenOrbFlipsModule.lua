local WIT, core = ...

local foData = {
    core.Data.Results.Flips.FOEternalFire,
    core.Data.Results.Flips.FOEternalAir,
    core.Data.Results.Flips.FOEternalWater,
    core.Data.Results.Flips.FOEternalEarth,
    core.Data.Results.Flips.FOEternalLife,
}

table.insert(core.Modules, core.FlipResultModule('FrozenOrbFlips', foData, 'Flipping'))
