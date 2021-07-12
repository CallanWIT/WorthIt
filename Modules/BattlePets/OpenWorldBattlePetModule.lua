local WIT, core = ...

local OpenWorlddata = {

-- Vanilla
    core.Data.Results.Farms.EmeraldWhelplingFeralas,
	core.Data.Results.Farms.CrimsonWhelplingWetlands,
	core.Data.Results.Farms.DarkWhelplingBadlands,
	core.Data.Results.Farms.AzureWhelplingWinterspring,
	core.Data.Results.Farms.DisgustingoozlingSwampOfSorrows,
	core.Data.Results.Farms.RavasaurHatchlingUngoroCrater,
	core.Data.Results.Farms.DartingHatchlingDustwollowmarsh,
	core.Data.Results.Farms.RazormawHatchlingWetlands,
	core.Data.Results.Farms.LeapingHatchlingTheBarrens,
	core.Data.Results.Farms.HyacinthMacawStranglethorn,
	core.Data.Results.Farms.SpriteDarterHatchlingFeralas,
	core.Data.Results.Farms.BlackTabbyCatHillsbradfoothills,
	
	-- BC
	
	core.Data.Results.Farms.FireflyZangamarsh,
	
	-- Wotlk
	
	core.Data.Results.Farms.GundrakHatchlingZulDrak,
	
	-- Cata
	
	core.Data.Results.Farms.FoxKitTolBarad,
	
	-- Mop
	
	core.Data.Results.Farms.FilthlingIsleOfThunder,
	core.Data.Results.Farms.OminousFlameTimelessIsle,
	core.Data.Results.Farms.JademistDancerTimelessIsle,
	
	
	-- Wod
	
	core.Data.Results.Farms.BronzeWhelplingBlastedlands,
	core.Data.Results.Farms.ZomstrokWodShadowmoonValley,
	core.Data.Results.Farms.SavageCubTannanJungle,
	
	-- Legion
	
	-- BFA
	
	
	
	
	
	
	
}
local module = core.FarmResultModule('OpenWorldPet', OpenWorlddata, 'BattlePets')
module.Columns[#module.Columns].Visible = false
table.insert(core.Modules, module)

