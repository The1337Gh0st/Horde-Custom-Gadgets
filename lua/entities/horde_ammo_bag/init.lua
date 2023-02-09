AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/props/g_ammo_bag_6.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetUseType(3)

    self:SetVar(1, 6)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
	
	self.Removing = false
	
	timer.Simple(30, function ()
        if self:IsValid() then
            self:Remove()
        end
    end)

end

function ENT:Use( ply )
    local tab = self:GetTable() //get table of keys to be referenced
	local given_ammo = false
	
	if not self.Removing and ply:Alive() and not ply:IsBot() then
	if tab[1] == 6 then
        for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
            self:SetModel( "models/props/g_ammo_bag_5.mdl" ) //change model
            self:PhysicsInit(SOLID_VPHYSICS) //re-init physics model
            tab[1] = tab[1] - 1 //reduce charges by 1
	elseif tab[1] == 5 then
        for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
            self:SetModel( "models/props/g_ammo_bag_4.mdl" ) //change model
            self:PhysicsInit(SOLID_VPHYSICS) //re-init physics model
            tab[1] = tab[1] - 1 //reduce charges by 1
    elseif tab[1] == 4 then
        for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
            self:SetModel( "models/props/g_ammo_bag_3.mdl" ) //change model
            self:PhysicsInit(SOLID_VPHYSICS) //re-init physics model
            tab[1] = tab[1] - 1 //reduce charges by 1
    elseif tab[1] == 3 then
        for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
            self:SetModel( "models/props/g_ammo_bag_2.mdl" )
            self:PhysicsInit(SOLID_VPHYSICS)
            tab[1] = tab[1] - 1
    elseif tab[1] == 2 then
        for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
            self:SetModel( "models/props/g_ammo_bag_1.mdl" )
            self:PhysicsInit(SOLID_VPHYSICS)
            tab[1] = tab[1] - 1
    elseif tab[1] == 1 then
	for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
		self.Removing = true
            self:Remove()
    end
end
end
