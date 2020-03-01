local status = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        
        SendNUIMessage({
            show = IsPauseMenuActive(),
            health = GetEntityHealth(GetPlayerPed(-1)) - 100,
            armor = GetPedArmour(GetPlayerPed(-1)),
            stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
            st = status,
        })
    end
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(GetPlayerPed(-1)) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			SetRadarZoom(1100)
		end
    end
end)

RegisterNetEvent('nafing:updateStatus')
AddEventHandler('nafing:updateStatus', function(Status)
    status = Status
    SendNUIMessage({action = "updateStatus", st = Status,})
end)

