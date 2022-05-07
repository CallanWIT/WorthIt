local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local function CreateArrow(texture, size)
    local frame = CreateFrame("Button", nil, UIParent)
    frame:SetWidth(size)
    frame:SetHeight(size)

	frame.image = frame:CreateTexture(nil, "ARTWORK")
    frame.image:SetTexture(texture)
	frame.image:SetAllPoints(frame)

    return frame
end

local function CreateColumnSelector(column)
    local frame = AceGUI:Create("SimpleGroup")
    frame:SetLayout("Flow")
    frame:SetHeight(16)
    frame:SetFullWidth(true)

    local checkMark = CreateArrow("Interface\\AddOns\\WIT\\Images\\Icons\\check_mark", 10)
    checkMark:SetParent(frame.frame)
    checkMark:SetPoint("TOPRIGHT", frame.frame, "TOPLEFT", 0, -3)

    local label = AceGUI:Create("InteractiveLabel")

    label:SetText(column.DisplayName)
    frame.minWidth = label.label:GetStringWidth() + 30
    label:SetWidth(frame.minWidth - 25)

    frame.background = frame.frame:CreateTexture(nil, "BACKGROUND")
    frame.background:SetPoint("TOPLEFT", frame.frame, "TOPLEFT", -13, -2)
    frame.background:SetPoint("BOTTOMRIGHT", frame.frame, "BOTTOMRIGHT", 0, -2)

    if column.IsHidden then
        frame.background:SetColorTexture(0.2, 0.2, 0.2)
        checkMark.image:SetTexture(nil)
    else
        frame.background:SetColorTexture(0, 0, 0)
        checkMark.image:SetTexture("Interface\\AddOns\\WIT\\Images\\Icons\\check_mark")
    end

    local arrowUp = CreateArrow("Interface\\AddOns\\WIT\\Images\\Icons\\arrow_up_gold", 16)
    arrowUp:SetParent(frame.frame)
    arrowUp:SetPoint("TOPRIGHT", frame.frame, "TOPRIGHT", -15, 0)
    arrowUp:SetScript("OnClick", function(self)
        frame.moveUp(column)
    end)

    local arrowDown = CreateArrow("Interface\\AddOns\\WIT\\Images\\Icons\\arrow_down_gold", 16)
    arrowDown:SetParent(frame.frame)
    arrowDown:SetPoint("TOPRIGHT", frame.frame, "TOPRIGHT", -3, 0)
    arrowDown:SetScript("OnClick", function(self)
        frame.moveDown(column)
    end)
    
    frame:SetCallback("OnRelease", function(self)
        self.background:Hide()
        arrowUp:Hide()
        arrowUp:SetParent(nil)
        arrowDown:Hide()
        arrowDown:SetParent(nil)
        checkMark.image:SetTexture(nil)
    end)
    checkMark:SetScript("OnClick", function(self)
        column.IsHidden = not column.IsHidden
        if column.IsHidden then
            frame.background:SetColorTexture(0.2, 0.2, 0.2)
            checkMark.image:SetTexture(nil)
        else
            frame.background:SetColorTexture(0, 0, 0)
            checkMark.image:SetTexture("Interface\\AddOns\\WIT\\Images\\Icons\\check_mark")
        end

        local module = core.UI.MainWindow.CurrentModule()
        if module ~= nil then
            if module.SaveColumnFilter then
                module.SaveColumnFilter()
            end
            module.Refresh()
        end
    end)

    label:SetCallback("OnClick", function()
        column.IsHidden = not column.IsHidden
        if column.IsHidden then
            frame.background:SetColorTexture(0.2, 0.2, 0.2)
            checkMark.image:SetTexture(nil)
        else
            frame.background:SetColorTexture(0, 0, 0)
            checkMark.image:SetTexture("Interface\\AddOns\\WIT\\Images\\Icons\\check_mark")
        end

        local module = core.UI.MainWindow.CurrentModule()
        if module ~= nil then
            if module.SaveColumnFilter then
                module.SaveColumnFilter()
            end
            module.Refresh()
        end
    end)

    frame:AddChild(label)

    return frame
end

local function GetVisibleColumns(module)
    local visibleColumns = {}

    for _, column in pairs(module.Columns or {}) do
        if column.IsVisible(module) then
            table.insert(visibleColumns, column)
        end
    end

    return visibleColumns
end

local function UpdateColumns(module, columns)
    local currentOrder = {}

    for _, column in pairs(module.Columns) do
        table.insert(currentOrder, column)
    end

    wipe(module.Columns)

    for _, column in pairs(columns or {}) do
        table.insert(module.Columns, column)
    end

    for _, column in pairs(currentOrder) do
        if not tContains(module.Columns, column) then
            table.insert(module.Columns, column)
        end
    end
end

local function DrawColumns(frame, columns)
    local minWidth = 0

    local function MoveUp(column)
        local module = core.UI.MainWindow.CurrentModule()
        if module == nil or module.Columns == nil then return end
        local columns = GetVisibleColumns(module)

        local index = core.TableHelper.IndexOf(columns, column)
        if index > 1 and not columns[index - 1].IsFixedSize and columns[index - 1].Name ~= '' then
            table.remove(columns, index)
            table.insert(columns, index - 1, column)
            DrawColumns(frame, columns)

            UpdateColumns(module, columns)

            if module.SaveColumnFilter then
                module.SaveColumnFilter()
            end
            module.Refresh()
        end
    end

    local function MoveDown(column)
        local module = core.UI.MainWindow.CurrentModule()
        if module == nil or module.Columns == nil then return end
        local columns = GetVisibleColumns(module)

        local index = core.TableHelper.IndexOf(columns, column)
        if index < #columns then
            table.remove(columns, index)
            table.insert(columns, index + 1, column)
            DrawColumns(frame, columns)

            UpdateColumns(module, columns)

            if module.SaveColumnFilter then
                module.SaveColumnFilter()
            end
            module.Refresh()
        end
    end

    frame:ReleaseChildren()

    for _, column in pairs(columns) do
        if not column.IsFixedSize and column.Name ~= '' then
            local columnSelector = CreateColumnSelector(column)
            columnSelector.moveUp = MoveUp
            columnSelector.moveDown = MoveDown
            minWidth = minWidth < columnSelector.minWidth and columnSelector.minWidth or minWidth
            frame:AddChild(columnSelector)
        end
    end

    frame:SetWidth(minWidth + 5)
end

local function CreatePanel(columns)
    local frame = AceGUI:Create("SimpleGroup")
    frame:SetLayout("List")
    frame:SetHeight(16)

    DrawColumns(frame, columns or {})

    return frame
end

local function CreateWidget()
    local frame = CreateFrame("Button", nil, UIParent)
    frame:SetWidth(16)
    frame:SetHeight(16)

	local image = frame:CreateTexture(nil, "BACKGROUND")
    image:SetTexture("Interface\\AddOns\\WIT\\Images\\Icons\\menu")
	image:SetAllPoints(frame)

    frame.Panel = CreatePanel(nil)
    frame.Panel.frame:SetParent(frame)
    frame.Panel:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, 0)

    frame.Panel.frame:Hide()

    frame:SetScript("OnClick", function(self)
        if frame.Panel.frame:IsShown() then
            frame.Panel.frame:Hide()
        else
            frame.Panel.frame:Show()
        end
    end)

    local widget = {
		frame = frame,
		type  = "ColumnSelector"
	}

    widget.RefeshColumnList = function(module)
        frame.Panel.frame:Hide()

        if module ~= nil and module.Columns then
            DrawColumns(frame.Panel, GetVisibleColumns(module))
        end
    end 

    widget.OnAcquire = function() end

    return AceGUI:RegisterAsWidget(widget)
end

function core.UI.ColumnSelector(columns)
    return CreateWidget()
end
