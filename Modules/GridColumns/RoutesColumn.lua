local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")
local LibBase64 = LibStub("LibBase64-1.0")
local AceSerializer = LibStub("AceSerializer-3.0")

local GridColumns = core.GridColumns

function GridColumns.RoutesColumn(options)
    options = options or {}
    options.Name = options.Name or 'Routes'
    local self = GridColumns.GridColumn(options)

    self.Description = core.GetString('RoutesDescription')
    self.Sortable = false

    if not StaticPopupDialogs["WIT_Confirm_Import_Route"] then
        StaticPopupDialogs["WIT_Confirm_Import_Route"] = {
            text = core.GetString("ImportRouteMessage"),
            button1 = "Import",
            button2 = "Cancel",
            OnAccept = function (self, data)
                core.RoutesHelper.ImportRoute(data, self.editBox:GetText())
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
    function self.IsVisible(module, rows)
        if not baseIsVisible() or not core.RoutesHelper.IsRoutesAvailable() then return false end

        for _, row in pairs(rows) do
            if row.Data.Routes then
                return true
            end
        end

        return false
    end

    local function showConfirmationDialog(routeName)
        return StaticPopup_Show("WIT_Confirm_Import_Route", routeName)
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
                
                local routeName = route.RouteName or core.GetString(route.Name)
                local dialog = showConfirmationDialog(routeName)
                if dialog then
                    dialog.data = route
                    dialog.editBox:SetText(routeName)
                 end
            end)
        end

        container:AddChild(cell)

        return container
    end
    
    return self
end
