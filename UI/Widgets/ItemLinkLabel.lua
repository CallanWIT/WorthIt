local WIT, core = ...

local AceGUI = LibStub("AceGUI-3.0")

function core.UI.ItemLinkLabel(item, options)
    options = options or {}
    local link = AceGUI:Create("InteractiveLabel")
    local itemLink = item.ItemLink or core.PriceSourceHelper.GetItemLink(item.Id)

    link:SetText(options.Prefix .. itemLink .. options.Suffix)
    link:SetWidth(link.label:GetStringWidth() + 7)

    link:SetCallback("OnEnter", function()
        GameTooltip:SetOwner(link.frame, "ANCHOR_PRESERVE")
	    GameTooltip:ClearAllPoints()
	    GameTooltip:SetPoint("LEFT", link.frame, "RIGHT")

        if item.PetId then
            BattlePetToolTip_ShowLink(item.ItemLink)
        else
            GameTooltip:SetHyperlink("item:" .. item.Id)
            GameTooltip:Show()
        end
    end)
    link:SetCallback("OnLeave", function()
        if item.PetId then
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

    return link
end
