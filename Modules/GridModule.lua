local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.GridModule(name, data, category)
    local self = core.Module(name, category)

    self.Data = data
    self.Columns = {}

    function self.ClearCache()
        self.Rows = nil
    end

    function self.GetRows()
        if not self.Rows then
            self.Rows = {}

            for _, data in pairs(self.Data) do
                local row = { Data = data }

                for _, column in pairs(self.Columns) do
                    row[column.Name] = column.Value(data)
                end

                table.insert(self.Rows, row)
            end
        end

        return self.Rows
    end

    function self.Draw(frame)
        local rows = self.GetRows()
        local visibleColumns = self.GetVisibleColumns(rows)
        local columnWidth = {}
        local columnCount = 0
        local totalWidth = 0

        local header = AceGUI:Create("SimpleGroup")
        header:SetLayout("Flow")
        header:SetFullWidth(true)

        for key, column in pairs(visibleColumns) do
            columnWidth[key] = column.GetColumnMinWidth(rows) + 5
            totalWidth = totalWidth + columnWidth[key]
            columnCount = columnCount + 1
        end

        local diff = GetScreenWidth()*0.6 - 45 - totalWidth

        if diff > 0 then
            diff = math.floor(diff / columnCount)

            for key, width in pairs(columnWidth) do
                columnWidth[key] = width + diff
            end
        end

        for key, column in pairs(visibleColumns) do
            local headerCell = column.GetHeaderCell()
            headerCell:SetWidth(columnWidth[key])
            header:AddChild(headerCell)
        end

        frame:AddChild(header)

        for _, row in pairs(rows) do
            local group = AceGUI:Create("SimpleGroup")
            group:SetLayout("Flow")
            group:SetFullWidth(true)

            for key, column in pairs(visibleColumns) do
                local cell = column.GetCell(row)
                cell:SetWidth(columnWidth[key])
                group:AddChild(cell)
            end

            frame:AddChild(group)
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
