local Type, Version = "WITScrollFrame", 24
local AceGUI = LibStub and LibStub("AceGUI-3.0", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end

-- Lua APIs
local pairs, assert, type = pairs, assert, type
local min, max, floor, abs = math.min, math.max, math.floor, math.abs

-- WoW APIs
local CreateFrame, UIParent = CreateFrame, UIParent

--[[-----------------------------------------------------------------------------
Support functions
-------------------------------------------------------------------------------]]
local function FixScrollOnUpdate(frame)
	frame:SetScript("OnUpdate", nil)
	frame.obj:FixScroll()
end

--[[-----------------------------------------------------------------------------
Scripts
-------------------------------------------------------------------------------]]
local function ScrollFrame_OnMouseWheel(frame, value)
	frame.obj:MoveScroll(value)
end

local function ScrollFrame_OnSizeChanged(frame)
	frame:SetScript("OnUpdate", FixScrollOnUpdate)
end

local function VScrollbar_OnScrollValueChanged(frame, value)
	frame.obj:SetScroll(value, frame.obj.hScrollbar:GetValue())
end

local function HScrollbar_OnScrollValueChanged(frame, value)
	frame.obj:SetScroll(frame.obj.vScrollbar:GetValue(), value)
end

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]
local methods = {
	["OnAcquire"] = function(self) 
		self:SetScroll(0, 0)
		self.scrollframe:SetScript("OnUpdate", FixScrollOnUpdate)
	end,

	["OnRelease"] = function(self)
		self.status = nil
		for k in pairs(self.localstatus) do
			self.localstatus[k] = nil
		end
		self.scrollframe:SetPoint("BOTTOMRIGHT")
		self.vScrollbar:Hide()
		self.vScrollbarShown = nil
		self.hScrollbar:Hide()
		self.hScrollbarShown = nil
		self.content.height, self.content.width = nil, nil
	end,

	["SetScroll"] = function(self, vvalue, hvalue)
		local status = self.status or self.localstatus
		local viewheight = self.scrollframe:GetHeight()
        local viewwidth = self.scrollframe:GetWidth()
		local height = self.content:GetHeight()
        local width = self.content:GetWidth()
		local voffset, hoffset

		if viewheight > height then
			voffset = 0
		else
			voffset = floor((height - viewheight) / 1000.0 * vvalue)
		end

        if viewwidth > width then
			hoffset = 0
		else
			hoffset = floor((width - viewwidth) / 1000.0 * hvalue)
		end

		self.content:ClearAllPoints()
		self.content:SetPoint("TOPLEFT", -hoffset, voffset)
		--self.content:SetPoint("TOPRIGHT", -hoffset, voffset)
		status.voffset = voffset
        status.hoffset = hoffset
		status.vscrollvalue = vvalue
        status.hscrollvalue = hvalue
	end,

	["MoveScroll"] = function(self, value)
		local status = self.status or self.localstatus
		local height, viewheight = self.scrollframe:GetHeight(), self.content:GetHeight()
		
		if self.vScrollbarShown then
			local diff = height - viewheight
			local delta = 1
			if value < 0 then
				delta = -1
			end
			self.vScrollbar:SetValue(min(max(status.vscrollvalue + delta*(1000/(diff/45)),0), 1000))
		end
	end,

	["FixScroll"] = function(self)
		if self.updateLock then return end
		self.updateLock = true
		local status = self.status or self.localstatus
		local height, viewheight = self.scrollframe:GetHeight(), self.content:GetHeight()
        local width, viewwidth = self.scrollframe:GetWidth(), self.content:GetWidth()

		local voffset = status.voffset or 0
        local hoffset = status.hoffset or 0
		local curvaluev = self.vScrollbar:GetValue()
        local curvalueh = self.hScrollbar:GetValue()

        local showVScrollbar = false
        local showHScrollbar = false
        local refreshLayout = false

		if viewheight >= height + ((viewwidth >= width + 2) and not self.hScrollbarShown and 22 or 2) then
            showVScrollbar = true
		end

		if viewwidth >= width + (showVScrollbar and not self.vScrollbarShown and 22 or 2) then
            showHScrollbar = true
		end

        if (self.vScrollbarShown ~= showVScrollbar) or (self.hScrollbarShown ~= showHScrollbar) then
		    self.vScrollbarShown = showVScrollbar
		    self.vScrollbar:SetShown(showVScrollbar)

            if not showVScrollbar then
		        self.vScrollbar:SetValue(0)
            end

		    self.hScrollbarShown = showHScrollbar
		    self.hScrollbar:SetShown(showHScrollbar)

            if not showHScrollbar then
		        self.hScrollbar:SetValue(0)
            end

            self.scrollframe:SetPoint("BOTTOMRIGHT", showVScrollbar and -20 or 0, showHScrollbar and 20 or 0)
            self:DoLayout()
		end

        if showVScrollbar or showHScrollbar then
			local vvalue = 0
            local hvalue = 0

            if showVScrollbar then
                vvalue = (voffset / (viewheight - height) * 1000)
                if vvalue > 1000 then vvalue = 1000 end
            end

            if showHScrollbar then
                hvalue = (hoffset / (viewwidth - width) * 1000)
                if hvalue > 1000 then hvalue = 1000 end
            end
			
			self.vScrollbar:SetValue(vvalue)
            self.hScrollbar:SetValue(hvalue)
			self:SetScroll(vvalue, hvalue)
        end
		self.updateLock = nil
	end,

	["LayoutFinished"] = function(self, width, height)
        self.content:SetWidth(width or 0 + 20)
		self.content:SetHeight(height or 0 + 20)
		self.scrollframe:SetScript("OnUpdate", FixScrollOnUpdate)
	end,

	["SetStatusTable"] = function(self, status)
		assert(type(status) == "table")
		self.status = status
        status.vscrollvalue = status.vscrollvalue or 0
        status.hscrollvalue = status.hscrollvalue or 0
	end,

	["OnWidthSet"] = function(self, width)
		local content = self.content
		content.width = width
	end,

	["OnHeightSet"] = function(self, height)
		local content = self.content
		content.height = height
	end
}

--[[-----------------------------------------------------------------------------
Constructor
-------------------------------------------------------------------------------]]
local function Constructor()
	local frame = CreateFrame("Frame", nil, UIParent)
	local num = AceGUI:GetNextWidgetNum(Type)

	local scrollframe = CreateFrame("ScrollFrame", nil, frame)
	scrollframe:SetPoint("TOPLEFT")
	scrollframe:SetPoint("BOTTOMRIGHT")
	scrollframe:EnableMouseWheel(true)
	scrollframe:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel)
	scrollframe:SetScript("OnSizeChanged", ScrollFrame_OnSizeChanged)

	local vScrollbar = CreateFrame("Slider", ("AceConfigDialogScrollFrame%dVScrollbar"):format(num), scrollframe)
	vScrollbar:SetPoint("TOPLEFT", scrollframe, "TOPRIGHT", 4, 0)
	vScrollbar:SetPoint("BOTTOMLEFT", scrollframe, "BOTTOMRIGHT", 4, 0)
	vScrollbar:SetMinMaxValues(0, 1000)
	vScrollbar:SetValueStep(1)
	vScrollbar:SetValue(0)
	vScrollbar:SetWidth(16)
	vScrollbar:Hide()
	-- set the script as the last step, so it doesn't fire yet
	vScrollbar:SetScript("OnValueChanged", VScrollbar_OnScrollValueChanged)

    local scrollbgtv = vScrollbar:CreateTexture(nil, "BACKGROUND")
    scrollbgtv:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
    vScrollbar:SetThumbTexture(scrollbgtv)

	local scrollbg = vScrollbar:CreateTexture(nil, "BACKGROUND")
	scrollbg:SetAllPoints(vScrollbar)
	scrollbg:SetColorTexture(0, 0, 0, 0.4)

    local hScrollbar = CreateFrame("Slider", ("AceConfigDialogScrollFrame%dHScrollbar"):format(num), scrollframe)
    hScrollbar:SetOrientation('HORIZONTAL')
	hScrollbar:SetPoint("TOPLEFT", scrollframe, "BOTTOMLEFT", 0, -4)
    hScrollbar:SetPoint("TOPRIGHT", scrollframe, "BOTTOMRIGHT", 0, -4)
	hScrollbar:SetMinMaxValues(0, 1000)
	hScrollbar:SetValueStep(1)
	hScrollbar:SetValue(0)
	hScrollbar:SetHeight(16)
	hScrollbar:Hide()
	-- set the script as the last step, so it doesn't fire yet
	hScrollbar:SetScript("OnValueChanged", HScrollbar_OnScrollValueChanged)

    local scrollbgth = hScrollbar:CreateTexture(nil, "BACKGROUND")
    scrollbgth:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
    hScrollbar:SetThumbTexture(scrollbgth)

	local scrollbgh = hScrollbar:CreateTexture(nil, "BACKGROUND")
	scrollbgh:SetAllPoints(hScrollbar)
	scrollbgh:SetColorTexture(0, 0, 0, 0.4)

	--Container Support
	local content = CreateFrame("Frame", nil, scrollframe)
	content:SetPoint("TOPLEFT")
    content:SetWidth(100)
	content:SetHeight(400)
	scrollframe:SetScrollChild(content)

	local widget = {
		localstatus = { vscrollvalue = 0, hscrollvalue = 0 },
		scrollframe = scrollframe,
		vScrollbar   = vScrollbar,
        hScrollbar   = hScrollbar,
		content     = content,
		frame       = frame,
		type        = Type
	}
	for method, func in pairs(methods) do
		widget[method] = func
	end
	scrollframe.obj, vScrollbar.obj, hScrollbar.obj = widget, widget, widget

	return AceGUI:RegisterAsContainer(widget)
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
