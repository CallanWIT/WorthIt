local WIT, core = ...


-- Find Location Map ID's = /script print(C_Map.GetBestMapForUnit("player"))


core.Maps = {
    Ashenvale = 63,
    BlastedLands = 17,
    BurningSteppes = 36,
    Darkshore = 62,
    Durotar = 1,
    DustwallowMarsh = 70,
    Felwood = 77,
    Feralas = 69,
    Silithus = 81,
    SwampOfSorrows = 51,
    Tanaris = 71,
    WesternPlaguelands = 22,
    Wetlands = 56,
    Winterspring = 83,
	UngoroCrater = 78,

    TheDeadMines = 291,
    Stratholme = 318,
    BlackrockDepths = 242,
    DireMaul = 239,
    RazorfenDowns = 300,
    WailingCaverns = 279,
    Maraudon = 281,
    ScarletMonastary = 435,
    Scholomace = 476,
    ScarletHalls = 431,
    ShadowfangKeep = 310,
    TheTempleOfAtalHakkar = 220,
    Gnomeregan = 226,
    LowerBlackrockSpire = 252,
    BlackfathomDeeps = 221,
    Ulduman = 230,
    TheStockade = 225,
    ZulFarrak = 219,
    RazorfenKraul = 301,
    RagefireChasm = 213,

    -- TBC

    HellfirePeninsula = 100,
    Nagrand = 107,
    Netherstorm = 109,
    QuelDanas = 122,
    ShadowmoonValley = 104,
    TerokkarForest = 108,
    Zangarmarsh = 102,
	BladesEdgeMTs = 105,

    -- WotLK

    BoreanTundra = 114,
    Dalaran = 125,
    HowlingFjord = 117,
    Icecrown = 118,
    SholazarBasin = 119,
    Wintergrasp = 123,
    TheStormPeaks = 120,
    ZulDrak = 121,


    -- Cata

    AbyssalDepths = 204,
    Deepholm = 207,
    MountHyjal = 198,
    TwilightHighlands = 241,
    Uldum = 249,

    -- MOP

    DreadWastes = 422,
    IsleOfGiants = 507,
    KunLaiSummit = 379,
    TheJadeForest = 371,
    TownlongSteppes = 388,
    ValeOfEternalBlossoms = 390,
    ValleyOfTheFourWinds = 376,

    -- WOD

    TanaanJungle = 534,
    WODShadowmoonValley = 539,
	FrostfireRidge = 525,
	

    -- Legion

    Azsuna = 630,
    Krokuun = 830,
    Highmountain = 650,
    Stormheim = 634,
    Suramar = 680,
    Valsharah = 641,

    -- BFA
	
	Zandalar = 862,
	Nazmir = 863,

    Drustvar = 896,
    Nazjatar = 1355,
    StormsongValley = 942,
    TiragardeSound = 895,
    Voldun = 864,
    BFAUldum = 1527,
    BFAValeOfEternalBlossoms = 1530,
	
	-- Dungeons/Raids
	
	
	-- Vanilla 
	
	AQ = 320, 
	MoltenCore = 232,
	BlackWingLair = 287, 
	
	-- TBC
	
	Karazhan = 350,
	SerpentShrineCavern = 332,
	TempestKeep = 334,
	BlackTemple = 340,
	HyjalSummit = 329,
	SunwellPlateau = 335,
	
	
	
	-- wotlk
	ICC = 186,
	Ulduar = 147,
	TrialOfCrus = 172,
	VaultofArch = 156,
	Naxx = 166,
	Obsidiansanc = 155,
	EyeofEternity = 141,
	OnyxiasLair = 248,
	RubySanctum = 200,
	
	--cata
	
    Baradinhold = 282,
    Blackwingdecent = 285,
    BastionofTwilight = 294,
    ThroneofFourWinds = 328,
    Firelands = 367,
    Dragonsoul = 409,
	
	-- mop
	
	Mogushan = 471,
	HeartofFear = 474,
	Terraceofendless = 456,
	ThroneofThunder = 510,
	SeigeofOrgrimmar = 563,
	
	--wod
	
	HellfireCitatel = 661,
	Highmaul = 615,
	Blackrockfoundry = 598,
	Skyreach = 601,
	
	-- legion
	
	TombofSargeras = 856,
	EmeraldNightmare = 777,
	Nighthold = 766,
	TrialofValor = 807,
	Antorus = 917,
	
	--bfa
	
	FreeHold = 936,
	
	Dazaralor = 1352,
	EternalPalace = 1512,
	Nyalotha = 1580,
	
	--Shadowlands
	
	RevenDreth = 1525,
	Maldraxxus = 1536,
	Bastion = 1533,
	Ardenweald = 1565,
	
	
	
	
	
	
}
