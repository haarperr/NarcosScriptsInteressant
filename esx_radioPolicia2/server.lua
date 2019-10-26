function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end

TriggerEvent('es:addCommand', 'bk', function(source, args)
  	local grupos = getIdentity(source)
	
    if grupos.job == 'police' then
	    TriggerClientEvent("RequestBackup", -1, source,grupos.firstname, table.concat(args, " "))
		TriggerClientEvent("RequestBackupAnim", source)
	end
end)

TriggerEvent('es:addCommand', 'dep', function(source, args)
  	local grupos = getIdentity(source)
	
    if grupos.job == 'police' or grupos.job == 'ambulance' then
	    TriggerClientEvent("departamento", -1, source,grupos.firstname, table.concat(args, " "))
		TriggerClientEvent("RequestBackupAnim", source)
	end
end)