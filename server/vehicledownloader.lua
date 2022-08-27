local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('JLRP-Config:GetAllVehicles', function (source, cb)
	MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
		cb(result)
	end)
end)