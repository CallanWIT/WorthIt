local Type, Version = "WITDropDownMenu", 24
local AceGUI = LibStub and LibStub("AceGUI-3.0", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end

-- Lua APIs
local pairs, assert, type = pairs, assert, type
local min, max, floor, abs = math.min, math.max, math.floor, math.abs

-- WoW APIs
local CreateFrame, UIParent = CreateFrame, UIParent

--[[-----------------------------------------------------------------------------
Scripts
-------------------------------------------------------------------------------]]
local function DropDownMenu_OnLoad(dropDown, level, menuList)
    if menuList then
        for key, item in pairs(menuList) do
            if not item.IsVisible or item.IsVisible(item.ActionArg) then
                local hasChildren = item.Children ~= nil and #(item.Children) > 0
                local info = UIDropDownMenu_CreateInfo()
                info.hasArrow = hasChildren
                info.notCheckable = true
                info.disabled = item.IsEnabled and (not item.IsEnabled(item.ActionArg))
                info.text = item.DisplayName or item.Name
                info.menuList = item.Children
                info.func = function (self, arg1) 
                    if item.Action then
                        item.Action(arg1)
                    end

                    --UIDROPDOWNMENU_OPEN_MENU

                    for key, _ in pairs(dropDown.obj.frame) do
                        --print(key)
                    end

                    if level and level > 1 then
                        dropDown.obj:Show()
                    end
                end
                info.arg1 = item.ActionArg

                UIDropDownMenu_AddButton(info, level)
            end
        end
    end
end

local function Init(frame)
	UIDropDownMenu_Initialize(frame, DropDownMenu_OnLoad)
end

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]
local methods = {
	["OnAcquire"] = function(self)
		self.frame:Hide()
        self.anchor = nil
	end,

	["Show"] = function(self)
        if not self.Initialized then
            UIDropDownMenu_Initialize(self.frame, DropDownMenu_OnLoad)
        end

		ToggleDropDownMenu(1, nil, self.frame, self.anchor.frame or self.anchor, self.offsetX, self.offsetY, self.menuList)
        
        self.Initialized = true
	end,

	["SetAnchor"] = function(self, anchorFrame, offsetX, offsetY)
        self.anchor = anchorFrame
        self.offsetX = offsetX or self.offsetX or 0
        self.offsetY = offsetY or self.offsetY or 0
	end,

	["SetMenuList"] = function(self, menuList)
        self.menuList = menuList
	end
}

--[[-----------------------------------------------------------------------------
Constructor
-------------------------------------------------------------------------------]]
local function Constructor()
	local frame = CreateFrame("Frame", nil, UIParent, "UIDropDownMenuTemplate")
	--local num = AceGUI:GetNextWidgetNum(Type)

	local widget = {
		frame       = frame,
		type        = Type
	}

	for method, func in pairs(methods) do
		widget[method] = func
	end

    frame.obj = widget

	return AceGUI:RegisterAsWidget(widget)
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
