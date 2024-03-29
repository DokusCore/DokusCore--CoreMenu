--------------------------------------------------------------------------------
----------------------------------- DevDokus -----------------------------------
--------------------------------------------------------------------------------
----------------------- I feel a disturbance in the force ----------------------
--------------------------------------------------------------------------------
SteamID, CharID = nil, nil
SetMusic, SetVolume = 1, 0.3
SetAutoPlay, AutoPlayWarning = false, false
Language = nil
AutoMoveOn = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
IsAnyMenuOpen    = false
IsMainMPShown    = false
IsInventOpen     = false
IsUserMenuOpen   = false
IsAdminMenuOpen  = false
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Prompt_Settings       = nil
Prompt_Invent         = nil
Prompt_AdminMenu      = nil
Prompt_AdminMenuV2    = nil
Prompt_Zoning         = nil
Prompt_AutoDriveStart = nil
Prompt_AutoDriveStop  = nil
Prompt_UnEqWeapon     = nil
Prompt_HorseCall      = nil
Prompt_HorseFollow    = nil
Prompt_HorseStay      = nil
Prompt_ObjMenu        = nil
Group                 = GetRandomIntInRange(0, 0xffffff)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.CoreMenu) then
    while (not FrameReady()) do Wait(1000) end
    while (not UserInGame()) do Wait(1000) end
    local Sync = TCTCC('DokusCore:Sync:Get:UserData')
    SteamID, CharID = Sync.SteamID, Sync.CharID
    local Data = TSC('DokusCore:Core:DBGet:Settings', { 'User', { SteamID } }).Result[1]
    SetVolume, Language, SetMusic = Data.Volume, Data.Language, Data.Music
    NoteObjective(SYS("System").MSG, MSG("Initialize").MSG, "Horn", Floor(MSG("Initialize").Time * 1000))
    NoteObjective(SYS("System").MSG, MSG("Initialize2").MSG, "Horn", Floor(MSG("Initialize2").Time * 1000))
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CreateThread(function()
  if (_Modules.CoreMenu) then
    while (not (FrameReady())) do Wait(1000) end
    while (not (UserInGame())) do Wait(1000) end
    while true do Wait(1)
      while (not (IsMainMPShown) and (not (IsAnyMenuOpen))) do Wait(1)
        local Alt = IsControlJustPressed(0, _Keys.LALT)
        if ((Alt and (not (IsMainMPShown)))) then OpenMenu() end
      end

      while (IsMainMPShown) do Wait(1)
        local Alt = IsControlJustPressed(0, _Keys.LALT)
        if ((Alt) and (IsMainMPShown)) then CloseMenu() end
      end
    end
  end
end)
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
















































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
