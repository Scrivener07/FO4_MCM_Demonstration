ScriptName Scrivener07:Settings extends Quest
import Scrivener07:MCM
import Scrivener07:Papyrus

; Configuration
string Modification = "MCM_Scrivener07" const

; Identifiers
;---------------------------------------------

; INI Settings
string bBorderRegionsEnabled = "bBorderRegionsEnabled:INIT" const
string fHUDOpacity = "fHUDOpacity:INIT" const
string fPipboyEffectColorR = "fPipboyEffectColorR:INIT" const
string fPipboyEffectColorG = "fPipboyEffectColorG:INIT" const
string fPipboyEffectColorB = "fPipboyEffectColorB:INIT" const
string bCrosshairEnabled = "bCrosshairEnabled:INIT" const

; Game Settings
string fGunShellLifetime = "fGunShellLifetime:GMST" const

; Global Settings
string GameHour = "GameHour:GLOB" const
string TimeScale = "TimeScale:GLOB" const


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

		If (id == bBorderRegionsEnabled)
			bool value = MCM.GetModSettingBool(Modification, bBorderRegionsEnabled)
			Utility.SetINIBool("bBorderRegionsEnabled", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf


		If (id == fHUDOpacity)
			float value = MCM.GetModSettingFloat(Modification, fHUDOpacity)
			Utility.SetINIFloat("fHUDOpacity", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

		If (id == fPipboyEffectColorR)
			float value = MCM.GetModSettingFloat(Modification, fPipboyEffectColorR)
			Utility.SetINIFloat("fPipboyEffectColorR", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

		If (id == fPipboyEffectColorG)
			float value = MCM.GetModSettingFloat(Modification, fPipboyEffectColorG)
			Utility.SetINIFloat("fPipboyEffectColorG", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf

		If (id == fPipboyEffectColorB)
			float value = MCM.GetModSettingFloat(Modification, fPipboyEffectColorB)
			Utility.SetINIFloat("fPipboyEffectColorB", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf


		If (id == bCrosshairEnabled)
			bool value = MCM.GetModSettingBool(Modification, bCrosshairEnabled)
			Utility.SetINIBool("bCrosshairEnabled", value)
			WriteLine(self, "Set id "+id+" to value "+value)
			return
		EndIf





		If (id == fGunShellLifetime)
			float value = MCM.GetModSettingFloat(Modification, fGunShellLifetime)
			Game.SetGameSettingFloat("fGunShellLifetime", value)
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
