local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.RoutesColumn()
    local self = GridColumns.GridColumn('Routes')

    self.Description = core.GetString('RoutesDescription')
    self.Sortable = false

    if not StaticPopupDialogs["WIT_Confirm_Import_Route"] then
        StaticPopupDialogs["WIT_Confirm_Import_Route"] = {
            text = core.GetString("ImportRouteMessage"),
            button1 = "Import",
            button2 = "Cancel",
            OnAccept = function (self, data)
                core.RoutesHelper.ImportRoute(data, self.editBox:GetText())
                ReloadUI()
            end,
            hasEditBox = true,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            exclusive = true,
            enterClicksFirstButton = true,
            preferredIndex = STATICPOPUP_NUMDIALOGS
        }
    end

    function self.Value(data)
        return data.Routes and core.RoutesHelper.IsRoutesAvailable()
    end

    function self.GetRowText(row)
        return self.Value(row.Data) and ("|cFF00A2E8" .. core.GetString("ImportRoute")) or ''
    end

    local baseIsVisible = self.IsVisible
    function self.IsVisible(rows)
        if not baseIsVisible or not core.RoutesHelper.IsRoutesAvailable() then return false end

        for _, row in pairs(rows) do
            if row.Data.Routes then
                return true
            end
        end

        return false
    end

    local function showConfirmationDialog(route)
        return StaticPopup_Show("WIT_Confirm_Import_Route", core.GetString(route.Name))
    end

    function self.GetCell(row)
        local container = AceGUI:Create("SimpleGroup")
        local cell = AceGUI:Create("InteractiveLabel")
        local value = self.Value(row.Data)
        cell:SetText(value and self.GetRowText(row) or '')
        cell:SetWidth(cell.label:GetStringWidth() + 5)
        cell:SetUserData("routes", row.Data.Routes)

        if value then
            cell:SetCallback("OnClick", function(item)
                local route = row.Data.Routes.MapId and row.Data.Routes or row.Data.Routes[1]
                local dialog = showConfirmationDialog(route)
                if dialog then
                    dialog.data = route
                    dialog.editBox:SetText(core.GetString(route.Name))
                 end
            end)
        end

        container:AddChild(cell)

        return container
    end
    
    return self
end
