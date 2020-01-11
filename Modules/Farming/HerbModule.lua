local WIT, core = ...

local herbData = {
    core.Data.Results.Farms.Peacebloom
}

table.insert(core.Modules, core.FarmResultModule('Herb', herbData, 'Farming'))
