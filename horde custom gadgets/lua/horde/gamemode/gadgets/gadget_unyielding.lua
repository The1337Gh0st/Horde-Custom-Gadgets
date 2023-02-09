GADGET.PrintName = "Unyielding"
GADGET.Description =
[[Caps damage received to 50% of your max health,
but you will also be inflicted with Decay whenever this triggers.]]
GADGET.Icon = "items/gadgets/transcendance.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false
GADGET.Params = {
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_OnPlayerDamageTakenPost = function (ply, dmginfo, bonus)
    if ply:Horde_GetGadget() ~= "gadget_unyielding"  then return end
	local maxhealth = ply:GetMaxHealth() * 0.5
	if dmginfo:GetDamage() >= maxhealth then
    ply:Horde_AddDebuffBuildup(HORDE.Status_Decay, 100, dmginfo:GetAttacker())
    dmginfo:SetDamage(maxhealth)
	end
end