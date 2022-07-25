Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local engine = nil
		if(IsCharInAnyCar(GetPlayerChar(-1))) then
			local petrol = GetPetrolTankHealth(vehicle)
			local vehicle = (GetCarCharIsUsing(GetPlayerChar(-1))) 
			local getActualSpeed = GetCarSpeed(vehicle)
			if(DoesVehicleExist(vehicle)) then
				if(GetDriverOfCar(vehicle) == GetPlayerChar(-1)) then
					if(IsCarModel(vehicle, GetHashKey("POLICE")) or IsCarModel(vehicle, GetHashKey("POLICE2"))) then
						if IsGameKeyboardKeyPressed(57) then
							if(not IsCarInAirProper(vehicle)) then
								if(GetCarSpeed(vehicle) > 1) then
									SetCarForwardSpeed(vehicle, getActualSpeed - 1)
								end
							end
						end
					end
				end
			end
			if(IsGameKeyboardKeyJustPressed(45)) then --[[X]]--
				if(engine == false) then
					engine = true
					PrintStringWithLiteralStringNow("STRING", "Vehicle started", 2000, 1)
				else
					PrintStringWithLiteralStringNow("STRING", "Vehicle stopped", 2000, 1)
					engine = false
				end
			end
			if(IsCharInAnyCar(GetPlayerChar(-1))) then
				if(DoesVehicleExist(vehicle)) then
					if(engine == false) then
						PrintStringWithLiteralStringNow("STRING", "Press X to start the engine", 1000, 1)
						if(DoesVehicleExist(vehicle)) then
							SetCarEngineOn(vehicle, 0, 0)
						end
					else
						if(DoesVehicleExist(vehicle)) then
							SetCarEngineOn(vehicle, 1, 1)
						end
					end
				end
			end
			if(DoesVehicleExist(vehicle)) then
				if(petrol <= 999) then
					SetPetrolTankHealth(vehicle, 1000)
					SetCarHealth(vehicle, 0)
					SetEngineHealth(vehicle, 0)
					engine = 0
				end
			end
		else
			engine = false
		end
	end
end)