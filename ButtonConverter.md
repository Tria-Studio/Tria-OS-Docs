

# 0.7 Button Converter

## HOW TO USE

1. Load into studio and make sure your map is named "Map" AND  MAKE SURE YOUR MAP IS GROUPED
2. Find the Command Bar tab and copy the code below into the bar
3. Press Enter
4. Your map is now converted to 0.7 buttons
5. Select your map and upload it to your mapslot 
6. Publish your map using our Map Manager
7. Enjoy our advanced button customization system 

```lua

local map = workspace:FindFirstChild("Map") or workspace:FindFirstChildWhichIsA("Model")
if map then
	local _settings = map:FindFirstChild("Settings") 
	if _settings then
		local buttonfolder = _settings:FindFirstChild("Button") or _settings:FindFirstChild("Buttons")

		if buttonfolder then
            
			if buttonfolder.Name == "Buttons" then
				buttonfolder.Name = "Button"
			end

			if #buttonfolder:GetChildren() > 0 then
				warn("MAP HAS ALREADY BEEN CONVERTED???")
				return
			else

				local names  = {
					"Default",
					"Group",
					"PathChild",
				}

				for _,v in pairs(names) do
					local congif = Instance.new("Configuration")
					congif.Name = v
					congif.Parent = buttonfolder
				end

				local OLDTONEW = {
					DisabledColor = "InactiveColor",
					EnabledColor = "ActiveColor",
					PressedColor = "ActivatedColor"
				}

				for _,v in pairs(buttonfolder:GetAttributes()) do
					for x,y in pairs(OLDTONEW) do
						if buttonfolder:GetAttribute(tostring(x)) then

							local save = buttonfolder:GetAttribute(tostring(x))
							local RGBValues = string.split(tostring(save), ", ")

                            local color = Color3.new(table.unpack(RGBValues))
                            
                            buttonfolder:SetAttribute(tostring(x), nil)
							for _,v in pairs(names) do
								buttonfolder[v]:SetAttribute(y , Color3.fromRGB(math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255)))
								buttonfolder[v]:SetAttribute("LocatorImage", "")
								buttonfolder[v]:SetAttribute("ActivatedSound", "")
							end
						end
					end
				end

				local groupbuttoncolor = buttonfolder:GetAttribute("EnabledGroupColor")
				if groupbuttoncolor then
					buttonfolder["Group"]:SetAttribute("ActivatedColor", groupbuttoncolor)
					buttonfolder:SetAttribute("EnabledGroupColor", nil)
				end

				local locatorimage = buttonfolder:GetAttribute("LocatorImage")
				if locatorimage then
					for _,v in pairs(buttonfolder:GetChildren()) do
						buttonfolder[v.Name]:SetAttribute("LocatorImage", locatorimage)
					end
				end

				buttonfolder:SetAttribute("LocatorImage", nil)

				warn("MAP CONVERTED TO 0.7 BUTTONS")

			end
		else
			error("CANT FIND BUTTONSETTINGS")
		end
	else
		error("CANT FIND SETTINGS")
	end
	error("CANT FIND MAP")
end
```