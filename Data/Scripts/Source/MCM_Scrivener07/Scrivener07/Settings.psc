ScriptName Scrivener07:Settings extends Quest
import Scrivener07:MCM
import Scrivener07:Papyrus

string Modification = "MCM_Scrivener07" const

; Identifiers
string fHUDOpacity = "fHUDOpacity:INIT" const
string bCrosshairEnabled = "bCrosshairEnabled:INIT" const
string iInventoryAskQuantityAt = "iInventoryAskQuantityAt:GMST" const
string iHUDEnemyHealthSkullIconLevelDifference = "iHUDEnemyHealthSkullIconLevelDifference:GMST" const
string iTerminalDisplayRate = "iTerminalDisplayRate:GMST" const


; Events
;---------------------------------------------

Event OnInit()
	If (MCM.IsInstalled())
		RegisterForSettingChange(self, Modification)
	Else
		WriteLine(self, "No MCM is installed.")
	EndIf
EndEvent


Function OnMCMSettingChange(string modName, string id)
	WriteLine(self, "OnChanged(modName="+modName+", id="+id+")")
	If (modName == Modification)
		If (id == fHUDOpacity)
			float value = MCM.GetModSettingFloat(Modification, fHUDOpacity)
			Utility.SetINIFloat("fHUDOpacity", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

		If (id == bCrosshairEnabled)
			bool value = MCM.GetModSettingBool(Modification, bCrosshairEnabled)
			Utility.SetINIBool("bCrosshairEnabled", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

		If (id == iInventoryAskQuantityAt)
			int value = MCM.GetModSettingInt(Modification, iInventoryAskQuantityAt)
			Game.SetGameSettingInt("iInventoryAskQuantityAt", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

		If (id == iHUDEnemyHealthSkullIconLevelDifference)
			int value = MCM.GetModSettingInt(Modification, iHUDEnemyHealthSkullIconLevelDifference)
			Game.SetGameSettingInt("iHUDEnemyHealthSkullIconLevelDifference", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

		If (id == iTerminalDisplayRate)
			int value = MCM.GetModSettingInt(Modification, iTerminalDisplayRate)
			Game.SetGameSettingInt("iTerminalDisplayRate", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

	Else
		WriteLine(self, "The modName "+modName+" was unhandled.")
	EndIf
EndFunction


; Methods
;---------------------------------------------

Function HelloWorld(string text) Global
	WriteMessage("Button Click", "Hello "+text)
EndFunction
