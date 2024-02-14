-- Overrides the ents i cant be fucked to do manually os here it is


--- @type table<string, string>
local entities = {
	["base_searchable"] = "Search",
	["entity_lightarmour"] = "To Equip",
	["entity_heavyarmour"] = "To Equip"
}

hook.Add("HUDDraw", "GobboDrawDefaults", function()
	local ply = LocalPlayer()
	local trace = ply:GetEyeTrace()

	local entity = trace.Entity

	if (!IsValid(entity)) then
		return
	end

	local position = ply:GetPos()

	if (position:Distance(entity:GetPos()) > 100) then
		return
	end

	for k, v in pairs(entities) do
		if (entity:GetClass() ~= k) then
			continue
		end

		GOBBO.UI:DrawKeyInteraction("E", v)
	end
end)