local WIT, core = ...

local GridColumns = core.GridColumns

function GridColumns.CostColumn()
    local self = GridColumns.ResultsValueColumn('Cost')

    self.Description = core.GetString('CostDescription')

    function self.GetItemPrice(item)
        if item.BuyFromVendor then
            return core.TSMHelper.GetItemVendorBuyPrice(item.Id) * (item.ApplyReputationDiscount and 0.8 or 1)
        else
            return core.TSMHelper.GetItemPrice(item.Id)
        end
    end

    function self.GetItemList(data)
        return data.Materials
    end
    
    return self
end
