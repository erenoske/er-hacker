local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('er:server:hacking', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = math.random(1000, 3000)
    Player.Functions.AddMoney('bank', amount, 'Unkown money transfer')
end)


QBCore.Functions.CreateUseableItem("tablet", function(source)
    local src = source
    TriggerClientEvent("hack:client:hacker", src)
end)