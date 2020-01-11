local WIT, core = ...
core.UI.MinimapIcon = {}

local MinimapIcon = core.UI.MinimapIcon

function MinimapIcon.Initialize()
    local LDB = LibStub("LibDataBroker-1.1", true)
    local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)

    if LDB then
        local WITLauncher = LDB:NewDataObject("WIT", {
            type = "launcher",
            icon = "Interface\\Icons\\Achievement_dungeon_classicdungeonmaster", -- Icon img
            OnClick = MinimapIcon.OnIconClick,
            OnTooltipShow = MinimapIcon.OnTooltipShow,
        })

        if LDBIcon then
            LDBIcon:Register("WIT", WITLauncher, WITDB.Settings.MinimapIcon)
        end
    end
end

function MinimapIcon.OnIconClick()
    --print(GetAddOnMetadata("WIT", "Version"))
    --print(GetAddOnMetadata("TradeSkillMaster", "Version"))
    --print(core.TSMHelper.GetItemPrice(2770))

    core.UI.MainWindow.Toggle()
end

function MinimapIcon.OnTooltipShow(tooltip)
    tooltip:AddLine("|cffffff00WorthIT" ,"Click|r to toggle the WorthIt UI")
end

function MinimapIcon.Dialog()
	local UIConfig = CreateFrame("Frame", "WorthITConfig", UIParent, "UIPanelDialogTemplate");
	UIConfig:SetSize(900, 550);
	UIConfig:SetPoint("CENTER"); -- Doesn't need to be ("CENTER", UIParent, "CENTER")

    UIConfig:Show()
end

function MinimapIcon.DropdownMenuTest()
    local favoriteNumber = 42 -- A user-configurable setting

    -- Create the dropdown, and configure its appearance
    local dropDown = CreateFrame("FRAME", "WPDemoDropDown", UIParent, "UIDropDownMenuTemplate")
    dropDown:SetPoint("CENTER")
    UIDropDownMenu_SetWidth(dropDown, 200)
    UIDropDownMenu_SetText(dropDown, "Favorite number: " .. favoriteNumber)

    -- Create and bind the initialization function to the dropdown menu
    UIDropDownMenu_Initialize(dropDown, function(self, level, menuList)
     local info = UIDropDownMenu_CreateInfo()
     if (level or 1) == 1 then
      -- Display the 0-9, 10-19, ... groups
      for i=0,4 do
       info.text, info.checked = i*10 .. " - " .. (i*10+9), favoriteNumber >= i*10 and favoriteNumber <= (i*10+9)
       info.menuList, info.hasArrow = i, true
       UIDropDownMenu_AddButton(info)
      end

     else
      -- Display a nested group of 10 favorite number options
      info.func = self.SetValue
      for i=menuList*10, menuList*10+9 do
       info.text, info.arg1, info.checked = i, i, i == favoriteNumber
       UIDropDownMenu_AddButton(info, level)
      end
     end
    end)

    -- Implement the function to change the favoriteNumber
    function dropDown:SetValue(newValue)
     favoriteNumber = newValue
     -- Update the text; if we merely wanted it to display newValue, we would not need to do this
     UIDropDownMenu_SetText(dropDown, "Favorite number: " .. favoriteNumber)
     -- Because this is called from a sub-menu, only that menu level is closed by default.
     -- Close the entire menu with this next call
     CloseDropDownMenus()
    end
end