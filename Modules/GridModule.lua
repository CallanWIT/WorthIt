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
    
    return self
end
