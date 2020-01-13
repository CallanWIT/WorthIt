local WIT, core = ...

local TomTomHelper = {}

core.TomTomHelper = TomTomHelper

local function CheckIfTomTomIsEnabled()
    if not TomTomHelper.IsTomTomAvailable() then
        error("TomTom addon not found")
    end
end

function TomTomHelper.IsTomTomAvailable()
    return TomTom and TomTom.AddWaypoint
end

--{ MapId = core.Maps.ValeOfEternalBlossoms, X = 61.69, Y = 21.68, Name = "Vendor", Faction = core.Factions.Horde }
--{ MapId = core.Maps.ValeOfEternalBlossoms, 390, X = 84.60, Y = 60.38, Name = "Vendor", Faction = core.Factions.Alliance }
function TomTomHelper.AddWaypoint(waypoint)
    CheckIfTomTomIsEnabled()

    if waypoint.Faction and waypoint.Faction ~= UnitFactionGroup("player") then return end
    
    local options = {
        title = core.GetString(waypoint.Name),
        world = true,
        from = core.GetString("WorthIt"),
    }

    TomTom:AddWaypoint(waypoint.MapId, waypoint.X/100, waypoint.Y/100, options)
end

function TomTomHelper.AddWaypoints(waypoints)
    CheckIfTomTomIsEnabled()

    for _, waypoint in pairs(waypoints) do
        TomTomHelper.AddWaypoint(waypoint)
    end
end