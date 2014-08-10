local ply = FindMetaTable("Player")

local teams = {}

--Ghosts data
teams[0] = {name = "Ghosts", color = Vector(204,204,0), weapons = {"weapon_crowbar"}}
--Hunters data
teams[1] = {name = "Hunters", color = Vector(255,255,255), weapons = {"weapon_pistol"}}


function ply:SetGamemodeTeam(n)
	if not teams[n] then return end 	--invalid team id
	
	self:SetTeam(n)	
	self:SetPlayerColor(teams[n].color)
	self:GiveGamemodeWeapons()
	
	--if teams[n].name == "Ghosts" then 	works, but not in shadows
	--	self:DrawShadow( false )
	--	self:SetMaterial( "models/effects/vol_light001" )
	--	self:SetRenderMode( RENDERMODE_TRANSALPHA )
	--	self:Fire( "alpha", visibility, 0 )
	--else end
	
	return true
end


function ply:GiveGamemodeWeapons()
	local n = self:Team()
	self:StripWeapons()
	
	for k, wep in pairs(teams[n].weapons) do
		self:Give(wep)
	end
end


function ply:GetTeamId()
	
	return 0 --always Ghosts team
end