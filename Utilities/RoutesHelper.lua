local WIT, core = ...

local RoutesHelper = {}
local L = nil

core.RoutesHelper = RoutesHelper

local route_zone_args_desc_table = {
	type = "description",
	name = function(info)
		local zone = tonumber(info[2])
		local count = 0

		for route_name, route_table in pairs(Routes.db.global.routes[zone]) do
			if #route_table.route > 0 then
				count = count + 1
			end
		end

		return L["You have |cffffd200%d|r route(s) in |cffffd200%s|r."]:format(count, C_Map.GetMapInfo(zone).name)
	end,
	order = 0,
}

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

local function importRoute(data)
    if not data or not data.RouteZone or not data.RouteKey or not data.RouteName or not data.RouteData then return end

    L = L or LibStub("AceLocale-3.0"):GetLocale("Routes", false)

    Routes.db.global.routes[data.RouteZone][data.RouteName] = nil
	Routes.db.global.routes[data.RouteZone][data.RouteName] = data.RouteData

	local opts = Routes.options.args.routes_group.args
    local zoneKey = tostring(data.RouteZone)

	if not opts[zoneKey] then
        local mapName = C_Map.GetMapInfo(data.RouteZone).name
		opts[zoneKey] = {
			type = "group",
			name = mapName,
			desc = L["Routes in %s"]:format(mapName),
			args = {
				desc = route_zone_args_desc_table,
			},
		}
		Routes.routekeys[data.RouteZone] = {}
	end

	Routes.routekeys[data.RouteZone][data.RouteKey] = data.RouteName
	opts[zoneKey].args[data.RouteKey] = Routes:GetAceOptRouteTable()

	local AutoShow = Routes:GetModule("AutoShow", true)

	if AutoShow and Routes.db.defaults.use_auto_showhide then
		AutoShow:ApplyVisibility()
	end

	Routes:DrawWorldmapLines()
	Routes:DrawMinimapLines(true)
    local AceConfigDialog = LibStub("AceConfigDialog-3.0")

    if not AceConfigDialog.OpenFrames["Routes"] then
        AceConfigDialog:Open("Routes")
    end
end

function RoutesHelper.ImportRoute(route, name)
    CheckIfRoutesIsEnabled()
    
    local data = { RouteZone = route.RouteZone or route.MapId, RouteKey = name:gsub("%s", "\255"), RouteName = name, RouteData = route.RouteData or route.Data }
    
    importRoute(data)
end

function RoutesHelper.GetRouteTree()
    local zones = {}

    for zone, routes in pairs(Routes.db.global.routes) do
        local data = { Id = zone, Name = C_Map.GetMapInfo(zone).name, Routes = {} }
        for k, v in pairs(routes) do
            table.insert(data.Routes, { Name = k, Zone = data, Data = v })
        end
        table.sort(data.Routes, function(a, b) return a.Name < b.Name end)
        if #data.Routes > 0 then
            table.insert(zones, data)
        end
    end
    table.sort(zones, function(a, b) return a.Name == b.Name and a.Id < b.Id or a.Name < b.Name end)

    return zones
end
