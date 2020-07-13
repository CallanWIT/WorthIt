local WIT, core = ...

local rawgoldData = {


-- Wotlk

core.Data.Results.Farms.ICCRawGold,
core.Data.Results.Farms.UlduarRawGold,
core.Data.Results.Farms.TrialOfCrusRawGold,
core.Data.Results.Farms.VaultofArchRawGold,
core.Data.Results.Farms.NaxxRawGold,
core.Data.Results.Farms.ObsidiansancRawGold,
core.Data.Results.Farms.EyeofEternityRawGold,
core.Data.Results.Farms.OnyxiasLairRawGold,
core.Data.Results.Farms.RubySanctumRawGold,

-- Cata

core.Data.Results.Farms.BaradinholdRawGold,
core.Data.Results.Farms.BlackwingdecentRawGold,
core.Data.Results.Farms.BastionofTwilightRawGold,
core.Data.Results.Farms.ThroneofFourWindsRawGold,
core.Data.Results.Farms.FirelandsRawGold,
core.Data.Results.Farms.DragonsoulRawGold,

-- Mop

core.Data.Results.Farms.MogushanRawGold,
core.Data.Results.Farms.HeartofFearRawGold,
core.Data.Results.Farms.TerraceofendlessRawGold,
core.Data.Results.Farms.ThroneofThunderRawGold,
core.Data.Results.Farms.SeigeofOrgRawGold,

-- Wod
core.Data.Results.Farms.HFCRawGold,
core.Data.Results.Farms.HighmaulRawGold,
core.Data.Results.Farms.BlackrockfoundryRawGold,

-- Legion

core.Data.Results.Farms.TombofSargerasRawGold,
core.Data.Results.Farms.EmeraldNightmareRawGold,
core.Data.Results.Farms.NightholdRawGold,
core.Data.Results.Farms.TrialofValorRawGold,
core.Data.Results.Farms.AntorusRawGold,
core.Data.Results.Farms.SkyreachRawGold,


-- BFA

core.Data.Results.Farms.FreeHoldRawGold,
}

local resultColumn = core.GridColumns.ResultsValueColumn()
local module = core.GridModule('RawGold', rawgoldData, 'Farming')
module.IsExpandabled = false

module.Columns = {
    core.GridColumns.ItemNameColumn(),
    resultColumn,
    core.GridColumns.LocationsColumn(),
}

module.Sort = {
    Column = resultColumn,
    Direction = "DESC",
}

table.insert(core.Modules, module)