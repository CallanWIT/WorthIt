local WIT, core = ...

local data = { }

core.DashboardModule = core.FarmResultModule('Dashboard', data, 'Dashboard')

function core.DashboardModule.GetData()
    local farms = {}

    if core.Config.GetModulesConfig().Dashboard.ShowCurrentContent then
        for _, farm in pairs(core.Data.Results.Farms) do
            if farm.Content == core.Content.Shadowlands then
                table.insert(farms, farm)
            end
        end
    else
        local dashboardFarms = core.Config.GetModulesConfig().Dashboard.Farms
        local allFarms = core.TableHelper.Concat({}, core.Config.GetUserFarms())

        for _, farm in pairs(core.Data.Results.Farms) do
            table.insert(allFarms, farm)
        end

        for _, farm in pairs(allFarms) do
            if dashboardFarms[farm.Id] then
                table.insert(farms, farm)
            end
        end
    end

    return farms
end

table.insert(core.Modules, core.DashboardModule)
