local HighestValueEggFinder = {}

local function getEggValue(egg: Instance): number?
	local attributeValue = egg:GetAttribute("Value")
	if typeof(attributeValue) == "number" then
		return attributeValue
	end

	local eggValueAttribute = egg:GetAttribute("EggValue")
	if typeof(eggValueAttribute) == "number" then
		return eggValueAttribute
	end

	local valueObject = egg:FindFirstChild("Value") or egg:FindFirstChild("EggValue")
	if valueObject and (valueObject:IsA("NumberValue") or valueObject:IsA("IntValue")) then
		return valueObject.Value
	end

	return nil
end

local function isEggCandidate(instance: Instance): boolean
	return instance:IsA("Model") or instance:IsA("BasePart")
end

function HighestValueEggFinder.FindHighestValueEgg(eggsFolder: Instance?): (Instance?, number?)
	local folder = eggsFolder or workspace:FindFirstChild("Eggs")
	if not folder then
		return nil, nil
	end

	local bestEgg: Instance? = nil
	local bestValue: number? = nil

	for _, egg in folder:GetChildren() do
		if isEggCandidate(egg) and egg:GetAttribute("Claimed") ~= true then
			local value = getEggValue(egg)
			if value ~= nil then
				local isBetter = bestValue == nil or value > bestValue
				local isTieWithEarlierName = value == bestValue and bestEgg ~= nil and egg.Name < bestEgg.Name
				if isBetter or isTieWithEarlierName then
					bestEgg = egg
					bestValue = value
				end
			end
		end
	end

	return bestEgg, bestValue
end

return HighestValueEggFinder
