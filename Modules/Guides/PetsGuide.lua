local WIT, core = ...

local sections = {
    core.GuideSections.Text('BattlePetGuideSection_1')
}

table.insert(core.Modules, core.GuideModule('BattlePetGuide', sections, 'Guide'))
