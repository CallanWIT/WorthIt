local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

local GridColumns = core.GridColumns

function GridColumns.ItemNameColumn(options)
    options = options or {}
    options.Name = options.Name or 'Name'

    local self = GridColumns.GridColumn(options)

    self.ItemIdProperty = options.ItemIdProperty or "ItemId"

    function self.GetSortValue(row)
        local key = self.Name .. "_Order"
        if not row[key] or row[key] == core.GetString('ItemIsLoading') then
            if row.Data.PetId then
                row[key] = core.PriceSourceHelper.GetItemName('p:'.. row.Data.PetId)
            elseif row.Data[self.ItemIdProperty] then
                row[key] = core.PriceSourceHelper.GetItemName(row.Data[self.ItemIdProperty])
            elseif row.Data.NameMapId then
                row[key] = core.LocationHelper.GetMapName(row.Data.NameMapId)
            else
                row[key] = row.Data.Name
            end
        end

        if row.Data.NameSuffix then
            row[key] = row[key] .. " " .. core.GetString(row.Data.NameSuffix)
        end

        return row[key] or ''
    end

    function self.GetFilterValue(row)
        return strlower(self.GetSortValue(row))
    end

    function self.Value(data)
        if data.ItemLink then return data.ItemLink end
        if data[self.ItemIdProperty] then
            return core.PriceSourceHelper.GetItemLink(data[self.ItemIdProperty])
        end

        return data.NameMapId and core.LocationHelper.GetMapName(data.NameMapId) or data.Name
    end

    local baseGetRowText = self.GetRowText
    function self.GetRowText(row)
        local text = self.Value(row.Data)

        if row.Data.Quantity then
            text = text .. " x" .. row.Data.Quantity
        end

        if row.Data.NameSuffix then
            text = text .. " " .. core.GetString(row.Data.NameSuffix)
        end

        return text
    end

    local baseGetCell = self.GetCell
    function self.GetCell(row)
        if row.Data[self.ItemIdProperty] then
            local cell = AceGUI:Create("SimpleGroup")
            local link = AceGUI:Create("InteractiveLabel")
            local itemLink = self.Value(row.Data)
            
            link:SetText(self.GetRowText(row))
            link:SetWidth(link.label:GetStringWidth() + 5)

            link:SetCallback("OnEnter", function()
                GameTooltip:SetOwner(link.frame, "ANCHOR_PRESERVE")
	            GameTooltip:ClearAllPoints()
	            GameTooltip:SetPoint("LEFT", link.frame, "RIGHT")
                if row.Data.PetId then
                    BattlePetToolTip_ShowLink(row.Data.ItemLink)
                else
                    GameTooltip:SetHyperlink("item:" .. row.Data[self.ItemIdProperty])
                    GameTooltip:Show()
                end
            end)
            link:SetCallback("OnLeave", function()
                if row.Data.PetId then
                    BattlePetTooltip:Hide()
                else
                    GameTooltip:Hide()
                end
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