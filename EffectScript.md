# EffectScript

## How it works
 
EffectScript is a localscript inside of the Tria.OS Map Making Kit, it should be used as an alternative to the LocalMapScript if you want your code to be replicated to other spectators.
 
In order for the EffectScript to communicate we use RemoteEvents which are fired from the MapScript to the EffectScript.
 
When a round starts all the old EffectScripts are deleted and if a new EffectScript is present, the script will be inserted into the Players PlayerGUI, this is to prevent the EffectScript from being deleted if the player dies.

If you wish to manually edit the EffectScript the location of it is `game.Players.LocaPlayer.PlayerGUI.Timer`
Keep in mind that reparenting the EffectScript will cause the EffectScript not to be deleted on the next round and can potentially cause memory leaks.

## Examples of usage

The EffectScript uses the same methods as the MapScript to get the MapLib, being 
`local MapLib = game.GetMapLib:Invoke()()`