local WIT, core = ...

local vanillamogData = {
    -- Vanilla
    core.Data.Results.Farms.Ragefire,
    core.Data.Results.Farms.TheDeadMines,
    core.Data.Results.Farms.WailingCaverns,
    core.Data.Results.Farms.Shadowfang,
    core.Data.Results.Farms.Blackfathom,
    core.Data.Results.Farms.Stockades,
    core.Data.Results.Farms.Gnomeregan,
    core.Data.Results.Farms.Scarlet,
    core.Data.Results.Farms.Monastary,
    core.Data.Results.Farms.Kraul,
    core.Data.Results.Farms.Maraudon,
    core.Data.Results.Farms.Downs,
    core.Data.Results.Farms.Scholomace,
    core.Data.Results.Farms.Ulduman,
    core.Data.Results.Farms.Dire,
    core.Data.Results.Farms.Farrak,
    core.Data.Results.Farms.Stratholme,
    core.Data.Results.Farms.Sunken,
    core.Data.Results.Farms.Blackrock,
    core.Data.Results.Farms.Spire,
}

local module = core.FarmResultModule('Transmog', vanillamogData, 'Transmog')
module.DetailsRowHeaderResource = "ItemsOfNote"

function module.GetDetailsRowData(row)
    return row.Data.ItemsOfNote
end

table.insert(core.Modules, module)