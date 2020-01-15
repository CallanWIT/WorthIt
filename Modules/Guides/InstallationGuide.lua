local WIT, core = ...

local sections = {
    core.GuideSections.Heading('InstallationGuideSection_1'),
    core.GuideSections.Text('InstallationGuideSection_2'),
    core.GuideSections.Heading('InstallationGuideSection_3'),
    core.GuideSections.Text('InstallationGuideSection_4'),
    core.GuideSections.Heading('InstallationGuideSection_5'),
    core.GuideSections.Text('InstallationGuideSection_6'),
    core.GuideSections.Heading('InstallationGuideSection_7'),
    core.GuideSections.Text('InstallationGuideSection_8'),
    core.GuideSections.Heading('InstallationGuideSection_9'),
    core.GuideSections.Text('InstallationGuideSection_10'),
    core.GuideSections.Image('Interface\\AddOns\\WIT\\Images\\Guides\\install_app_settings.jpeg', 1024, 512),
    core.GuideSections.Text('InstallationGuideSection_11'),
    core.GuideSections.Image('Interface\\AddOns\\WIT\\Images\\Guides\\install_add_realm.jpeg', 1024, 512),
    core.GuideSections.Text('InstallationGuideSection_12'),
}

core.InstallationGuide = core.GuideModule('Installation', sections, 'NotInMenu')
table.insert(core.Modules, core.InstallationGuide)
