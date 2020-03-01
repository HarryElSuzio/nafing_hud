ESX = nil

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

RegisterNetEvent('nafing_items:startSmoke')
AddEventHandler('nafing_items:startSmoke', function(source)
	SmokeAnimation()
end)

function SmokeAnimation()
	local playerPed = GetPlayerPed(-1)
	
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)               
	end)
end

RegisterNetEvent('nafing_items:painkillers')
AddEventHandler('nafing_items:painkillers', function()
    local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
	local health = GetEntityHealth(playerPed)
    local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
    tabletki(40)
    exports['mythic_notify']:SendAlert('success', 'Użyłeś tabletki przeciwbólowej!')
	SetEntityHealth(playerPed, newHealth)
end)

RegisterNetEvent('nafing_items:bulletproof')
AddEventHandler('nafing_items:bulletproof', function()
    local playerPed = GetPlayerPed(-1)
    kamzaon(40)
    exports['mythic_notify']:SendAlert('success', 'Założyłeś kamizelke kuloodporną!')
	SetPedComponentVariation(playerPed, 9, 26, 9, 2)
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
end)

RegisterNetEvent('nafing_items:bulletproofoff')
AddEventHandler('nafing_items:bulletproofoff', function()
    local playerPed = GetPlayerPed(-1)
    kamzaoff(40)
    exports['mythic_notify']:SendAlert('success', 'Sciągnąłeś kamizelke kuloodporną!')
	SetPedComponentVariation(playerPed, 9, 1, 9, 2)
	AddArmourToPed(playerPed, 0)
    SetPedArmour(playerPed, 0)
end)

RegisterNetEvent('nafing_items:redbull')
AddEventHandler('nafing_items:redbull', function()
    
    SetPedMovementClipset(GetPlayerPed(-1), true)
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.15)
		Citizen.Wait(60000)
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
	SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
end)



RegisterNetEvent('nafing_items:procentykamzaon')
AddEventHandler('nafing_items:procentykamzaon', function()
  CzyJest = true
    while (CzyJest) do
      Citizen.Wait(8)
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      DrawText3D(coords.x, coords.y, coords.z+0.1,'Zakładasz kamizelkę...' , 0.4)
      DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
    end
end)

RegisterNetEvent('nafing_items:procentykamzaoff')
AddEventHandler('nafing_items:procentykamzaoff', function()
  CzyJest = true
    while (CzyJest) do
      Citizen.Wait(8)
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      DrawText3D(coords.x, coords.y, coords.z+0.1,'Sciągasz kamizelkę...' , 0.4)
      DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
    end
end)

RegisterNetEvent('nafing_items:tabletki')
AddEventHandler('nafing_items:tabletki', function()
  CzyJest = true
    while (CzyJest) do
      Citizen.Wait(8)
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      DrawText3D(coords.x, coords.y, coords.z+0.1,'Sciągasz kamizelkę...' , 0.4)
      DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
    end
end)

function kamzaon(time)
	TriggerEvent('nafing_items:procentykamzaon')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
	cooldownclick = false
end

function kamzaoff(time)
	TriggerEvent('nafing_items:procentykamzaoff')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
	cooldownclick = false
end

function tabletki(time)
	TriggerEvent('nafing_items:tabletki')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
	cooldownclick = false
end

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
  
	AddTextComponentString(text)
	DrawText(_x, _y)
  
	local factor = (string.len(text)) / 270
	DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end