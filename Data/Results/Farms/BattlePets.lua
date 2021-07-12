local WIT, core = ...

-- Vanilla


-- Temple of AQ
core.Data.Results.Farms.TempleofAQBattlePets = {
    Id = "TempleofAQBattlePets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.AQ,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.Silithus },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1156, ItemLink = "|cff0070dd|Hbattlepet:1156:1:3:152:12:12:0000000000000000:6291|h[Mini Mindslayer]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1155, ItemLink = "|cff0070dd|Hbattlepet:1155:1:3:165:11:10:0000000000000000:6291|h[Anubisath Idol]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1154, ItemLink = "|cff0070dd|Hbattlepet:1154:1:3:158:10:12:0000000000000000:6291|h[Viscidus Globule]|h|r", Quantity = 1 },
    }
}


-- Molten Core

--Ashstone Core
--Corefire Imp
--Harbringer of Flame

core.Data.Results.Farms.MoltenCorePets = {
    Id = "MoltenCorePets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.MoltenCore,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.BurningSteppes },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1150, ItemLink = "|cff0070dd|Hbattlepet:1150:1:3:158:10:12:0000000000000000:6291|h[Ashstone Core]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1149, ItemLink = "|cff0070dd|Hbattlepet:1149:1:3:152:12:12:0000000000000000:6291|h[Corefire Imp]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1147, ItemLink = "|cff0070dd|Hbattlepet:1147:1:3:152:13:10:0000000000000000:6291|h[Harbinger of Flame]|h|r", Quantity = 1 },
    }
}
-- Black Wing Lair 

--Chrominius
--Untamed Hatchling
-- Death Talon Whelpguard

core.Data.Results.Farms.BlackWingLairPets = {
    Id = "BlackWingLairPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.BlackWingLair,
    Content = core.Content.Vanilla,
    Locations = { core.Locations.Kalimdor.BurningSteppes },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1152, ItemLink = "|cff0070dd|Hbattlepet:1152:1:3:162:11:10:0000000000000000:6291|h[Chrominius]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1151, ItemLink = "|cff0070dd|Hbattlepet:1151:1:3:158:12:10:0000000000000000:6291|h[Untamed Hatchling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1153, ItemLink = "|cff0070dd|Hbattlepet:1153:1:3:152:13:10:0000000000000000:6291|h[Death Talon Whelpguard]|h|r", Quantity = 1 },
    }
}

-- BC 

-- Karazhan

-- Fiendish Imp
-- Lil'Bad Wolf
-- Menagerie Custodian
-- Netherspace Abyssal

core.Data.Results.Farms.KarazhanPets = {
    Id = "KarazhanPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Karazhan,
    Content = core.Content.TBC,
    Locations = { core.Locations.EasternKingdoms.DeadwindPass },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1229, ItemLink = "|cff0070dd|Hbattlepet:1229:1:3:150:10:13:0000000000000000:6291|h[Fiendish Imp]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1226, ItemLink = "|cff0070dd|Hbattlepet:1226:1:3:149:14:10:0000000000000000:6291|h[Lil' Bad Wolf]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1227, ItemLink = "|cff0070dd|Hbattlepet:1227:1:3:168:10:10:0000000000000000:6291|h[Menagerie Custodian]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1228, ItemLink = "|cff0070dd|Hbattlepet:1228:1:3:165:11:10:0000000000000000:6291|h[Netherspace Abyssal]|h|r", Quantity = 1 },
    }
}

-- Serpent Shrine Cavern

-- Coilfang Stalker
-- Tainted Waveling
-- Tideskipper

core.Data.Results.Farms.SerpentShrineCavernPets = {
    Id = "SerpentShrineCavernPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.SerpentShrineCavern,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.Zangamarsh },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1232, ItemLink = "|cff0070dd|Hbattlepet:1232:1:3:156:11:11:0000000000000000:6291|h[Coilfang Stalker]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1231, ItemLink = "|cff0070dd|Hbattlepet:1231:1:3:158:11:11:0000000000000000:6291|h[Tainted Waveling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1230, ItemLink = "|cff0070dd|Hbattlepet:1230:1:3:167:11:10:0000000000000000:6291|h[Tideskipper]|h|r", Quantity = 1 },
    }
}

-- The Eye ( Tempest Keep)

-- Lesser Voidcaller
-- Phoenix Hawk Hatchling
-- Pocket Reaver 

core.Data.Results.Farms.TempestKeepPets = {
    Id = "TempestKeepPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.TempestKeep,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.Netherstorm },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1234, ItemLink = "|cff0070dd|Hbattlepet:1234:1:3:167:10:10:0000000000000000:6291|h[Lesser Voidcaller]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1235, ItemLink = "|cff0070dd|Hbattlepet:1235:1:3:152:10:13:0000000000000000:6291|h[Phoenix Hawk Hatchling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1233, ItemLink = "|cff0070dd|Hbattlepet:1233:1:3:167:11:9:0000000000000000:6291|h[Pocket Reaver]|h|r", Quantity = 1 },
    }
}

-- Black Temple 

-- Abyssius
-- Fragment of Anger
-- Fragment of Desire
-- Fragment of Suffering
-- Leviathan Hatchling
-- Sister of Temptation

core.Data.Results.Farms.BlackTemplePets = {
    Id = "BlackTemplePets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.BlackTemple,
    Content = core.Content.TBC,
    Locations = { core.Locations.Outlands.ShadowmoonValleyOld },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1624, ItemLink = "|cff0070dd|Hbattlepet:1150:1:3:152:13:10:0000000000000000:6291|h[Abyssius]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1625, ItemLink = "|cff0070dd|Hbattlepet:1625:1:3:158:12:10:0000000000000000:6291|h[Fragment of Anger]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1627, ItemLink = "|cff0070dd|Hbattlepet:1627:1:3:158:10:12:0000000000000000:6291|h[Fragment of Desire]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1626, ItemLink = "|cff0070dd|Hbattlepet:1626:1:3:158:11:11:0000000000000000:6291|h[Fragment of Suffering]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1623, ItemLink = "|cff0070dd|Hbattlepet:1623:1:3:158:12:10:0000000000000000:6291|h[Leviathan Hatchling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1628, ItemLink = "|cff0070dd|Hbattlepet:1628:1:3:158:11:11:0000000000000000:6291|h[Sister of Temptation]|h|r", Quantity = 1 },
    }
}

-- HyjalSummit

-- Grotesque
-- Hyjal Wisp
-- Stinkrot

core.Data.Results.Farms.HyjalSummitPets = {
    Id = "HyjalSummitPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.HyjalSummit,
    Content = core.Content.TBC,
    Locations = { core.Locations.Kalimdor.Tanaris },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1622, ItemLink = "|cff0070dd|Hbattlepet:1622:1:3:168:10:10:0000000000000000:6291|h[Grotesque]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1631, ItemLink = "|cff0070dd|Hbattlepet:1631:1:3:152:10:13:0000000000000000:6291|h[Hyjal Wisp]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1629, ItemLink = "|cff0070dd|Hbattlepet:1629:1:3:158:11:11:0000000000000000:6291|h[Stinkrot]|h|r", Quantity = 1 },
    }
}

-- Sunwell Plateau

-- Choas Pup
-- Sunblade Micro-Defender
-- Wretched Servant

core.Data.Results.Farms.SunwellPlateauPets = {
    Id = "SunwellPlateauPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.SunwellPlateau,
    Content = core.Content.TBC,
    Locations = { core.Locations.EasternKingdoms.IsleofQuelDanas },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1633, ItemLink = "|cff0070dd|Hbattlepet:1633:1:3:155:12:11:0000000000000000:6291|h[Chaos Pup]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1632, ItemLink = "|cff0070dd|Hbattlepet:1632:1:3:165:10:10:0000000000000000:6291|h[Sunblade Micro-Defender]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1634, ItemLink = "|cff0070dd|Hbattlepet:1634:1:3:155:11:11:0000000000000000:6291|h[Wretched Servant]|h|r", Quantity = 1 },
    }
}


-- Wrath of the Lich King

-- Ice Crown Citidel

-- Boneshard
-- Blood Boil
-- Blightbreath
-- Soulbroken Whelpling
-- Drudge Ghoul
-- Wicked Soul

core.Data.Results.Farms.IceCrownCitidelPets = {
    Id = "IceCrownCitidelPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.ICC,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Icecrown },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1963, ItemLink = "|cff0070dd|Hbattlepet:1963:1:3:155:11:11:0000000000000000:6291|h[Boneshard]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1964, ItemLink = "|cff0070dd|Hbattlepet:1964:1:3:165:10:10:0000000000000000:6291|h[Blood Boil]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1965, ItemLink = "|cff0070dd|Hbattlepet:1965:1:3:159:12:10:0000000000000000:6291|h[Blightbreath]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1966, ItemLink = "|cff0070dd|Hbattlepet:1966:1:3:155:11:12:0000000000000000:6291|h[Soulbroken Whelpling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1967, ItemLink = "|cff0070dd|Hbattlepet:1967:1:3:154:11:11:0000000000000000:6291|h[Drudge Ghoul]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1968, ItemLink = "|cff0070dd|Hbattlepet:1968:1:3:150:10:13:0000000000000000:6291|h[Wicked Soul]|h|r", Quantity = 1 },
    }
}

-- Trial of the Crusader

-- Dreadmaw 
-- Nerubian Swarmer

core.Data.Results.Farms.TrialoftheCrusaderPets = {
    Id = "TrialoftheCrusaderPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.TrialOfCrus,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Icecrown },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1952, ItemLink = "|cff0070dd|Hbattlepet:1952:1:3:155:11:11:0000000000000000:6291|h[Dreadmaw]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1954, ItemLink = "|cff0070dd|Hbattlepet:1954:1:3:152:12:12:0000000000000000:6291|h[Nerubian Swarmer]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1953, ItemLink = "|cff0070dd|Hbattlepet:1953:1:3:152:10:13:0000000000000000:6291|h[Snobold Runt]|h|r", Quantity = 1 },
    }
}

-- Ulduar

-- Magma Rageling
-- Ironbound Proto-Whelp 
-- Runeforged Servitor
-- Sanctum Cub
-- Winter Rageling
-- Snaplasher
-- G0-R41-0N Ultratonk
-- Creeping Tentacle

core.Data.Results.Farms.UlduarPets = {
    Id = "UlduarPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Ulduar,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.StormPeaks },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1955, ItemLink = "|cff0070dd|Hbattlepet:1955:1:3:145:14:10:0000000000000000:6291|h[Magma Rageling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1956, ItemLink = "|cff0070dd|Hbattlepet:1956:1:3:168:10:10:0000000000000000:6291|h[Ironbound Proto-Whelp]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1957, ItemLink = "|cff0070dd|Hbattlepet:1957:1:3:162:11:10:0000000000000000:6291|h[Runeforged Servitor]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1958, ItemLink = "|cff0070dd|Hbattlepet:1958:1:3:152:13:10:0000000000000000:6291|h[Sanctum Cub]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1959, ItemLink = "|cff0070dd|Hbattlepet:1959:1:3:171:10:10:0000000000000000:6291|h[Winter Rageling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1960, ItemLink = "|cff0070dd|Hbattlepet:1960:1:3:155:11:11:0000000000000000:6291|h[Snaplasher]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1961, ItemLink = "|cff0070dd|Hbattlepet:1961:1:3:170:10:10:0000000000000000:6291|h[G0-R41-0N Ultratonk]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1962, ItemLink = "|cff0070dd|Hbattlepet:1962:1:3:152:12:12:0000000000000000:6291|h[Creeping Tentacle]|h|r", Quantity = 1 },
    }
}

-- Naxxramas

-- Fungal Abomination
-- Giant Bone Spider
-- Stitched Pup

core.Data.Results.Farms.NaxxramasPets = {
    Id = "NaxxramasPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Naxx,
    Content = core.Content.WotLK,
    Locations = { core.Locations.Northrend.Dragonblight },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1144, ItemLink = "|cff0070dd|Hbattlepet:1144:1:3:158:10:12:0000000000000000:6291|h[Fungal Abomination]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1143, ItemLink = "|cff0070dd|Hbattlepet:1143:1:3:152:12:12:0000000000000000:6291|h[Giant Bone Spider]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1146, ItemLink = "|cff0070dd|Hbattlepet:1146:1:3:158:12:10:0000000000000000:6291|h[Stitched Pup]|h|r", Quantity = 1 },
    }
}




-- Cata

-- Throne of The Four Winds

-- Drafty
-- Zephyrian Prince

core.Data.Results.Farms.ThroneofTheFourWindsPets = {
    Id = "ThroneofTheFourWindsPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.ThroneofFourWinds,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.Uldum },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2085, ItemLink = "|cff0070dd|Hbattlepet:2085:1:3:149:11:13:0000000000000000:6291|h[Drafty]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2084, ItemLink = "|cff0070dd|Hbattlepet:2084:1:3:149:12:12:0000000000000000:6291|h[Zephyrian Prince]|h|r", Quantity = 1 },
    }
}

-- Bastion of Twilight

-- Bound Stream
-- Faceless Minion
-- Twilight Clutch Sister

core.Data.Results.Farms.BastionofTwilightPets = {
    Id = "BastionofTwilightPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.BastionofTwilight,
    Content = core.Content.Cata,
    Locations = { core.Locations.EasternKingdoms.TwilightHighlands },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2082, ItemLink = "|cff0070dd|Hbattlepet:2082:1:3:149:10:14:0000000000000000:6291|h[Bound Stream]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2083, ItemLink = "|cff0070dd|Hbattlepet:2083:1:3:152:13:10:0000000000000000:6291|h[Faceless Minion]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2081, ItemLink = "|cff0070dd|Hbattlepet:2081:1:3:152:12:12:0000000000000000:6291|h[Twilight Clutch-Sister]|h|r", Quantity = 1 },
    }
}

-- Firelands

-- Blazehound
-- Cinderweb Recluse
-- Surger

core.Data.Results.Farms.FirelandsPets = {
    Id = "FirelandsPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Firelands,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.MtHyjal },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2086, ItemLink = "|cff0070dd|Hbattlepet:2086:1:3:152:12:11:0000000000000000:6291|h[Blazehound]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2087, ItemLink = "|cff0070dd|Hbattlepet:2087:1:3:152:12:12:0000000000000000:6291|h[Cinderweb Recluse]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2088, ItemLink = "|cff0070dd|Hbattlepet:2088:1:3:149:10:14:0000000000000000:6291|h[Surger]|h|r", Quantity = 1 },
    }
}

-- Dragon Soul

-- Corrupted Blood
-- Faceless Mindlasher
-- Unstable Tendril

core.Data.Results.Farms.DragonSoulPets = {
    Id = "DragonSoulPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Dragonsoul,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.Tanaris },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2091, ItemLink = "|cff0070dd|Hbattlepet:2091:1:3:155:12:11:0000000000000000:6291|h[Corrupted Blood]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2090, ItemLink = "|cff0070dd|Hbattlepet:2090:1:3:150:13:11:0000000000000000:6291|h[Faceless Mindlasher]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2092, ItemLink = "|cff0070dd|Hbattlepet:2092:1:3:161:12:10:0000000000000000:6291|h[Unstable Tendril]|h|r", Quantity = 1 },
    }
}

-- Blackwing Decent

-- Discarded Experiment
-- Rattlejaw
-- Tinytron

core.Data.Results.Farms.BlackwingDecentPets = {
    Id = "BlackwingDecentPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Blackwingdecent,
    Content = core.Content.Cata,
    Locations = { core.Locations.Kalimdor.BurningSteppes },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2079, ItemLink = "|cff0070dd|Hbattlepet:2079:1:3:159:12:10:0000000000000000:6291|h[Discarded Experiment]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2080, ItemLink = "|cff0070dd|Hbattlepet:2080:1:3:154:11:11:0000000000000000:6291|h[Rattlejaw]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2078, ItemLink = "|cff0070dd|Hbattlepet:2078:1:3:171:10:9:0000000000000000:6291|h[Tinytron]|h|r", Quantity = 1 },
    }
}




-- Mists of Pandaria

-- Mogu'shan Vaults

-- Stoneclaw
-- Wayward Spirit
-- Comet
-- Baoh-Xi

core.Data.Results.Farms.MogushanVaultsPets = {
    Id = "MogushanVaultsPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Mogushan,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.KunLiSummit },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2579, ItemLink = "|cff0070dd|Hbattlepet:2579:1:3:162:11:10:0000000000000000:6291|h[Stoneclaw]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2580, ItemLink = "|cff0070dd|Hbattlepet:2580:1:3:147:12:13:0000000000000000:6291|h[Wayward Spirit]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2581, ItemLink = "|cff0070dd|Hbattlepet:2581:1:3:156:12:10:0000000000000000:6291|h[Comet]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2582, ItemLink = "|cff0070dd|Hbattlepet:2582:1:3:153:13:10:0000000000000000:6291|h[Baoh-Xi]|h|r", Quantity = 1 },
    }
}

-- Terrace of Endless Spring

-- Azure Windseeker 
-- Spirit of the Spring

core.Data.Results.Farms.TerraceofEndlessSpringPets = {
    Id = "TerraceofEndlessSpringPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Terraceofendless,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.ValleyOfTheFourWinds },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2583, ItemLink = "|cff0070dd|Hbattlepet:2583:1:3:149:13:11:0000000000000000:6291|h[Azure Windseeker]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2584, ItemLink = "|cff0070dd|Hbattlepet:2584:1:3:153:11:12:0000000000000000:6291|h[Spirit of the Spring]|h|r", Quantity = 1 },
    }
}

-- Heart of Fear

-- Kor'thik Swarmling
-- Amberglow Stinger
-- Spawn of Garalon
-- Living Amberglow
-- Ravenous Prideling

core.Data.Results.Farms.HeartofFearPets = {
    Id = "HeartofFearPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.HeartofFear,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.Dreadwastes },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2585, ItemLink = "|cff0070dd|Hbattlepet:2585:1:3:145:14:11:0000000000000000:6291|h[Kor'thik Swarmling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2586, ItemLink = "|cff0070dd|Hbattlepet:2586:1:3:163:10:11:0000000000000000:6291|h[Amberglow Stinger]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2587, ItemLink = "|cff0070dd|Hbattlepet:2587:1:3:181:8:9:0000000000000000:6291|h[Spawn of Garalon]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2589, ItemLink = "|cff0070dd|Hbattlepet:2589:1:3:155:12:10:0000000000000000:6291|h[Living Amber]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2590, ItemLink = "|cff0070dd|Hbattlepet:2590:1:3:146:12:12:0000000000000000:6291|h[Ravenous Prideling]|h|r", Quantity = 1 },
    }
}

-- Throne of Thunder

-- Pygmy Direhorn
-- Living Sandling
-- Ji-Kun Hatchling
-- Living Fluid 
-- Viscous Horror
-- Son of Animus

core.Data.Results.Farms.ThroneofThunderPets = {
    Id = "ThroneofThunderPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.ThroneofThunder,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.IsleofThunder },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1200, ItemLink = "|cff0070dd|Hbattlepet:1200:1:3:154:12:11:0000000000000000:6291|h[Pygmy Direhorn]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1177, ItemLink = "|cff0070dd|Hbattlepet:1177:1:3:171:10:9:0000000000000000:6291|h[Living Sandling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1202, ItemLink = "|cff0070dd|Hbattlepet:1202:1:3:155:11:12:0000000000000000:6291|h[Ji-Kun Hatchling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1243, ItemLink = "|cff0070dd|Hbattlepet:1243:1:3:152:12:12:0000000000000000:6291|h[Living Fluid]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1244, ItemLink = "|cff0070dd|Hbattlepet:1244:1:3:158:12:10:0000000000000000:6291|h[Viscous Horror]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1183, ItemLink = "|cff0070dd|Hbattlepet:1183:1:3:152:13:10:0000000000000000:6291|h[Son of Animus]|h|r", Quantity = 1 },
    }
}

-- Siege of Orgrimmar 

-- Gooey Sha-ling
-- Droplet of Y'Shaarj
-- Blackfuse Bombling
-- Kovok


core.Data.Results.Farms.SiegeofOrgrimmarPets = {
    Id = "SiegeofOrgrimmarPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.SeigeofOrgrimmar,
    Content = core.Content.MoP,
    Locations = { core.Locations.Pandaria.ValeofEternalBlossoms },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1332, ItemLink = "|cff0070dd|Hbattlepet:1332:1:3:165:10:10:0000000000000000:6291|h[Gooey Sha-ling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1331, ItemLink = "|cff0070dd|Hbattlepet:1331:1:3:152:13:10:0000000000000000:6291|h[Droplet of Y'Shaarj]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1322, ItemLink = "|cff0070dd|Hbattlepet:1322:1:3:168:11:9:0000000000000000:6291|h[Blackfuse Bombling]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 1334, ItemLink = "|cff0070dd|Hbattlepet:1334:1:3:162:10:11:0000000000000000:6291|h[Kovok]|h|r", Quantity = 1 },
				
    }
}



-- Warlords of Dreanor

-- Hellfire Citidel

-- Currupted Nest Guardian

core.Data.Results.Farms.HellfireCitidelPets = {
    Id = "HellfireCitidelPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.HellfireCitatel,
    Content = core.Content.WoD,
    Locations = { core.Locations.Draenor.TanaanJungle },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1672, ItemLink = "|cff0070dd|Hbattlepet:1672:1:3:168:11:9:0000000000000000:6291|h[Corrupted Nest Guardian]|h|r", Quantity = 1 },

    }
}

-- Legion

-- The Emerald Nightmare

-- Nightmare Whelpling

core.Data.Results.Farms.EmeraldNightmarePets = {
    Id = "EmeraldNightmarePets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.EmeraldNightmare,
    Content = core.Content.Legion,
    Locations = { core.Locations.BrokenIsles.ValShara },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 1723, ItemLink = "|cff0070dd|Hbattlepet:1723:1:3:158:12:10:0000000000000000:6291|h[Nightmare Whelpling]|h|r", Quantity = 1 },
    }
}

-- BFA 

-- Battle of Dazar'alor

-- Spawn of Krag'wa
-- Thunder Lizard Runt 
-- Child od Pa'Ku 

core.Data.Results.Farms.BattleofDazaralorPets = {
    Id = "BattleofDazaralorPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Dazaralor,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Boralus },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2528, ItemLink = "|cff0070dd|Hbattlepet:2528:1:3:156:12:11:0000000000000000:6291|h[Spawn of Krag'wa]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2529, ItemLink = "|cff0070dd|Hbattlepet:2529:1:3:158:11:11:0000000000000000:6291|h[Thunder Lizard Runt]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2527, ItemLink = "|cff0070dd|Hbattlepet:2527:1:3:151:12:11:0000000000000000:6291|h[Child of Pa'ku]|h|r", Quantity = 1 },
    }
}

-- Eternal Palace

-- Lightless Ambusher
-- Mindlost Bloodfrenzy
-- Nameless Octopode
-- Zan'jir Poker

core.Data.Results.Farms.EternalPalacePets = {
    Id = "EternalPalacePets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.EternalPalace,
    Content = core.Content.BFA,
    Locations = { core.Locations.BFA.Nazjatar },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2692, ItemLink = "|cff0070dd|Hbattlepet:2692:1:3:152:11:12:0000000000000000:6291|h[Lightless Ambusher]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2694, ItemLink = "|cff0070dd|Hbattlepet:2694:1:3:149:13:11:0000000000000000:6291|h[Mindlost Bloodfrenzy]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2696, ItemLink = "|cff0070dd|Hbattlepet:2696:1:3:156:11:11:0000000000000000:6291|h[Nameless Octopode]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2680, ItemLink = "|cff0070dd|Hbattlepet:2680:1:3:156:11:11:0000000000000000:6291|h[Zanj'ir Poker]|h|r", Quantity = 1 },
    }
}

-- Ny'alotha , The Waking City

-- Muar
-- Aqir Hivespawn
-- Ra'kim
-- Void-Scarred Anubisath
-- Eye of Corruption

core.Data.Results.Farms.NyalothaWakingCityPets = {
    Id = "NyalothaWakingCityPets",
    Activity = core.Activity.BattlePets,
    NameMapId = core.Maps.Nyalotha,
    Content = core.Content.BFA,
    Locations = { core.Locations.Kalimdor.Uldum },
    Results = {
        { Id = core.Items.PetCageItemId, PetId = 2832, ItemLink = "|cff0070dd|Hbattlepet:2832:1:3:157:13:10:0000000000000000:6291|h[Muar]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2834, ItemLink = "|cff0070dd|Hbattlepet:2834:1:3:162:12:9:0000000000000000:6291|h[Aqir Hivespawn]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2835, ItemLink = "|cff0070dd|Hbattlepet:2835:1:3:156:11:11:0000000000000000:6291|h[Ra'kim]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2833, ItemLink = "|cff0070dd|Hbattlepet:2833:1:3:164:11:10:0000000000000000:6291|h[Void-Scarred Anubisath]|h|r", Quantity = 1 },
		{ Id = core.Items.PetCageItemId, PetId = 2836, ItemLink = "|cff0070dd|Hbattlepet:2836:1:3:147:13:11:0000000000000000:6291|h[Eye of Corruption]|h|r", Quantity = 1 },
    }
}






















































































