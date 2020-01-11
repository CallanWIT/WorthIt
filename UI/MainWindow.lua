local WIT, core = ...
core.UI.MainWindow = {}

local MainWindow = core.UI.MainWindow

local window = nil
local frame = nil
local navMenu = nil

local AceGUI = LibStub("AceGUI-3.0")

local function createWindow()
    -- Create the frame container
    window = AceGUI:Create("Window")
    window:SetWidth(GetScreenWidth()*0.6)
    window:SetHeight(GetScreenHeight() * 0.6)
    window:SetTitle(core.GetString("WorthItTitle"))
    
    window:SetLayout("Flow")

    local header = AceGUI:Create("SimpleGroup")
    header:SetFullWidth(true)
    header:SetHeight(35)

    navMenu = core.UI.NavigationMenu()

    header:AddChild(navMenu)

    window:AddChild(header)

    local scrollcontainer = AceGUI:Create("SimpleGroup") -- "InlineGroup" is also good
    scrollcontainer:SetFullWidth(true)
    scrollcontainer:SetFullHeight(true)
    scrollcontainer:SetLayout("Fill")

    window:AddChild(scrollcontainer)

    frame = AceGUI:Create("ScrollFrame")
    frame:SetLayout("Flow")
    scrollcontainer:AddChild(frame)

    core.UI.SelectModule(core.DashboardModule)

    local oldCloseSpecialWindows = CloseSpecialWindows
    CloseSpecialWindows = function()
		if window:IsShown() then
			window:Hide()
			return true
		end

		return oldCloseSpecialWindows()
	end

    return window
end

function MainWindow.Show()
    window = window or createWindow()
    window:Show()
end

function MainWindow.Hide()
    if window then
        window:Hide()
    end
end

function MainWindow.Toggle()
    if not window or not window:IsShown() then
        window = window or createWindow()
        window:Show()
    else
        window:Hide()
    end
end

function MainWindow.ShowModule(module)
    if not frame then return end

    frame:ReleaseChildren()

    if not core.TSMHelper.IsTSMAPIAvailable() or not core.TSMHelper.IsTSMDBAvailable() then
        core.InstallationGuide.Draw(frame)
        if navMenu then
            navMenu:SetDisabled(true)
        end
    elseif module.Draw then
        module.Draw(frame)
    end
end


