local WIT, core = ...

local data = {

-- Darkmoon Faire

core.Data.Results.Farms.MoonMoonDarkmoonFaire,
core.Data.Results.Farms.DarkmoonRabbitDarkmoonFaire,

-- Cata

core.Data.Results.Farms.TinyShaleSpiderDeepholm,

-- Mop


core.Data.Results.Farms.SpineclawCrabTimelessIsle,
core.Data.Results.Farms.GulpFrogletTimelessIsle,
core.Data.Results.Farms.GuChiSwarmlingTimelessIsle,
core.Data.Results.Farms.SkunkyAlementalTimelessIsle,
core.Data.Results.Farms.DeathAdderHatchlingTimelessIsle,
core.Data.Results.Farms.JadefireSpiritTimelessIsle,
core.Data.Results.Farms.AshleafSpritelingTimelessIsle,
core.Data.Results.Farms.RubyDropletTimelessIsle,
core.Data.Results.Farms.SunreaverMicroSentryIsleofThunder,
core.Data.Results.Farms.AquaStriderDreadwastes,
core.Data.Results.Farms.GrinderDreadwastes,


-- Wod

core.Data.Results.Farms.ServantOfDemidosShadowmoonValley,
core.Data.Results.Farms.EmpoweredManafiendNagrand,
core.Data.Results.Farms.EnergizedManafiendNagrand,
core.Data.Results.Farms.EmpyrealManafiendNagrand,
core.Data.Results.Farms.HydralingSpiresOfArak,
core.Data.Results.Farms.NetherspawnNagrand,
core.Data.Results.Farms.BrilliantSporeSpiresOfArak,
core.Data.Results.Farms.DoomBloomGorgrond,
core.Data.Results.Farms.FruitHunterFrostfireRidge,
core.Data.Results.Farms.UmbrafenSporeShadowmoonValley,
core.Data.Results.Farms.CrimsonSporeGorgrond,
core.Data.Results.Farms.TeroclawHatchlingTalador,

	
	
	
	
	
	
	
}

local module = core.FarmResultModule('RareBattlePets', data, 'BattlePets')
module.Columns[#module.Columns].Visible = false
module.ConfigKey = "Pets"
table.insert(core.Modules, module)