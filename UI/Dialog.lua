local WIT, core = ...

function core.UI.ShowDialog(options)
    if not StaticPopupDialogs["WIT_Dialog"] then
        StaticPopupDialogs["WIT_Dialog"] = {
            text = '%s',
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            exclusive = true,
            enterClicksFirstButton = true,
            preferredIndex = STATICPOPUP_NUMDIALOGS
        }
    end

    local dialog = StaticPopupDialogs["WIT_Dialog"]

    dialog.button1 = options.Button1
    dialog.button2 = options.Button2
    dialog.button3 = options.Button3

    dialog.hasEditBox = options.HasEditBox or false

    dialog.OnAccept = options.OnAccept
    dialog.OnCancel = options.OnCancel
    dialog.OnAlt = options.OnAlt

    local widget = StaticPopup_Show("WIT_Dialog", options.Text)

    widget.data = options.Data

    if options.HasEditBox then
        local editBox = widget.editBox

        editBox:SetNumeric(options.IsNumeric or false)

        editBox:SetScript("OnEnterPressed", function() widget.button1:Click() end)
        editBox:SetScript("OnEscapePressed", function() widget.button2:Click() end)

        if options.TextBoxValue then
            editBox:SetText(options.TextBoxValue)

            if options.SelectText then
                editBox:HighlightText(0, options.TextBoxValue:len())
            end
        end
    end

    return widget
end

function core.UI.ConfirmableDialog(options)
    options.Button1 = options.Button1 or core.GetString("Yes")
    options.Button2 = options.Button2 or core.GetString("No")
    return core.UI.ShowDialog(options)
end

function core.UI.InputDialog(options)
    options.Button1 = options.Button1 or core.GetString("Accept")
    options.Button2 = options.Button2 or core.GetString("Cancel")
    return core.UI.ShowDialog(options)
end

function core.UI.WarningDialog(options)
    options.Button1 = options.Button1 or core.GetString("Ok")

    return core.UI.ShowDialog(options)
end

