local WIT, core = ...

local sections = {
    core.GuideSections.Heading('AddonsGuideSection_1'),
    core.GuideSections.Text('AddonsGuideSection_2'),
    core.GuideSections.Text('AddonsGuideSection_3'),
}

table.insert(core.Modules, core.GuideModule('AddonsGuide', sections, 'Help'))
table.insert(core.Modules, core.GuideModule('RecorderGuide', sections, 'Help'))
