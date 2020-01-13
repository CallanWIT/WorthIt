local WIT, core = ...

local L = LibStub("AceLocale-3.0"):GetLocale("WorthIt", true)

function core.GetString(key)
    return L[key] or key
end
