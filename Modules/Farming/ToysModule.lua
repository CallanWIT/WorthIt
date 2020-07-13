local WIT, core = ...

local toysData = {
core.Data.Results.Farms.WornTrollDice,
core.Data.Results.Farms.DecahedralDwarvenDice,
core.Data.Results.Farms.LoadedGnomishDice,
core.Data.Results.Farms.CrashinThrashinRollerController,
core.Data.Results.Farms.CrashinThrashinCannonController,
core.Data.Results.Farms.CrashinThrashinMortarController,
core.Data.Results.Farms.BigRedRayGun,
}

table.insert(core.Modules, core.FarmResultModule('Toys', toysData, 'Farming'))