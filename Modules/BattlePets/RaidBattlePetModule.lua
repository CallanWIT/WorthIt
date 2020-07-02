local WIT, core = ...

local data = {
    core.Data.Results.Farms.EmeraldWhelplingFeralas,
}

table.insert(core.Modules, core.FarmResultModule('RaidBattlePet', data, 'Farming'))