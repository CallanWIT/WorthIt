local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")
local navigationMenu = nil

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

local function CreateGroupItem(group)
    local menuItem = AceGUI:Create("Dropdown-Item-Menu")

    menuItem:SetText(group.DisplayName or group.Name)
    menuItem:SetUserData("group", group)

    local submenu = AceGUI:Create("Dropdown-Pullout")
    submenu.frame:SetScale(core.Config.GetScaling())
    local hasModules = false

    for _, module in pairs(core.Modules) do
        if module.Category == group.Category then
            hasModules = true
            submenu:AddItem(CreateModuleItem(module))
        end
    end

    menuItem:SetDisabled(group.IsDisabled or not hasModules)
    menuItem:SetMenu(submenu)

    return menuItem;
end

local function CreateSeparator()
    return AceGUI:Create("Dropdown-Item-Separator")
end

local function CreateMenuItem(item)
    if item.IsGroup then
        return CreateGroupItem(item)
    elseif item.IsSeparator then
        return CreateSeparator()
    else
        return CreateModuleItem(item)
    end
end

local function buildNavigationMenu()
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
        {
            IsGroup = true,
            Name = "Guides",
            DisplayName = core.GetString("Guides"),
            Category = "Guide"
        },
        core.UserDataModule,
        { IsSeparator = true },
        core.ConfigurationModule,
    }

    for _, item in pairs(tree) do
        navigationMenu.pullout:AddItem(CreateMenuItem(item))
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
