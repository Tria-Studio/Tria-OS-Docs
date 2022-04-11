# Tria.OS Map Library

This does not include deprecated items.

## Methods
### MapLib:Alert(message: `string`, color: `Color3?`, length: `number?`): `nil`

Example:
```lua
local ServerStorage = game:GetService("ServerStorage")
local MapLib = ServerStorage.Bindables.GetMapLib:Invoke()()

MapLib:Alert("This is an Alert!", Color3.fromRGB(255, 255, 255), 10)
```
Alerts can be used to send a message to everyone, they can be customized by color and duration.

-----------------------------------------------------

### MapLib:AllowSliding(slideState: `boolean`): `nil`

Example:
```lua
local ServerStorage = game:GetService("ServerStorage")
local MapLib = ServerStorage.Bindables.GetMapLib:Invoke()()

MapLib:AllowSliding(true)
```
This function can be used to change sliding state in maps. True enables sliding and false disables sliding.

-----------------------------------------------------

### MapLib:ChangeMusic(musicId: `string|number`, volume: `number?`, startTick: `number?`): `nil`

```lua
local ServerStorage = game:GetService("ServerStorage")
local MapLib = ServerStorage.Bindables.GetMapLib:Invoke()()

Lib:ChangeMusic(8166551934, 0.5, 5) --changes the background music to 8166551934 and plays it with the volume of 0.5 and the starttime of 5
```
This function can be used to change the current music playing in maps, this also replicates to spectators.











### MapLib:GetButtonEvent(buttonId: `number`): `Event`

### MapLib:SetLiquidType(liquid: `BasePart`, liquidType: `string`): `nil`

### MapLib:MovePart(part: `BasePart`, movement: `Vector3`, duration: `number?`): `nil`

### MapLib:MovePartLocal(part: `BasePart`, movement: `Vector3`, duration: `number?`): `nil`

### MapLib:GetFeature(featureName: `string`: [`Feature`](FeatureLib.md)
