local WIT, core = ...

local data = { }

for _, farm in pairs(core.Data.Results.Farms) do
    if farm.Content == core.Content.Vanilla then
        table.insert(data, farm)
    end
end

core.DashboardModule = core.FarmResultModule('Dashboard', data, 'Dashboard')
table.insert(core.Modules, core.DashboardModule)
