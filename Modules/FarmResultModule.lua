local WIT, core = ...

function core.FarmResultModule(name, data, category)
    local self = core.GridModule(name, data, category)

    local resultColumn = core.GridColumns.ResultsValueColumn()

    self.ConfigKey = "Farm"

    self.Columns = {
        core.GridColumns.ExpandRowColumn(),
        core.GridColumns.ContextMenuColumn({ GetMenu = core.FarmResultItemMenu }),
        core.GridColumns.ItemNameColumn(),
        resultColumn,
        core.GridColumns.ResultsValueColumn({ Name = "ResultDBMinBuyout", PriceSource = "DBMinBuyout", IsHidden = true }),
        core.GridColumns.ResultsValueColumn({ Name = "ResultDBMarket", PriceSource = "DBMarket", IsHidden = true }),
        core.GridColumns.ResultsValueColumn({ Name = "ResultDBHistorical", PriceSource = "DBHistorical", IsHidden = true }),
        core.GridColumns.ResultsValueColumn({ Name = "ResultDBRegionMarketAvg", PriceSource = "DBRegionMarketAvg", IsHidden = true }),
        core.GridColumns.ItemTotalQuantityColumn(),
        core.GridColumns.LocationsColumn(),
        core.GridColumns.ItemSellRateColumn(),
    }

    self.Sort = {
        Column = resultColumn,
        Direction = "DESC",
    }
    
    return self
end

local function addPlannedFarm(row)
    local ids = core.Config.GetPlannedFarmIds()

    if not tContains(ids, row.Data.Id) then
        table.insert(ids, row.Data.Id)
    end

    local module = core.UI.MainWindow.CurrentModule()
    core.FarmPlannerModule.ClearCache()
    module.ClearCache()
    module.Refresh()
end

local function removePlannedFarm(row)
    core.TableHelper.RemoveValue(core.Config.GetPlannedFarmIds(), row.Data.Id)
    
    local module = core.UI.MainWindow.CurrentModule()
    core.FarmPlannerModule.ClearCache()
    module.ClearCache()
    module.Refresh()
end

local function importRoute(row)
    local route = nil

    if row.Data.Routes.MapId or type(row.Data.Routes) == "string" then
        route = row.Data.Routes
    else
        route = row.Data.Routes[1]
    end

    if type(route) == "string" then
        local result, data = AceSerializer:Deserialize(LibBase64.Decode(route))

        if result and data and data.RouteZone and data.RouteKey and data.RouteName and data.RouteData then
            route = data
        else
            route = nil
        end
    end

    if not route then return end

    core.UI.InputDialog({ Text = core.GetString("ImportRouteMessage"), Button1 = core.GetString("Import"), Data = route, HasEditBox = true, TextBoxValue = route.RouteName or core.GetString(route.Name), OnAccept = function(self, data)
        core.RoutesHelper.ImportRoute(data, self.editBox:GetText())
    end })
end

function core.FarmResultItemMenu(module, row)
    local menu = {
        {
            Name = "ToDo",
            DisplayName = core.GetString("ToDo"),
            Action = addPlannedFarm,
            ActionArg = row,
            IsVisible = function(row) return not tContains(core.Config.GetPlannedFarmIds(), row.Data.Id) end
        },
        {
            Name = "RemoveToDo",
            DisplayName = core.GetString("RemoveFromPlannedFarms"),
            Action = removePlannedFarm,
            ActionArg = row,
            IsVisible = function(row) return tContains(core.Config.GetPlannedFarmIds(), row.Data.Id) end
        },
    }

    if core.RoutesHelper.IsRoutesAvailable() and row.Data.Routes then
        table.insert(menu, {
            Name = "Route",
            DisplayName = core.GetString("ImportRoute"),
            Action = importRoute,
            ActionArg = row,
        })
    end

    return menu
end
