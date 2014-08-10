local ply = FindMetaTable("Player")

local teams = {}

--Ghosts data
teams[0] = {name = "Ghosts", color = Vector(1.0, 1.0, 1.0), weapons = {"weapon_crowbar"}}
--Hunters data
teams[1] = {name = "Hunters", color = Vector(0.0, 0.0, 0.0), weapons = {"weapon_pistol"}}


function ply:SetGamemodeTeam(n)
	if not teams[n] then return end 	--invalid team id
	
	self:SetTeam(n)	
	self:SetPlayerColor(teams[n].color)
	self:GiveGamemodeWeapons()
	
	return true;
end


function ply:GiveGamemodeWeapons()
	local n = self:Team()
	self:StripWeapons()
	
	for k, wep in pairs(teams[n].weapons) do
		self:Give(wep)
	end
end