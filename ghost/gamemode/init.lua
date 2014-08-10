AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("database/cl_database.lua")

include("shared.lua")
include("player.lua")
include("database/database.lua")


function GM:PlayerConnect(name, ip)
	print("Player: " .. name .. " has joined the game.")
end


function GM:PlayerInitialSpawn(ply)		--function run at initial, first spawn
	print("Player: " .. ply:Nick() .. " has spawned.")
	ply:SetGamemodeTeam(0)		--manual set team id, 0 = Ghosts
end


--CURRENTLY WORKING ON THIS--
function GM:PrePlayerDraw(ply)
	print("getTeamId is set to: " .. getTeamId(ply))
	local teamId = getTeamId(ply)
	if teamId == 0 then return true end
end


function GM:PlayerSpawn(ply)	--remove if unnecessary
	ply:SetModel("models/player/group01/male_07.mdl")
	ply:GiveGamemodeWeapons()
end


function GM:PlayerAuthed(ply, steamID, uniqueID)
	print("Player: " .. ply:Nick() .. " has gotten authed.")
	ply:databaseCheck()
end


function GM:PlayerDisconnected(ply)
	ply:databaseDisconnect()
end