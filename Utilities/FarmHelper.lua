local WIT, core = ...

local FarmHelper = {}

core.FarmHelper = FarmHelper

function FarmHelper.GetName(farm)
    local name = ''
    if farm.ItemId then
        name = core.TSMHelper.GetItemName(farm.ItemId)
    elseif farm.NameMapId then
        name = core.LocationHelper.GetMapName(farm.NameMapId)
    else
        name = farm.Name
    end

    if farm.NameSuffix then
        name = name .. " " .. core.GetString(farm.NameSuffix)
    end

    return name
end
