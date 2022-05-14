----------------------------------------
---- Flood escape 2 to V2 converter ----
----------------------------------------

function valueToAttribute(value)
	if value:IsA("ValueBase") then
		local par = value.Parent
		par:SetAttribute(value.Name, value.Value)
		value:Destroy()
	end
end

return function(oldMap, options)
	local map = oldMap:Clone()
	map.Name = map.Name.."_Converted"
	map.Parent = oldMap.Parent

	-- Convert settings --
	local newSettingsFolder = Instance.new("Folder")
	local main = Instance.new("Configuration")
	main.Name = "Main"
	main.Parent = newSettingsFolder

	local lighting = Instance.new("Configuration")
	lighting.Name = "Lighting"
	lighting.Parent = newSettingsFolder

	local button = script.Button:Clone()
	button.Parent = newSettingsFolder

	local liquidTypes = Instance.new("Folder")
	liquidTypes.Name = "Liquids"
	liquidTypes.Parent = newSettingsFolder

	for _,v in next, map.Settings:GetChildren() do
		if v:IsA("ValueBase") then
			v.Parent = main
		end
	end
	for _,v in next, map.Settings.Lighting:GetChildren() do
		v.Parent = lighting
		valueToAttribute(v)
	end

	newSettingsFolder.Name = "Settings"
	map.Settings:Destroy()
	newSettingsFolder.Parent = map

	main.BGM.Name = "Music"
	main.MapName.Name = "Name"
	main.MapImage.Name = "Image"
	main:SetAttribute("MusicVolume", 0.5)

	for _,v in next, main:GetChildren() do
		valueToAttribute(v)
	end

	local es = map:FindFirstChild("EventString")
	if es then
		local s = Instance.new("Script", map)
		s.Name = "EventScript"
		s.Source = es.Value
		es:Destroy()
	end

	-- Convert map objects --

	map.EventScript.Name = "MapScript"
	local les = map:FindFirstChild("LocalEventScript")
	if les then
		les.Name = "LocalMapScript"
	end

	local renames = {
		_Appear = "_Show",
		_Fade = "_Destroy"
	}

	for i,v in next, map:GetDescendants() do
		for o,p in next, renames do
			if v.Name:find(o) then
				v.Name = p .. v.Name:sub(#o+1,#v.Name)
			end
		end
		if v.Name:find("_Water") then
			v.Name = v.name:gsub("_Water","_Liquid")
			v:SetAttribute("Type", v:FindFirstChild("State") and v.State.Value or "water")

		elseif v.Name == "_Wall" then
			v.Name = "_WallJump"

		elseif v.Name == "AirTank" then
			if v:FindFirstChild("Hitbox") then
				v.PrimaryPart = v.Hitbox
				local newAirTank = script.AirTank:Clone()
				newAirTank:SetPrimaryPartCFrame(v:GetPrimaryPartCFrame())
				newAirTank.Parent = v.Parent
				v:Destroy()
			end

		elseif v.Name:find("_Button") then
			--v:SetAttribute("Group", (v:FindFirstChild("Group") and true or false))
		end
	end

	-- Convert map script --
	local s = map.MapScript.Source
	s = s:gsub(
		"workspace%.Multiplayer%.GetMapVals%:Invoke%(%)",
		"game.ServerStorage.Bindables.GetMapLib:Invoke()()"
	)
	s = s:gsub(
		"Lib%.Button:connect%(function%(p, bNo%) if Lib%.btnFuncs%[bNo%] then Lib%.btnFuncs%[bNo%]%(bNo, p%) end end%)",
		""
	)
	s = s:gsub(
		"--Has: Map, Script, Button, btnFuncs",
		""
	)
	s = s:gsub(
		"Lib%.Button",
		"Lib.ButtonPressed"
	)
	s = s:gsub(
		"_Water",
		"_Liquid"
	)
	local a
	repeat
		a = true
		s = s:gsub(
			"Lib%.Script%.moveWater(%b())",
			function(args)
				a = false
				if args:find(",.*true") then
					args = args:gsub(",%s*true", "")
					return "Lib:MovePartLocal"..args..""
				else
					return "Lib:MovePart"..args..""
				end
			end
		)
	until a
	repeat
		a = true
		s = s:gsub(
			"Lib%.Script%.setWaterState%((.*),(.*)%)",
			function(...)
				a = false
				local args = {...}
				return "Lib:SetLiquidType("..args[1]..","..args[2]..")"
			end
		)
	until a
	map.MapScript.Source = s
end