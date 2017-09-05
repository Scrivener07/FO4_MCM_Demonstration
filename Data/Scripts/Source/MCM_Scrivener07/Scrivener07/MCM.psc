ScriptName Scrivener07:MCM Const Native Hidden
{Extensions for MCM script.}

Function RegisterForSettingChange(ScriptObject script, string modName, string callback = "OnMCMSettingChange") Global
    script.RegisterForExternalEvent("OnMCMSettingChange|"+modName, callback)
EndFunction


Function UnregisterForSettingChange(ScriptObject script, string modName) Global
    script.UnregisterForExternalEvent("OnMCMSettingChange|"+modName)
EndFunction
