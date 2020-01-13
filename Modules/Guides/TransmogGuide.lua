local WIT, core = ...

local sections = {
    --core.GuideSections.Text('TransmogGuideTitle'),
    core.GuideSections.Heading('TransmogGuideSection_1'),
    core.GuideSections.Text('TransmogGuideSection_2'),
    core.GuideSections.Text('TransmogGuideSection_3'),
    core.GuideSections.Text('TransmogGuideSection_4'),
    core.GuideSections.Text('TransmogGuideSection_5'),
    core.GuideSections.Text('TransmogGuideSection_6'),
    core.GuideSections.Text('TransmogGuideSection_7'),
    core.GuideSections.Heading('TransmogGuideSection_8'),
    core.GuideSections.Text('TransmogGuideSection_9'),
}

table.insert(core.Modules, core.GuideModule('TransmogGuide', sections, 'Guide'))
