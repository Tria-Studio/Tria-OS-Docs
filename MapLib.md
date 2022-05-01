# Tria.OS Map Library

This does not include deprecated items.

## Methods
### MapLib:Alert(message: `string`, color: `Color3?`, length: `number?`): `nil`

Example:
```lua
MapLib:Alert("This is an Alert!", Color3.fromRGB(255, 255, 255), 10)
```
This function can be used to send a message to everyone, they can be customized by color and duration.

-----------------------------------------------------

### MapLib:AllowSliding(slideState: `boolean`): `nil`

Example:
```lua
MapLib:AllowSliding(true)
```
This function can be used to change sliding state in maps. True enables sliding and false disables sliding.

-----------------------------------------------------

### MapLib:ChangeMusic(musicId: `string|number`, volume: `number?`, startTick: `number?`): `nil`

Example:
```lua
MapLib:ChangeMusic(8166551934, 0.5, 5) --changes the background music to 8166551934 and plays it with the volume of 0.5 and the starttime of 5.
```
This function can be used to change the current music playing in maps, this also replicates to spectators.

-----------------------------------------------------

### MapLib:GetButtonEvent(buttonId: `number`): `Event`

Example:
```lua
MapLib:GetButtonEvent(5):Connect(function(player) -- player value here is the player that pressed the button.
    MapLib:Alert("Button 5 was pressed!", Color3.fromRGB(255, 255, 255), 4)
end)
```
This function is the equivalent of `Lib.btnFuncs[5] = function() end` in Flood Escape 2. It can be used to run functions once a button has been pressed.

-----------------------------------------------------

### MapLib:SetLiquidType(liquid: `BasePart`, liquidType: `string`): `nil`

Example:
```lua
MapLib:SetLiquidType(MapLib.map._Liquid1, "lava") -- changes Liquid1 to lava.
```
This function can be used to change the state of a liquid. There are 3 states you can choose from excluding custom states, these are "water", "acid" and "lava".

-----------------------------------------------------

### MapLib:MovePart(part: `BasePart`, movement: `Vector3`, duration: `number?`): `nil`

Example:
```lua
MapLib:MovePart(MapLib.map._Liquid2, Vector3.new(0, 20, 0), 5) -- moves _Liquid2 20 studs in 5 seconds
```
This function moves a part globally, and can be customized by final position and duration.

-----------------------------------------------------

### MapLib:MovePartLocal(part: `BasePart`, movement: `Vector3`, duration: `number?`): `nil`

Example:
```lua
MapLib:MovePartLocal(MapLib.map._Liquid1, Vector3.new(0, 20, 0), 5) -- moves _Liquid1 20 studs (depending on rotation) in 5 seconds
```
This function moves a part locally (dependent on rotation) and can be customized by final position and duration.

-----------------------------------------------------

### MapLib:GetFeature(featureName: `string`: [`Feature`](FeatureLib.md)

Example:
```lua
MapLib:GetFeature("Skills")
MapLib:GetFeature("Lighting")
```
-----------------------------------------------------

## Features
### MapLib:GetFeature("Lighting"):SetLighting(newLighting: { [string]: any })

Example:
```lua
MapLib:GetFeature("Lighting"):SetLighting({
        FogEnd = 100,
        FogStart = 1,
        FogColor = Color3.new(1, 0, 0),
        Ambient = Color3.new(1, 1, 0),
	OutdoorAmbient = Color3.new(1, 0, 1),
})
```
This function can be used to set the lighting of maps, such as the Ambient and FogColor. They can be customized.

## MapLib:GetFeature("Lighting"):EaseLighting(newLighting: { [string]: any }, tweenInfo: TweenInfo)

Example:
```lua
MapLib:GetFeature("Lighting"):EaseLighting({
	FogEnd = 100,
	FogStart = 1,
	FogColor = Color3.new(0, 1, 1),
},TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
```
This function tweens the lighting to the values set in the function. They can be customized by lighting and the way the lighting tweens.

## MapLib:GetFeature("Lighting"):EaseLighting(newLighting: { [string]: any }, tweenInfo: TweenInfo)
