ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end

RegisterServerEvent('svEvent:showJOB')
AddEventHandler('svEvent:showJOB', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    TriggerClientEvent('Roda_Notifications:showNotification', source, 'You are working as: ' .. job .. ' - ' .. jobgrade, 'info', 3000)
end)

RegisterServerEvent('svEvent:showCASH')
AddEventHandler('svEvent:showCASH', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local wallet = getMoneyFromUser(_source)
  
    TriggerClientEvent('Roda_Notifications:showNotification', source, 'You currently have $' .. wallet .. ' in your wallet', 'info', 3000)
end)

RegisterServerEvent('svEvent:showBANK')
AddEventHandler('svEvent:showBANK', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bank 			= getBankFromUser(_source)
    
    TriggerClientEvent('Roda_Notifications:showNotification', source, 'You currently have $' .. bank .. ' in your bank', 'info', 3000)
end)

RegisterServerEvent('svEvent:showDIRTY')
AddEventHandler('svEvent:showDIRTY', function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local black_money 	= getBlackMoneyFromUser(_source)
    
    TriggerClientEvent('Roda_Notifications:showNotification', source, 'You currently have $' .. black_money .. ' dirty money in your wallet', 'info', 3000)
end)