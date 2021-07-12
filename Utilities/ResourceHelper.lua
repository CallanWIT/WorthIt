local WIT, core = ...

local L = LibStub("AceLocale-3.0"):GetLocale("WorthIt", false)

function core.GetString(key)
    return (not key or key == "") and "" or L[key] or key
end
