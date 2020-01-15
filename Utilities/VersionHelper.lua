local WIT, core = ...

local VersionHelper = {}
local worthItVersion = nil

core.VersionHelper = VersionHelper

function VersionHelper.GetVersion()
    if not worthItVersion then
        worthItVersion = GetAddOnMetadata("WIT", "Version")
    end

    return worthItVersion
end

function VersionHelper.IsNewerVersion(version1, version2)
    local v1 = {}
    local v2 = {}

    for _, x in pairs({ strsplit(".", strtrim(version1, "vV")) }) do
        table.insert(v1, tonumber(x))
    end

    for _, x in pairs({ strsplit(".", strtrim(version2, "vV")) }) do
        table.insert(v2, tonumber(x))
    end

    for key in pairs(v1) do
        if v2[key] == nil or v1[key] < v2[key] then
            return false
        elseif v1[key] > v2[key] then
            return true
        end
    end

    return false
end
