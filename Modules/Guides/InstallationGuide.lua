local WIT, core = ...

local sections = {
    core.GuideSections.Text('InstallationGuideSection_1')
}

core.InstallationGuide = core.GuideModule('Installation', sections, 'NotInMenu')
table.insert(core.Modules, core.InstallationGuide)
