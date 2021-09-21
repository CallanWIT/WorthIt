local WIT, core = ...

local ExportHelper = {}

local LibBase64 = LibStub("LibBase64-1.0")
local AceSerializer = LibStub("AceSerializer-3.0")

core.ExportHelper = ExportHelper

local function GetProjectName(projectId)
    return (projectId == WOW_PROJECT_MAINLINE and "Retail") or (projectId == WOW_PROJECT_CLASSIC and "Classic") or (projectId == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and "TBCC") or "Unknown"
end

local function GetProjectLongName(projectId)
    return (projectId == WOW_PROJECT_MAINLINE and "Retail WoW") or (projectId == WOW_PROJECT_CLASSIC and "Classic WoW") or (projectId == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and "Burning Crusade Classic") or "Unknown WoW Type"
end

local function GetProjectId(projectName)
    return (projectName =="Retail" and WOW_PROJECT_MAINLINE) or (projectName == "Classic" and WOW_PROJECT_CLASSIC) or (projectName == "TBCC" and WOW_PROJECT_BURNING_CRUSADE_CLASSIC)
end

local function GetFarmName(data)
    if data.PetId then
        return core.TSMHelper.GetItemName('p:'.. data.PetId)
    elseif data.ItemId then
        return core.TSMHelper.GetItemName(data.ItemId)
    elseif data.NameMapId then
        return core.LocationHelper.GetMapName(data.NameMapId)
    else
        return data.Name
    end
end

local function StripSpecialChars(string)
    return string:gsub("[;:+/=-.|]", " ")
end

function ExportHelper.Serialize(data)
    local target = data.Routes and #(data.Routes) > 0 and "WorthIt+Routes" or "WorthIt"
    local projectName = GetProjectName(WOW_PROJECT_ID)
    local location = StripSpecialChars(core.LocationHelper.GetMapName(data.MapId))
    local name = StripSpecialChars(GetFarmName(data))

    return string.format("%s:%s:%s:%s:%s", projectName, target, name, location, LibBase64.Encode(AceSerializer:Serialize(data)))
end

function ExportHelper.Deserialize(exportString)
    local sections = { strsplit(":", exportString) }

    if #sections == 0 then return nil end

    if #sections == 5 and GetProjectId(sections[1]) ~= WOW_PROJECT_ID then
        print(string.format(core.GetString("ImportStringIncorrectGameType"), GetProjectLongName(GetProjectId(sections[1])), GetProjectLongName(WOW_PROJECT_ID)))
        return nil
    end

    return AceSerializer:Deserialize(LibBase64.Decode(sections[#sections]))
end
