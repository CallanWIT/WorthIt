local WIT, core = ...

local RoutesHelper = {}

core.RoutesHelper = RoutesHelper

--/script for key, value in pairs(Routes.LZName) do print(key .. ' - ' .. value) end
--/script for name, id in pairs(Routes.LZName) do if id == 69 then print(name) end end

local function CheckIfRoutesIsEnabled()
    if not RoutesHelper.IsRoutesAvailable() then
        error("Routes addon not found")
    end
end

local function GetRoutesMapName(mapId)
    for name, id in pairs(Routes.LZName) do
        if id == mapId then
            return name
        end
    end
end

function RoutesHelper.IsRoutesAvailable()
    return Routes and Routes.db and Routes.db.global
end

-- requires reloading ui
function RoutesHelper.ImportRoute(route)
    CheckIfRoutesIsEnabled()

    --route.Data["color"] = { 0, 0.2470588235294118, 1, 1 }

    Routes.db.global.routes[route.MapId] = Routes.db.global.routes[route.MapId] or {}
    Routes.db.global.routes[route.MapId][core.GetString(route.Name)] = route.Data
end
