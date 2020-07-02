local WIT, core = ...
core.UI.MainWindow = {}

local MainWindow = core.UI.MainWindow

local window = nil
local frame = nil
local navMenu = nil
local currentModule = nil

local AceGUI = LibStub("AceGUI-3.0")

local function setCloseOnEscPress()
    local oldCloseSpecialWindows = CloseSpecialWindows
    CloseSpecialWindows = function()
		if window:IsShown() then
			window:Hide()
			return true
		end

		return oldCloseSpecialWindows()
	end
end

local function createWindow()
    window = AceGUI:Create("Window")
    window.frame:SetScale(core.Config.GetScaling())
    window:SetWidth(MainWindow.GetWindowWidth())
    window:SetHeight(MainWindow.GetWindowHeight())
    window:SetTitle(core.GetString("WorthItTitle"))
    window:SetLayout("Flow")
    window:EnableResize(false)
    window:AddChild(core.UI.Header(window))

    frame = AceGUI:Create("SimpleGroup")
    frame:SetFullWidth(true)
    frame:SetFullHeight(true)
    frame:SetLayout("Fill")

    window:AddChild(frame)

    core.UI.SelectModule(core.DashboardModule)

    setCloseOnEscPress()

    return window
end

function MainWindow.GetWindowWidth()
    return GetScreenWidth()*0.6 / core.Config.GetScaling()
end

function MainWindow.GetWindowHeight()
    return GetScreenHeight()*0.6 / core.Config.GetScaling()
end

function MainWindow.Init()
    if not window then
        window = createWindow()
        window:Hide()
    end
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

function MainWindow.IsShown()
    return window and window:IsShown()
end

function MainWindow.CurrentModule()
    return currentModule
end

function MainWindow.ShowModule(module)
    if not frame then return end

    frame:ReleaseChildren()

    if not core.TSMHelper.IsTSMAPIAvailable() or not core.TSMHelper.IsTSMDBAvailable() then
        core.InstallationGuide.Draw(frame)
        core.UI.DisableHeader()
    elseif module.Draw then
        module.Draw(frame)
        currentModule = module
    end
end
