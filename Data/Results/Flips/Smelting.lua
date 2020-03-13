local WIT, core = ...

-- Vanilla

core.Data.Results.Flips.SmeltingCopperOre = {
    ItemId = core.Items.Smelting.CopperBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Copper, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.CopperBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingTinBar = {
    ItemId = core.Items.Smelting.TinBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Tin, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.TinBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingBronzeBar = {
    ItemId = core.Items.Smelting.BronzeBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Copper, Quantity = 1 },
		{ Id = core.Items.Ores.Tin, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.BronzeBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingSilverBar = {
    ItemId = core.Items.Smelting.SilverBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Silver, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.SilverBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingSteelBar = {
    ItemId = core.Items.Smelting.SteelBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Smelting.IronBar, Quantity = 1 },
		{ Id = core.Items.Ores.Coal, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.SteelBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingIronBar = {
    ItemId = core.Items.Smelting.IronBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Iron, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.IronBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingGoldBar = {
    ItemId = core.Items.Smelting.GoldBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Gold, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.GoldBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingMithrilBar = {
    ItemId = core.Items.Smelting.MithrilBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Mithril, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.MithrilBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingTruesilverBar = {
    ItemId = core.Items.Smelting.TruesilverBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Truesilver, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.TruesilverBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingThoriumBar = {
    ItemId = core.Items.Smelting.ThoriumBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.Thorium, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.ThoriumBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingDarkIronBar = {
    ItemId = core.Items.Smelting.DarkIronBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.DarkIron, Quantity = 8 },
    },
    Results = {
        { Id = core.Items.Smelting.DarkIronBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingEnchantedElementiumBar = {
    ItemId = core.Items.Smelting.EnchantedElementiumBar,
    Quantity = 1,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Ores.ElementiumIngot, Quantity = 1 },
		{ Id = core.Items.Ores.ArcaniteBar, Quantity = 10 },
		{ Id = core.Items.Ores.FireyCore, Quantity = 1 },
		{ Id = core.Items.Ores.ElementalFlux, Quantity = 3 },
    },
    Results = {
        { Id = core.Items.Smelting.EnchantedElementiumBar, Quantity = 1 },
    }
}
  
  
-- TBC 

core.Data.Results.Flips.SmeltingFelIronBar = {
    ItemId = core.Items.Smelting.FelIronBar,
    Quantity = 1,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Ores.FelIron, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.FelIronBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingAdamantiteBar = {
    ItemId = core.Items.Smelting.AdamantiteBar,
    Quantity = 1,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Ores.Adamantite, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.AdamantiteBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingEterniumBar = {
    ItemId = core.Items.Smelting.EterniumBar,
    Quantity = 1,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Ores.Eternium, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.EterniumBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingFelSteelBar = {
    ItemId = core.Items.Smelting.FelSteelBar,
    Quantity = 1,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Smelting.FelIronBar, Quantity = 3 },
		{ Id = core.Items.Smelting.EterniumBar, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.FelSteelBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingHardenedAdamantiteBar = {
    ItemId = core.Items.Smelting.HardenedAdamantiteBar,
    Quantity = 1,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Smelting.AdamantiteBar, Quantity = 10 },
    },
    Results = {
        { Id = core.Items.Smelting.HardenedAdamantiteBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingKhoriumBar = {
    ItemId = core.Items.Smelting.KhoriumBar,
    Quantity = 1,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Ores.Khorium, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.KhoriumBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingHardenedKhoriumBar = {
    ItemId = core.Items.Smelting.HardenedKhoriumBar,
    Quantity = 1,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Smelting.KhoriumBar, Quantity = 3 },
		{ Id = core.Items.Smelting.HardenedAdamantiteBar, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.HardenedKhoriumBar, Quantity = 1 },
    }
}




-- Wotlk 


core.Data.Results.Flips.SmeltingSaroniteBar = {
    ItemId = core.Items.Smelting.SaroniteBar,
    Quantity = 1,
    Content = core.Content.Wotlk,
    Materials = {
        { Id = core.Items.Ores.Saronite, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.SaroniteBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingCobaltBar = {
    ItemId = core.Items.Smelting.CobaltBar,
    Quantity = 1,
    Content = core.Content.Wotlk,
    Materials = {
        { Id = core.Items.Ores.Cobalt, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.CobaltBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingTitanSteelBar = {
    ItemId = core.Items.Smelting.TitanSteelBar,
    Quantity = 1,
    Content = core.Content.Wotlk,
    Materials = {
        { Id = core.Items.Ores.Titanium, Quantity = 3 },
		{ Id = core.Items.Misc.EternalFire, Quantity = 1 },
		{ Id = core.Items.Misc.EternalEarth, Quantity = 1 },
		{ Id = core.Items.Misc.EternalShadow, Quantity = 1 },
    },
    Results = {
        { Id = core.Items.Smelting.TitanSteelBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingTitaniumBar = {
    ItemId = core.Items.Smelting.TitaniumBar,
    Quantity = 1,
    Content = core.Content.Wotlk,
    Materials = {
        { Id = core.Items.Ores.Titanium, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.TitaniumBar, Quantity = 1 },
    }
}

-- Cata 


core.Data.Results.Flips.SmeltingObsidianBar = {
    ItemId = core.Items.Smelting.ObsidianBar,
    Quantity = 1,
    Content = core.Content.Cata,
    Materials = {
        { Id = core.Items.Ores.Obsidium, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.ObsidianBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingElementiumBar = {
    ItemId = core.Items.Smelting.ElementiumBar,
    Quantity = 1,
    Content = core.Content.Cata,
    Materials = {
        { Id = core.Items.Ores.Elementium, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.ElementiumBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingHardenedElementiumBar = {
    ItemId = core.Items.Smelting.HardenedElementiumBar,
    Quantity = 1,
    Content = core.Content.Cata,
    Materials = {
        { Id = core.Items.Ores.Elementium, Quantity = 10 },
		{ Id = core.Items.Misc.VolatileEarth, Quantity = 4 },
    },
    Results = {
        { Id = core.Items.Smelting.HardenedElementiumBar, Quantity = 1 },
		
    }
}

core.Data.Results.Flips.SmeltingPyriumBar = {
    ItemId = core.Items.Smelting.PyriumBar,
    Quantity = 1,
    Content = core.Content.Cata,
    Materials = {
        { Id = core.Items.Ores.Pyrite, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.PyriumBar, Quantity = 1 },
    }
}

--Mop 

core.Data.Results.Flips.SmeltingTrilliumBar = {
    ItemId = core.Items.Smelting.TrilliumBar,
    Quantity = 1,
    Content = core.Content.Mop,
    Materials = {
        { Id = core.Items.Ores.BlackTrillium, Quantity = 2 },
		{ Id = core.Items.Ores.WhiteTrillium, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.TrilliumBar, Quantity = 1 },
    }
}

core.Data.Results.Flips.SmeltingGhostIronBar = {
    ItemId = core.Items.Smelting.GhostIronBar,
    Quantity = 1,
    Content = core.Content.Mop,
    Materials = {
        { Id = core.Items.Ores.GhostIron, Quantity = 2 },
    },
    Results = {
        { Id = core.Items.Smelting.GhostIronBar, Quantity = 1 },
    }
}







































