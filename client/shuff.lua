local disableShuffle = true
local isInVehicle, seat = false, false
local isLoopActive = false
local isHelpShown = false

local function shuffToDriver()
	disableShuffle = false
	SetPedConfigFlag(cache.ped, 184, false)
	Wait(3000)
	disableShuffle = true
end
local function disableAutoShuff()
	if isLoopActive then return end
	isLoopActive = true
	isHelpShown = false
	while cache.seat == 0 and disableShuffle do
		local ped = cache.ped
		--local vehicle = GetVehiclePedIsIn(ped)
		if IsVehicleSeatFree(cache.vehicle, -1) then
			if not isHelpShown then
				--[[
				lib.showTextUI("[E] - Switch to driver seat (/shuff)", {
					position = 'right-center', 
					style = {
						backgroundColor = '#020040', 
						color = white, 
						borderColor = '#d90000', 
						borderWidth = 2
						}
				})]]
				TriggerEvent('qb-core:client:DrawText', "[E] - Switch to driver seat (/shuff)")
				isHelpShown = true
			end
			if GetIsTaskActive(ped, 165) then
				SetPedIntoVehicle(ped, cache.vehicle, 0)
				SetPedConfigFlag(ped, 184, true)
			end
			if IsControlJustPressed(0, 38) then
				--lib.hideTextUI()
				TriggerEvent('qb-core:client:KeyPressed')
				shuffToDriver()
				break
			end
		else
			if isHelpShown then
				--lib.hideTextUI()
				TriggerEvent('qb-core:client:HideText')
				isHelpShown = false
			end
			Wait(200)
		end
		--print('loop is running', tostring(cache.seat), tostring(disableShuffle))
		Wait(0)
	end
	--lib.hideTextUI()
	TriggerEvent('qb-core:client:HideText')
	isLoopActive = false
end

AddEventHandler('qb-smallresources:cache:client:onChange', function(key, value, allCaches)
	if key == "seat" then
		seat = value
		if seat == 0 then disableAutoShuff() end
	end
end)

RegisterNetEvent('qb-smallresources:Shuff:Client:SeatShuffle', function()
	if seat then
		if seat == 0 then
			shuffToDriver()
		elseif seat == -1 then
			local ped = cache.ped
			SetPedIntoVehicle(ped, GetVehiclePedIsIn(ped), 0)
		end
	else
		QBCore.Functions.Notify("You have to be in a vehicle in order to shuffle!", "info")
	end
end)

RegisterCommand(Config.Shuff.Command, function()
    TriggerEvent("qb-smallresources:Shuff:Client:SeatShuffle")
end, false)
TriggerEvent('chat:addSuggestion', '/'..Config.Shuff.Command, Config.Shuff.Description)

RegisterCommand(Config.Seat.Command, function(_, args)
	if seat then
		local seatIndex = table.unpack(args)
		seatIndex = tonumber(seatIndex)
		local ped = cache.ped
		local vehicle = GetVehiclePedIsIn(ped, false)
		if seatIndex < 1 or seatIndex > GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) then
			QBCore.Functions.Notify("Seat \""..seatIndex.."\" is not recognized in your current vehicle!", "error")
		else
			if vehicle ~= nil and vehicle > 0 then
				SetPedIntoVehicle(ped, vehicle, seatIndex - 2)
			end
		end
	else
		QBCore.Functions.Notify("You have to be in a vehicle in order to change seat!", "info")
	end
end)
TriggerEvent('chat:addSuggestion', '/'..Config.Seat.Command, Config.Seat.Description, {{ name = 'seat', help = Config.Seat.Extra }})