local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.UI.Grid(options)
    options = options or {}

    local self = AceGUI:Create("SimpleGroup")
    local minWidth = options.MinWidth

    self.Columns = options.Columns or {}
    self.IsExpandabled = options.IsExpandabled ~= nil and options.IsExpandabled or true
    self.DetailsRowHeaderResource = options.DetailsRowHeaderResource or "Loot"
    self.Sort = options.Sort or { Column = nil, Direction = nil }
    self.SearchTerm = options.SearchTerm

    local function onColumnClicked(column)
        if not column.IsSortable() then return end

        if self.Sort.Column == column then
            self.Sort.Direction = self.Sort.Direction ~= "ASC" and "ASC" or "DESC"
        else
            self.Sort = {
                Column = column,
                Direction = "ASC",
            }
        end

        self.Reload()
    end

    local function sortRows(rows)
        if not self.Sort.Column then return rows end

        table.sort(rows, function(a, b)
            local valA = self.Sort.Column.GetSortValue(a)
            local valB = self.Sort.Column.GetSortValue(b)
            local idA = a.Data.Id or 0
            local idB = b.Data.Id or 0

            if self.Sort.Direction == "ASC" then
                return valA == valB and idA < idB or valA < valB
            else
                return valA == valB and idA > idB or valA > valB
            end
        end)

        return rows
    end
    
    local function matchFilter(row, columns)
        for _, column in pairs(columns) do
            if column.GetFilterValue and strfind(column.GetFilterValue(row), self.SearchTerm) then
                return true
            end
        end
    end

    local function filterRows(rows)
        if not self.SearchTerm or self.SearchTerm == "" then return rows end

        local visibleColumns = self.GetVisibleColumns(rows)
        local results = {}

        for _, row in pairs(rows) do
            if matchFilter(row, visibleColumns) then
                table.insert(results, row)
            end
        end

        return results
    end

    function self.GetData()
        return self.Data
    end

    function self.GetDetailsRowData(row)
        return row.Data.Results
    end

    function self.GetRows()
        if not self.Rows then
            self.Rows = {}
            local data = self.GetData()

            for _, data in pairs(data) do
                local row = { Data = data }

                for _, column in pairs(self.Columns) do
                    row[column.Name] = column.Value(data)
                end

                table.insert(self.Rows, row)
            end
        end

        return sortRows(filterRows(self.Rows))
    end

    local function DrawDetailsRow(row, isAlternateRow)
        local data = self.GetDetailsRowData(row)
        if not data or #(data) == 0 then return end

        local group = AceGUI:Create("SimpleGroup")
        group:SetFullWidth(true)

        if isAlternateRow == true then
            group.background = group.frame:CreateTexture(nil, "BACKGROUND")
            group.background:SetPoint("TOPLEFT", group.frame, "TOPLEFT", 0, -2)
            group.background:SetPoint("BOTTOMRIGHT", group.frame, "BOTTOMRIGHT", 0, -2)
            group.background:SetColorTexture(0.5, 0.5, 0.5, 0.3)
            group:SetCallback("OnRelease", function(self)
                self.background:Hide()
            end)
        end

        local header = AceGUI:Create("Label")
        header:SetFullWidth(true)
        header:SetText("     " .. core.GetString(self.DetailsRowHeaderResource))
        group:AddChild(header)

        for _, item in pairs(data) do
            if item.Quantity and type(item.Quantity) == "string" then item.Quantity = tonumber(item.Quantity) end
            local itemLabel = core.UI.ItemLinkLabel(item, { Prefix = "       ", Suffix = (item.Quantity or 1) > 1 and (" x" .. (item.Quantity or 1)) or "" })
            group:AddChild(itemLabel)
        end

        self:AddChild(group)
    end

    local function Draw()
        local rows = self.GetRows()
        local visibleColumns = self.GetVisibleColumns(rows)
        local columnWidth = {}
        local columnCount = 0
        local totalWidth = 0
        local fixedWidth = 0
        local isFullWidth = false

        local header = AceGUI:Create("SimpleGroup")
        header:SetLayout("Flow")
        header:SetFullWidth(true)

        header.background = header.frame:CreateTexture(nil, "BACKGROUND")
        header.background:SetPoint("TOPLEFT", header.frame, "TOPLEFT", 0, -2)
        header.background:SetPoint("BOTTOMRIGHT", header.frame, "BOTTOMRIGHT", 0, -1)
        header.background:SetColorTexture(0.5, 0.5, 0.5, 0.3)
        header:SetCallback("OnRelease", function(self)
            self.background:Hide()
        end)

        for key, column in pairs(visibleColumns) do
            columnWidth[key] = column.GetColumnMinWidth(rows) + 5
            totalWidth = totalWidth + columnWidth[key]

            if not column.IsFixedSize then
                columnCount = columnCount + 1
            end
        end

        if minWidth then
            minWidth = math.floor(minWidth)
            local diff = minWidth - 45 - totalWidth
            isFullWidth = diff > 0
            self:SetFullWidth(false)

            if diff > 0 then
                local additionalWidth = math.floor(diff / columnCount)
                for key, width in pairs(columnWidth) do
                    if not visibleColumns[key].IsFixedSize then
                        columnWidth[key] = width + additionalWidth
                    end
                end
                self:SetFullWidth(true)
            else
                self:SetWidth(totalWidth + 45)
            end
        else
            self:SetFullWidth(true)
        end

        for key, column in pairs(visibleColumns) do
            local headerCell = column.GetHeaderCell(onColumnClicked)
            headerCell:SetWidth(columnWidth[key])
            header:AddChild(headerCell)
        end

        self:AddChild(header)

        local isAlternateRow = false

        for _, row in pairs(rows) do
            local group = AceGUI:Create("SimpleGroup")
            group:SetLayout("Flow")
            group:SetFullWidth(true)

            if isAlternateRow == true then
                group.background = group.frame:CreateTexture(nil, "BACKGROUND")
                group.background:SetPoint("TOPLEFT", group.frame, "TOPLEFT", 0, -2)
                group.background:SetPoint("BOTTOMRIGHT", group.frame, "BOTTOMRIGHT", 0, -2)
                group.background:SetColorTexture(0.5, 0.5, 0.5, 0.3)
                group:SetCallback("OnRelease", function(self)
                    self.background:Hide()
                end)
            end

            for key, column in pairs(visibleColumns) do
                local cell = column.GetCell(row, self)
                cell:SetWidth(columnWidth[key])
                group:AddChild(cell)
            end

            self:AddChild(group)

            if row.Expanded then
                DrawDetailsRow(row, isAlternateRow)
            end

            isAlternateRow = not isAlternateRow
        end
    end

    function self.Show(data)
        self.Data = data

        self.ClearCache()
        self.Reload()
    end

    function self.Reload()
        self:ReleaseChildren()
        Draw()

        self:Fire("OnReload")
    end

    function self.Search(term)
        self.SearchTerm = strlower(term)
        self.Reload()
    end

    function self.ClearCache()
        self.Rows = nil
    end

    function self.GetVisibleColumns(rows)
        local visibleColumns = {}

        for _, column in pairs(self.Columns) do
            if column.IsVisible(self, rows) then
                table.insert(visibleColumns, column)
            end
        end

        return visibleColumns
    end
    
    return self
end
