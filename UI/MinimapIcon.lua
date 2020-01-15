local WIT, core = ...
core.UI.MinimapIcon = {}

local MinimapIcon = core.UI.MinimapIcon

function MinimapIcon.Initialize()
    local LDB = LibStub("LibDataBroker-1.1", true)
    local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)

    if LDB then
        local WITLauncher = LDB:NewDataObject("WIT", {
            type = "launcher",
            icon = "Interface\\AddOns\\WIT\\Images\\logo.jpeg", -- Icon img
            OnClick = MinimapIcon.OnIconClick,
            OnTooltipShow = MinimapIcon.OnTooltipShow,
        })

        if LDBIcon then
            LDBIcon:Register("WIT", WITLauncher, WITDB.Settings.MinimapIcon)
        end
    end
end

function MinimapIcon.OnIconClick()
    core.UI.MainWindow.Toggle()
end

function MinimapIcon.OnTooltipShow(tooltip)
    tooltip:AddLine("|cffffff00WorthIT" ,"Click|r to toggle the WorthIt UI")
end

function MinimapIcon.Dialog()
	local UIConfig = CreateFrame("Frame", "WorthITConfig", UIParent, "UIPanelDialogTemplate")
	UIConfig:SetSize(900, 550)
	UIConfig:SetPoint("CENTER")

    UIConfig:Show()
end
