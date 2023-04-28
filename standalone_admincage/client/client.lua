RegisterCommand('admincage', function(_, args)
	TriggerServerEvent('admincage:handler', args)
end)

RegisterCommand('getLicense', function(_, args)
	if not Config.Debug then
		return
	end
	TriggerServerEvent('admincage:license', args)
end)