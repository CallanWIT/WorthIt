local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.GridColumn(name)
    local self = {
        Visible = true,
        Name = name,
        DisplayName = core.GetString(name),
    }

    function self.Value(data)
        return 0
    end

    function self.GetCell(row)
        local cell = AceGUI:Create("Label")

        cell:SetText(self.GetRowText(row))

        return cell
    end

    function self.IsVisible()
        return self.Visible
    end

    function self.GetRowText(row)
        row[self.Name] = row[self.Name] or self.Value(row.Data)

        return row[self.Name] or ''
    end

    function self.GetColumnMinWidth(rows)
        local label = AceGUI:Create("Label")
        label:SetText(self.DisplayName or self.Name)

        local maxWidth = label.label:GetStringWidth()

        for _, row in pairs(rows) do
            label:SetText(self.GetRowText(row))
            local width = label.label:GetStringWidth()

            if width > maxWidth then
                maxWidth = width
            end
        end

        label:Release()

        return maxWidth
    end

    function self.GetHeaderCell()
        local container = AceGUI:Create("SimpleGroup")
        local cell = AceGUI:Create("InteractiveLabel")
            
        cell:SetText(self.DisplayName or self.Name)
        cell:SetWidth(cell.label:GetStringWidth() + 5)

        if self.Description then
            cell:SetCallback("OnEnter", function()
                GameTooltip:SetOwner(cell.frame, "ANCHOR_PRESERVE")
	            GameTooltip:ClearAllPoints()
	            GameTooltip:SetPoint("LEFT", cell.frame, "RIGHT")
                GameTooltip:ClearLines()
                GameTooltip:AddLine(self.Description)
                GameTooltip:Show()
            end)
            cell:SetCallback("OnLeave", function()
                GameTooltip:Hide()
            end)
        end

        cell:SetCallback("OnClick", function()
            -- sort
        end)

        container:AddChild(cell)

        return container
    end
    
    return self
end
