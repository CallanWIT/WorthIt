local WIT, core = ...

local foDataData = {
    core.Data.Results.Flips.FOEternalFire
}

table.insert(core.Modules, core.FlipResultModule('FrozenOrbFlips', foDataData, 'Flipping'))
