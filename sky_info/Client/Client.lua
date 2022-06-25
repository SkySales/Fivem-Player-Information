ESX = nil
local PlayerData = {}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNUICallback('showSOC', function()
    if ESX.PlayerData.job.grade_name == "boss" then
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
            exports['Roda_Notifications']:showNotify('Society Money : $'..money, 'info', 4000)
        end, ESX.PlayerData.job.name)
    else
        exports['Roda_Notifications']:showNotify('[BOSS] - Access Denied', 'error', 4000)
    end
end)

RegisterNUICallback('showID', function()
    exports['Roda_Notifications']:showNotify('Player ID - ' .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. '', 'info', 4000)
end)

RegisterNUICallback('showJOB', function()
    TriggerServerEvent('svEvent:showJOB', source)
end)

RegisterNUICallback('showCASH', function()
    TriggerServerEvent('svEvent:showCASH', source)
end)

RegisterNUICallback('showBANK', function()
    TriggerServerEvent('svEvent:showBANK', source)
end)

RegisterNUICallback('showDIRTY', function()
    TriggerServerEvent('svEvent:showDIRTY', source)
end)


RegisterCommand('openinfo', function(source)
	SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'OpenMenu',
    })
end, false)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
end)