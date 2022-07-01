local QBCore = exports['qb-core']:GetCoreObject()



RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)



RegisterNUICallback('getConfig', function(data,cb)
    cb(vCode)
end)

RegisterNUICallback('voteForSomeone', function(data)
    TriggerServerEvent('vC-vote:voteWithData', data.id)
end)

RegisterNUICallback('error', function()
    QBCore.Functions.Notify('Please Choose A Candidate!', 'error')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local pos = GetEntityCoords(PlayerPedId())
        for i=1, #vCode.Locations do

            local distance = GetDistanceBetweenCoords(pos, vCode.Locations[i], true)
            if distance < 3 then


                if IsControlJustPressed(0,38) then
                    TryToVote()
                end
            else

            end

        end

    end
end)


function TryToVote()
    QBCore.Functions.TriggerCallback('vC-vote:hasPlayerVoted', function(hasVoted)
        if hasVoted then

            SendNUIMessage({
                type = 'show',
            })
            SetNuiFocus(true, true)
        else
            QBCore.Functions.Notify('You Have Already Voted!', 'error')
        end
    end)

end

