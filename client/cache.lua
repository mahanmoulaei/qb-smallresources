cache = {
	playerId = PlayerId(),
	serverId = GetPlayerServerId(PlayerId()),
	ped = PlayerPedId(),
	vehicle = false,
	seat = false
}

local function updatePed(value)
	cache.ped = value
	TriggerEvent("qb-smallresources:cache:client:onChange", "ped", cache.ped, cache)
end

local function updateVehicle(value)
	cache.vehicle = value
	TriggerEvent("qb-smallresources:cache:client:onChange", "vehicle", cache.vehicle, cache)
end

local function updateSeat(value)
	cache.seat = value
	TriggerEvent("qb-smallresources:cache:client:onChange", "seat", cache.seat, cache)
end

if GetResourceState('ox_lib') ~= 'missing' and GetResourceState('ox_lib') ~= 'unknown' then
	lib.onCache('ped', function(value)
		updatePed(value)
	end)
	
	lib.onCache('vehicle', function(value)
		updateVehicle(value)
	end)
	
	lib.onCache('seat', function(value)
		updateSeat(value)
	end)	
else
	CreateThread(function()
		while true do
			
			local ped = PlayerPedId()
			if cache.ped ~= ped then
				updatePed(ped)
			end
			
			local vehicle = GetVehiclePedIsUsing(ped, false)
			if vehicle > 0 then
				if vehicle == cache.vehicle then
					if not cache.seat or GetPedInVehicleSeat(vehicle, cache.seat) ~= ped then
						for i = -1, GetVehicleMaxNumberOfPassengers(vehicle) - 1 do
							if GetPedInVehicleSeat(vehicle, i) == ped then
								updateSeat(i)
								break
							end
						end
					end
				else
					updateVehicle(vehicle)
				end
			else
				if cache.seat or cache.vehicle then
					updateSeat(false)
					updateVehicle(false)
				end
			end
			
			Wait(200)
		end
	end)
end


AddEventHandler('qb-smallresources:cache:client:onChange', function(key, value, allCaches)
	--print(key..' is being updated to '..value)
end)
