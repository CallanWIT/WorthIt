local WIT, core = ...



-- Vanilla
core.Data.Results.Flips.DEGreenLinenBracers = {
    ItemId = core.Items.Tailoring.GreenLinenBracers,
    Quantity = 100,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Cloths.LinenCloth, Quantity = 600 },
		{
            Id = core.Items.Cloths.CoarseThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 200
        },
		{
            Id = core.Items.Cloths.GreenDye,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 100
        },
    },
    Results = {
        { Id = core.Items.Enchanting.LesserMagicEssence, Quantity = 40 },
        { Id = core.Items.Enchanting.StrangeDust, Quantity = 120 },
    }
}



core.Data.Results.Flips.RuneclothBelt = {
    ItemId = core.Items.Tailoring.RuneclothBelt,
    Quantity = 100,
    Content = core.Content.Vanilla,
    Materials = {
        { Id = core.Items.Cloths.Runecloth, Quantity = 1200 },
		{
            Id = core.Items.Cloths.RuneThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 100
        },
    },
    Results = {
        { Id = core.Items.Enchanting.LargeBrilliantShard, Quantity = 20 },
        { Id = core.Items.Enchanting.GreaterEternalEssence, Quantity = 30 },
		{ Id = core.Items.Enchanting.RichIllusionDust, Quantity = 100 },
    }
}


-- TBC 

core.Data.Results.Flips.NetherweaveBracers = {
    ItemId = core.Items.Tailoring.NetherweaveBracers,
    Quantity = 100,
    Content = core.Content.TBC,
    Materials = {
        { Id = core.Items.Cloths.NetherweaveCloth, Quantity = 1500 },
		{
            Id = core.Items.Cloths.RuneThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 100
        },
    },
    Results = {
        { Id = core.Items.Enchanting.ArcaneDust, Quantity = 60 },
        { Id = core.Items.Enchanting.SmallPrismaticShard, Quantity = 10 },
		{ Id = core.Items.Enchanting.LesserPlannerEssence, Quantity = 140 },
    }
}


-- WOTLK

core.Data.Results.Flips.FrostwovenWristwraps = {
    ItemId = core.Items.Tailoring.FrostwovenWristwraps,
    Quantity = 100,
    Content = core.Content.WotLK,
    Materials = {
        { Id = core.Items.Cloths.FrostweaveCloth, Quantity = 1500 },
		{
            Id = core.Items.Cloths.EterniumThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 100
        },
    },
    Results = {
        { Id = core.Items.Enchanting.LesserCosmicEssence, Quantity = 20 },
        { Id = core.Items.Enchanting.LargeDreamShard, Quantity = 10 },
		{ Id = core.Items.Enchanting.InfiniteDust, Quantity = 190 },
    }
}


-- Cata

core.Data.Results.Flips.DeathsilkBracers = {
    ItemId = core.Items.Tailoring.DeathsilkBracers,
    Quantity = 100,
    Content = core.Content.Cata,
    Materials = {
        { Id = core.Items.Cloths.EmbersilkCloth, Quantity = 1000 },
		{
            Id = core.Items.Cloths.EterniumThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 200
        },
    },
    Results = {
        { Id = core.Items.Enchanting.LesserCelestialEssence, Quantity = 80 },
        { Id = core.Items.Enchanting.HypnoticDust, Quantity = 160 },
    }
}


-- Mop

core.Data.Results.Flips.WindwoolBelt = {
    ItemId = core.Items.Tailoring.WindwoolBelt,
    Quantity = 100,
    Content = core.Content.MoP,
    Materials = {
        { Id = core.Items.Cloths.WindwoolCloth, Quantity = 2000 },
    },
    Results = {
        { Id = core.Items.Enchanting.EthrealShard, Quantity = 20 },
        { Id = core.Items.Enchanting.MysteriousEssence, Quantity = 10 },
		{ Id = core.Items.Enchanting.SpiritDust, Quantity = 140 },
    }
}


-- Wod

core.Data.Results.Flips.SumptousCowl = {
    ItemId = core.Items.Tailoring.SumptousCowl,
    Quantity = 100,
    Content = core.Content.WoD,
    Materials = {
        { Id = core.Items.Cloths.SumptuousFur, Quantity = 5000 },
    },
    Results = {
        { Id = core.Items.Enchanting.DraenicDust, Quantity = 960 },
    }
}


-- Legion

core.Data.Results.Flips.SilkweaveEpaulets = {
    ItemId = core.Items.Tailoring.SilkweaveEpaulets,
    Quantity = 100,
    Content = core.Content.Legion,
    Materials = {
        { Id = core.Items.Cloths.ShalDoreiSilk, Quantity = 1800 },
    },
    Results = {
        { Id = core.Items.Enchanting.LeylightShard, Quantity = 100 },

    }
}


-- BFA
core.Data.Results.Flips.TidesprayBracers = {
    ItemId = core.Items.Tailoring.TidesprayBracers,
    Quantity = 100,
    Content = core.Content.BFA,
    Materials = {
        { Id = core.Items.Cloths.TidesprayLinen, Quantity = 1000 },
		{
            Id = core.Items.Cloths.NylonThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 500
        },
    },
    Results = {
        { Id = core.Items.Enchanting.GloomDust, Quantity = 709 },

    }
}



-- Shadowlands

core.Data.Results.Flips.ShroudedClothBracers = {
    ItemId = core.Items.Tailoring.ShroudedClothBracers,
    Quantity = 100,
    Content = core.Content.Shadowlands,
    Materials = {
        { Id = core.Items.Cloths.ShroudedCloth, Quantity = 300 },
		{
            Id = core.Items.Cloths.PenumbraThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 300
        },
    },
    Results = {
        { Id = core.Items.Enchanting.SoulDust, Quantity = 220 },

    }
}

core.Data.Results.Flips.ShadowlaceCuffs = {
    ItemId = core.Items.Tailoring.ShadowlaceCuffs,
    Quantity = 100,
    Content = core.Content.Shadowlands,
    Materials = {
        { Id = core.Items.Cloths.ShroudedCloth, Quantity = 1000 },
		{ Id = core.Items.Cloths.LightlessSilk, Quantity = 200 },
		{
            Id = core.Items.Cloths.PenumbraThread,
            BuyFromVendor = true,
            ApplyReputationDiscount = true,
            Quantity = 300
        },
    },
    Results = {
        { Id = core.Items.Enchanting.SacredShard, Quantity = 140 },
		{ Id = core.Items.Enchanting.SoulDust, Quantity = 150 },

    }
}




