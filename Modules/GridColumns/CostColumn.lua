local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.CostColumn(options)
    options = options or {}
    options.Name = options.Name or 'Cost'

    local self = GridColumns.ResultsValueColumn(options)

    self.Description = core.GetString('CostDescription')

    function self.GetItemPrice(item)
        local id = item.Id == core.TSMHelper.PetCageItemId and 'p:'.. item.PetId or item.Id
        if item.BuyFromVendor then
            return core.TSMHelper.GetItemVendorBuyPrice(id) * (item.ApplyReputationDiscount and 0.8 or 1)
        else
            return core.TSMHelper.GetItemPrice(id)
        end
    end

    function self.GetItemList(data)
        return data.Materials
    end
    
    return self
end
