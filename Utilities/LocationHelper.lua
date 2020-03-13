local WIT, core = ...

local LocationHelper = {}

core.LocationHelper = LocationHelper

-- areaId - id from namespace core.Locations
function LocationHelper.GetAreaName(areaId)
    return C_Map.GetAreaInfo(areaId)
end

-- mapId - C_Map.GetBestMapForUnit("player")
function LocationHelper.GetMapName(mapId)
    return C_Map.GetMapInfo(mapId).name
end