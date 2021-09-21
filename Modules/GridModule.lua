local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.GridModule(name, data, category)
    local self = core.Module(name, category)

    self.Data = data
    self.Columns = {}
    self.IsExpandabled = true
    self.DetailsRowHeaderResource = "Loot"

    self.Sort = {
        Column = nil,
        Direction = nil,
    }

    function self.ClearCache()
        if self.Grid then
            self.Grid.ClearCache()
        end
    end

    function self.GetData()
        return self.Data
    end

    local function OnReload()
        if self.CurrentFrame then
            self.CurrentFrame:DoLayout()
        end
    end

    function self.Search(term)
        if self.Grid then
            self.Grid.Search(term)
        end
    end

    function self.Draw(container)
        self.CurrentFrame = AceGUI:Create("WITScrollFrame")
        self.CurrentFrame:SetLayout("WITList")

        local options = {
            MinWidth = core.UI.MainWindow.GetWindowWidth(),
            Columns = self.Columns,
            Sort = self.Sort,
            SearchTerm = core.UI.GetSearchTerm(),
            IsExpandabled = self.IsExpandabled,
            DetailsRowHeaderResource = self.DetailsRowHeaderResource
        }
        self.Grid = core.UI.Grid(options)
        self.Grid.GetData = self.GetData or self.Grid.GetData
        self.Grid.GetDetailsRowData = self.GetDetailsRowData or self.Grid.GetDetailsRowData

        self.Grid:SetCallback("OnReload", OnReload)

        container:AddChild(self.CurrentFrame)
        self.CurrentFrame:AddChild(self.Grid)

        self.Grid.Show(self.GetData())

        core.UI.ToggleQuickSearch(true, function(_, _, term) self.Search(term) end)
    end

    function self.Refresh()
        if self.Grid then
            self.Grid.Reload()
        end
    end

    local function FilterColumns(filter)
        if filter == nil or self.Columns == nil then return end
        local index = 1

        for _, column in pairs(self.Columns) do
            if column.IsFixedSize or column.Name == '' then
                index = index + 1
            end
        end

        for _, item in pairs(filter) do
            for _, column in pairs(self.Columns) do
                if not column.IsFixedSize and column.Name == item.Name then
                    column.IsHidden = item.IsHidden
                    core.TableHelper.RemoveValue(self.Columns, column)
                    table.insert(self.Columns, index, column)

                    index = index + 1
                end
            end
        end
    end

    local function GetCurrentColumnFilter()
        if self.Columns == nil then return {} end
        local filter = {}

        for _, column in pairs(self.Columns) do
            if not column.IsFixedSize and column.Name ~= '' then
                table.insert(filter, { Name = column.Name, IsHidden = column.IsHidden })
            end
        end

        return filter
    end

    function self.LoadColumnFilter()
        if self.ConfigKey == nil then return end
        local filter = core.Config.GetColumnFilter(self.ConfigKey)

        if filter ~= nil then
            FilterColumns(filter)
        end
    end

    function self.SaveColumnFilter()
        if self.ConfigKey == nil then return end
        local filter = GetCurrentColumnFilter()

        if filter ~= nil then
            core.Config.SetColumnFilter(self.ConfigKey, filter)
        end
    end
    
    return self
end
