--[[   TRIA.os MAP KIT DOCUMENTATION    ]]--
--[[
                &#BGGPPPPPPPPGGB#&                
            &#GGGGB#&&&    &&&#BGGGG#&            
          #GPG#&                  &#GPG#          
        #PPB&                        &BPP#        
      &GP#                              #PG&      
     BPB                                  BPB     
    GP#                                    #PG    
   GP&                                      &PG   
  GP&                                        &PG  
 #5#                                          #5# 
&PG                   &#BB#&                   GP&
BP&                 BPGBBBBGPB                 &PB
GP                &GP/      \PG&                PG
PG                GP/        \PB                GP
PG                PG          GP                GP
PG                GP\        /PB                GP
GP                 PP\      /PP                 PG
BP&               BPGPGB  BGPGPB               &PB
&PG              BP#  GP  PG  #PB              GP&
 #5#            BP#   GP  PG   #PB            #5# 
  GP&          BP#    GP  PG    #PB          &PG  
   GP&        BP#     GP  PG     #PB        &PG   
    GP#      BP#      GP  PG      #PB      #PG    
     BPB    BP#       GP  PG       #PB    BPB     
      &GP# BP#        GP  PG        #PB #PG&      
        #GP5B         GP  PG         B5PG#        
          #GPG#&      GP  PG      &#GPG#          
            &#GGGGB#&&GP  PG&&#BGGGG#&            
                &#BGGPPP  PPPGGB#&                          
]]	   

--[[INDEX

A-General
	1-Map Functionallity
	2-Audio
	
B-Parts
	1-Spawn
	2-ExitRegion
	3-ExitBlock
	4-Walljumps
	5-Wallruns
	6-Liquids
	7-Buttons
	8-Button Effects
	
C-Settings
	1-Sliding

]]

--[[SECTION A GENERAL

1	-MAP FUNCTIONALITY-
	Every map needs a MapScript, ExitRegion, Spawn, Settings.
	A map with buttons will need the buttons to be pressed before ExitRegion can be used.
	
2	-AUDIO-
	Audio MUST be free to use for non commercial purposes or commercial purposes.
	TRIA.os is not ran for a commercial profit, and the only profit made is through premium users playing the game and will continue like this forever.
	Audio functionallity is currently unknown, with recent roblox changes.
	
3	-

]]

--[[SECTION B PARTS

1	-SPAWN-
	Part named Spawn
	The point at which the players will spawn, with the front of the part being where players spawn

2	-EXITREGION-
	Part named ExitRegion
	When player enters this block the round is won if all buttons are pressed
	For more than ONE ExitRegion create a Folder or Model named ExitRegion, and all parts within it will be ExitRegion parts

3	-EXITBLOCK-
	Part named ExitBlock
	When a player enters ExitRegion, will turn to cancollide on to prevent players from leaving exit

4	-WALLJUMPS-
	Part with the name _WallJump and value _WallJump
	Creates a part which can be jumped from

5	-WALLRUNS-
	Part with the name _WallRun and value _WallRun
	_WallRun value contains the speed of the wallrun, how fast it is going
	Wallruns act as walljumps that move the player towards the local positive X direction

6	-LIQUIDS-
	Part with the name _Liquid
	There are three default liquid types, those being "water", "acid", and "lava" which can be changed in the mapscript or a value
	You can assign a part to be liquid by turning cancollide off and assigning a liquid type to it, either using a script or a StringValue
	To set it using a StringValue, add a StringValue to any liquid part, and rename it "Type". Then, set the Value to any liquid type.
	To set it using the script, use 'Lib.setLiquidType(Lib.Map._Water._Liquid#, "type")'
	
	See C-2 for custom liquids

7	-BUTTONS-
	Model named _ButtonXY where X is the number of the button and Y is its path
	
	Buttons are pressed sequentially, first button will always be pressed first
	I.E _Button1 will be the first button to be pressed and _Button2 will be the second button to be pressed
	
	Button Paths are for alternate button directions which will be activated at the same time
	I.E two buttons nammed _Button2A and _Button2B will be activated at the same time, pressing one of the buttons disables both
	
	Group buttons are a type of buttons where 50% of people have to press it before it's pressed. To make a group button, 
	insert a StringValue called "Group" inside of a button model
	
	You can use the default model for buttons or make your own. To make your own button, you can make it any design. However, it is required
	that it's in a model called "_Button#", the # being the button number, and there are 2 parts called "Hitbox" and "Light" inside of it,
	the hitbox being invisible and having cancollide off
	
	See C-3 for button settings.
	
8	-BUTTON EFFECTS
	Part with the value added _DestroyX _ExplodeX _FallX _HideX _ShowX where X is button number
	Inbuilt function to allow for parts to be changed without scripting, when X button is pressed the effect triggers
	_Destroy	-Destroys the part
	_Explode	-Creates an explosion from the part
	_Fall		-Makes the part unanchored
	_Hide		-Hides the part
	_Show		-Shows the part

]]

--[[SECTION C SETTINGS

]]
