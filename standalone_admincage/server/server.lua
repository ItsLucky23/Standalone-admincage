playernames = '' -- dont change
playerids = '' -- dont change

RegisterNetEvent('admincage:handler')
AddEventHandler('admincage:handler', function(args)

    local _source = source

    if not IsPlayerAceAllowed(_source, "admin") then
        return
    end

    if args[1] == 'true' then
        SetPlayerRoutingBucket(_source, 1)

    elseif args[1] == 'false' then
        SetPlayerRoutingBucket(_source, 0)

    end

    if #args > 0 then

        for i = 1, #args do

            if i ~= 1 then

                if #GetPlayerIdentifiers(args[i]) > 0 then

                    playernames = playernames..GetPlayerName(args[i])..' '
                    playerids = playerids..args[i]..' '

                    if GetPlayerRoutingBucket(args[i]) ~= 0 then
                        SetPlayerRoutingBucket(args[i], 0)

                    else
                        SetPlayerRoutingBucket(args[i], 1)

                    end

                end

            end

        end

    end

    if #args > 1 then
        message = GetPlayerName(source).. ' Admincaged ' ..playernames.. 'id(s): '..playerids
        PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end

    playernames = '' -- dont change
    playerids = '' -- dont change

end)

RegisterNetEvent('admincage:license')
AddEventHandler('admincage:license', function(args)

    if #args > 0 then

        for i = 1, #args do

            print('ID ' ..args[1].. ' license = ' ..GetPlayerIdentifiers(args[1])[1]) 

        end

    end

end)