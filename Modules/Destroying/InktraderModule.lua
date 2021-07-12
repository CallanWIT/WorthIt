local WIT, core = ...

local InktraderData = {


-- Trades 1:10
core.Data.Results.Flips.DarkflameInk1,
core.Data.Results.Flips.SnowfallInk1,
core.Data.Results.Flips.InfernoInk1,
core.Data.Results.Flips.StarlightInk1,
core.Data.Results.Flips.ViridecentInk1,

-- Trades 1:1
core.Data.Results.Flips.MoonglowInk1,
core.Data.Results.Flips.MidnightInk1,
core.Data.Results.Flips.LionsInk1,
core.Data.Results.Flips.JadefireInk1,
core.Data.Results.Flips.CelestialInk1,
core.Data.Results.Flips.ShimmeringInk1,
core.Data.Results.Flips.EthrealInk1,
core.Data.Results.Flips.InkOfTheSea1,
core.Data.Results.Flips.BlackfallowInk1,
core.Data.Results.Flips.InkOfDreams1,
core.Data.Results.Flips.WarbindersInk1,
core.Data.Results.Flips.RoseatePigment1,
core.Data.Results.Flips.SallowPigment1,
core.Data.Results.Flips.UltramarineInk1,
core.Data.Results.Flips.CrimsonInk1,
core.Data.Results.Flips.MaroonInk1,


}

table.insert(core.Modules, core.DestroyingResultModule('Inktrader', InktraderData, 'Flipping'))