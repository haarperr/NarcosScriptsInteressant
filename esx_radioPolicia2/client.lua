ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('RequestBackup')
AddEventHandler('RequestBackup', function(s, playername, message)
	local player = GetPlayerPed(-1)
    local src = s
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
	
	if PlayerData.job.name == Config.jobname then
        
		TriggerEvent('chatMessage', "", {19, 112, 211}, " ^**Pedido de Reforços[" .. playername .. "]*^0:^r" .. message)
        SetNewWaypoint(coords.x, coords.y)
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		Wait(500)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    end
end)

RegisterNetEvent('departamento')
AddEventHandler('departamento', function(s, playername, message)
	local player = GetPlayerPed(-1)
    local src = s
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
	
	if PlayerData.job.name == Config.jobname or PlayerData.job.name == Config.jobnameInem then
        
		TriggerEvent('chatMessage', "", {255, 200, 0}, " ^**[DEPARTAMENTO][" .. playername .. "]*^0:^r" .. message)
        SetNewWaypoint(coords.x, coords.y)
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		Wait(500)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
    end
end)

RegisterNetEvent('RequestBackupAnim')
AddEventHandler('RequestBackupAnim', function()
	local player = GetPlayerPed(-1)
	if PlayerData.job.name == Config.jobname or PlayerData.job.name == Config.jobnameInem then
		if (DoesEntityExist(player) and not IsEntityDead(player) )then
			RequestAnimDict("timetable@ron@hand_radio_ig_1")
			while (not HasAnimDictLoaded("timetable@ron@hand_radio_ig_1")) do
				Citizen.Wait(100)
			end
			SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
			TaskPlayAnim(player,"timetable@ron@hand_radio_ig_1","ig_1_base",8.0,2.5,-1,49,0,0,0,0)
			Citizen.Wait(2000)
			ClearPedSecondaryTask(player)
		end
	end
end)
