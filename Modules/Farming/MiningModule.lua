local WIT, core = ...

local miningData = {
    core.Data.Results.Farms.CopperOre,
    core.Data.Results.Farms.TinOre,
}

table.insert(core.Modules, core.FarmResultModule('Mining', miningData, 'Farming'))
