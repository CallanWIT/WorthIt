local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")
local LibBase64 = LibStub("LibBase64-1.0")
local AceSerializer = LibStub("AceSerializer-3.0")
local navigationMenu = nil
local createMenuItem = nil

core.LastScan = { Bag = {}, Bank = {}}

local function OnItemSelected(menuItem)
    local module = menuItem:GetUserData("module")

    navigationMenu.pullout:Close()

    if module then core.UI.SelectModule(module) end
end

local function CreateModuleItem(module)
    local item = AceGUI:Create("Dropdown-Item-Execute")

    item:SetText(module.DisplayName or module.Name)
    item:SetUserData("module", module)
    item:SetCallback("OnClick", OnItemSelected)
    item:SetDisabled(module.IsDisabled or false)

    return item
end

local function CreateActionItem(action)
    local item = AceGUI:Create("Dropdown-Item-Execute")

    item:SetText(action.DisplayName or action.Name)
    item:SetUserData("options", action.Options)
    item:SetCallback("OnClick", action.Action)
    item:SetDisabled(action.IsDisabled or false)

    return item
end

local function CreateGroupItem(group)
    local menuItem = AceGUI:Create("Dropdown-Item-Menu")

    menuItem:SetText(group.DisplayName or group.Name)
    menuItem:SetUserData("group", group)

    local submenu = AceGUI:Create("Dropdown-Pullout")
    submenu.frame:SetScale(core.Config.GetScaling())
    local hasChildren = false

    if group.Category then
        for _, module in pairs(core.Modules) do
            if module.Category == group.Category then
                hasChildren = true
                submenu:AddItem(CreateModuleItem(module))
            end
        end
    else
        for _, child in pairs(group.Children) do
            hasChildren = true
            submenu:AddItem(createMenuItem(child))
        end
    end

    menuItem:SetDisabled(group.IsDisabled or not hasChildren)
    menuItem:SetMenu(submenu)

    return menuItem;
end

local function CreateSeparator()
    return AceGUI:Create("Dropdown-Item-Separator")
end

createMenuItem = function(item)
    if item.IsGroup then
        return CreateGroupItem(item)
    elseif item.IsSeparator then
        return CreateSeparator()
    elseif item.Action then
        return CreateActionItem(item)
    else
        return CreateModuleItem(item)
    end
end

local function ShowBagValue(priceSource)
    local value = core.PriceSourceHelper.GetInventoryValue(priceSource)
    if value ~= nil then
        print(core.GetString("InventoryValueFormat"):format(priceSource or core.GetString("DefaultPriceSource"), core.PriceSourceHelper.ToMoneyString(value)))
        core.LastScan.Bag.PriceSource = priceSource
        core.LastScan.Bag.Value = value
    end
end

local function ShowBankValue(priceSource)
    local value = core.PriceSourceHelper.GetBankValue(priceSource)
    if value == 0 then
        print(core.GetString("OpenBank"))
    elseif value ~= nil then
        print(core.GetString("BankValueFormat"):format(priceSource or core.GetString("DefaultPriceSource"), core.PriceSourceHelper.ToMoneyString(value)))

        core.LastScan.Bank.PriceSource = priceSource
        core.LastScan.Bank.Value = value
    end
end

local function ContinueBagScan()
    if not core.LastScan.Bag.Value then
        return ShowBagValue()
    end

    local value = core.PriceSourceHelper.GetInventoryValue()
    local diff = value - core.LastScan.Bag.Value
    if diff ~= nil then
        print(core.GetString("InventoryValueChangeFormat"):format(core.LastScan.Bag.PriceSource or core.GetString("DefaultPriceSource"), core.PriceSourceHelper.ToColoredMoneyString(diff)))
        core.LastScan.Bag.Value = value
    end
end

local function ContinueBankScan()
    if not core.LastScan.Bank.Value then
        return ShowBankValue()
    end

    local value = core.PriceSourceHelper.GetInventoryValue()
    local diff = value - core.LastScan.Bank.Value
    if diff ~= nil then
        print(core.GetString("BankValueChangeFormat"):format(core.LastScan.Bank.PriceSource or core.GetString("DefaultPriceSource"), core.PriceSourceHelper.ToColoredMoneyString(diff)))
        core.LastScan.Bank.Value = value
    end
end

local function ShowRecorder()
    core.Recorder().Show()
    core.UI.MainWindow.Hide()
end

local function ShowflipEditor()
    core.Recorder().Show()
    core.UI.MainWindow.Hide()
end

local function ImportFarm()
    core.UI.InputDialog({ Text = core.GetString("ImportFarm"), HasEditBox = true, OnAccept = function(dialog)
        local text = dialog.editBox:GetText()
        if text ~= nil then
            if strlen(text) > 0 then
                local result, data = core.ExportHelper.Deserialize(text)

                if result and data.Id and data.Time then
                    local farms = core.Config.GetUserFarms()

                    for i, farm in pairs(farms) do
                        if farm.Id == data.Id then
                            tremove(farms, i)
                        end
                    end

                    table.insert(farms, data)

                    core.UserDataModule.ClearCache()
                    core.DashboardModule.ClearCache()

                    if core.UI.MainWindow.CurrentModule() == core.UserDataModule then
                        core.UI.MainWindow.ShowModule(core.UserDataModule)
                    elseif core.UI.MainWindow.CurrentModule() == core.DashboardModule then
                        core.UI.MainWindow.ShowModule(core.DashboardModule)
                    end
                end
            end
        end
    end })
end

local function buildNavigationMenu()
    local bagValueItems = {
        {
            Name = "BagValueDefault",
            DisplayName = core.GetString("DefaultPriceSource"),
            Action = function() core.PrintInventoryValue() end
        },
        { IsSeparator = true },
        {
            Name = "Difference",
            DisplayName = core.GetString("Difference"),
            Action = function() core.PrintInventoryValue("diff") end
        },
        { IsSeparator = true }
    }

    local bankValueItems = {
        {
            Name = "BankValueDefault",
            DisplayName = core.GetString("DefaultPriceSource"),
            Action = function() core.PrintBankValue() end
        },
        { IsSeparator = true },
        {
            Name = "Difference",
            DisplayName = core.GetString("Difference"),
            Action = function() core.PrintBankValue("diff") end
        },
        { IsSeparator = true }
    }

    if core.Config.GetDataSource() == 1 then
        table.insert(bagValueItems, {
            Name = "BagValueDBMinBuyout",
            DisplayName = "DBMinBuyout",
            Action = function() core.PrintInventoryValue("DBMinBuyout") end
        })
        table.insert(bagValueItems, {
            Name = "BagValueDBMarket",
            DisplayName = "DBMarket",
            Action = function() core.PrintInventoryValue("DBMarket") end
        })
        table.insert(bagValueItems, {
            Name = "BagValueDBHistorical",
            DisplayName = "DBHistorical",
            Action = function() core.PrintInventoryValue("DBHistorical") end
        })
        table.insert(bagValueItems, {
            Name = "BagValueDBRegionMarketAvg",
            DisplayName = "DBRegionMarketAvg",
            Action = function() core.PrintInventoryValue("DBRegionMarketAvg") end
        })

        table.insert(bankValueItems, {
            Name = "BankValueDBMinBuyout",
            DisplayName = "DBMinBuyout",
            Action = function() core.PrintBankValue("DBMinBuyout") end
        })
        table.insert(bankValueItems, {
            Name = "BankValueDBMarket",
            DisplayName = "DBMarket",
            Action = function() core.PrintBankValue("DBMarket") end
        })
        table.insert(bankValueItems, {
            Name = "BankValueDBHistorical",
            DisplayName = "DBHistorical",
            Action = function() core.PrintBankValue("DBHistorical") end
        })
        table.insert(bankValueItems, {
            Name = "BankValueDBRegionMarketAvg",
            DisplayName = "DBRegionMarketAvg",
            Action = function() core.PrintBankValue("DBRegionMarketAvg") end
        })
    else
        table.insert(bagValueItems, {
            Name = "BagValueRecent",
            DisplayName = "recent",
            Action = function() core.PrintInventoryValue("recent") end
        })
        table.insert(bagValueItems, {
            Name = "BagValueMarket",
            DisplayName = "market",
            Action = function() core.PrintInventoryValue("market") end
        })
        table.insert(bagValueItems, {
            Name = "BagValueGlobalMean",
            DisplayName = "globalMean",
            Action = function() core.PrintInventoryValue("globalMean") end
        })
        table.insert(bagValueItems, {
            Name = "BagValueGlobalMedian",
            DisplayName = "globalMedian",
            Action = function() core.PrintInventoryValue("globalMedian") end
        })

        table.insert(bankValueItems, {
            Name = "BankValueRecent",
            DisplayName = "recent",
            Action = function() core.PrintBankValue("recent") end
        })
        table.insert(bankValueItems, {
            Name = "BankValueMarket",
            DisplayName = "market",
            Action = function() core.PrintBankValue("market") end
        })
        table.insert(bankValueItems, {
            Name = "BankValueGlobalMean",
            DisplayName = "globalMean",
            Action = function() core.PrintBankValue("globalMean") end
        })
        table.insert(bankValueItems, {
            Name = "BankValueGlobalMedian",
            DisplayName = "globalMedian",
            Action = function() core.PrintBankValue("globalMedian") end
        })
    end

    local tree = {
        core.DashboardModule,
        {
            IsGroup = true,
            Name = "Farms",
            DisplayName = core.GetString("Farms"),
            Category = "Farming"
        },
        {
            IsGroup = true,
            Name = "BattlePets",
            DisplayName = core.GetString("BattlePets"),
            Category = "BattlePets"
        },
        {
            IsGroup = true,
            Name = "Flippings",
            DisplayName = core.GetString("Flippings"),
            Category = "Flipping"
        },
		{
            IsGroup = true,
            Name = "Transmog",
            DisplayName = core.GetString("Transmog"),
            Category = "Transmog"
        },
        core.UserDataModule,
        { IsSeparator = true },
        core.FarmPlannerModule,
        { IsSeparator = true },
        {
            IsGroup = true,
            Name = "Guides",
            DisplayName = core.GetString("Guides"),
            Category = "Guide"
        },
        {
            IsGroup = true,
            Name = "Help",
            DisplayName = core.GetString("Help"),
            Category = "Help"
        },
        { IsSeparator = true },
        {
            IsGroup = true,
            Name = "Tools",
            DisplayName = core.GetString("Tools"),
            Children = {
                {
                    Name = "Recorder",
                    DisplayName = core.GetString("Recorder"),
                    Action = ShowRecorder
                },
                --{
                --    Name = "flipEditor",
                --    DisplayName = core.GetString("flipEditor"),
                --    Action = ShowflipEditor
                --},
                {
                    Name = "Import",
                    DisplayName = core.GetString("ImportFarm"),
                    Action = ImportFarm
                },
                {
                    IsGroup = true,
                    Name = "BagValue",
                    DisplayName = core.GetString("BagValue"),
                    Children = bagValueItems
                },
                {
                    IsGroup = true,
                    Name = "BankValue",
                    DisplayName = core.GetString("BankValue"),
                    Children = bankValueItems
                },
            }
        },
        { IsSeparator = true },
        core.ConfigurationModule,
    }

    for _, item in pairs(tree) do
        navigationMenu.pullout:AddItem(createMenuItem(item))
    end
end

function core.UI.NavigationMenu()
    if navigationMenu then return navigationMenu end

    navigationMenu = AceGUI:Create("Dropdown")
    navigationMenu.pullout.frame:SetScale(core.Config.GetScaling())
    navigationMenu.multiselect = true
	
    buildNavigationMenu()

    return navigationMenu
end

function core.UI.SelectModule(module)
    navigationMenu:SetText(module.DisplayName or module.Name)

    core.UI.MainWindow.ShowModule(module)
end
