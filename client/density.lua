local density = {
    ['parked'] = 0.0,
    ['vehicle'] = 0.2,
    ['multiplier'] = 0.8,
    ['peds'] = 0.8,
    ['scenario'] = 0.8,
}

CreateThread(function()
	local id = PlayerId()
	Wait(1000)
	local x,y,z = table.unpack(GetEntityCoords(cache.ped))
	while true do
		SetParkedVehicleDensityMultiplierThisFrame(density['parked'])
		SetVehicleDensityMultiplierThisFrame(density['vehicle'])
		SetRandomVehicleDensityMultiplierThisFrame(density['multiplier'])
		SetPedDensityMultiplierThisFrame(density['peds'])
		SetScenarioPedDensityMultiplierThisFrame(density['scenario'], density['scenario']) -- Walking NPC Density
		
		RemoveVehiclesFromGeneratorsInArea(x - 10000.0, y - 10000.0, z - 10000.0, x + 10000.0, y + 10000.0, z + 10000.0)  -- Whole Map
		
		DisablePlayerVehicleRewards(cache.playerId)

		Wait(0)
	end
end)

function DecorSet(Type, Value)
    if Type == 'parked' then
        density['parked'] = Value
    elseif Type == 'vehicle' then
        density['vehicle'] = Value
    elseif Type == 'multiplier' then
        density['multiplier'] = Value
    elseif Type == 'peds' then
        density['peds'] = Value
    elseif Type == 'scenario' then
        density['scenario'] = Value
    end
end

exports('DecorSet', DecorSet)
