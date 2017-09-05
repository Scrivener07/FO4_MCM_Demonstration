ScriptName Scrivener07:Settings extends Quest
import Scrivener07:MCM
import Scrivener07:Papyrus

; Configuration
string Modification = "MCM_Scrivener07" const

; Identifier
string bBorderRegionsEnabled = "bBorderRegionsEnabled:INIT" const
string fGunShellLifetime = "fGunShellLifetime:GMST" const


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


		ElseIf (id == fGunShellLifetime)

			float value = MCM.GetModSettingFloat(Modification, fGunShellLifetime)
			Game.SetGameSettingFloat("fGunShellLifetime", value)
			WriteLine(self, "Set id "+id+" to value "+value)


		Else
			WriteLine(self, "The id "+id+" was unhandled.")
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
