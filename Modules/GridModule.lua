local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.GridModule(name, data, category)
    local self = core.Module(name, category)

    self.Data = data
    self.Columns = {}
    self.Sort = {
        Column = nil,
        Direction = nil,
    }

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

        core.UI.MainWindow.ShowModule(self)
    end

    local function sortRows(rows)
        if not self.Sort.Column then return rows end

        table.sort(rows, function(a, b)
            if self.Sort.Direction == "ASC" then
                return self.Sort.Column.GetSortValue(a) < self.Sort.Column.GetSortValue(b)
            else
                return self.Sort.Column.GetSortValue(a) > self.Sort.Column.GetSortValue(b)
            end
        end)

        return rows
    end

    function self.ClearCache()
        self.Rows = nil
    end

    function self.GetData()
        return self.Data
    end

    function self.GetRows()
        if not self.Rows then
            self.Rows = {}

            for _, data in pairs(self.GetData()) do
                local row = { Data = data }

                for _, column in pairs(self.Columns) do
                    row[column.Name] = column.Value(data)
                end

                table.insert(self.Rows, row)
            end
        end

        return sortRows(self.Rows)
    end

    function self.Draw(container)
        local frame = AceGUI:Create("ScrollFrame")
        container:AddChild(frame)

        local rows = self.GetRows()
        local visibleColumns = self.GetVisibleColumns(rows)
        local columnWidth = {}
        local columnCount = 0
        local totalWidth = 0

        local header = AceGUI:Create("SimpleGroup")
        header:SetLayout("Flow")
        header:SetFullWidth(true)

        header.background = header.frame:CreateTexture(nil, "BACKGROUND")
        header.background:SetPoint("TOPLEFT", header.frame, "TOPLEFT", 0, -2)
        header.background:SetPoint("BOTTOMRIGHT", header.frame, "BOTTOMRIGHT", 0, -1)
        header.background:SetColorTexture(0.5, 0.5, 0.5, 0.5)
        header:SetCallback("OnRelease", function(self)
            self.background:Hide()
        end)

        for key, column in pairs(visibleColumns) do
            columnWidth[key] = column.GetColumnMinWidth(rows) + 5
            totalWidth = totalWidth + columnWidth[key]
            columnCount = columnCount + 1
        end

        local diff = core.UI.MainWindow.GetWindowWidth() - 45 - totalWidth

        if diff > 0 then
            local additionalWidth = math.floor(diff / columnCount)

            for key, width in pairs(columnWidth) do
                columnWidth[key] = width + additionalWidth
            end
        else
            header:SetFullWidth(false)
            header:SetWidth(totalWidth + 45)
        end

        for key, column in pairs(visibleColumns) do
            local headerCell = column.GetHeaderCell(onColumnClicked)
            headerCell:SetWidth(columnWidth[key])
            header:AddChild(headerCell)
        end

        frame:AddChild(header)

        local isAlternateRow = false

        for _, row in pairs(rows) do
            local group = AceGUI:Create("SimpleGroup")
            group:SetLayout("Flow")
            group:SetFullWidth(true)

            if diff <= 0 then
                group:SetFullWidth(false)
                group:SetWidth(totalWidth + 45)
            end

            if isAlternateRow == true then
                group.background = group.frame:CreateTexture(nil, "BACKGROUND")
                group.background:SetPoint("TOPLEFT", group.frame, "TOPLEFT", 0, -2)
                group.background:SetPoint("BOTTOMRIGHT", group.frame, "BOTTOMRIGHT", 0, -2)
                group.background:SetColorTexture(0.5, 0.5, 0.5, 0.5)
                group:SetCallback("OnRelease", function(self)
                    self.background:Hide()
                end)
            end

            for key, column in pairs(visibleColumns) do
                local cell = column.GetCell(row)
                cell:SetWidth(columnWidth[key])
                group:AddChild(cell)
            end

            frame:AddChild(group)
            isAlternateRow = not isAlternateRow
        end
    end

    function self.GetVisibleColumns(rows)
        local visibleColumns = {}

        for _, column in pairs(self.Columns) do
            if column.IsVisible(rows) then
                table.insert(visibleColumns, column)
            end
        end

        return visibleColumns
    end
    
    return self
end
