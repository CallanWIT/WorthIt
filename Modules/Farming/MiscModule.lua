local WIT, core = ...

local miscData = {

-- Vanilla

core.Data.Results.Farms.EssenceOfFire,
core.Data.Results.Farms.EssenceOfWater,
core.Data.Results.Farms.EssenceOfAir,
core.Data.Results.Farms.EssenceOfUndeath,
core.Data.Results.Farms.LivingEssence,

-- TBC

core.Data.Results.Farms.PrimalEarth,
core.Data.Results.Farms.PrimalLife,
core.Data.Results.Farms.PrimalMana,
core.Data.Results.Farms.PrimalShadow,
core.Data.Results.Farms.PrimalWater,
core.Data.Results.Farms.PrimalFire,
core.Data.Results.Farms.PrimalAir,

-- Wotlk 

core.Data.Results.Farms.EternalWater,
core.Data.Results.Farms.EternalAir,
core.Data.Results.Farms.EternalFire,
core.Data.Results.Farms.EternalEarth,
core.Data.Results.Farms.EternalLife,

-- Cata

core.Data.Results.Farms.VolatileFire,
core.Data.Results.Farms.VolatileWater,
core.Data.Results.Farms.VolatileEarth,
core.Data.Results.Farms.VolatileAir,
core.Data.Results.Farms.VolatileLife,

-- Mop

core.Data.Results.Farms.SpiritOfHarmony,




}

table.insert(core.Modules, core.FarmResultModule('Misc', miscData, 'Farming'))