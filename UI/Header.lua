local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")
local header = nil
local navMenu = nil
local bagValue = nil
local bagValueButton = nil

local function GetColumns()
    local items = {}

    for _, column in pairs(core.DashboardModule.Columns) do
        if not column.IsFixedSize then
            table.insert(items, {
                Name = column.DisplayName or column.Name,
                DisplayName = column.DisplayName or column.Name,
                Checkable = true,
                Action = function() print('click') end,
                --Action = moveUp,
                --ActionArg = row,
                --IsEnabled = function(row) return core.TableHelper.IndexOf(core.Config.GetPlannedFarmIds(), row.Data.Id) > 1 end
            })
        end
    end

    return items
end

function core.UI.Header(window)
    if header then return header end

    header = AceGUI:Create("SimpleGroup")
    header:SetLayout("Flow")
    header:SetFullWidth(true)
    header:SetHeight(35)

    navMenu = core.UI.NavigationMenu()
    header:AddChild(navMenu)

    --local menu = core.UI.ContextMenuButton({
    --        Name = "RowContextMenu",
    --        DisplayName = "Context Menu",
    --        Icon = "Interface\\AddOns\\WIT\\Images\\Icons\\menu",
    --        IconWidth = 12,
    --        Children = GetColumns()
    --    })
    --menu.alignoffset = -10
    --header:AddChild(menu)

    header.SearchBox = AceGUI:Create("EditBox")
    header.SearchBox:DisableButton(true)
    header.SearchBox:SetParent(header)
    header.SearchBox:SetPoint("TOPRIGHT", header.frame, "TOPRIGHT", -10, 0)

    --local searchIcon = header.SearchBox.frame:CreateTexture(nil, "BACKGROUND")
    --searchIcon:SetTexture("Interface\\COMMON\\Search")
	--searchIcon:SetPoint("TOPRIGHT", header.SearchBox.frame, "TOPRIGHT", 0, 0)

    header.SearchBox.frame:Hide()

    --"Interface\\COMMON\\help-i"
    --hidden:AddChild(header.SearchBox)
    --OnTextChanged(text)

    return header
end

function core.UI.DisableHeader()
    if not header then return end

    navMenu:SetDisabled(true)
end

function core.UI.ToggleQuickSearch(show, onSearch)
    if show then
        header.SearchBox.frame:Show()
    else
        header.SearchBox.frame:Hide()
    end

    header.SearchBox:SetCallback("OnTextChanged", onSearch)
end

function core.UI.GetSearchTerm()
    return header.SearchBox:GetText()
end

function core.UI.ClearBagValue()
    if not bagValue then return end
end
