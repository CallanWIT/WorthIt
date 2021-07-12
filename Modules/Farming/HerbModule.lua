local WIT, core = ...

local herbData = {
    core.Data.Results.Farms.Peacebloom,
	core.Data.Results.Farms.Fadeleaf,
	core.Data.Results.Farms.Gromsblood,
	
	--BC 
	core.Data.Results.Farms.Felweed,
	core.Data.Results.Farms.AddersTongue,
	-- WOTLK 
	core.Data.Results.Farms.Icethorn,
	--Cata
	core.Data.Results.Farms.AzsharasVeil,
	core.Data.Results.Farms.Whiptail,
	core.Data.Results.Farms.Cinderbloom,
	core.Data.Results.Farms.TwilightJasmine,
	core.Data.Results.Farms.Heartblossom,
	-- Mop
	core.Data.Results.Farms.GreenTeaLeaf,
	core.Data.Results.Farms.Silkweed,
	core.Data.Results.Farms.FoolsCap,
	core.Data.Results.Farms.SnowLily,
	-- Wod
	core.Data.Results.Farms.TaladorOrchid,
	core.Data.Results.Farms.Frostweed,
	core.Data.Results.Farms.NagrandArrowbloom,
	core.Data.Results.Farms.Starflower,
	core.Data.Results.Farms.Fireweed,
	core.Data.Results.Farms.GorgrondFlytrap,
	-- Legion 
	core.Data.Results.Farms.StarlightRose,
	core.Data.Results.Farms.Aethril,
	core.Data.Results.Farms.Dreamleaf,
	core.Data.Results.Farms.Foxflower,
	core.Data.Results.Farms.Fjarnskaggl,
	core.Data.Results.Farms.AstralGlory,
	--BFA
	core.Data.Results.Farms.AkundasBite,
	core.Data.Results.Farms.WintersKiss,
	core.Data.Results.Farms.Zinanthid,
	-- Shadowlands
	core.Data.Results.Farms.MarrowRoot,
	core.Data.Results.Farms.Widowbloom,
	core.Data.Results.Farms.VigilsTorch,
	core.Data.Results.Farms.RisingGlory,
	
	
}

table.insert(core.Modules, core.FarmResultModule('Herb', herbData, 'Farming'))
