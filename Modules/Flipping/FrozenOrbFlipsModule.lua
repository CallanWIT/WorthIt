local WIT, core = ...

local foData = {
    core.Data.Results.Flips.FOEternalFire
}

table.insert(core.Modules, core.FlipResultModule('FrozenOrbFlips', foData, 'Flipping'))
