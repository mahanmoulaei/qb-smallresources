local stage = 0
local movingForward = false
local loopIsRunning = false
local vehicle = false

local function ResetStage()
	stage = 0
	local plyr = PlayerPedId()
	ClearPedTasksImmediately(plyr)
	ResetAnimSet()
	SetPedStealthMovement(plyr,0,0)
end

AddEventHandler("onKeyUp", function(key)
	if key == "lcontrol" and not vehicle then
		stage = stage + 1
		local plyr = PlayerPedId()
		if stage ~= 0 then
			if stage == 1 then
				-- Crouch stuff
				ClearPedTasks(plyr)
				RequestAnimSet("move_ped_crouched")
				while not HasAnimSetLoaded("move_ped_crouched") do
					Wait(0)
				end
				SetPedMovementClipset(plyr, "move_ped_crouched",1.0)
				SetPedWeaponMovementClipset(plyr, "move_ped_crouched",1.0)
				SetPedStrafeClipset(plyr, "move_ped_crouched_strafing",1.0)
			elseif stage == 2 then
				ClearPedTasks(plyr)
				RequestAnimSet("move_crawl")
				while not HasAnimSetLoaded("move_crawl") do
					Wait(0)
				end
			elseif stage > 2 then
				ResetStage()
			end
			if loopIsRunning then return end
		end
		
		while stage ~= 0 do
			local ped = cache.ped
			loopIsRunning = true
			if not IsPedSittingInAnyVehicle(ped) and not IsPedFalling(ped) and not IsPedSwimming(ped) and not IsPedSwimmingUnderWater(ped) then
				
				if stage == 1 then
					if GetEntitySpeed(ped) > 1.0 then
						SetPedWeaponMovementClipset(ped, "move_ped_crouched",1.0)
						SetPedStrafeClipset(ped, "move_ped_crouched_strafing",1.0)
					elseif GetEntitySpeed(ped) < 1.0 and (GetFollowPedCamViewMode() == 4 or GetFollowVehicleCamViewMode() == 4) then
						ResetPedWeaponMovementClipset(ped)
						ResetPedStrafeClipset(ped)
					end
				elseif stage == 2 then
					DisableControlAction(0, 21, true) -- sprint
					DisableControlAction(1, 140, true)
					DisableControlAction(1, 141, true)
					DisableControlAction(1, 142, true)

					if (IsControlPressed(0, 32) and not movingForward) and Config.EnableProne  then
						movingForward = true
						SetPedMoveAnimsBlendOut(ped)
						local pronepos = GetEntityCoords(ped)
						TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", pronepos.x, pronepos.y, pronepos.z+0.1, 0.0, 0.0, GetEntityHeading(ped), 100.0, 0.4, 1.0, 7, 2.0, 1, 1)
						Wait(500)
					elseif (not IsControlPressed(0, 32) and movingForward) then
						local pronepos = GetEntityCoords(ped)
						TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", pronepos.x, pronepos.y, pronepos.z+0.1, 0.0, 0.0, GetEntityHeading(ped), 100.0, 0.4, 1.0, 6, 2.0, 1, 1)
						Wait(500)
						movingForward = false
					end

					if IsControlPressed(0, 34) then
						SetEntityHeading(ped,GetEntityHeading(ped) + 1)
					end

					if IsControlPressed(0, 9) then
						SetEntityHeading(ped,GetEntityHeading(ped) - 1)
					end
				end
			else
				stage = 0
			end
			Wait(0)
		end
		loopIsRunning = false
	end
end)

local walkSet = "default"

RegisterNetEvent('qb-smallresources:crouchProne:client:setWalkSet', function(clipset)
    walkSet = clipset
end)

function ResetAnimSet()
	local ped = PlayerPedId()
    if walkSet == "default" then
        ResetPedMovementClipset(ped)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
    else
        ResetPedMovementClipset(ped)
        ResetPedWeaponMovementClipset(ped)
        ResetPedStrafeClipset(ped)
        Wait(100)
        RequestWalking(walkSet)
        SetPedMovementClipset(ped, walkSet, 1)
        RemoveAnimSet(walkSet)
    end
end

function RequestWalking(set)
    RequestAnimSet(set)
    while not HasAnimSetLoaded(set) do
        Wait(1)
    end
end

AddEventHandler('qb-smallresources:cache:client:onChange', function(key, value, allCaches)
	if key == 'vehicle' then
		if value and stage ~= 0 then ResetStage() end
		vehicle = value
	end
end)