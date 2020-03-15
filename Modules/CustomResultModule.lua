local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local function ShowRecorder()
    core.Recorder().Show()
    core.UI.MainWindow.Hide()
end

function core.CustomResultModule(name, category)
    local self = core.GridModule(name, {}, category)

    local resultColumn = core.GridColumns.ResultsValueColumn()

    self.Columns = {
        core.GridColumns.ItemNameColumn(),
        resultColumn,
        core.GridColumns.LocationsColumn(),
        core.GridColumns.ItemSellRateColumn(),
        core.GridColumns.CustomActionsColumn(),
    }

    self.Sort = {
        Column = resultColumn,
        Direction = "DESC",
    }

    self.GetData = function ()
        return core.Config.GetUserFarms()
    end

    local baseDraw = self.Draw
    function self.Draw(container)
        local frame = AceGUI:Create("SimpleGroup")
        frame:SetLayout("List")
        container:AddChild(frame)

        local recorderButton = AceGUI:Create("Button")
        recorderButton:SetText(core.GetString("Recorder")) --
        recorderButton:SetFullWidth(true)
        recorderButton:SetCallback("OnClick", ShowRecorder)
        frame:AddChild(recorderButton)

        local gridFrame = AceGUI:Create("SimpleGroup")
        gridFrame:SetFullWidth(true)
        gridFrame:SetHeight(frame.frame:GetHeight() - recorderButton.frame:GetHeight() - 10)
        gridFrame:SetLayout("Fill")

        baseDraw(gridFrame)

        frame:AddChild(gridFrame)
    end

    return self
end

core.UserDataModule = core.CustomResultModule('MyFarms', 'UserData')

table.insert(core.Modules, core.UserDataModule)