ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('99kr-burglary:Add')
AddEventHandler('99kr-burglary:Add', function(item, qtty)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.addInventoryItem(item, qtty)
end)

RegisterServerEvent('99kr-burglary:Remove')
AddEventHandler('99kr-burglary:Remove', function(item, qtty)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.removeInventoryItem(item, qtty)
end)

ESX.RegisterUsableItem('lockpick', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('99kr-burglary:Lockpick', _source)
	TriggerClientEvent('99kr-burglary:onUse', _source)
end)

RegisterNetEvent('99kr-burglary:removeKit')
AddEventHandler('99kr-burglary:removeKit', function()
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source)
		xPlayer.removeInventoryItem('lockpick', 1)
end)

RegisterNetEvent('99kr-burglary:stopanimlosea')
AddEventHandler('99kr-burglary:stopanimlosea', function()
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('99kr-burglary:stopanimlose', _source)
end)

RegisterNetEvent('99kr-burglary:stopanimwona')
AddEventHandler('99kr-burglary:stopanimwona', function()
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('99kr-burglary:stopanimwon', _source)
end)


            ---------- Pawn Shop --------------
RegisterServerEvent('99kr-burglary:sellring')
AddEventHandler('99kr-burglary:sellring', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local ring = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "ring" then
			ring = item.count
		end
	end
				
		if ring > 0 then
			xPlayer.removeInventoryItem('ring', 1)
			xPlayer.addMoney(30)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "€30 adicionados")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Não tens um anel para vender!")
		end
end)
			
RegisterServerEvent('99kr-burglary:sellrolex')
AddEventHandler('99kr-burglary:sellrolex', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local rolex = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "rolex" then
			rolex = item.count
		end
	end
				
		if rolex > 0 then
			xPlayer.removeInventoryItem('rolex', 1)
			xPlayer.addMoney(35)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "€35 adicionados")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Não tens um rolex para vender!")
		end
end)
			
RegisterServerEvent('99kr-burglary:sellcamera')
AddEventHandler('99kr-burglary:sellcamera', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local camera = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "camera" then
			camera = item.count
		end
	end
				
	    if camera > 0 then
		  xPlayer.removeInventoryItem('camera', 1)
			xPlayer.addMoney(60)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "€60 adicionados")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Não tens uma camera para vender!")
	    end
end)
			
RegisterServerEvent('99kr-burglary:sellgoldNecklace')
AddEventHandler('99kr-burglary:sellgoldNecklace', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local goldNecklace = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "goldNecklace" then
			goldNecklace = item.count
		end
	end
				
		if goldNecklace > 0 then
			xPlayer.removeInventoryItem('goldNecklace', 1)
			xPlayer.addMoney(55)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "€55 adicionados")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Não tens um colar de ouro para vender!")
		end
end)
			
RegisterServerEvent('99kr-burglary:selllaptop')
AddEventHandler('99kr-burglary:selllaptop', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local laptop = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "laptop" then
			laptop = item.count
		end
	end
				
		if laptop > 0 then
			xPlayer.removeInventoryItem('laptop', 1)
			xPlayer.addMoney(90)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "€90 adicionados")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Não tens um laptop para vender!")
		end
end)
			
			
RegisterServerEvent('99kr-burglary:sellsamsungS10')
AddEventHandler('99kr-burglary:sellsamsungS10', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local samsungS10 = 0
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "samsungS10" then
			samsungS10 = item.count
		end
	end
				
		if samsungS10 > 0 then
			xPlayer.removeInventoryItem('samsungS10', 1)
			xPlayer.addMoney(70)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "€70 adicionados")
		else 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Não tens um samsungS10 para vender!")
		end
end)
			
			
function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end
local CopsConnected = 0
function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end
CountCops()
ESX.RegisterServerCallback("99kr-burglary:checkCops",function(source,cb)
	cb(CopsConnected)
end)


RegisterServerEvent('kuana:abriucofrecasa')
AddEventHandler('kuana:abriucofrecasa', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randommoney = math.random( 300, 1250)
	local listitem = {[1] = "gold", [2] = "weed_pooch"}
	local randomitem = math.random( 1, 100)
	local randomqitem = math.random( 1, 15)
	local listweapon = { [1] = "weapon_pistol", [2] = "weapon_combatpistol",[3] = "weapon_microsmg",[4] = "weapon_molotov"}
	local randomweapon = math.random( 1, 100)

	if randomitem >= 10 and randomitem <= 20 then
		xPlayer.addInventoryItem(listitem[1], randomqitem)
	elseif randomitem >= 80 and randomitem <= 90 then
	    xPlayer.addInventoryItem(listitem[2], randomqitem)
	end
	
	if randomweapon >= 2 and randomweapon <= 10 then
		xPlayer.addWeapon(listweapon[1],250 )
	elseif randomweapon >= 15 and randomweapon <= 20 then
	    xPlayer.addWeapon(listweapon[2],250 )
    elseif randomweapon >= 24 and randomweapon <= 25 then
	    xPlayer.addWeapon(listweapon[3],250 )
	elseif randomweapon >= 21 and randomweapon <= 23 then  --Percentagem tem de ser diferente por exemplo 1 - 10 e 5-10 não pode ser porque se calhar 5 calha 2 armas
	    xPlayer.addWeapon(listweapon[4],250 )
	end
			
	xPlayer.addMoney(randommoney)
end)