# Tria.OS Map Library

This does not include deprecated items.

## Methods
### MapLib:Alert(message: `string`, color: `Color3?`, length: `number?`): `nil`

Example:
```lua
local MapLib = ServerStorage.Bindables.GetMapLib:Invoke()()

MapLib:Alert("This is an Alert!", Color3.fromRGB(255, 255, 255), 10)
```



### MapLib:ChangeMusic(musicId: `string|number`, volume: `number?`, startTick: `number?`): `nil`

### MapLib:GetButtonEvent(buttonId: `number`): `Event`

### MapLib:SetLiquidType(liquid: `BasePart`, liquidType: `string`): `nil`

### MapLib:MovePart(part: `BasePart`, movement: `Vector3`, duration: `number?`): `nil`

### MapLib:MovePartLocal(part: `BasePart`, movement: `Vector3`, duration: `number?`): `nil`

### MapLib:GetFeature(featureName: `string`): `Feature`

### MapLib:AllowSliding(slideState: `boolean`): `nil`

### MapLib:GetFeature(featureName: `string`: [`Feature`](FeatureLib.md)
