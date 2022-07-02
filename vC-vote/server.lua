local QBCore = exports['qb-core']:GetCoreObject()






QBCore.Functions.CreateCallback('vC-vote:hasPlayerVoted', function(source,cb)
    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./votes.json")
    local Player = QBCore.Functions.GetPlayer(source)
    local cid = Player.PlayerData.citizenid
    local tablo = json.decode(loadFile)
    print(json.encode(tablo))


    if json.encode(tablo) == '{}' then
        cb(true)
    end

    if tablo[cid] == nil then
        print('burda')
        cb(true)
    else
        cb(false)


    end


end)




RegisterServerEvent('vC-vote:voteWithData', function(data)

    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./votes.json")
    local Player = QBCore.Functions.GetPlayer(source)
    local cid = Player.PlayerData.citizenid
    local tablo = json.decode(loadFile)
    tablo[cid] = {vote = data}
    SaveResourceFile(GetCurrentResourceName(), "votes.json", json.encode(tablo), -1)
    if vCode.GiveItem then
        local info = {
            election = vCode.ElectionName,
        }
        Player.Functions.AddItem('votingpin',1, false, info)
    end
end)


QBCore.Functions.CreateCallback('vC-vote:countCallback', function(source,cb)
    local toplamvotes = 0
    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./votes.json")


    for k,v in pairs(vCode.Options) do
        v.count = 0
    end
    local tablo = json.decode(loadFile)
    for k, v in pairs(tablo) do
        vote = v.vote

        toplamvotes = toplamvotes + 1
        vCode.Toplam = toplamvotes 
        print(k, json.encode(v))

        vCode.Options[vote].count = vCode.Options[vote].count + 1

    end

    cb(vCode)

end)
--[[
    local tablo = json.decode(loadFile)
    table.insert(tablo, information)
    table.insert(tablo, info1rmation)
    SaveResourceFile(GetCurrentResourceName(), "votes.json", json.encode(tablo), -1)



]]--
