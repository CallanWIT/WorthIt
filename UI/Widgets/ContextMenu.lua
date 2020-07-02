local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.UI.ApplyContextMenuToFrame(frame, item)
    frame.ContextMenu = AceGUI:Create("WITDropDownMenu")
    frame.ContextMenu:SetAnchor(frame, 0, 0)
    frame.ContextMenu:SetMenuList(item.Children)

    frame:SetCallback("OnClick", function(self)
        frame.ContextMenu:Show()
    end)
end

local function CreateMenuItem(item)
    local frame = CreateFrame("Button", nil, UIParent)
    local width = item.IconWidth or 16
    local height = item.IconHeight or item.IconWidth or 16
    frame:SetWidth(width)
    frame:SetHeight(height)

	local image = frame:CreateTexture(nil, "BACKGROUND")
    image:SetTexture(item.Icon)
	image:SetAllPoints(frame)

    frame.ContextMenu = AceGUI:Create("WITDropDownMenu")
    frame.ContextMenu:SetAnchor(frame, 0, height / 2 + 5)
    frame.ContextMenu:SetMenuList(item.Children)

    frame:SetScript("OnClick", function(self)
        frame.ContextMenu:Show()
    end)

    local widget = {
		frame = frame,
		type  = "ContextMenu"
	}

    widget.OnAcquire = function() end

    return AceGUI:RegisterAsWidget(widget)
end

local function CreateMenuItem2(item)
    local icon = AceGUI:Create("Icon")
    icon:SetImage(item.Icon)
    icon:SetImageSize(item.IconWidth or 16, item.IconHeight or item.IconWidth or 16)
    icon:SetWidth(item.IconWidth or 16)
    icon:SetHeight(item.IconHeight or item.IconWidth or 16)
    icon.ContextMenu = AceGUI:Create("WITDropDownMenu")
    icon.ContextMenu:SetAnchor(icon)
    icon.ContextMenu:SetMenuList(item.Children)

    icon:SetCallback("OnClick", function(self)
        icon.ContextMenu:Show()
    end)

    return icon
end

function core.UI.ContextMenu(menuItems, frame)
    if not frame then
        frame = AceGUI:Create("SimpleGroup")
        frame:SetLayout("Flow")
        frame:SetHeight(menuItems[1].IconHeight or menuItems[1].IconWidth or 16)
    end

    for _, item in pairs(menuItems) do
        frame:AddChild(CreateMenuItem(item))
    end

    return frame
end

function core.UI.ContextMenuButton(item)
    return CreateMenuItem(item)
end
