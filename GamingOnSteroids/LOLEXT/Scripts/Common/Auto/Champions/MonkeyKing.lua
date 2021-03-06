
function LoadScript()
	Menu = MenuElement({type = MENU, id = myHero.networkID, name = myHero.charName})
	Menu:MenuElement({id = "Skills", name = "技能", type = MENU})
	Menu.Skills:MenuElement({id = "Q", name = "[Q]粉碎打击", type = MENU	})
	Menu.Skills.Q:MenuElement({id = "Auto",	name = "AA重置",	value = true	})
	Menu.Skills.Q:MenuElement({id = "Killsteal",	name = "斩杀",	value = true	})
		
	Menu.Skills:MenuElement({id = "W",	name = "[W]真假猴王",	type = MENU})
	Menu.Skills.W:MenuElement({id = "CC",	name = "在预期时使用控制",	value = true	})
		
	Menu.Skills:MenuElement({id = "E", name = "[E]腾云突击", type = MENU})
	Menu.Skills.E:MenuElement({id = "Killsteal",	name = "斩杀",	value = true	})
	Menu.Skills.E:MenuElement({id = "Radius",	name = "最小Gapcloser范围",	value = 300, min = 200, max = 625, step = 25	})
	
		
	Menu.Skills:MenuElement({id = "R", name = "[R]大闹天宫", type = MENU})
	Menu.Skills.R:MenuElement({id = "Count", name = "自动开启#个敌人", value = 2, min = 1, max = 6, step = 1 })
	
	Menu.Skills:MenuElement({id = "Draw", name = "绘制伤害", value = true })
	
	LocalObjectManager:OnSpellCast(function(spell) OnSpellCast(spell) end)
	_G.SDK.Orbwalker:OnPostAttack(function(args) OnPostAttack() end)
	
	Callback.Add("Tick", function() Tick() end)
end

function OnPostAttack()
	if not myHero.activeSpell.target then return end
	local target = LocalObjectManager:GetHeroByHandle(myHero.activeSpell.target)
	if not target then return end		
	if Ready(_Q) and (Menu.Skills.Q.Auto:Value() or ComboActive()) then	
		CastSpell(HK_Q)
		LocalOrbwalker.AutoAttackResetted = true
		return
	end
end

function OnSpellCast(spell)
	if spell.isEnemy and Ready(_W) then
		local hitDetails = LocalDamageManager:GetSpellHitDetails(spell,myHero)
		if hitDetails and hitDetails.Hit and hitDetails.Path and hitDetails.CC and Menu.Skills.W.CC:Value() then
			CastSpell(HK_W)
		end
	end
end


local NextTick = LocalGameTimer()
function Tick()
	local currentTime = LocalGameTimer()
	if NextTick > currentTime then return end
	NextTick = LocalGameTimer() + .1
	if myHero.activeSpell and myHero.activeSpell.valid and not myHero.activeSpell.spellWasCast then return end	
	if BlockSpells() then return end
	
	if Ready(_Q) and Menu.Skills.Q.Killsteal:Value() then
		local target = GetTarget(myHero.range + 125, true)
		if CanTarget(target) then
			local thisDmg = LocalDamageManager:CalculateDamage(myHero, target, "MonkeyKingDoubleAttack")
			if thisDmg > thisDmg >= target.health + target.hpRegen then
				CastSpell(HK_Q)
				LocalOrbwalker.AutoAttackResetted = true
			end
		end
	end
	--Check for R enemy count
	if Ready(_R) and EnemyCount(myHero.pos, 175, .25) >= Menu.Skills.R.Count:Value() then
		CastSpell(HK_R)
	end
		
	if Ready(_E) and ComboActive() then
		local target = GetTarget(625, true)		
		if CanTarget(target) and LocalGeometry:GetDistance(myHero.pos, target.pos) >= Menu.Skills.E.Radius:Value() then
			CastSpell(HK_E, target)
			NextTick = LocalGameTimer() + .25
		end
	end
	
end