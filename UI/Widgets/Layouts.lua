local AceGUI = LibStub and LibStub("AceGUI-3.0", true)

AceGUI:RegisterLayout("WITList",
	function(content, children)
		local height = 0
		local width = 0
        local fill = false
		for i = 1, #children do
			local child = children[i]
			
            if child.width ~= "fill" and child.width ~= "relative" then
                local childWidth = child.frame:GetWidth()
                width = (width < childWidth) and childWidth or width
            elseif child.width == "fill" then
                fill = true
            end
		end

        if fill then
            width = content:GetParent():GetWidth()
        else 
            local contentWidth = content.width or content:GetWidth() or 0
            width = width < contentWidth and contentWidth or width
        end

        content.width = width

		for i = 1, #children do
			local child = children[i]
			
			local frame = child.frame
			frame:ClearAllPoints()
			frame:Show()
			if i == 1 then
				frame:SetPoint("TOPLEFT", content)
			else
				frame:SetPoint("TOPLEFT", children[i-1].frame, "BOTTOMLEFT")
			end
			
			if child.width == "fill" then
				child:SetWidth(width)
				frame:SetPoint("RIGHT", content)
				
				if child.DoLayout then
					child:DoLayout()
				end
			elseif child.width == "relative" then
				child:SetWidth(width * child.relWidth)
				
				if child.DoLayout then
					child:DoLayout()
				end
			end
			
			height = height + (frame.height or frame:GetHeight() or 0)
		end
		content.obj.LayoutFinished(content.obj, width, height)
	end)

AceGUI:RegisterLayout("WITOffset",
	function(content, children)
		for i = 1, #children do
			local child = children[i]
			local frame = child.frame
			frame:ClearAllPoints()
			frame:Show()
			if i == 1 then
				frame:SetPoint("BOTTOMLEFT", content, "BOTTOMLEFT", child.OffsetX or 0, child.OffsetY or 0)
			else
				frame:SetPoint("BOTTOMLEFT", children[i-1].frame, "BOTTOMRIGHT", child.OffsetX or 0, child.OffsetY or 0)
			end
		end
		content.obj.LayoutFinished(content.obj, content:GetWidth(), content:GetHeight() or 1)
	end)