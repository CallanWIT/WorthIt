local WIT, core = ...

core.LastScan = { Bag = {}, Bank = {}}

local AceConsole = LibStub("AceConsole-3.0")

local function ShowConfig()
    core.UI.MainWindow.Toggle()
    core.UI.SelectModule(core.ConfigurationModule)
end

local function PrintHelp()
    AceConsole:Print(core.GetString("HelpCommands"))
end

function core.PrintInventoryValue(priceSource)
    local continue = priceSource == "diff" or priceSource == "difference"

    if continue then
        priceSource = core.LastScan.Bag.PriceSource
    end

    if priceSource and not core.TSMHelper.IsValidCustomPrice(priceSource) then
        AceConsole:Print(core.GetString("InvalidPriceSource"))
        return
    end

    local value = core.TSMHelper.GetInventoryValue(priceSource)
    if core.LastScan.Bag.Value and continue then
        local diff = value - core.LastScan.Bag.Value
        if diff ~= nil then
            AceConsole:Print(core.GetString("InventoryValueChangeFormat"):format(priceSource or core.GetString("DefaultPriceSource"), core.TSMHelper.ToColoredMoneyString(diff)))
            core.LastScan.Bag.Value = value
        end
    else
        if value ~= nil then
            AceConsole:Print(core.GetString("InventoryValueFormat"):format(priceSource or core.GetString("DefaultPriceSource"), core.TSMHelper.ToMoneyString(value)))
            core.LastScan.Bag.PriceSource = priceSource
            core.LastScan.Bag.Value = value
        end
    end
end

function core.PrintBankValue(priceSource)
    local continue = priceSource == "diff" or priceSource == "difference"

    if continue then
        priceSource = core.LastScan.Bank.PriceSource
    end

    if priceSource and not core.TSMHelper.IsValidCustomPrice(priceSource) then
        AceConsole:Print(core.GetString("InvalidPriceSource"))
        return
    end

    local value = core.TSMHelper.GetBankValue(priceSource)
    if value == 0 then
        AceConsole:Print(core.GetString("OpenBank"))
    elseif core.LastScan.Bank.Value and continue then
        local diff = value - core.LastScan.Bank.Value
        if diff ~= nil then
            AceConsole:Print(core.GetString("BankValueChangeFormat"):format(priceSource or core.GetString("DefaultPriceSource"), core.TSMHelper.ToColoredMoneyString(diff)))
            core.LastScan.Bank.Value = value
        end
    else
        if value ~= nil then
            AceConsole:Print(core.GetString("BankValueFormat"):format(priceSource or core.GetString("DefaultPriceSource"), core.TSMHelper.ToMoneyString(value)))
            core.LastScan.Bank.PriceSource = priceSource
            core.LastScan.Bank.Value = value
        end
    end
end

local function OpenWITWindow()
    core.UI.MainWindow.Show()
end

local function OpenWITRecorderWindow()
    core.UI.MainWindow.Init()
    core.Recorder().Show()
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
    options["recorder"] = OpenWITRecorderWindow
    options["rec"] = OpenWITRecorderWindow
    options["bagvalue"] = core.PrintInventoryValue
    options["bankvalue"] = core.PrintBankValue

    if input == nil or input == '' then
        core.UI.MainWindow.Toggle()
    else
        local command, arg = AceConsole:GetArgs(input, 2)
        local handler = options[command]

        if handler ~= nil then
            handler(arg)
        end
    end
end
--/wit bagvalue diff
AceConsole:RegisterChatCommand('wit', ConsoleHandler)
AceConsole:RegisterChatCommand('worthit', ConsoleHandler)
