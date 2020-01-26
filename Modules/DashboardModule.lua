local WIT, core = ...

local data = { }

core.DashboardModule = core.FarmResultModule('Dashboard', data, 'Dashboard')

function core.DashboardModule.GetData()
    local farms = {}

    if core.Config.GetModulesConfig().Dashboard.ShowCurrentContent then
        for _, farm in pairs(core.Data.Results.Farms) do
            if farm.Content == core.Content.BFA then
                table.insert(farms, farm)
            end
        end
    else
        local dashboardFarms = core.Config.GetModulesConfig().Dashboard.Farms
        for _, farm in pairs(core.Data.Results.Farms) do
            if dashboardFarms[farm.Id] then
                table.insert(farms, farm)
            end
        end
    end

    return farms
end

table.insert(core.Modules, core.DashboardModule)
