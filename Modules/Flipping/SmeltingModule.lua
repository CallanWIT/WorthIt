local WIT, core = ...

local smeltingData = {
    core.Data.Results.Flips.SmeltingCopperOre,
	
	core.Data.Results.Flips.SmeltingTinBar,
	core.Data.Results.Flips.SmeltingBronzeBar,
	core.Data.Results.Flips.SmeltingSilverBar,
	core.Data.Results.Flips.SmeltingSteelBar,
	core.Data.Results.Flips.SmeltingIronBar,
	core.Data.Results.Flips.SmeltingGoldBar,
	core.Data.Results.Flips.SmeltingMithrilBar,
	core.Data.Results.Flips.SmeltingTruesilverBar,
	core.Data.Results.Flips.SmeltingThoriumBar,
	core.Data.Results.Flips.SmeltingDarkIronBar,
	core.Data.Results.Flips.SmeltingEnchantedElementiumBar,
	
	-- TBC 
	
	core.Data.Results.Flips.SmeltingFelIronBar,
	core.Data.Results.Flips.SmeltingAdamantiteBar,
	core.Data.Results.Flips.SmeltingEterniumBar,
	core.Data.Results.Flips.SmeltingFelSteelBar,
	core.Data.Results.Flips.SmeltingHardenedAdamantiteBar,
	core.Data.Results.Flips.SmeltingKhoriumBar,
	core.Data.Results.Flips.SmeltingHardenedKhoriumBar,  
	
	-- Wotlk 
	
	core.Data.Results.Flips.SmeltingSaroniteBar,  
	core.Data.Results.Flips.SmeltingCobaltBar,  
	core.Data.Results.Flips.SmeltingTitanSteelBar,  
	core.Data.Results.Flips.SmeltingTitaniumBar,  
	
	-- Cata 
	
	core.Data.Results.Flips.SmeltingObsidianBar,  
	core.Data.Results.Flips.SmeltingElementiumBar,  
	core.Data.Results.Flips.SmeltingHardenedElementiumBar,  
	core.Data.Results.Flips.SmeltingPyriumBar,  
	
	-- Mop 
	
	core.Data.Results.Flips.SmeltingTrilliumBar,  
	core.Data.Results.Flips.SmeltingGhostIronBar,  
}

local module = core.FlipResultModule('Smelting', smeltingData, 'Flipping')
module.DetailsRowHeaderResource = "Ingredients"

function module.GetDetailsRowData(row)
    return row.Data.Materials
end

table.insert(core.Modules, module)