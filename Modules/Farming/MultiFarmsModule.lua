local WIT, core = ...

local MultiFarmsData = {

-- Vanilla

core.Data.Results.Farms.FelwoodMultifarm,
core.Data.Results.Farms.FeralasMultifarm,
core.Data.Results.Farms.DarkshoreMultifarm,
core.Data.Results.Farms.SilithusMultifarm,
-- BC 
core.Data.Results.Farms.TerokkarForestMultifarm,
-- Wotlk
core.Data.Results.Farms.WintergraspMultifarm,
core.Data.Results.Farms.BoreanTundraMultifarm,
core.Data.Results.Farms.SholazarBasinMultifarm,
-- Cata
core.Data.Results.Farms.UldumMultifarm,
core.Data.Results.Farms.VashirMultifarm,
core.Data.Results.Farms.DeepholmMultifarm,
core.Data.Results.Farms.MountHyjalMultifarm,
core.Data.Results.Farms.TwilightHighlandsMultifarm,
-- Mop
core.Data.Results.Farms.KunLaiSummitMultifarm,
core.Data.Results.Farms.DreadWastesMultifarm,
core.Data.Results.Farms.ValleyoftheFourWindsMultifarm,
core.Data.Results.Farms.TheJadeForestMultifarm,
-- Wod
core.Data.Results.Farms.TannanJungleMultifarm,
-- Legion
core.Data.Results.Farms.AzsunaMultifarm,
core.Data.Results.Farms.StormheimMultifarm,
core.Data.Results.Farms.ValSharahMultifarm,
core.Data.Results.Farms.SuramarMultifarm,
core.Data.Results.Farms.HighMountainMultifarm,
-- BFA
core.Data.Results.Farms.VigilHillMultifarm,
core.Data.Results.Farms.NazjatarMultifarm,
-- Shadowlands
core.Data.Results.Farms.MaldraxxusMultifarm,
core.Data.Results.Farms.RevendrethMultifarm,
core.Data.Results.Farms.BastionMultifarm, 
core.Data.Results.Farms.ArdenwealdMultifarm,




}

table.insert(core.Modules, core.FarmResultModule('MultiFarms', MultiFarmsData, 'Farming'))