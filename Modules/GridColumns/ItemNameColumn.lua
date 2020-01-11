local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemNameColumn()
    local self = GridColumns.GridColumn('Name')

    function self.Value(data)
        if data.ItemId then
            return core.TSMHelper.GetItemLink(data.ItemId)
        end

        return data.Name
    end

    local baseGetRowText = self.GetRowText
    function self.GetRowText(row)
        if row.Data.Quantity then
            return baseGetRowText(row) .. " x" .. row.Data.Quantity
        else
            return baseGetRowText(row)
        end
    end

    local baseGetCell = self.GetCell
    function self.GetCell(row)
        if row.Data.ItemId then
            local cell = AceGUI:Create("SimpleGroup")
            local link = AceGUI:Create("InteractiveLabel")
            local itemLink = self.Value(row.Data)
            
            link:SetText(self.GetRowText(row))
            link:SetWidth(link.label:GetStringWidth() + 5)

            link:SetCallback("OnEnter", function()
                GameTooltip:SetOwner(link.frame, "ANCHOR_PRESERVE")
	            GameTooltip:ClearAllPoints()
	            GameTooltip:SetPoint("LEFT", link.frame, "RIGHT")
                GameTooltip:SetHyperlink("item:" .. row.Data.ItemId)
                GameTooltip:Show()
            end)
            link:SetCallback("OnLeave", function()
                GameTooltip:Hide()
            end)
            link:SetCallback("OnClick", function()
                if IsShiftKeyDown() then
		            ChatEdit_InsertLink(itemLink)
	            end
            end)

            cell:AddChild(link)

            return cell
        end

        return baseGetCell(row)
    end
    
    return self
end