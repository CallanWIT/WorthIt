local WIT, core = ...

function core:Init(event, name)
    if (name ~= "WIT") then return end

    if core.Config then
        core.Config.Initialize()
    end

    if core.TSMHelper then
        core.TSMHelper.Initialize()
    end

    if core.UI then
        core.UI.Initialize()
    end
end

function core.ClearCache()
    for _, module in pairs(core.Modules) do
        if module.ClearCache then
            module.ClearCache()
        end
    end
end
