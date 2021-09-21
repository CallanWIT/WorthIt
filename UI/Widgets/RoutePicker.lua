local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local function setValue(widget, route, triggerEvent)
    local name = route and (route.Name .. " (" .. route.Zone.Name .. ")") or core.GetString("NoRoute")
    widget:SetText(string.format(core.GetString("RouteFormat"), name))
    widget:SetWidth(widget.label:GetStringWidth() + 7)

    if route and route.Data then
        core.RoutesHelper.NormaliseRouteData(route.Data)
    end

    if triggerEvent then
        widget:Fire("OnValueChanged", route)
    end
end

local function routePickerMenu(widget)
    local item = {
        Children =
        {
            {
                Name = "None",
                DisplayName = core.GetString("None"),
                Action = function() setValue(widget, nil, true) end
            },
        }
    }

    if core.RoutesHelper.IsRoutesAvailable() then
        for _, zone in pairs(core.RoutesHelper.GetRouteTree()) do
            local children = {}
            for _, route in pairs(zone.Routes) do
                table.insert(children, {
                    Name = route.Name,
                    DisplayName = route.Name,
                    Action = function(arg) setValue(widget, arg, true) end,
                    ActionArg = route
                })
            end
            table.insert(item.Children, {
                Name = zone.Name,
                DisplayName = zone.Name,
                Children = children
            })
        end
    end

    return item
end

function core.UI.RoutePicker(options)
    options = options or {}
    local link = AceGUI:Create("InteractiveLabel")

    setValue(link, nil)

    core.UI.ApplyContextMenuToFrame(link, routePickerMenu(link))

    link.SetValue = setValue

    return link
end
