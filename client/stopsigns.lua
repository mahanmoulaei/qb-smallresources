local QBCore = exports['qb-core']:GetCoreObject()
local stopsign = nil
local stopsigns = {
    `prop_sign_road_01a`,
	`prop_sign_road_01b`,
	`prop_sign_road_01c`,
	`prop_sign_road_02a`,
	`prop_sign_road_03a`,
	`prop_sign_road_03b`,
	`prop_sign_road_03c`,
	`prop_sign_road_03d`,
	`prop_sign_road_03e`,
	`prop_sign_road_03f`,
	`prop_sign_road_03g`,
	`prop_sign_road_03h`,
	`prop_sign_road_03i`,
	`prop_sign_road_03j`,
	`prop_sign_road_03k`,
	`prop_sign_road_03l`,
	`prop_sign_road_03m`,
	`prop_sign_road_03n`,
	`prop_sign_road_03o`,
	`prop_sign_road_03p`,
	`prop_sign_road_03q`,
	`prop_sign_road_03r`,
	`prop_sign_road_03s`,
	`prop_sign_road_03t`,
	`prop_sign_road_03u`,
	`prop_sign_road_03v`,
	`prop_sign_road_03w`,
	`prop_sign_road_03x`,
	`prop_sign_road_03y`,
	`prop_sign_road_03z`,
	`prop_sign_road_04a`,
	`prop_sign_road_04b`,
	`prop_sign_road_04c`,
	`prop_sign_road_04d`,
	`prop_sign_road_04e`,
	`prop_sign_road_04f`,
	`prop_sign_road_04g`,
	`prop_sign_road_04g_l1`,
	`prop_sign_road_04h`,
	`prop_sign_road_04i`,
	`prop_sign_road_04j`,
	`prop_sign_road_04k`,
	`prop_sign_road_04l`,
	`prop_sign_road_04m`,
	`prop_sign_road_04n`,
	`prop_sign_road_04o`,
	`prop_sign_road_04p`,
	`prop_sign_road_04q`,
	`prop_sign_road_04r`,
	`prop_sign_road_04s`,
	`prop_sign_road_04t`,
	`prop_sign_road_04u`,
	`prop_sign_road_04v`,
	`prop_sign_road_04w`,
	`prop_sign_road_04x`,
	`prop_sign_road_04y`,
	`prop_sign_road_04z`,
	`prop_sign_road_04za`,
	`prop_sign_road_04zb`,
	`prop_sign_road_05a`,
	`prop_sign_road_05b`,
	`prop_sign_road_05c`,
	`prop_sign_road_05d`,
	`prop_sign_road_05e`,
	`prop_sign_road_05f`,
	`prop_sign_road_05g`,
	`prop_sign_road_05h`,
	`prop_sign_road_05i`,
	`prop_sign_road_05j`,
	`prop_sign_road_05k`,
	`prop_sign_road_05l`,
	`prop_sign_road_05m`,
	`prop_sign_road_05n`,
	`prop_sign_road_05o`,
	`prop_sign_road_05p`,
	`prop_sign_road_05q`,
	`prop_sign_road_05r`,
	`prop_sign_road_05s`,
	`prop_sign_road_05t`,
	`prop_sign_road_05u`,
	`prop_sign_road_05v`,
	`prop_sign_road_05w`,
	`prop_sign_road_05x`,
	`prop_sign_road_05y`,
	`prop_sign_road_05z`,
	`prop_sign_road_05za`,
	`prop_sign_road_06a`,
	`prop_sign_road_06b`,
	`prop_sign_road_06c`,
	`prop_sign_road_06d`,
	`prop_sign_road_06e`,
	`prop_sign_road_06f`,
	`prop_sign_road_06g`,
	`prop_sign_road_06h`,
	`prop_sign_road_06i`,
	`prop_sign_road_06j`,
	`prop_sign_road_06k`,
	`prop_sign_road_06l`,
	`prop_sign_road_06m`,
	`prop_sign_road_06n`,
	`prop_sign_road_06o`,
	`prop_sign_road_06p`,
	`prop_sign_road_06q`,
	`prop_sign_road_06r`,
	`prop_sign_road_07a`,
	`prop_sign_road_07b`,
	`prop_sign_road_08a`,
	`prop_sign_road_08b`,
	`prop_sign_road_09a`,
	`prop_sign_road_09b`,
	`prop_sign_road_09c`,
	`prop_sign_road_09d`,
	`prop_sign_road_09e`,
	`prop_sign_road_09f`,
	`prop_sign_road_callbox`,
	`prop_snow_sign_road_01a`,
	`prop_snow_sign_road_06e`,
	`prop_snow_sign_road_06g`
}

CreateThread(function()
	if GetResourceState('qb-target') ~= 'missing' then
		while GetResourceState('qb-target') ~= 'started' do
			Wait(100)
		end
		Wait(1000)
		exports['qb-target']:AddTargetModel(stopsigns, {
			options = {
				{
					event = "JLRP-Config:RoadSigns:Client:StealRoadSign",
					icon = "fas fa-sign",
					label = "Steal Sign"
				},
			},
			distance = 2
		})
	end
end)


RegisterNetEvent('JLRP-Config:RoadSigns:Client:StealRoadSign', function(data)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local closestObj = data.entity

    if DoesEntityExist(closestObj) then
        if(IsPedArmed(playerPed, 1|2|4)) then SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, 1) Wait(500) end
		
		if stopsign ~= nil then
			if DoesEntityExist(stopsign) and IsEntityAttachedToEntity(playerPed, stopsign) then
				DetachSign(stopsign)
			end
			stopsign = nil
			Wait(300)
		end
		
		CreateThread(function()
			local data = data
			local dict = "rcmnigel1d"
			LoadAnimDict(dict)
			TaskPlayAnim(cache.ped, dict, "base_club_shoulder", 5.0, -1, -1, 50, 0, false, false, false)
			RemoveAnimDict(dict)

			stopsign = CreateObject(GetEntityModel(data.entity), playerCoords.x, playerCoords.y, playerCoords.z, true, false, false)
			AttachEntityToEntity(stopsign, cache.ped, GetPedBoneIndex(cache.ped, 60309),-0.1390, -0.4870, 0.2200, -67.3315314, 145.0627869, -4.4318885,1,1,0,1,0,1)
			if DoesEntityExist(stopsign) then
				SetEntityAsMissionEntity(closestObj, 1, 1)
				Framework.Game.DeleteObject(closestObj, function(response)
					if not response or response == nil then
						SetEntityCoords(closestObj, -1000.0, -1000.0, -1000.0)
					end
				end)
				SetEntityAsNoLongerNeeded(closestObj)
			end
			while stopsign ~= nil and DoesEntityExist(stopsign) and IsEntityAttachedToEntity(cache.ped, stopsign) and not QBCore.PlayerData.metadata['isdead'] and not QBCore.PlayerData.metadata['inlaststand'] and not QBCore.PlayerData.metadata['ishandcuffed'] do
				QBCore.Functions.DrawText3D(GetPedBoneCoords(cache.ped, 60309), "Press \"~g~G~s~\" to drop the stop sign youre holding")
				if IsControlJustReleased(0, 58) then
					DetachSign(stopsign)
					break
				end
				Wait(0)
			end
			DetachSign(stopsign)
		end)
    end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    QBCore.PlayerData = val
end)

function DetachSign(entity)
	if entity ~= nil then
		local playerPed = PlayerPedId()
		if IsEntityAttachedToEntity(entity, playerPed) then
			DetachEntity(entity, false, false)
			PlaceObjectOnGroundProperly(entity)
			ClearPedTasks(playerPed)
		end
		stopsign = nil
	end
end

function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 
