local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.CustomActionsColumn()
    local self = GridColumns.GridColumn('Actions')

    self.Sortable = false

    function self.Value(data)
        return true
    end

    function self.GetRowText(row)
        return ''
    end

    function self.GetColumnMinWidth(rows)
        local label = AceGUI:Create("Label")
        label:SetText(self.DisplayName or self.Name)

        local maxWidth = label.label:GetStringWidth() + 5

        label:SetText(core.GetString("Edit") .. "x")
        local width = label.label:GetStringWidth() + 20

        if width > maxWidth then
            maxWidth = width
        end

        label:Release()

        return maxWidth
    end

    function self.GetCell(row)
        local container = AceGUI:Create("SimpleGroup")
        container:SetLayout("Flow")

        local editButton = AceGUI:Create("Button")
        editButton:SetAutoWidth(true)
        editButton:SetText(core.GetString("Edit"))
        editButton:SetCallback("OnClick", function()
            local recorder = core.Recorder()

            if not recorder.Session.IsRunning then
                recorder.LoadSession(row.Data)
                recorder.Show()
                core.UI.MainWindow.Hide()
            else
                print(core.GetString("RecordingInProgress"))
            end
        end)
        container:AddChild(editButton)

        local removeButton = AceGUI:Create("Button")
        removeButton:SetAutoWidth(true)
        removeButton:SetText("X")
        removeButton:SetCallback("OnClick", function()
            if not IsShiftKeyDown() then return end

            local farms = core.Config.GetUserFarms()

            for i, farm in pairs(farms) do
                if farm.Id == row.Data.Id then
                    tremove(farms, i)
                end
            end

            core.UserDataModule.ClearCache()
            core.UI.MainWindow.ShowModule(core.UserDataModule)
        end)
        removeButton:SetCallback("OnEnter", function()
            GameTooltip:SetOwner(removeButton.frame, "ANCHOR_PRESERVE")
	        GameTooltip:ClearAllPoints()
	        GameTooltip:SetPoint("LEFT", removeButton.frame, "RIGHT")
            GameTooltip:ClearLines()
            GameTooltip:AddLine(core.GetString("ShiftToRemove"))
            GameTooltip:Show()
        end)
        removeButton:SetCallback("OnLeave", function()
            GameTooltip:Hide()
        end)
        container:AddChild(removeButton)

        return container
    end
    
    return self
end
