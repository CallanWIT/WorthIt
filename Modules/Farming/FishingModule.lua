local WIT, core = ...

local fishingData = {

core.Data.Results.Farms.AlbinoCavefish,

core.Data.Results.Farms.RedtailLoach,
core.Data.Results.Farms.SandShifter,
core.Data.Results.Farms.TiraguardPerch,
core.Data.Results.Farms.LaneSnapper,
core.Data.Results.Farms.ViperFish,
core.Data.Results.Farms.DarkmoonDaggermaw,

}

table.insert(core.Modules, core.FarmResultModule('Fishing', fishingData, 'Farming'))
