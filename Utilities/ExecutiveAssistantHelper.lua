local WIT, core = ...

local ExecutiveAssistantHelper = {}

core.ExecutiveAssistantHelper = ExecutiveAssistantHelper

function ExecutiveAssistantHelper.IsExecutiveAssistantAvailable()
    return ExecAssist and ExecAssist.AddTask
end

function ExecutiveAssistantHelper.GetOrCreateGroup(name)
    local agg = ExecAssist.db.global.groupStem.agg

    for _, item in pairs(agg) do
        if item.isGroup and item.isWorthItGroup then
            return item
        end
    end

    local group = agg[ExecAssist:AddGroup(name, nil, true)]
    group.listName = name
    group.isWorthItGroup = true

    return group
end

local function getFarmName(farm)
    local name = ''
    if farm.ItemId then
        name = core.TSMHelper.GetItemName(farm.ItemId)
    elseif farm.NameMapId then
        name = core.LocationHelper.GetMapName(farm.NameMapId)
    else
        name = farm.Name
    end

    if farm.NameSuffix then
        name = name .. " " .. core.GetString(farm.NameSuffix)
    end

    return name
end

function ExecutiveAssistantHelper.GetOrCreateTask(group, farm)
    local agg = ExecAssist.db.global.groupStem.agg

    for _, item in pairs(agg) do
        if item.isTask and item.p == group.id and item.WorthItId == farm.Id then
            return item
        end
    end

    local task = ExecAssist:AddTask(group, nil, true)
    task.taskName = core.FarmHelper.GetName(farm)
    task.WorthItId = farm.Id
    return task
end

function ExecutiveAssistantHelper.RefreshTaskWindow()
    ExecAssist:loadGroups_toOptionsTable()
    ExecAssist:UpdateWindow()
end

function ExecutiveAssistantHelper.CreateToDoList(groupName, farmList)
    local taskIds = {}
    local group = ExecutiveAssistantHelper.GetOrCreateGroup(groupName)

    for _, farm in pairs(farmList) do
        table.insert(taskIds, ExecutiveAssistantHelper.GetOrCreateTask(group, farm).id)
    end

    for _, id in pairs(group.DO) do
        if not tContains(taskIds, id) then
            ExecAssist:GarbageCollection({id})
        end
    end

    group.DO = taskIds

    ExecutiveAssistantHelper.RefreshTaskWindow()
end