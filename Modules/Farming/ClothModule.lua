local WIT, core = ...

local clothData = {

-- Vanilla

core.Data.Results.Farms.LinenCloth,
core.Data.Results.Farms.Silkcloth,
core.Data.Results.Farms.MageweaveCloth,
core.Data.Results.Farms.Runecloth,

core.Data.Results.Farms.NetherweaveCloth,
core.Data.Results.Farms.FrostweaveCloth,
core.Data.Results.Farms.EmbersilkCloth,
core.Data.Results.Farms.WindwoolCloth,
core.Data.Results.Farms.SumptuousFur,
core.Data.Results.Farms.ShalDoreiSilk,
core.Data.Results.Farms.LightweaveCloth,
core.Data.Results.Farms.TidesprayLinen,
core.Data.Results.Farms.GildedSeaweave,

}

table.insert(core.Modules, core.FarmResultModule('Cloth', clothData, 'Farming'))