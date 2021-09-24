function setupModel(model)
  RequestModel(model)
  while not HasModelLoaded(model) do
    RequestModel(model)
    Wait(0)
  end
  SetModelAsNoLongerNeeded(model)
end

function pedCreation_basic(PedToCreate)

		setupModel(GetHashKey(PedToCreate.modelHash))
		pedCreated = CreatePed(4, PedToCreate.modelHash, PedToCreate.x, PedToCreate.y, PedToCreate.z -1, PedToCreate.rotation, false, false)
		SetEntityAsMissionEntity(pedCreated, true, true)
		--SetPedShootRate(pedCreated,  1000)
		--AddArmourToPed(pedCreated, 100)
		--SetPedAlertness(pedCreated, 0)
		--SetPedAccuracy(pedCreated, 100)
		--SetPedCanSwitchWeapon(pedCreated, true)
		--SetEntityHealth(pedCreated,  200)
		SetPedFleeAttributes(pedCreated, 0, 0)
		--SetPedCombatAttributes(pedCreated, 46, true)
		--SetPedCombatAbility(pedCreated,  2)
		--SetPedCombatMovement(pedCreated,  0)
		--SetPedCombatRange(pedCreated, 0)
		--SetPedPathAvoidFire(inputPed,  1)
		--SetPedPathCanUseLadders(inputPed,1)
		--SetPedPathCanDropFromHeight(inputPed, 1)
		--SetPedPathPreferToAvoidWater(inputPed, 1)
		SetEntityInvincible(pedCreated, true)
		--GiveWeaponToPed(pedCreated, GetHashKey("weapon_sawnoffshotgun"), 5000, false, false)

end

RegisterNetEvent("qb-SpawnPed:client:Spawn_Basic")
AddEventHandler("qb-SpawnPed:client:Spawn_Basic", function(NPC)
	print(NPC.heading)
	Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if (not generalLoaded) then
				if NetworkIsHost() then
					for i=1,#NPC ,1 do
						pedCreation_basic(NPC[i])
						Citizen.Wait(10)
					end
				end
				generalLoaded = true
			end
	end
	end)
end)


-- armed ped spawn 

function pedCreation_armed(PedToCreate)

		setupModel(GetHashKey(PedToCreate.modelHash))
		pedCreated = CreatePed(4, PedToCreate.modelHash, PedToCreate.x, PedToCreate.y, PedToCreate.z -1, PedToCreate.rotation, false, false)
		SetEntityAsMissionEntity(pedCreated, true, true)
		SetPedShootRate(pedCreated,  1000)
		--AddArmourToPed(pedCreated, 100)
		SetPedAlertness(pedCreated, 1)
		SetPedAccuracy(pedCreated, 80)
		SetPedCanSwitchWeapon(pedCreated, true)
		SetEntityHealth(pedCreated,  200)
		SetPedFleeAttributes(pedCreated, 0, 0)
		SetPedCombatAttributes(pedCreated, 46, true)
		SetPedCombatAbility(pedCreated,  2)
		SetPedCombatMovement(pedCreated,  0)
		SetPedCombatRange(pedCreated, 0)
		SetPedPathAvoidFire(inputPed,  1)
		--SetPedPathCanUseLadders(inputPed,1)
		--SetPedPathCanDropFromHeight(inputPed, 1)
		SetPedPathPreferToAvoidWater(inputPed, 1)
		--SetEntityInvincible(pedCreated, true)
		GiveWeaponToPed(pedCreated, GetHashKey("weapon_sawnoffshotgun"), 5000, false, false)

end

RegisterNetEvent("qb-SpawnPed:client:Spawn_Armed")
AddEventHandler("qb-SpawnPed:client:Spawn_Armed", function(NPC)
	print(NPC.heading)
	Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if (not generalLoaded) then
				if NetworkIsHost() then
					for i=1,#NPC ,1 do
						pedCreation_armed(NPC[i])
						Citizen.Wait(10)
					end
				end
				generalLoaded = true
			end
	end
	end)
end)