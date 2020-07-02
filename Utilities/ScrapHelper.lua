local WIT, core = ...

local ScrapHelper = {}

core.ScrapHelper = ScrapHelper

function ScrapHelper.IsJunk(itemId)
    return Scrap and Scrap.IsJunk and Scrap:IsJunk(itemId)
end
