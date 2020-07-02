local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local function ExportFarmPlanner()
    local farms = core.FarmPlannerModule.GetData()

    core.ExecutiveAssistantHelper.CreateToDoList(core.GetString("FarmPlanner"), farms)
end

local function moveUp(row)
    local ids = core.Config.GetPlannedFarmIds()
    local index = core.TableHelper.IndexOf(ids, row.Data.Id)

    if index and index > 1 then
        table.remove(ids, index)
        table.insert(ids, index - 1, row.Data.Id)

        core.FarmPlannerModule.ClearCache()
        core.FarmPlannerModule.Refresh()
    end
end

local function moveDown(row)
    local ids = core.Config.GetPlannedFarmIds()
    local index = core.TableHelper.IndexOf(ids, row.Data.Id)

    if index and index < #ids then
        table.remove(ids, index)
        table.insert(ids, index + 1, row.Data.Id)

        core.FarmPlannerModule.ClearCache()
        core.FarmPlannerModule.Refresh()
    end
end

local function removePlannedFarm(row)
    core.UI.ConfirmableDialog({ Text = core.GetString("RemovePlannedFarmConfirmationMessage"), OnAccept = function()
        core.TableHelper.RemoveValue(core.Config.GetPlannedFarmIds(), row.Data.Id)
        core.FarmPlannerModule.ClearCache()
        core.FarmPlannerModule.Refresh()
    end })
end

local function farmPlannerItemMenu(module, row)
    return {
        {
            Name = "Up",
            DisplayName = core.GetString("Up"),
            Action = moveUp,
            ActionArg = row,
            IsEnabled = function(row) return core.TableHelper.IndexOf(core.Config.GetPlannedFarmIds(), row.Data.Id) > 1 end
        },
        {
            Name = "Down",
            DisplayName = core.GetString("Down"),
            Action = moveDown,
            ActionArg = row,
            IsEnabled = function(row) return core.TableHelper.IndexOf(core.Config.GetPlannedFarmIds(), row.Data.Id) < #(core.Config.GetPlannedFarmIds()) end
        },
        {
            Name = "Remove",
            DisplayName = core.GetString("Remove"),
            Action = removePlannedFarm,
            ActionArg = row,
        },
    }
end

local function farmPlannerModule(name, category)
    local self = core.GridModule(name, {}, category)

    local resultColumn = core.GridColumns.ResultsValueColumn({ Sortable = false })

    self.Columns = {
        core.GridColumns.ContextMenuColumn({ GetMenu = farmPlannerItemMenu }),
        core.GridColumns.ItemNameColumn({ Sortable = false }),
        resultColumn,
    }

    self.GetData = function ()
        local ids = core.Config.GetPlannedFarmIds()

        local allFarms = {}
        local data = {}

        for _, farm in pairs(core.Data.Results.Farms) do
            allFarms[farm.Id] = farm
        end

        for _, farm in pairs(core.Config.GetUserFarms()) do
            allFarms[farm.Id] = farm
        end

        for _, id in pairs(ids) do
            if allFarms[id] then
                table.insert(data, allFarms[id])
            end
        end

        return data
    end

    local baseDraw = self.Draw
    function self.Draw(container)
        local frame = AceGUI:Create("SimpleGroup")
        frame:SetLayout("List")
        container:AddChild(frame)

        local exportButton = nil

        if core.ExecutiveAssistantHelper.IsExecutiveAssistantAvailable() then
            exportButton = AceGUI:Create("Button")
            exportButton:SetText(core.GetString("ExportToExecutiveAssistant"))
            exportButton:SetFullWidth(true)
            exportButton:SetCallback("OnClick", ExportFarmPlanner)
            exportButton:SetDisabled(not core.ExecutiveAssistantHelper.IsExecutiveAssistantAvailable())
            frame:AddChild(exportButton)
        end

        local gridFrame = AceGUI:Create("SimpleGroup")
        gridFrame:SetFullWidth(true)
        gridFrame:SetHeight(frame.frame:GetHeight() - (exportButton and exportButton.frame:GetHeight() or 0) - 10)
        gridFrame:SetLayout("Fill")

        baseDraw(gridFrame)

        frame:AddChild(gridFrame)
    end

    return self
end

core.FarmPlannerModule = farmPlannerModule('FarmPlanner', 'FarmPlanner')

table.insert(core.Modules, core.FarmPlannerModule)