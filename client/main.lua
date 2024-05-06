local QBCore = exports['qb-core']:GetCoreObject()
local action = true
local PlayerData = {}

-- Handlers

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
	PlayerData = QBCore.Functions.GetPlayerData()
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)


RegisterNetEvent('hack:client:hacker')

AddEventHandler('hack:client:hacker', function()
    if PlayerData.job.name == 'hacker' then
        if action then 
            TriggerServerEvent('police:server:policeAlert', 'hacking alert')
            action = false
            TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
            QBCore.Functions.Progressbar("steak_cook", "Opening", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function()
                local success = exports['qb-minigames']:Hacking(2, 25) -- kod bloğu boyutu ve çözme süresi
                if success then
                    TriggerServerEvent('er:server:hacking')
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    QBCore.Functions.Notify("You hacked successfully!", "success", 2500) 
                else
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    QBCore.Functions.Notify("Hacking failed!", "error", 2500) 
                end  
                Wait(3600 * 1000)
                action = true
            end, function() -- İptal
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Hacking canceled.", "error", 2500)
            end)

        else 
            QBCore.Functions.Notify("You are already used.", "error", 2500)  
        end
    else
        QBCore.Functions.Notify("You are not authorized to hack.", "error", 2500)
    end
end)
