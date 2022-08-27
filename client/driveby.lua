AddEventHandler('qb-smallresources:cache:client:onChange', function(key, value, allCaches)
	if key == "seat" then
		if value == -1 then
			SetPlayerCanDoDriveBy(cache.playerId, false)
		else
			SetPlayerCanDoDriveBy(cache.playerId, true)
		end
	end
end)

