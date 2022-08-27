local seat = false
local angle = 0.0
local speed = 0.0

AddEventHandler('qb-smallresources:cache:client:onChange', function(key, value, allCaches)
	if key == "seat" then
		seat = value
		if seat then
			while seat == -1 do
				if DoesEntityExist(cache.vehicle) then
					local tangle = GetVehicleSteeringAngle(cache.vehicle)
					if tangle > 10.0 or tangle < -10.0 then
						angle = tangle
					end
					speed = GetEntitySpeed(cache.vehicle)
						
					if speed < 0.1 and not GetIsTaskActive(cache.ped, 151) and not GetIsVehicleEngineRunning(cache.vehicle) then
						SetVehicleSteeringAngle(cache.vehicle, angle)
					end
				end
				Wait(500)
			end
		else
			angle = 0.0
			speed = 0.0
		end
	end
end)