local WIT, core = ...
core.UI.MainWindow = {}

local MainWindow = core.UI.MainWindow

local window = nil
local frame = nil
local navMenu = nil
local currentModule = nil
local isRefreshNeeded = false
local refreshTime = nil

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

local function OnUpdate()
    if isRefreshNeeded and time() > refreshTime and MainWindow.CurrentModule() ~= nil then
        isRefreshNeeded = false
        local module = MainWindow.CurrentModule()

        if module.ClearCache ~= nil then
            --module.ClearCache()
        end

        if module.Refresh ~= nil then
            module.Refresh()
        end

        --MainWindow.ShowModule(MainWindow.CurrentModule())
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

    window.frame:SetScript("OnUpdate", OnUpdate)

    frame = AceGUI:Create("SimpleGroup")
    frame:SetFullWidth(true)
    frame:SetFullHeight(true)
    frame:SetLayout("Fill")

    window:AddChild(frame)

    core.UI.SelectModule(core.DashboardModule)

    setCloseOnEscPress()

    return window
end

function MainWindow.QueueRefresh()
    refreshTime = time() + 1
    isRefreshNeeded = true
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
    if not frame or not module then return end

    frame:ReleaseChildren()

    if not core.PriceSourceHelper.IsAPIAvailable() or not core.PriceSourceHelper.IsDBAvailable() then
        core.InstallationGuide.Draw(frame)
        core.UI.DisableHeader()
        core.UI.ToggleColumnSelector(nil)
    elseif module.Draw then
        if module.LoadColumnFilter then
            module.LoadColumnFilter()
        end

        module.Draw(frame)
        currentModule = module
        core.UI.ToggleColumnSelector(module)
    end
end
