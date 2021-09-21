local WIT, core = ...

local data = {

-- Vanilla
    core.Data.Results.Farms.TempleofAQBattlePets,
	core.Data.Results.Farms.BlackWingLairPets,
	core.Data.Results.Farms.MoltenCorePets,


-- BC

core.Data.Results.Farms.KarazhanPets,
core.Data.Results.Farms.SerpentShrineCavernPets,
core.Data.Results.Farms.TempestKeepPets,
core.Data.Results.Farms.BlackTemplePets,
core.Data.Results.Farms.HyjalSummitPets,
core.Data.Results.Farms.SunwellPlateauPets,


-- Wotlk

core.Data.Results.Farms.IceCrownCitidelPets,
core.Data.Results.Farms.TrialoftheCrusaderPets,
core.Data.Results.Farms.UlduarPets,
core.Data.Results.Farms.NaxxramasPets,


-- Cata

core.Data.Results.Farms.ThroneofTheFourWindsPets,
core.Data.Results.Farms.BastionofTwilightPets,
core.Data.Results.Farms.FirelandsPets,
core.Data.Results.Farms.DragonSoulPets,
core.Data.Results.Farms.BlackwingDecentPets,


-- Mop

core.Data.Results.Farms.MogushanVaultsPets,
core.Data.Results.Farms.TerraceofEndlessSpringPets,
core.Data.Results.Farms.HeartofFearPets,
core.Data.Results.Farms.ThroneofThunderPets,
core.Data.Results.Farms.SiegeofOrgrimmarPets,


-- Wod

core.Data.Results.Farms.HellfireCitidelPets,


-- Legion

core.Data.Results.Farms.EmeraldNightmarePets,


-- BFA
	
core.Data.Results.Farms.BattleofDazaralorPets,
core.Data.Results.Farms.EternalPalacePets,
core.Data.Results.Farms.NyalothaWakingCityPets,	
	
	

	
	
	
}

local module = core.FarmResultModule('RaidBattlePet', data, 'BattlePets')
module.Columns[#module.Columns].Visible = false
module.ConfigKey = "Pets"
table.insert(core.Modules, module)
