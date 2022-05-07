local WIT, core = ...

local sections = {
    core.GuideSections.Heading('DataSourceSection_1'),
    core.GuideSections.Text('DataSourceSection_2'),
    core.GuideSections.Section('DataSourceSection_3'),
    core.GuideSections.Text('DataSourceSection_4'),
    core.GuideSections.Section('DataSourceSection_5'),
    core.GuideSections.Text('DataSourceSection_6'),
    core.GuideSections.Section('DataSourceSection_7'),
    core.GuideSections.Text('DataSourceSection_8'),
    core.GuideSections.Text('DataSourceSection_9'),
}

table.insert(core.Modules, core.GuideModule('DataSource', sections, 'Help'))

sections = {
    core.GuideSections.Heading('AddonsGuideSection_1'),
    core.GuideSections.Text('AddonsGuideSection_2'),
    core.GuideSections.Section('AddonsGuideSection_3'),
    core.GuideSections.Text('AddonsGuideSection_4'),
    core.GuideSections.Section('AddonsGuideSection_5'),
    core.GuideSections.Text('AddonsGuideSection_6'),
    core.GuideSections.Section('AddonsGuideSection_7'),
    core.GuideSections.Text('AddonsGuideSection_8'),
    core.GuideSections.Section('AddonsGuideSection_9'),
    core.GuideSections.Text('AddonsGuideSection_10'),
    core.GuideSections.Section('AddonsGuideSection_11'),
    core.GuideSections.Text('AddonsGuideSection_12'),
    core.GuideSections.Section('AddonsGuideSection_13'),
    core.GuideSections.Text('AddonsGuideSection_14'),
}

table.insert(core.Modules, core.GuideModule('AddonsGuide', sections, 'Help'))

sections = {
    core.GuideSections.Heading('RecorderGuideSection_1'),
    core.GuideSections.Text('RecorderGuideSection_2'),
    core.GuideSections.Image('Interface\\AddOns\\WIT\\Images\\Guides\\recorder_edit.jpeg', 512, 512),
    core.GuideSections.Text('RecorderGuideSection_2.5'),
    core.GuideSections.Section('RecorderGuideSection_3'),
    core.GuideSections.Image('Interface\\AddOns\\WIT\\Images\\Guides\\control_buttons.jpeg', 128, 64),
    core.GuideSections.Text('RecorderGuideSection_4'),
    core.GuideSections.Section('RecorderGuideSection_5'),
    core.GuideSections.Text('RecorderGuideSection_6'),
    core.GuideSections.Section('RecorderGuideSection_7'),
    core.GuideSections.Text('RecorderGuideSection_8'),
    core.GuideSections.Section('RecorderGuideSection_9'),
    core.GuideSections.Text('RecorderGuideSection_10'),
    core.GuideSections.Section('RecorderGuideSection_11'),
    core.GuideSections.Image('Interface\\AddOns\\WIT\\Images\\Guides\\route_picker.jpeg', 512, 256),
    core.GuideSections.Text('RecorderGuideSection_12'),
    core.GuideSections.Section('RecorderGuideSection_13'),
    core.GuideSections.Text('RecorderGuideSection_14'),
    core.GuideSections.Section('RecorderGuideSection_15'),
    core.GuideSections.Text('RecorderGuideSection_16'),
    core.GuideSections.Section('RecorderGuideSection_17'),
    core.GuideSections.Text('RecorderGuideSection_18'),
    core.GuideSections.Section('RecorderGuideSection_19'),
    core.GuideSections.Text('RecorderGuideSection_20'),
    core.GuideSections.Section('RecorderGuideSection_21'),
    core.GuideSections.Text('RecorderGuideSection_22'),
    core.GuideSections.Section('RecorderGuideSection_23'),
    core.GuideSections.Text('RecorderGuideSection_24'),
    core.GuideSections.Section('RecorderGuideSection_25'),
    core.GuideSections.Text('RecorderGuideSection_26'),
}
table.insert(core.Modules, core.GuideModule('RecorderGuide', sections, 'Help'))

sections = {
    core.GuideSections.Heading('TricksGuideSection_1'),
    core.GuideSections.Section('TricksGuideSection_2'),
    core.GuideSections.Text('TricksGuideSection_3'),
    core.GuideSections.Section('TricksGuideSection_4'),
    core.GuideSections.Text('TricksGuideSection_5'),
    core.GuideSections.Text('TricksGuideSection_6'),
    core.GuideSections.Text('TricksGuideSection_7'),
    core.GuideSections.Section('TricksGuideSection_8'),
    core.GuideSections.Text('TricksGuideSection_9'),
}
table.insert(core.Modules, core.GuideModule('TipsAndTricksGuide', sections, 'Help'))