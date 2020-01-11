local WIT, core = ...

local L = LibStub("AceLocale-3.0"):GetLocale("WorthIt")

function core.GetString(key)
    --for key, value in pairs(L) do
    --    print(key)
    --    print(value)
    --end

    return L[key]
end
