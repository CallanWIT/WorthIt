local WIT, core = ...
core.UI = {}

local UI = core.UI

function UI.Initialize()
    if UI.MinimapIcon ~= nil then
        UI.MinimapIcon.Initialize();
    end
end

UI.MainWindow = CreateFrame("Frame")
UI.MainWindow:RegisterEvent("ADDON_LOADED")
UI.MainWindow:SetScript("OnEvent", core.Init)