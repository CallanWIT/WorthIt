local WIT, core = ...

local ScrapHelper = {}

core.ScrapHelper = ScrapHelper

function ScrapHelper.IsScrapAvailable()
    return Scrap and Scrap.IsJunk
end


function ScrapHelper.IsJunk(itemId)
    return ScrapHelper.IsScrapAvailable() and Scrap:IsJunk(itemId)
end
