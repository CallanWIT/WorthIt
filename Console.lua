local WIT, core = ...

local AceConsole = LibStub("AceConsole-3.0")

local function ShowConfig()
    core.UI.MainWindow.Toggle()
    core.UI.SelectModule(core.ConfigurationModule)
end

local function PrintHelp()
    AceConsole:Print(core.GetString("HelpCommands"))
end

local function OpenWITWindow()
    core.UI.MainWindow.Show()
end

local function CloseWITWindow()
    core.UI.MainWindow.Close()
end

local function ConsoleHandler(input)
    input = input or ''
    input = input:trim():lower()

    local options = {}
    options["config"] = ShowConfig
    options["cfg"] = ShowConfig
    options["configuration"] = ShowConfig
    options["options"] = ShowConfig
    options["settings"] = ShowConfig
    options["help"] = PrintHelp
    options["?"] = PrintHelp
    options["show"] = OpenWITWindow
    options["open"] = OpenWITWindow
    options["close"] = CloseWITWindow

    if input == nil or input == '' then
        core.UI.MainWindow.Toggle()
    else
        local handler = options[input]

        if handler ~= nil then
            handler()
        end
    end
end

AceConsole:RegisterChatCommand('wit', ConsoleHandler)
AceConsole:RegisterChatCommand('worthit', ConsoleHandler)
