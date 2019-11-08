local Heroes = {"Kalista","Mordekaiser","LeeSin","Soraka","Lux","Yuumi","Rakan","Nidalee","Ryze","XinZhao","Kassadin","Veigar","Tristana","Warwick","Neeko","Cassiopeia","Malzahar","Zyra","Sylas","Kayle","Morgana","Ekko","Xerath","Sona","Ahri"}
local GsoPred = {"Veigar","Kalista","Mordekaiser","LeeSin","Soraka","Lux","Yuumi","Rakan","Nidalee","Ryze","Cassiopeia","Malzahar","Zyra","Kayle","Morgana","Ekko","Xerath","Sona","Ahri"}

if not table.contains(Heroes, myHero.charName) then return end

   


   local Version = 0.33


    local Files = {
        Lua = {
            Path = SCRIPT_PATH,
            Name = "PussyAIO.lua",
            Url = "https://raw.githubusercontent.com/Pussykate/GoS/master/PussyAIO.lua"

        },
        Version = {
            Path = SCRIPT_PATH,
            Name = "PussyAIO.version",
            Url = "https://raw.githubusercontent.com/Pussykate/GoS/master/PussyAIO.version"
        }	
    }
    
        local function DownloadFile(url, path, fileName)
            DownloadFileAsync(url, path .. fileName, function() end)
            while not FileExist(path .. fileName) do end
        end
        
        local function ReadFile(path, fileName)
            local file = io.open(path .. fileName, "r")
            local result = file:read()
            file:close()
            return result
        end 

	local function AutoUpdate()
        

        
        DownloadFile(Files.Version.Url, Files.Version.Path, Files.Version.Name)
        local textPos = myHero.pos:To2D()
        local NewVersion = tonumber(ReadFile(Files.Version.Path, Files.Version.Name))
        if NewVersion > Version then
            DownloadFile(Files.Lua.Url, Files.Lua.Path, Files.Lua.Name)
            print("New PussyAIO Version Press 2x F6")
        else
            print(Files.Version.Name .. ": No Updates Found")
        end	
	end
	




local isLoaded = false
function TryLoad()
	if Game.Timer() < 5 then return end
	isLoaded = true	
	if table.contains(Heroes, myHero.charName) then
		_G[myHero.charName]()
	end	
end

function OnLoad()
	AutoUpdate()
	Start()
	HPred()

	
end


	
	if table.contains(GsoPred, myHero.charName) then
		if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
			DownloadFileAsync("https://raw.githubusercontent.com/gamsteron/GOS-EXT/master/Common/GamsteronPrediction.lua", COMMON_PATH .. "GamsteronPrediction.lua", function() end)
			while not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") do end
								

		end
	require "GamsteronPrediction"	
	end


	

require "Collision"
require "2DGeometry"

class "Start"

function Start:__init()
	
	Callback.Add("Draw", function() self:Draw() end)
end



function Start:Draw()
if not isLoaded then
	TryLoad()
	return
end
local NewVersion = tonumber(ReadFile(Files.Version.Path, Files.Version.Name))
local textPos = myHero.pos:To2D()	

    if NewVersion > Version then
		Draw.Text("New PussyAIO Vers. Press 2xF6", 50, textPos.x + 100, textPos.y - 200, Draw.Color(255, 255, 0, 0))
	end
	
	if Game.Timer() > 20 then return end 
	if NewVersion == Version then	
		Draw.Text("Version: 0.33", 20, textPos.x + 400, textPos.y - 220, Draw.Color(255, 255, 0, 0))
		
		Draw.Text("Welcome to PussyAIO", 50, textPos.x + 100, textPos.y - 200, Draw.Color(255, 255, 100, 0))
		Draw.Text("Supported Champs", 30, textPos.x + 200, textPos.y - 150, Draw.Color(255, 255, 200, 0))
		
		Draw.Text("Ahri", 25, textPos.x + 200, textPos.y - 100, Draw.Color(255, 255, 200, 0))
		Draw.Text("Ekko", 25, textPos.x + 200, textPos.y - 80, Draw.Color(255, 255, 200, 0))
		Draw.Text("Kayle", 25, textPos.x + 200, textPos.y - 60, Draw.Color(255, 255, 200, 0))
		Draw.Text("Kalista", 25, textPos.x + 200, textPos.y - 40, Draw.Color(255, 255, 200, 0))
		Draw.Text("Lux", 25, textPos.x + 200, textPos.y - 20, Draw.Color(255, 255, 200, 0))
		Draw.Text("Morgana", 25, textPos.x + 200, textPos.y - 1, Draw.Color(255, 255, 200, 0))
		Draw.Text("Neeko", 25, textPos.x + 200, textPos.y + 20 , Draw.Color(255, 255, 200, 0))
		Draw.Text("Rakan", 25, textPos.x + 200, textPos.y + 40, Draw.Color(255, 255, 200, 0))
		Draw.Text("Soraka", 25, textPos.x + 200, textPos.y + 60, Draw.Color(255, 255, 200, 0))
		Draw.Text("Sylas", 25, textPos.x + 200, textPos.y + 80, Draw.Color(255, 255, 200, 0))		
		Draw.Text("Veigar", 25, textPos.x + 200, textPos.y + 100, Draw.Color(255, 255, 200, 0))	
		Draw.Text("Xerath", 25, textPos.x + 200, textPos.y + 120, Draw.Color(255, 255, 200, 0))
		Draw.Text("Yuumi", 25, textPos.x + 200, textPos.y + 140, Draw.Color(255, 255, 200, 0))


		Draw.Text("Cassiopeia", 25, textPos.x + 300, textPos.y - 100, Draw.Color(255, 255, 200, 0))	
		Draw.Text("Kassadin", 25, textPos.x + 300, textPos.y - 80, Draw.Color(255, 255, 200, 0))
		Draw.Text("LeeSin", 25, textPos.x + 300, textPos.y - 60, Draw.Color(255, 255, 200, 0))
		Draw.Text("Malzahar", 25, textPos.x + 300, textPos.y - 40, Draw.Color(255, 255, 200, 0))
		Draw.Text("Mordekaiser", 25, textPos.x + 300, textPos.y - 20, Draw.Color(255, 255, 200, 0))
		Draw.Text("Nidalee", 25, textPos.x + 300, textPos.y - 1 , Draw.Color(255, 255, 200, 0))
		Draw.Text("Ryze", 25, textPos.x + 300, textPos.y + 20, Draw.Color(255, 255, 200, 0))
		Draw.Text("Sona", 25, textPos.x + 300, textPos.y + 40, Draw.Color(255, 255, 200, 0))
		Draw.Text("Tristana", 25, textPos.x + 300, textPos.y + 60, Draw.Color(255, 255, 200, 0))		
		Draw.Text("Warwick", 25, textPos.x + 300, textPos.y + 80, Draw.Color(255, 255, 200, 0))	
		Draw.Text("XinZhao", 25, textPos.x + 300, textPos.y + 100, Draw.Color(255, 255, 200, 0))
		Draw.Text("Zyra", 25, textPos.x + 300, textPos.y + 120, Draw.Color(255, 255, 200, 0))		
	end
end	


local menu = 1
local _OnWaypoint = {}
local _OnVision = {}
local TEAM_ALLY, TEAM_ENEMY, TEAM_JUNGLE = myHero.team, 300 - myHero.team, 300
local Allies = {}; local Enemies = {}; local Turrets = {}; local Units = {}; local AllyHeroes = {}
local intToMode = {[0] = "", [1] = "Combo", [2] = "Harass", [3] = "LastHit", [4] = "Clear"}
local castSpell = {state = 0, tick = GetTickCount(), casting = GetTickCount() - 1000, mouse = mousePos}
local spellcast = {state = 1, mouse = mousePos}
local ItemHotKey = {[ITEM_1] = HK_ITEM_1, [ITEM_2] = HK_ITEM_2,[ITEM_3] = HK_ITEM_3, [ITEM_4] = HK_ITEM_4, [ITEM_5] = HK_ITEM_5, [ITEM_6] = HK_ITEM_6, [ITEM_7] = HK_ITEM_7,}
local Orb
local barHeight, barWidth, barXOffset, barYOffset = 8, 103, 0, 0
 

local Icons = {
["InsecMode"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819172317.png",
["Kassadin"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819174855.png",
["Combo"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819172939.png",
["BlockSpells"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819175312.png",
["Escape"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819175518.png",
["Harass"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819175700.png",
["Clear"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819175956.png",
["JClear"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820162149.png",
["Activator"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820162648.png",
["Drawings"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819180728.png",
["ks"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819181002.png",
["Pred"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820162931.png",
["BlockSpell"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819175312.png",
["AutoUseCC"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819181726.png",
["Engage"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820163602.png",
["Mana"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819182036.png",
["AutoWImmo"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820164242.png",
["AutoWE"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819182359.png",
["AutoRSafeLife"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819182546.png",
["AutoW"] = "https://github.com/zamipefuve/xiaohei/raw/master/QQ%E6%88%AA%E5%9B%BE20190819182702.png",
["AutoQImmo"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820164447.png",
["AutoE"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819182908.png",
["AutoECCSpells"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819183332.png",
["Flee"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819183516.png",
["AutoEW"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819183712.png",
["KeySet"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820164617.png",
["QSet"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820164757.png",
["WSet"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820164913.png",
["RSet"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190820165000.png",
["AutoR"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819184028.png",
["Gapclose"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819184140.png",
["Lasthit"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819184305.png",
["Misc"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819184434.png",
["junglesteal"] = "https://raw.githubusercontent.com/zamipefuve/xiaohei/master/QQ%E6%88%AA%E5%9B%BE20190819184614.png"
}



local cancelSpells = {
  ["Caitlyn"] = {
    ["CaitlynAceintheHole"] = {name = "Ace in the Hole"} --R
  },
  ["Darius"] = {
    ["DariusExecute"] = {name = "Noxian Guillotine"} --R
  },
  ["FiddleSticks"] = {
    ["DrainChannel"] = {name = "Drain"},  --W 
    ["Crowstorm"] = {name = "Crowstorm"}  --R 
  },
  ["Gragas"] = {
    ["GragasW"] = {name = "Drunken Rage"} --W 
  },
  ["Janna"] = {
    ["ReapTheWhirlwind"] = {name = "Monsoon"} --R
  },
  ["Karthus"] = {
    ["KarthusFallenOne"] = {name = "Requiem"} --R karthusfallenonecastsound
  },
  ["Katarina"] = {
    ["KatarinaR"] = {name = "Death Lotus"} --R 
  },
  ["Malzahar"] = {
    ["AlZaharNetherGrasp"] = {name = "Nether Grasp"} --R
  },
  ["MasterYi"] = {
    ["Meditate"] = {name = "Meditate"} --W 
  },
  ["MissFortune"] = {
    ["MissFortuneBulletTime"] = {name = "Bullet Time"} --R missfortunebulletsound   
  },
  ["Nunu"] = {
    ["AbsoluteZero"] = {name = "Absolute Zero"} --R
  },
  ["Pantheon"] = {
    ["PantheonE"] = {name = "Heartseeker Strike"}, --E
    ["PantheonRJump"] = {name = "Grand Skyfall"} --R
  },
  ["TwistedFate"] = {
    ["Destiny"] = {name = "Gate"} --R 
  },
  ["Warwick"] = {
    ["InfiniteDuress"] = {name = "Infinite Duress"} --R warwickrsound
  },
  ["Rammus"] = {
    ["PowerBall"] = {name = "Powerball"} --Q 
  }
}
local units = {}
local foundAUnit = false
	
local CCExceptions = {    
	["CamilleEMissile"] = true,
	["HecarimUltMissile"] = true,
	["HowlingGaleSpell"] = true,
	["JhinETrap"] = true,
	["JhinRShotMis"] = true,
	["JinxEHit"] = true,
	["SyndraESphereMissile"] = true,
	["ThreshQMissile"] = true,
}

local CCSpells = {
	["AatroxW"] = {charName = "Aatrox", displayName = "Infernal Chains", slot = _W, origin = "spell", type = "linear", speed = 1800, range = 825, delay = 0.25, radius = 80, collision = true},
	["AhriSeduce"] = {charName = "Ahri", displayName = "Seduce", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 975, delay = 0.25, radius = 60, collision = true},
	["AhriSeduceMissile"] = {charName = "Ahri", displayName = "Seduce [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1500, range = 975, delay = 0.25, radius = 60, collision = true},
	["AkaliR"] = {charName = "Akali", displayName = "Perfect Execution [First]", slot = _R, origin = "spell", type = "linear", speed = 1800, range = 525, delay = 0, radius = 65, collision = false},
	["Pulverize"] = {charName = "Alistar", displayName = "Pulverize", slot = _Q, origin = "spell", type = "circular", speed = math.huge, range = 0, delay = 0.25, radius = 365, collision = false},
	["BandageToss"] = {charName = "Amumu", displayName = "Bandage Toss", slot = _Q, origin = "spell", type = "linear", speed = 2000, range = 1100, delay = 0.25, radius = 80, collision = true},
	["SadMummyBandageToss"] = {charName = "Amumu", displayName = "Bandage Toss [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 2000, range = 1100, delay = 0.25, radius = 80, collision = true},
	["CurseoftheSadMummy"] = {charName = "Amumu", displayName = "Curse of the Sad Mummy", slot = _R, origin = "spell", type = "circular", speed = math.huge, range = 0, delay = 0.25, radius = 550, collision = false},
	["FlashFrostSpell"] = {charName = "Anivia", displayName = "Flash Frost",missileName = "FlashFrostSpell", slot = _Q, origin = "both", type = "linear", speed = 850, range = 1100, delay = 0.25, radius = 110, collision = false},
	["EnchantedCrystalArrow"] = {charName = "Ashe", displayName = "Enchanted Crystal Arrow", slot = _R, origin = "both", type = "linear", speed = 1600, range = 25000, delay = 0.25, radius = 130, collision = false},
	["AurelionSolQ"] = {charName = "AurelionSol", displayName = "Starsurge", slot = _Q, origin = "spell", type = "linear", speed = 850, range = 25000, delay = 0, radius = 110, collision = false},
	["AurelionSolQMissile"] = {charName = "AurelionSol", displayName = "Starsurge [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 850, range = 25000, delay = 0, radius = 110, collision = false},
	["AzirR"] = {charName = "Azir", displayName = "Emperor's Divide", slot = _R, origin = "spell", type = "linear", speed = 1400, range = 500, delay = 0.3, radius = 250, collision = false},
	["BardQ"] = {charName = "Bard", displayName = "Cosmic Binding", slot = _Q, origin = "spell", type = "linear", speed = 1500, range = 950, delay = 0.25, radius = 60, collision = true},
	["BardQMissile"] = {charName = "Bard", displayName = "Cosmic Binding [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1500, range = 950, delay = 0.25, radius = 60, collision = true},
	["BardR"] = {charName = "Bard", displayName = "Tempered Fate", slot = _R, origin = "spell", type = "circular", speed = 2100, range = 3400, delay = 0.5, radius = 350, collision = false},
	["BardRMissile"] = {charName = "Bard", displayName = "Tempered Fate [Missile]", slot = _R, origin = "missile", type = "circular", speed = 2100, range = 3400, delay = 0.5, radius = 350, collision = false},
	["RocketGrab"] = {charName = "Blitzcrank", displayName = "Rocket Grab", slot = _Q, origin = "spell", type = "linear", speed = 1800, range = 1050, delay = 0.25, radius = 70, collision = true},
	["RocketGrabMissile"] = {charName = "Blitzcrank", displayName = "Rocket Grab [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1800, range = 1050, delay = 0.25, radius = 70, collision = true},
	["BraumQ"] = {charName = "Braum", displayName = "Winter's Bite", slot = _Q, origin = "spell", type = "linear", speed = 1700, range = 1000, delay = 0.25, radius = 70, collision = true},
	["BraumQMissile"] = {charName = "Braum", displayName = "Winter's Bite [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1700, range = 1000, delay = 0.25, radius = 70, collision = true},
	["BraumR"] = {charName = "Braum", displayName = "Glacial Fissure", slot = _R, origin = "spell", type = "linear", speed = 1400, range = 1250, delay = 0.5, radius = 115, collision = false},
	["BraumRMissile"] = {charName = "Braum", displayName = "Glacial Fissure [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1400, range = 1250, delay = 0.5, radius = 115, collision = false},
	["CaitlynYordleTrap"] = {charName = "Caitlyn", displayName = "Yordle Trap", slot = _W, origin = "spell", type = "circular", speed = math.huge, range = 800, delay = 0.25, radius = 75, collision = false},
	["CaitlynEntrapment"] = {charName = "Caitlyn", displayName = "Entrapment", slot = _E, origin = "spell", type = "linear", speed = 1600, range = 750, delay = 0.15, radius = 70, collision = true},
	["CassiopeiaW"] = {charName = "Cassiopeia", displayName = "Miasma", slot = _W, origin = "spell", type = "circular", speed = 2500, range = 800, delay = 0.75, radius = 160, collision = false},
	["Rupture"] = {charName = "Chogath", displayName = "Rupture", slot = _Q, origin = "spell", type = "circular", speed = math.huge, range = 950, delay = 1.2, radius = 250, collision = false},
	["InfectedCleaverMissile"] = {charName = "DrMundo", displayName = "Infected Cleaver", slot = _Q, origin = "both", type = "linear", speed = 2000, range = 975, delay = 0.25, radius = 60, collision = true},
	["DravenDoubleShot"] = {charName = "Draven", displayName = "Double Shot", slot = _E, origin = "spell", type = "linear", speed = 1600, range = 1050, delay = 0.25, radius = 130, collision = false},
	["DravenDoubleShotMissile"] = {charName = "Draven", displayName = "Double Shot [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1600, range = 1050, delay = 0.25, radius = 130, collision = false},
	["EkkoQ"] = {charName = "Ekko", displayName = "Timewinder", slot = _Q, origin = "spell", type = "linear", speed = 1650, range = 1175, delay = 0.25, radius = 60, collision = false},
	["EkkoQMis"] = {charName = "Ekko", displayName = "Timewinder [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1650, range = 1175, delay = 0.25, radius = 60, collision = false},
	["EkkoW"] = {charName = "Ekko", displayName = "Parallel Convergence", slot = _W, origin = "spell", type = "circular", speed = math.huge, range = 1600, delay = 3.35, radius = 400, collision = false},
	["EkkoWMis"] = {charName = "Ekko", displayName = "Parallel Convergence [Missile]", slot = _W, origin = "missile", type = "circular", speed = math.huge, range = 1600, delay = 3.35, radius = 400, collision = false},
	["EliseHumanE"] = {charName = "Elise", displayName = "Cocoon", slot = _E, origin = "both", type = "linear", speed = 1600, range = 1075, delay = 0.25, radius = 55, collision = true},
	["FizzR"] = {charName = "Fizz", displayName = "Chum the Waters", slot = _R, origin = "spell", type = "linear", speed = 1300, range = 1300, delay = 0.25, radius = 150, collision = false},
	["FizzRMissile"] = {charName = "Fizz", displayName = "Chum the Waters [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1300, range = 1300, delay = 0.25, radius = 150, collision = false},
	["GalioE"] = {charName = "Galio", displayName = "Justice Punch", slot = _E, origin = "spell", type = "linear", speed = 2300, range = 650, delay = 0.4, radius = 160, collision = false},
	["GnarQMissile"] = {charName = "Gnar", displayName = "Boomerang Throw", slot = _Q, origin = "both", type = "linear", speed = 2500, range = 1125, delay = 0.25, radius = 55, collision = false},
	["GnarBigQMissile"] = {charName = "Gnar", displayName = "Boulder Toss", slot = _Q, origin = "both", type = "linear", speed = 2100, range = 1125, delay = 0.5, radius = 90, collision = true},
	["GnarBigW"] = {charName = "Gnar", displayName = "Wallop", slot = _W, origin = "spell", type = "linear", speed = math.huge, range = 575, delay = 0.6, radius = 100, collision = false},
	["GnarR"] = {charName = "Gnar", displayName = "GNAR!", slot = _R, origin = "spell", type = "circular", speed = math.huge, range = 0, delay = 0.25, radius = 475, collision = false},
	["GragasQ"] = {charName = "Gragas", displayName = "Barrel Roll", slot = _Q, origin = "spell", type = "circular", speed = 1000, range = 850, delay = 0.25, radius = 275, collision = false},
	["GragasQMissile"] = {charName = "Gragas", displayName = "Barrel Roll [Missile]", slot = _Q, origin = "missile", type = "circular", speed = 1000, range = 850, delay = 0.25, radius = 275, collision = false},
	["GragasR"] = {charName = "Gragas", displayName = "Explosive Cask", slot = _R, origin = "spell", type = "circular", speed = 1800, range = 1000, delay = 0.25, radius = 400, collision = false},
	["GragasRBoom"] = {charName = "Gragas", displayName = "Explosive Cask [Missile]", slot = _R, origin = "missile", type = "circular", speed = 1800, range = 1000, delay = 0.25, radius = 400, collision = false},
	["GravesSmokeGrenade"] = {charName = "Graves", displayName = "Smoke Grenade", slot = _W, origin = "spell", type = "circular", speed = 1500, range = 950, delay = 0.15, radius = 250, collision = false},
	["GravesSmokeGrenadeBoom"] = {charName = "Graves", displayName = "Smoke Grenade [Missile]", slot = _W, origin = "missile", type = "circular", speed = 1500, range = 950, delay = 0.15, radius = 250, collision = false},
	["HecarimUltMissile"] = {charName = "Hecarim", displayName = "Onslaught of Shadows", slot = _R, origin = "missile", type = "linear", speed = 1100, range = 1650, delay = 0.2, radius = 280, collision = false},
	["HeimerdingerE"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade", slot = _E, origin = "spell", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["HeimerdingerESpell"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["HeimerdingerEUlt"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade", slot = _E, origin = "spell", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["HeimerdingerESpell_ult"] = {charName = "Heimerdinger", displayName = "CH-2 Electron Storm Grenade [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1200, range = 970, delay = 0.25, radius = 250, collision = false},
	["IreliaW2"] = {charName = "Illaoi", displayName = "Defiant Dance", slot = _W, origin = "spell", type = "linear", speed = math.huge, range = 775, delay = 0.25, radius = 120, collision = false},
	["IreliaR"] = {charName = "Illaoi", displayName = "Vanguard's Edge", slot = _R, origin = "both", type = "linear", speed = 2000, range = 950, delay = 0.4, radius = 160, collision = false},
	["IvernQ"] = {charName = "Illaoi", displayName = "Rootcaller", slot = _Q, origin = "both", type = "linear", speed = 1300, range = 1075, delay = 0.25, radius = 80, collision = true},
	["HowlingGaleSpell"] = {charName = "Janna", displayName = "Howling Gale [1]", slot = _Q, origin = "missile", type = "linear", speed = 667, range = 995, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell2"] = {charName = "Janna", displayName = "Howling Gale [2]", slot = _Q, origin = "missile", type = "linear", speed = 700, range = 1045, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell3"] = {charName = "Janna", displayName = "Howling Gale [3]", slot = _Q, origin = "missile", type = "linear", speed = 733, range = 1095, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell4"] = {charName = "Janna", displayName = "Howling Gale [4]", slot = _Q, origin = "missile", type = "linear", speed = 767, range = 1145, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell5"] = {charName = "Janna", displayName = "Howling Gale [5]", slot = _Q, origin = "missile", type = "linear", speed = 800, range = 1195, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell6"] = {charName = "Janna", displayName = "Howling Gale [6]", slot = _Q, origin = "missile", type = "linear", speed = 833, range = 1245, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell7"] = {charName = "Janna", displayName = "Howling Gale [7]", slot = _Q, origin = "missile", type = "linear", speed = 867, range = 1295, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell8"] = {charName = "Janna", displayName = "Howling Gale [8]", slot = _Q, origin = "missile", type = "linear", speed = 900, range = 1345, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell9"] = {charName = "Janna", displayName = "Howling Gale [9]", slot = _Q, origin = "missile", type = "linear", speed = 933, range = 1395, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell10"] = {charName = "Janna", displayName = "Howling Gale [10]", slot = _Q, origin = "missile", type = "linear", speed = 967, range = 1445, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell11"] = {charName = "Janna", displayName = "Howling Gale [11]", slot = _Q, origin = "missile", type = "linear", speed = 1000, range = 1495, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell12"] = {charName = "Janna", displayName = "Howling Gale [12]", slot = _Q, origin = "missile", type = "linear", speed = 1033, range = 1545, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell13"] = {charName = "Janna", displayName = "Howling Gale [13]", slot = _Q, origin = "missile", type = "linear", speed = 1067, range = 1595, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell14"] = {charName = "Janna", displayName = "Howling Gale [14]", slot = _Q, origin = "missile", type = "linear", speed = 1100, range = 1645, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell15"] = {charName = "Janna", displayName = "Howling Gale [15]", slot = _Q, origin = "missile", type = "linear", speed = 1133, range = 1695, delay = 0, radius = 120, collision = false},
	["HowlingGaleSpell16"] = {charName = "Janna", displayName = "Howling Gale [16]", slot = _Q, origin = "missile", type = "linear", speed = 1167, range = 1745, delay = 0, radius = 120, collision = false},
	["JarvanIVDragonStrike"] = {charName = "JarvanIV", displayName = "Dragon Strike", slot = _Q, origin = "spell", type = "linear", speed = math.huge, range = 770, delay = 0.4, radius = 70, collision = false},
	["JhinW"] = {charName = "Jhin", displayName = "Deadly Flourish", slot = _W, origin = "spell", type = "linear", speed = 5000, range = 2550, delay = 0.75, radius = 40, collision = false},
	["JhinE"] = {charName = "Jhin", displayName = "Captive Audience", slot = _E, origin = "spell", type = "circular", speed = 1600, range = 750, delay = 0.25, radius = 130, collision = false},
	["JhinETrap"] = {charName = "Jhin", displayName = "Captive Audience [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1600, range = 750, delay = 0.25, radius = 130, collision = false},
	["JhinRShotMis"] = {charName = "Jhin", displayName = "Curtain Call [Missile]", slot = _R, origin = "missile", type = "linear", speed = 5000, range = 3500, delay = 0.25, radius = 80, collision = false},
	["JinxWMissile"] = {charName = "Jinx", displayName = "Zap!", slot = _W, origin = "both", type = "linear", speed = 3300, range = 1450, delay = 0.6, radius = 60, collision = true},
	["JinxEHit"] = {charName = "Jinx", displayName = "Flame Chompers! [Missile]", slot = _E, origin = "missile", type = "circular", speed = 1750, range = 900, delay = 0, radius = 120, collision = false},
	["KarmaQ"] = {charName = "Karma", displayName = "Inner Flame", slot = _Q, origin = "spell", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 60, collision = true},
	["KarmaQMissile"] = {charName = "Karma", displayName = "Inner Flame [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 60, collision = true},
	["KarmaQMantra"] = {charName = "Karma", displayName = "Inner Flame [Mantra]", slot = _Q, origin = "linear", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 80, collision = true},
	["KarmaQMissileMantra"] = {charName = "Karma", displayName = "Inner Flame [Mantra, Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1700, range = 950, delay = 0.25, radius = 80, collision = true},
	["KaynW"] = {charName = "Kayn", displayName = "Blade's Reach", slot = _W, origin = "spell", type = "linear", speed = math.huge, range = 700, delay = 0.55, radius = 90, collision = false},
	["KhazixWLong"] = {charName = "Khazix", displayName = "Void Spike [Threeway]", slot = _W, origin = "spell", type = "threeway", speed = 1700, range = 1000, delay = 0.25, radius = 70,angle = 23, collision = true},
	["KledQ"] = {charName = "Kled", displayName = "Beartrap on a Rope", slot = _Q, origin = "spell", type = "linear", speed = 1600, range = 800, delay = 0.25, radius = 45, collision = true},
	["KledQMissile"] = {charName = "Kled", displayName = "Beartrap on a Rope [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1600, range = 800, delay = 0.25, radius = 45, collision = true},
	["KogMawVoidOozeMissile"] = {charName = "KogMaw", displayName = "Void Ooze", slot = _E, origin = "both", type = "linear", speed = 1400, range = 1360, delay = 0.25, radius = 120, collision = false},
	["LeblancE"] = {charName = "Leblanc", displayName = "Ethereal Chains [Standard]", slot = _E, origin = "spell", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeblancEMissile"] = {charName = "Leblanc", displayName = "Ethereal Chains [Standard, Missile]", slot = _E, origin = "missile", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeblancRE"] = {charName = "Leblanc", displayName = "Ethereal Chains [Ultimate]", slot = _E, origin = "spell", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeblancREMissile"] = {charName = "Leblanc", displayName = "Ethereal Chains [Ultimate, Missile]", slot = _E, origin = "missile", type = "linear", speed = 1750, range = 925, delay = 0.25, radius = 55, collision = true},
	["LeonaZenithBlade"] = {charName = "Leona", displayName = "Zenith Blade", slot = _E, origin = "spell", type = "linear", speed = 2000, range = 875, delay = 0.25, radius = 70, collision = false},
	["LeonaSolarFlare"] = {charName = "Leona", displayName = "Solar Flare", slot = _R, origin = "spell", type = "circular", speed = math.huge, range = 1200, delay = 0.85, radius = 300, collision = false},
	["LissandraQMissile"] = {charName = "Lissandra", displayName = "Ice Shard", slot = _Q, origin = "both", type = "linear", speed = 2200, range = 750, delay = 0.25, radius = 75, collision = false},
	["LuluQ"] = {charName = "Lulu", displayName = "Glitterlance", slot = _Q, origin = "spell", type = "linear", speed = 1450, range = 925, delay = 0.25, radius = 60, collision = false},
	["LuluQMissile"] = {charName = "Lulu", displayName = "Glitterlance [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1450, range = 925, delay = 0.25, radius = 60, collision = false},
	["LuxLightBinding"] = {charName = "Lux", displayName = "Light Binding", slot = _Q, origin = "spell", type = "linear", speed = 1200, range = 1175, delay = 0.25, radius = 50, collision = true},
	["LuxLightBindingDummy"] = {charName = "Lux", displayName = "Light Binding [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1200, range = 1175, delay = 0.25, radius = 50, collision = true},
	["LuxLightStrikeKugel"] = {charName = "Lux", displayName = "Light Strike Kugel", slot = _E, origin = "both", type = "circular", speed = 1200, range = 1100, delay = 0.25, radius = 300, collision = true},
	["Landslide"] = {charName = "Malphite", displayName = "Ground Slam", slot = _E, origin = "spell", type = "circular", speed = math.huge, range = 0, delay = 0.242, radius = 400, collision = false},
	["MalzaharQ"] = {charName = "Malzahar", displayName = "Call of the Void", slot = _Q, origin = "spell", type = "rectangular", speed = 1600, range = 900, delay = 0.5, radius = 400, radius2 = 100, collision = false},
	["MalzaharQMissile"] = {charName = "Malzahar", displayName = "Call of the Void [Missile]", slot = _Q, origin = "missile", type = "rectangular", speed = 1600, range = 900, delay = 0.5, radius = 400, radius2 = 100, collision = false},
	["MaokaiQ"] = {charName = "Maokai", displayName = "Bramble Smash", slot = _Q, origin = "spell", type = "linear", speed = 1600, range = 600, delay = 0.375, radius = 110, collision = false},
	["MaokaiQMissile"] = {charName = "Maokai", displayName = "Bramble Smash [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1600, range = 600, delay = 0.375, radius = 110, collision = false},
	["DarkBindingMissile"] = {charName = "Morgana", displayName = "Dark Binding", slot = _Q, origin = "both", type = "linear", speed = 1200, range = 1175, delay = 0.25, radius = 70, collision = true},
	["NamiQ"] = {charName = "Nami", displayName = "Aqua Prison", slot = _Q, origin = "spell", type = "circular", speed = math.huge, range = 875, delay = 1, radius = 180, collision = false},
	["NamiRMissile"] = {charName = "Nami", displayName = "Tidal Wave", slot = _R, origin = "both", type = "linear", speed = 850, range = 2750, delay = 0.5, radius = 250, collision = false},
	["NautilusAnchorDragMissile"] = {charName = "Nautilus", displayName = "Dredge Line", slot = _Q, origin = "both", type = "linear", speed = 2000, range = 925, delay = 0.25, radius = 90, collision = true},
	["NeekoQ"] = {charName = "Neeko", displayName = "Blooming Burst", slot = _Q, origin = "both", type = "circular", speed = 1500, range = 800, delay = 0.25, radius = 200, collision = false},
	["NeekoE"] = {charName = "Neeko", displayName = "Tangle-Barbs", slot = _E, origin = "both", type = "linear", speed = 1400, range = 1000, delay = 0.25, radius = 65, collision = false},
	["NunuR"] = {charName = "Nunu", displayName = "Absolute Zero", slot = _R, origin = "spell", type = "circular", speed = math.huge, range = 0, delay = 3, radius = 650, collision = false},
	["OlafAxeThrowCast"] = {charName = "Olaf", displayName = "Undertow", slot = _Q, origin = "spell", type = "linear", speed = 1600, range = 1000, delay = 0.25, radius = 90, collision = false},
	["OlafAxeThrow"] = {charName = "Olaf", displayName = "Undertow [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1600, range = 1000, delay = 0.25, radius = 90, collision = false},
	["OrnnQ"] = {charName = "Ornn", displayName = "Volcanic Rupture", slot = _Q, origin = "spell", type = "linear", speed = 1800, range = 800, delay = 0.3, radius = 65, collision = false},
	-- OrnnQMissile
	["OrnnE"] = {charName = "Ornn", displayName = "Searing Charge", slot = _E, origin = "spell", type = "linear", speed = 1800, range = 800, delay = 0.35, radius = 150, collision = false},
	["OrnnRCharge"] = {charName = "Ornn", displayName = "Call of the Forge God", slot = _R, origin = "spell", type = "linear", speed = 1650, range = 2500, delay = 0.5, radius = 200, collision = false},
	-- OrnnRMissile
	["PoppyQSpell"] = {charName = "Poppy", displayName = "Hammer Shock", slot = _Q, origin = "spell", type = "linear", speed = math.huge, range = 430, delay = 0.332, radius = 100, collision = false},
	["PoppyRSpell"] = {charName = "Poppy", displayName = "Keeper's Verdict", slot = _R, origin = "spell", type = "linear", speed = 2000, range = 1200, delay = 0.33, radius = 100, collision = false},
	["PoppyRSpellMissile"] = {charName = "Poppy", displayName = "Keeper's Verdict [Missile]", slot = _R, origin = "missile", type = "linear", speed = 2000, range = 1200, delay = 0.33, radius = 100, collision = false},
	["PykeQMelee"] = {charName = "Pyke", displayName = "Bone Skewer [Melee]", slot = _Q, origin = "spell", type = "linear", speed = math.huge, range = 400, delay = 0.25, radius = 70, collision = false},
	["PykeQRange"] = {charName = "Pyke", displayName = "Bone Skewer [Range]", slot = _Q, origin = "both", type = "linear", speed = 2000, range = 1100, delay = 0.2, radius = 70, collision = true},
	["PykeE"] = {charName = "Pyke", displayName = "Phantom Undertow", slot = _E, origin = "spell", type = "linear", speed = 3000, range = 25000, delay = 0, radius = 110, collision = false},
	["PykeEMissile"] = {charName = "Pyke", displayName = "Phantom Undertow [Missile]", slot = _E, origin = "missile", type = "linear", speed = 3000, range = 25000, delay = 0, radius = 110, collision = false},
	["RakanW"] = {charName = "Rakan", displayName = "Grand Entrance", slot = _W, origin = "spell", type = "circular", speed = math.huge, range = 650, delay = 0.7, radius = 265, collision = false},
	["RengarE"] = {charName = "Rengar", displayName = "Bola Strike", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 1000, delay = 0.25, radius = 70, collision = true},
	["RengarEMis"] = {charName = "Rengar", displayName = "Bola Strike [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1500, range = 1000, delay = 0.25, radius = 70, collision = true},
	["RumbleGrenade"] = {charName = "Rumble", displayName = "Electro Harpoon", slot = _E, origin = "spell", type = "linear", speed = 2000, range = 850, delay = 0.25, radius = 60, collision = true},
	["RumbleGrenadeMissile"] = {charName = "Rumble", displayName = "Electro Harpoon [Missile]", slot = _E, origin = "missile", type = "linear", speed = 2000, range = 850, delay = 0.25, radius = 60, collision = true},
	["SejuaniR"] = {charName = "Sejuani", displayName = "Glacial Prison", slot = _R, origin = "spell", type = "linear", speed = 1600, range = 1300, delay = 0.25, radius = 120, collision = false},
	["SejuaniRMissile"] = {charName = "Sejuani", displayName = "Glacial Prison [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1600, range = 1300, delay = 0.25, radius = 120, collision = false},
	["ShyvanaTransformLeap"] = {charName = "Shyvana", displayName = "Transform Leap", slot = _R, origin = "spell", type = "linear", speed = 700, range = 850, delay = 0.25, radius = 150, collision = false},
	["SionQ"] = {charName = "Sion", displayName = "Decimating Smash", slot = _Q, origin = "", type = "linear", speed = math.huge, range = 750, delay = 2, radius = 150, collision = false},
	["SionE"] = {charName = "Sion", displayName = "Roar of the Slayer", slot = _E, origin = "spell", type = "linear", speed = 1800, range = 800, delay = 0.25, radius = 80, collision = false},
	["SionEMissile"] = {charName = "Sion", displayName = "Roar of the Slayer [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1800, range = 800, delay = 0.25, radius = 80, collision = false},
	["SkarnerFractureMissile"] = {charName = "Skarner", displayName = "Fracture", slot = _E, origin = "both", type = "linear", speed = 1500, range = 1000, delay = 0.25, radius = 70, collision = false},
	["SonaR"] = {charName = "Sona", displayName = "Crescendo", slot = _R, origin = "spell", type = "linear", speed = 2400, range = 1000, delay = 0.25, radius = 140, collision = false},
	["SonaRMissile"] = {charName = "Sona", displayName = "Crescendo [Missile]", slot = _R, origin = "missile", type = "linear", speed = 2400, range = 1000, delay = 0.25, radius = 140, collision = false},
	["SorakaQ"] = {charName = "Soraka", displayName = "Starcall", slot = _Q, origin = "spell", type = "circular", speed = 1150, range = 810, delay = 0.25, radius = 235, collision = false},
	["SorakaQMissile"] = {charName = "Soraka", displayName = "Starcall [Missile]", slot = _Q, origin = "missile", type = "circular", speed = 1150, range = 810, delay = 0.25, radius = 235, collision = false},
	["SwainW"] = {charName = "Swain", displayName = "Vision of Empire", slot = _W, origin = "spell", type = "circular", speed = math.huge, range = 3500, delay = 1.5, radius = 300, collision = false},
	["SwainE"] = {charName = "Swain", displayName = "Nevermove", slot = _E, origin = "both", type = "linear", speed = 1800, range = 850, delay = 0.25, radius = 85, collision = false},
	["SyndraESphereMissile"] = {charName = "Syndra", displayName = "Scatter the Weak [Seed]", slot = _E, origin = "missile", type = "linear", speed = 2000, range = 950, delay = 0.25, radius = 100, collision = false},
	["TahmKenchQ"] = {charName = "TahmKench", displayName = "Tongue Lash", slot = _Q, origin = "spell", type = "linear", speed = 2800, range = 800, delay = 0.25, radius = 70, collision = true},
	["TahmKenchQMissile"] = {charName = "TahmKench", displayName = "Tongue Lash [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 2800, range = 800, delay = 0.25, radius = 70, collision = true},
	["TaliyahWVC"] = {charName = "Taliyah", displayName = "Seismic Shove", slot = _W, origin = "spell", type = "circular", speed = math.huge, range = 900, delay = 0.85, radius = 150, collision = false},
	["TaliyahR"] = {charName = "Taliyah", displayName = "Weaver's Wall", slot = _R, origin = "spell", type = "linear", speed = 1700, range = 3000, delay = 1, radius = 120, collision = false},
	["TaliyahRMis"] = {charName = "Taliyah", displayName = "Weaver's Wall [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1700, range = 3000, delay = 1, radius = 120, collision = false},
	["ThreshQMissile"] = {charName = "Thresh", displayName = "Death Sentence [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1900, range = 1075, delay = 0.5, radius = 70, collision = true},
	["ThreshE"] = {charName = "Thresh", displayName = "Flay", slot = _E, origin = "spell", type = "linear", speed = math.huge, range = 500, delay = 0.389, radius = 110, collision = true},
	["ThreshEMissile1"] = {charName = "Thresh", displayName = "Flay [Missile]", slot = _E, origin = "missile", type = "linear", speed = math.huge, range = 500, delay = 0.389, radius = 110, collision = true},
	["TristanaW"] = {charName = "Tristana", displayName = "Rocket Jump", slot = _W, origin = "spell", type = "circular", speed = 1100, range = 900, delay = 0.25, radius = 300, collision = false},
	["UrgotQ"] = {charName = "Urgot", displayName = "Corrosive Charge", slot = _Q, origin = "spell", type = "circular", speed = math.huge, range = 800, delay = 0.6, radius = 180, collision = false},
	["UrgotQMissile"] = {charName = "Urgot", displayName = "Corrosive Charge [Missile]", slot = _Q, origin = "missile", type = "circular", speed = math.huge, range = 800, delay = 0.6, radius = 180, collision = false},
	["UrgotE"] = {charName = "Urgot", displayName = "Disdain", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 475, delay = 0.45, radius = 100, collision = false},
	["UrgotR"] = {charName = "Urgot", displayName = "Fear Beyond Death", slot = _R, origin = "both", type = "linear", speed = 3200, range = 1600, delay = 0.4, radius = 80, collision = false},
	["VarusE"] = {charName = "Varus", displayName = "Hail of Arrows", slot = _E, origin = "spell", type = "linear", speed = 1500, range = 925, delay = 0.242, radius = 260, collision = false},
	["VarusEMissile"] = {charName = "Varus", displayName = "Hail of Arrows [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1500, range = 925, delay = 0.242, radius = 260, collision = false},
	["VarusR"] = {charName = "Varus", displayName = "Chain of Corruption", slot = _R, origin = "spell", type = "linear", speed = 1950, range = 1200, delay = 0.25, radius = 120, collision = false},
	["VarusRMissile"] = {charName = "Varus", displayName = "Chain of Corruption [Missile]", slot = _R, origin = "missile", type = "linear", speed = 1950, range = 1200, delay = 0.25, radius = 120, collision = false},
	["VelkozQ"] = {charName = "Velkoz", displayName = "Plasma Fission", slot = _Q, origin = "spell", type = "linear", speed = 1300, range = 1050, delay = 0.25, radius = 50, collision = true},
	["VelkozQMissile"] = {charName = "Velkoz", displayName = "Plasma Fission [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1300, range = 1050, delay = 0.25, radius = 50, collision = true},
	["VelkozQMissileSplit"] = {charName = "Velkoz", displayName = "Plasma Fission [Split]", slot = _Q, origin = "missile", type = "linear", speed = 2100, range = 1100, delay = 0.25, radius = 45, collision = true},
	["VelkozE"] = {charName = "Velkoz", displayName = "Tectonic Disruption", slot = _E, origin = "spell", type = "circular", speed = math.huge, range = 800, delay = 0.8, radius = 185, collision = false},
	["VelkozEMissile"] = {charName = "Velkoz", displayName = "Tectonic Disruption [Missile]", slot = _E, origin = "missile", type = "circular", speed = math.huge, range = 800, delay = 0.8, radius = 185, collision = false},
	["ViktorGravitonField"] = {charName = "Viktor", displayName = "Graviton Field", slot = _W, origin = "spell", type = "circular", speed = math.huge, range = 800, delay = 1.75, radius = 270, collision = false},
	["WarwickR"] = {charName = "Warwick", displayName = "Infinite Duress", slot = _R, origin = "spell", type = "linear", speed = 1800, range = 3000, delay = 0.1, radius = 55, collision = false},
	["XerathArcaneBarrage2"] = {charName = "Xerath", displayName = "Arcane Barrage", slot = _W, origin = "spell", type = "circular", speed = math.huge, range = 1000, delay = 0.75, radius = 235, collision = false},
	["XerathMageSpear"] = {charName = "Xerath", displayName = "Mage Spear", slot = _E, origin = "spell", type = "linear", speed = 1400, range = 1050, delay = 0.2, radius = 60, collision = true},
	["XerathMageSpearMissile"] = {charName = "Xerath", displayName = "Mage Spear [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1400, range = 1050, delay = 0.2, radius = 60, collision = true},
	["XinZhaoW"] = {charName = "XinZhao", displayName = "Wind Becomes Lightning", slot = _W, origin = "spell", type = "linear", speed = 5000, range = 900, delay = 0.5, radius = 40, collision = false},
	["YasuoQ3Mis"] = {charName = "Yasuo", displayName = "Gathering Storm [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 1200, range = 1100, delay = 0.318, radius = 90, collision = false},
	["ZacQ"] = {charName = "Zac", displayName = "Stretching Strikes", slot = _Q, origin = "spell", type = "linear", speed = 2800, range = 800, delay = 0.33, radius = 120, collision = false},
	["ZacQMissile"] = {charName = "Zac", displayName = "Stretching Strikes [Missile]", slot = _Q, origin = "missile", type = "linear", speed = 2800, range = 800, delay = 0.33, radius = 120, collision = false},
	["ZiggsW"] = {charName = "Ziggs", displayName = "Satchel Charge", slot = _W, origin = "both", type = "circular", speed = 1750, range = 1000, delay = 0.25, radius = 240, collision = false},
	["ZiggsE"] = {charName = "Ziggs", displayName = "Hexplosive Minefield", slot = _E, origin = "both", type = "circular", speed = 1800, range = 900, delay = 0.25, radius = 250, collision = false},
	["ZileanQ"] = {charName = "Zilean", displayName = "Time Bomb", slot = _Q, origin = "spell", type = "circular", speed = math.huge, range = 900, delay = 0.8, radius = 150, collision = false},
	["ZileanQMissile"] = {charName = "Zilean", displayName = "Time Bomb [Missile]", slot = _Q, origin = "missile", type = "circular", speed = math.huge, range = 900, delay = 0.8, radius = 150, collision = false},
	["ZoeE"] = {charName = "Zoe", displayName = "Sleepy Trouble Bubble", slot = _E, origin = "spell", type = "linear", speed = 1700, range = 800, delay = 0.3, radius = 50, collision = true},
	["ZoeEMissile"] = {charName = "Zoe", displayName = "Sleepy Trouble Bubble [Missile]", slot = _E, origin = "missile", type = "linear", speed = 1700, range = 800, delay = 0.3, radius = 50, collision = true},
	["ZyraE"] = {charName = "Zyra", displayName = "Grasping Roots", slot = _E, origin = "both", type = "linear", speed = 1150, range = 1100, delay = 0.25, radius = 70, collision = false},
	["ZyraR"] = {charName = "Zyra", displayName = "Stranglethorns", slot = _R, origin = "spell", type = "circular", speed = math.huge, range = 700, delay = 2, radius = 500, collision = false},
	["BrandConflagration"] = {charName = "Brand", slot = _R, type = "targeted", displayName = "Conflagration", range = 625,cc = true},
	["JarvanIVCataclysm"] = {charName = "JarvanIV", slot = _R, type = "targeted", displayName = "Cataclysm", range = 650},
	["JayceThunderingBlow"] = {charName = "Jayce", slot = _E, type = "targeted", displayName = "Thundering Blow", range = 240},
	["BlindMonkRKick"] = {charName = "LeeSin", slot = _R, type = "targeted", displayName = "Dragon's Rage", range = 375},
	["LissandraR"] = {charName = "Lissandra", slot = _R, type = "targeted", displayName = "Frozen Tomb", range = 550},
	["SeismicShard"] = {charName = "Malphite", slot = _Q, type = "targeted", displayName = "Seismic Shard", range = 625,cc = true},
	["AlZaharNetherGrasp"] = {charName = "Malzahar", slot = _R, type = "targeted", displayName = "Nether Grasp", range = 700},
	["MaokaiW"] = {charName = "Maokai", slot = _W, type = "targeted", displayName = "Twisted Advance", range = 525},
	["NautilusR"] = {charName = "Nautilus", slot = _R, type = "targeted", displayName = "Depth Charge", range = 825},
	["PoppyE"] = {charName = "Poppy", slot = _E, type = "targeted", displayName = "Heroic Charge", range = 475},
	["RyzeW"] = {charName = "Ryze", slot = _W, type = "targeted", displayName = "Rune Prison", range = 615},
	["Fling"] = {charName = "Singed", slot = _E, type = "targeted", displayName = "Fling", range = 125},
	["SkarnerImpale"] = {charName = "Skarner", slot = _R, type = "targeted", displayName = "Impale", range = 350},
	["TahmKenchW"] = {charName = "TahmKench", slot = _W, type = "targeted", displayName = "Devour", range = 250},
	["TristanaR"] = {charName = "Tristana", slot = _R, type = "targeted", displayName = "Buster Shot", range = 669},
}



function GotBuff(unit, buffname)
  for i = 0, unit.buffCount do
    local buff = unit:GetBuff(i)
    if buff.name == buffname and buff.count > 0 then 
      return buff.count
    end
  end
  return 0
end

function GetBuffData(unit, buffname)
  for i = 0, unit.buffCount do
    local buff = unit:GetBuff(i)
    if buff.name == buffname and buff.count > 0 then 
      return buff
    end
  end
  return {type = 0, name = "", startTime = 0, expireTime = 0, duration = 0, stacks = 0, count = 0}
end

local function IsValid(unit, range)
    if (unit and unit.valid and unit.isTargetable and unit.alive and unit.visible and unit.networkID and unit.pathing and unit.health > 0) and GetDistanceSqr(myHero.pos, unit.pos) <= (range + myHero.boundingRadius + unit.boundingRadius) then
        return true;
    end
    return false;
end

local function IsValid(unit)
    if (unit and unit.valid and unit.isTargetable and unit.alive and unit.visible and unit.networkID and unit.pathing and unit.health > 0) then
        return true;
    end
    return false;
end

local function Ready(spell)
    return myHero:GetSpellData(spell).currentCd == 0 and myHero:GetSpellData(spell).level > 0 and myHero:GetSpellData(spell).mana <= myHero.mana
end

keybindings = { [ITEM_1] = HK_ITEM_1, [ITEM_2] = HK_ITEM_2, [ITEM_3] = HK_ITEM_3, [ITEM_4] = HK_ITEM_4, [ITEM_5] = HK_ITEM_5, [ITEM_6] = HK_ITEM_6}
local function GetInventorySlotItem(itemID)
    assert(type(itemID) == "number", "GetInventorySlotItem: wrong argument types (<number> expected)")
    for _, j in pairs({ITEM_1, ITEM_2, ITEM_3, ITEM_4, ITEM_5, ITEM_6, ITEM_7}) do
        if myHero:GetItemData(j).itemID == itemID and myHero:GetSpellData(j).currentCd == 0 then return j end
    end
    return nil
end

local function GetTarget(range) 
	local target = nil 
	if Orb == 1 then
		target = EOW:GetTarget(range)
	elseif Orb == 2 then 
		target = _G.SDK.TargetSelector:GetTarget(range)
	elseif Orb == 3 then
		target = GOS:GetTarget(range)
	elseif Orb == 4 then
		target = _G.gsoSDK.TS:GetTarget()		
	end
	return target 
end


local function GetMode()
	if Orb == 1 then
		return intToMode[EOW.CurrentMode]
	elseif Orb == 2 then
		if _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_COMBO] then
			return "Combo"
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_HARASS] then
			return "Harass"	
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_LANECLEAR] or _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_JUNGLECLEAR] then
			return "Clear"
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_LASTHIT] then
			return "LastHit"
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_FLEE] then
			return "Flee"
		end
	elseif Orb == 4 then
		if _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_COMBO] then
			return "Combo"
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_HARASS] then
			return "Harass"	
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_LANECLEAR] or _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_JUNGLECLEAR] then
			return "Clear"
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_LASTHIT] then
			return "LastHit"
		elseif _G.SDK.Orbwalker.Modes[_G.SDK.ORBWALKER_MODE_FLEE] then
			return "Flee"
		end			
	else
		return GOS.GetMode()
	end
end

local function SetAttack(bool)
	if _G.EOWLoaded then
		EOW:SetAttacks(bool)
	elseif _G.SDK then                                                        
		_G.SDK.Orbwalker:SetAttack(bool)
	elseif _G.gsoSDK then
		_G.gsoSDK.Orbwalker:SetAttack(bool)	
	else
		GOS.BlockAttack = not bool
	end

end

local function SetMovement(bool)
	if _G.EOWLoaded then
		EOW:SetMovements(bool)
		EOW:SetAttacks(bool)
	elseif _G.SDK then
		_G.SDK.Orbwalker:SetMovement(bool)
		_G.SDK.Orbwalker:SetAttack(bool)
	elseif _G.gsoSDK then
		_G.gsoSDK.Orbwalker:SetMovement(bool)
		_G.gsoSDK.Orbwalker:SetAttack(bool)	
	else
		GOS.BlockMovement = not bool
		GOS.BlockAttack = not bool
	end
	if bool then
		castSpell.state = 0
	end
end

local function DisableOrb()
	if _G.SDK.TargetSelector:GetTarget(900) then
		_G.SDK.Orbwalker:SetMovement(false)
		_G.SDK.Orbwalker:SetAttack(false)
		end
end

local function EnableOrb()
	if _G.SDK.TargetSelector:GetTarget(900) then
		_G.SDK.Orbwalker:SetMovement(true)
		_G.SDK.Orbwalker:SetAttack(true)	
		end
end



function CalcPhysicalDamage(target, damage)
	local targetArmor = target.armor * myHero.armorPenPercent - myHero.armorPen
	local damageReduction = 100 / ( 100 + targetArmor)
	if targetArmor < 0 then
		damageReduction = 2 - (100 / (100 - targetArmor))
	end		
	damage = damage * damageReduction	
	return damage
end

function CalcMagicalDamage(target, damage)
	local targetMR = target.magicResist * myHero.magicPenPercent - myHero.magicPen
	local damageReduction = 100 / ( 100 + targetMR)
	if targetMR < 0 then
		damageReduction = 2 - (100 / (100 - targetMR))
	end		
	damage = damage * damageReduction
	
	return damage
end

local function GetPercentHP(unit)
    if type(unit) ~= "userdata" then error("{GetPercentHP}: bad argument #1 (userdata expected, got "..type(unit) .. ")") end
    return 100 * unit.health / unit.maxHealth
end


local function GetPercentMP(unit)
    if type(unit) ~= "userdata" then error("{GetPercentMP}: bad argument #1 (userdata expected, got "..type(unit) .. ")") end
    return 100 * unit.mana / unit.maxMana
end


local function CastSpellMM(spell,pos,range,delay)
	local range = range or math.huge
	local delay = delay or 250
	local ticker = GetTickCount()
	if castSpell.state == 0 and GetDistance(myHero.pos,pos) < range and ticker - castSpell.casting > delay + Game.Latency then
		castSpell.state = 1
		castSpell.mouse = mousePos
		castSpell.tick = ticker
	end
	if castSpell.state == 1 then
		if ticker - castSpell.tick < Game.Latency then
			local castPosMM = pos:ToMM()
			Control.SetCursorPos(castPosMM.x,castPosMM.y)
			Control.KeyDown(spell)
			Control.KeyUp(spell)
			castSpell.casting = ticker + delay
			DelayAction(function()
				if castSpell.state == 1 then
					Control.SetCursorPos(castSpell.mouse)
					castSpell.state = 0
				end
			end,Game.Latency()/1000)
		end
		if ticker - castSpell.casting > Game.Latency then
			Control.SetCursorPos(castSpell.mouse)
			castSpell.state = 0
		end
	end
end

local function CastSpell(HK, pos, delay)
	if spellcast.state == 2 then return end
	if ExtLibEvade and ExtLibEvade.Evading then return end
	
	spellcast.state = 2
	DisableOrb()
	spellcast.mouse = mousePos
	DelayAction(function() 
		Control.SetCursorPos(pos) 
		Control.KeyDown(HK)
		Control.KeyUp(HK)
	end, 0.05) 
	
		DelayAction(function()
			Control.SetCursorPos(spellcast.mouse)
		end,0.25)
		
		DelayAction(function()
			EnableOrb()
			spellcast.state = 1
		end,0.35)
	
end

function GetDistanceSqr(p1, p2)
	if not p1 then return math.huge end
	p2 = p2 or myHero
	local dx = p1.x - p2.x
	local dz = (p1.z or p1.y) - (p2.z or p2.y)
	return dx*dx + dz*dz
end

function GetDistance(p1, p2)
	p2 = p2 or myHero
	return math.sqrt(GetDistanceSqr(p1, p2))
end

function GetDistance2D(p1,p2)
	return math.sqrt((p2.x - p1.x)*(p2.x - p1.x) + (p2.y - p1.y)*(p2.y - p1.y))
end


local function OnProcessSpell()
	for i = 1, #Units do
		local unit = Units[i].unit; local last = Units[i].spell; local spell = unit.activeSpell
		if spell and last ~= (spell.name .. spell.startTime) and unit.isChanneling then
			Units[i].spell = spell.name .. spell.startTime; return unit, spell
		end
	end
	return nil, nil
end

local function EnemiesAround(pos, range)
    local pos = pos.pos
    local N = 0
    for i = 1, Game.HeroCount() do
        local hero = Game.Hero(i)
        if (IsValid(hero, range) and hero.isEnemy and GetDistanceSqr(pos, hero.pos) < range * range) then
            N = N + 1
        end
    end
    return N
end

local function WardsAround(pos, range)
    local pos = pos.pos
    local N = 0
    for i = 1, Game.WardCount() do
		local ward = Game.Ward(i)
        if (IsValid(ward, 1000) and ward.isAlly and GetDistanceSqr(pos, ward.pos) < range * range) then
            N = N + 1
        end
    end
    return N
end

local function HasPoison(unit)
	for i = 0, unit.buffCount do 
	local buff = unit:GetBuff(i)
		if buff.type == 23 and Game.Timer() < buff.expireTime - 0.141  then
			return true
		end
	end
	return false
end

local function CountObjectsNearPos(pos, range, radius, objects)
    local n = 0
    for i, object in pairs(objects) do
        if GetDistanceSqr(pos, object.pos) <= radius * radius then
            n = n + 1
        end
    end
    return n
end

local function GetBestCircularFarmPosition(range, radius, objects)
    local BestPos 
    local BestHit = 0
    for i, object in pairs(objects) do
        local hit = CountObjectsNearPos(object.pos, range, radius, objects)
        if hit > BestHit then
            BestHit = hit
            BestPos = object.pos
            if BestHit == #objects then
               break
            end
         end
    end
    return BestPos, BestHit
end

local function CountEnemiesNear(pos, range)
    local pos = pos.pos
	local count = 0
	for i = 1, Game.HeroCount() do 
	local hero = Game.Hero(i)
	local Range = range * range
		if hero.team ~= TEAM_ALLY and GetDistanceSqr(pos, hero.pos) < Range then
		count = count + 1
		end
	end
	return count
end

local function GetEnemyHeroes()
    local _EnemyHeroes = {}
    for i = 1, Game.HeroCount() do
        local unit = Game.Hero(i)
        if unit.isEnemy then
            table.insert(_EnemyHeroes, unit)
        end
    end
    return _EnemyHeroes
end 

local function IsRecalling(unit)
	for i = 1, 63 do
	local buff = unit:GetBuff(i) 
		if buff.count > 0 and buff.name == "recall" and Game.Timer() < buff.expireTime then
			return true
		end
	end 
	return false
end



local function BaseCheck(unit)
	for i = 1, Game.ObjectCount() do
		local base = Game.Object(i)
		if base.type == Obj_AI_SpawnPoint then
		local range = 800	
			if base.isAlly and base.pos:DistanceTo(unit.pos) < range then
				return true
			end
		end
	end	
	return false	
end			


local function IsImmobileTarget(unit)
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i)
		if buff and (buff.type == 5 or buff.type == 11 or buff.type == 29 or buff.type == 24 or buff.name == 10 ) and buff.count > 0 then
			return true
		end
	end
	return false	
end

local function GetImmobileCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1, Game.HeroCount() do 
	local hero = Game.Hero(i)
	local Range = range * range
		if hero.isEnemy and GetDistanceSqr(pos, hero.pos) < Range and IsImmobileTarget(hero) then
		count = count + 1
		end
	end
	return count
end

local function Cleans(unit)
	if unit == nil then return false end
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i)
		if buff and (buff.type == 5 or buff.type == 7 or buff.type == 8 or buff.type == 21 or buff.type == 22 or buff.type == 25 or buff.type == 10 or buff.type == 31 or buff.type == 24) and buff.count > 0 then
			return true
		end
	end
	return false	
end

local function HasBuff(unit, buffname)
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i)
		if buff.name == buffname and buff.count > 0 then 
			return true
		end
	end
	return false
end

function Block(boolean) 
	if boolean == true then 
		if Orb == 1 then
			EOW:SetAttacks(false)
		elseif Orb == 2 then
			_G.SDK.Orbwalker:SetAttack(false)
		elseif Orb == 4 then
			_G.gsoSDK.Orbwalker:SetAttack(false)			
		else
			--GOS:BlockAttack(true)
		end
	else
		if Orb == 1 then
			EOW:SetAttacks(true)
		elseif Orb == 2 then
			_G.SDK.Orbwalker:SetAttack(true)
		elseif Orb == 4 then
			_G.gsoSDK.Orbwalker:SetAttack(true)			
		else
			--GOS:BlockAttack()
		end
	end
end
 
local _OnVision = {}
function OnVision(unit)
	if _OnVision[unit.networkID] == nil then _OnVision[unit.networkID] = {state = unit.visible , tick = GetTickCount(), pos = unit.pos} end
	if _OnVision[unit.networkID].state == true and not unit.visible then _OnVision[unit.networkID].state = false _OnVision[unit.networkID].tick = GetTickCount() end
	if _OnVision[unit.networkID].state == false and unit.visible then _OnVision[unit.networkID].state = true _OnVision[unit.networkID].tick = GetTickCount() end
	return _OnVision[unit.networkID]
end
Callback.Add("Tick", function() OnVisionF() end)
local visionTick = GetTickCount()
function OnVisionF()
	if GetTickCount() - visionTick > 100 then
		for i,v in pairs(GetEnemyHeroes()) do
			OnVision(v)
		end
	end
end

local _OnWaypoint = {}
function OnWaypoint(unit)
	if _OnWaypoint[unit.networkID] == nil then _OnWaypoint[unit.networkID] = {pos = unit.posTo , speed = unit.ms, time = Game.Timer()} end
	if _OnWaypoint[unit.networkID].pos ~= unit.posTo then 
		-- print("OnWayPoint:"..unit.charName.." | "..math.floor(Game.Timer()))
		_OnWaypoint[unit.networkID] = {startPos = unit.pos, pos = unit.posTo , speed = unit.ms, time = Game.Timer()}
			DelayAction(function()
				local time = (Game.Timer() - _OnWaypoint[unit.networkID].time)
				local speed = GetDistance2D(_OnWaypoint[unit.networkID].startPos,unit.pos)/(Game.Timer() - _OnWaypoint[unit.networkID].time)
				if speed > 1250 and time > 0 and unit.posTo == _OnWaypoint[unit.networkID].pos and GetDistance(unit.pos,_OnWaypoint[unit.networkID].pos) > 200 then
					_OnWaypoint[unit.networkID].speed = GetDistance2D(_OnWaypoint[unit.networkID].startPos,unit.pos)/(Game.Timer() - _OnWaypoint[unit.networkID].time)
					-- print("OnDash: "..unit.charName)
				end
			end,0.05)
	end
	return _OnWaypoint[unit.networkID]
end

local function GetPred(unit,speed,delay)
	local speed = speed or math.huge
	local delay = delay or 0.25
	local unitSpeed = unit.ms
	if OnWaypoint(unit).speed > unitSpeed then unitSpeed = OnWaypoint(unit).speed end
	if OnVision(unit).state == false then
		local unitPos = unit.pos + Vector(unit.pos,unit.posTo):Normalized() * ((GetTickCount() - OnVision(unit).tick)/1000 * unitSpeed)
		local predPos = unitPos + Vector(unit.pos,unit.posTo):Normalized() * (unitSpeed * (delay + (GetDistance(myHero.pos,unitPos)/speed)))
		if GetDistance(unit.pos,predPos) > GetDistance(unit.pos,unit.posTo) then predPos = unit.posTo end
		return predPos
	else
		if unitSpeed > unit.ms then
			local predPos = unit.pos + Vector(OnWaypoint(unit).startPos,unit.posTo):Normalized() * (unitSpeed * (delay + (GetDistance(myHero.pos,unit.pos)/speed)))
			if GetDistance(unit.pos,predPos) > GetDistance(unit.pos,unit.posTo) then predPos = unit.posTo end
			return predPos
		elseif IsImmobileTarget(unit) then
			return unit.pos
		else
			return unit:GetPrediction(speed,delay)
		end
	end
end

local function RightClick(pos)
	Control.mouse_event(MOUSEEVENTF_RIGHTDOWN)
	Control.mouse_event(MOUSEEVENTF_RIGHTUP)
	DelayAction(ReturnCursor,0.05,{pos})
end

local function EnemyInRange(range)
	local count = 0
	for i, target in ipairs(GetEnemyHeroes()) do
		if target.pos:DistanceTo(myHero.pos) < range and IsValid(target) then 
			count = count + 1
		end
	end
	return count
end

local function EnemiesNear(pos,range)
	local pos = pos.pos
	local N = 0
	for i = 1,Game.HeroCount()  do
		local hero = Game.Hero(i)
		local Range = range * range
		if IsValid(hero) and hero.isEnemy and GetDistanceSqr(pos, hero.pos) < Range then
			N = N + 1
		end
	end
	return N	
end	

local function MinionsNear(pos,range)
	local pos = pos.pos
	local N = 0
		for i = 1, Game.MinionCount() do 
		local Minion = Game.Minion(i)
		local Range = range * range
		if IsValid(Minion, 800) and Minion.team == TEAM_ENEMY and GetDistanceSqr(pos, Minion.pos) < Range then
			N = N + 1
		end
	end
	return N	
end	



local function GetMinionCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1,Game.MinionCount() do
	local hero = Game.Minion(i)
	local Range = range * range
		if hero.team ~= TEAM_ALLY and hero.dead == false and GetDistanceSqr(pos, hero.pos) < Range then
		count = count + 1
		end
	end
	return count
end

local function GetEnemyCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1, Game.HeroCount() do 
	local hero = Game.Hero(i)
	local Range = range * range
		if hero.team ~= TEAM_ALLY and GetDistanceSqr(pos, hero.pos) < Range and IsValid(hero) then
		count = count + 1
		end
	end
	return count
end

local function GetAllyCount(range, pos)
    local pos = pos.pos
	local count = 0
	for i = 1, Game.HeroCount() do 
	local hero = Game.Hero(i)
	local Range = range * range
		if hero.team == TEAM_ALLY and hero ~= myHero and GetDistanceSqr(pos, hero.pos) < Range then
		count = count + 1
		end
	end
	return count
end

local function IsUnderTurret(unit)
    for i = 1, Game.TurretCount() do
        local turret = Game.Turret(i)
        local range = (turret.boundingRadius + 750 + unit.boundingRadius / 2)
        if turret.isEnemy and not turret.dead then
            if turret.pos:DistanceTo(unit.pos) < range then
                return true
            end
        end
    end
    return false
end

local function IsUnderAllyTurret(unit)
    for i = 1, Game.TurretCount() do
        local turret = Game.Turret(i)
        local range = (turret.boundingRadius + 750 + unit.boundingRadius / 2)
        if turret.isAlly and not turret.dead then
            if turret.pos:DistanceTo(unit.pos) < range then
                return true
            end
        end
    end
    return false
end

local function GetAllyHeroes() 
	AllyHeroes = {}
	for i = 1, Game.HeroCount() do
		local Hero = Game.Hero(i)
		if Hero.isAlly and not Hero.isMe then
			table.insert(AllyHeroes, Hero)
		end
	end
	return AllyHeroes
end

local function GetAllyTurret() 
	Allyturret = {}
    for i = 1, Game.TurretCount() do
        local turret = Game.Turret(i)
		if turret.isAlly and not turret.dead then
			table.insert(Allyturret, turret)
		end
	end
	return Allyturret
end

local function GetItemSlot(unit, id)
  for i = ITEM_1, ITEM_7 do
    if unit:GetItemData(i).itemID == id then
      return i
    end
  end
  return 0
end

local function MyHeroReady()
    return myHero.dead == false and Game.IsChatOpen() == false and (ExtLibEvade == nil or ExtLibEvade.Evading == false) and IsRecalling(myHero) == false
end


	
class "Ahri"
--require('GamsteronPrediction')


local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 100, Range = 880, Speed = 1700, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_YASUOWALL}
}

local WData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 80, Range = 700, Speed = 900, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION,_G.COLLISION_YASUOWALL}
}

local EData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 60, Range = 975, Speed = 1600, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION,_G.COLLISION_YASUOWALL}
}

local RData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 600, Range = 450, Speed = 2200, Collision = false
}

function Ahri:__init()
	
	self.DetectedMissiles = {}; self.DetectedSpells = {}; self.Target = nil; self.Timer = 0
	if menu ~= 1 then return end
	menu = 2
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4
	end
end

function Ahri:VectorPointProjectionOnLineSegment(v1, v2, v)
	local cx, cy, ax, ay, bx, by = v.x, v.z, v1.x, v1.z, v2.x, v2.z
	local rL = ((cx - ax) * (bx - ax) + (cy - ay) * (by - ay)) / ((bx - ax) ^ 2 + (by - ay) ^ 2)
	local pointLine = { x = ax + rL * (bx - ax), y = ay + rL * (by - ay) }
	local rS = rL < 0 and 0 or (rL > 1 and 1 or rL)
	local isOnSegment = rS == rL
	local pointSegment = isOnSegment and pointLine or { x = ax + rS * (bx - ax), y = ay + rS * (by - ay) }
	return pointSegment, pointLine, isOnSegment
end

function Ahri:CalculateCollisionTime(startPos, endPos, unitPos, startTime, speed, delay, origin)
	local delay = origin == "spell" and delay or 0
	local pos = startPos:Extended(endPos, speed * (Game.Timer() - delay - startTime))
	return GetDistance(unitPos, pos) / speed
end

function Ahri:CalculateEndPos(startPos, placementPos, unitPos, range, radius, collision, type)
	local range = range or 3000; local endPos = startPos:Extended(placementPos, range)
	if type == "circular" or type == "rectangular" then
		if range > 0 then if GetDistance(unitPos, placementPos) < range then endPos = placementPos end
		else endPos = unitPos end
	elseif collision then
		for i = 1, Game.MinionCount() do
			local minion = Game.Minion(i)
			if minion and minion.team == myHero.team and not minion.dead and GetDistance(minion.pos, startPos) < range then
				local col = self:VectorPointProjectionOnLineSegment(startPos, placementPos, minion.pos)
				if col and GetDistance(col, minion.pos) < (radius + minion.boundingRadius / 2) then
					range = GetDistance(startPos, col); endPos = startPos:Extended(placementPos, range); break
				end
			end
		end
	end
	return endPos, range
end

local HeroIcon = "https://vignette.wikia.nocookie.net/leagueoflegends/images/a/aa/Star_Guardian_Ahri_profileicon.png"
local QIcon = "https://vignette.wikia.nocookie.net/leagueoflegends/images/1/19/Orb_of_Deception.png"
local WIcon = "https://vignette.wikia.nocookie.net/leagueoflegends/images/a/a8/Fox-Fire.png"
local EIcon = "https://vignette.wikia.nocookie.net/leagueoflegends/images/0/04/Charm.png"
local RIcon = "https://vignette.wikia.nocookie.net/leagueoflegends/images/8/86/Spirit_Rush.png"

function Ahri:LoadMenu()
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Ahri", name = "阿狸", leftIcon = HeroIcon})
	--ComboMenu
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]", value = true, leftIcon = QIcon})
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W]", value = true, leftIcon = WIcon})
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]", value = true, leftIcon = EIcon})
	self.Menu.Combo:MenuElement({id = "Type", name = "走砍逻辑", value = 2,drop = {"QWE", "EQW", "EWQ"}})	
	self.Menu.Combo:MenuElement({type = MENU, id = "UseR", name = "相应的设置", leftIcon = RIcon})
	self.Menu.Combo.UseR:MenuElement({id = "RR", name = "开/关相对应逻辑", value = true})	
	self.Menu.Combo.UseR:MenuElement({id = "Type", name = "相应的逻辑", value = 1,drop = {"Use for Kill", "Use Full in Combo", "Use after manually activate"}})	
	self.Menu.Combo.UseR:MenuElement({id = "CC", name = "自动相对应法术", value = true})
	self.Menu.Combo.UseR:MenuElement({id = "BlockList", name = "法术名单", type = MENU})	
	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]", value = true, leftIcon = QIcon})
	self.Menu.Harass:MenuElement({id = "UseW", name = "[W]", value = true, leftIcon = WIcon})
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
	
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]", value = true, leftIcon = QIcon})
	self.Menu.Clear:MenuElement({id = "Qmin", name = "使用Q如果命中X 小兵", value = 2, min = 1, max = 5, step = 1, leftIcon = QIcon})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
	
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]", value = true, leftIcon = QIcon})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
	
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "KillSteal", leftIcon = Icons["ks"]})
	self.Menu.KillSteal:MenuElement({id = "UseQ", name = "[Q]", value = true, leftIcon = QIcon})
	self.Menu.KillSteal:MenuElement({id = "UseW", name = "[W]", value = true, leftIcon = WIcon})
	self.Menu.KillSteal:MenuElement({id = "UseE", name = "[E]", value = true, leftIcon = EIcon})
	
	--AutoSpell on CC
	self.Menu:MenuElement({id = "CC", leftIcon = Icons["AutoUseCC"], type = MENU})
	self.Menu.CC:MenuElement({id = "UseQ", name = "Q", value = true, leftIcon = QIcon})
	self.Menu.CC:MenuElement({id = "UseE", name = "E", value = true, leftIcon = EIcon})
	
	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredW", name = "机会[W]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredE", name = "机会[E]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	
	--Drawing
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "绘制[Q]", value = true, leftIcon = QIcon})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "绘制[W]", value = true, leftIcon = WIcon})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "绘制[E]", value = true, leftIcon = EIcon})	
	self.Menu.Drawing:MenuElement({id = "DrawDamage", name = "DmgHPbar + KillableText [如果所有法术都学会了]", value = true})
	self.Slot = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
	DelayAction(function()
		for i, spell in pairs(CCSpells) do
			if not CCSpells[i] then return end
			for j, k in pairs(GetEnemyHeroes()) do
				if spell.charName == k.charName and not self.Menu.Combo.UseR.BlockList[i] then
					if not self.Menu.Combo.UseR.BlockList[i] then self.Menu.Combo.UseR.BlockList:MenuElement({id = "Dodge"..i, name = ""..spell.charName.." "..self.Slot[spell.slot].." | "..spell.displayName, value = true}) end
				end
			end    
		end
	end, 0.01)
end


function Ahri:Tick()
	if MyHeroReady() then
	self:KS()
	self:CC()
	self:AutoR()	
	if self.Menu.Combo.UseR.RR:Value() then
	self:KillR()
	end
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
			if self.Menu.Combo.UseR.RR:Value() then
			self:ComboR()
			end
		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
		end
	end
end


function Ahri:AutoR()
	if self.Menu.Combo.UseR.CC:Value() and Ready(_R) then
		self:OnMissileCreate() 
		self:OnProcessSpell() 
		for i, spell in pairs(self.DetectedSpells) do self:UseR(i, spell) end
	end
end

function Ahri:KillR()
local target = GetTarget(1300)
if target == nil then return end
	if IsValid(target, 1300) and myHero.pos:DistanceTo(target.pos) <= 1200 and self.Menu.Combo.UseR.Type:Value() == 1 and Ready(_R) then
		local Rdmg = getdmg("R", target, myHero)*3    
		if Rdmg >= target.health then
			Control.CastSpell(HK_R,target.pos)
		end
	end
end	

function Ahri:ActiveSpell()
	return myHero.activeSpell and myHero.activeSpell.valid and myHero.activeSpell.name == "AhriTumble"
end

function Ahri:ComboR()
local target = GetTarget(1500)
if target == nil then return end
	if IsValid(target, 1300) then	
		if myHero.pos:DistanceTo(target.pos) <= 600 and self.Menu.Combo.UseR.Type:Value() == 2 and Ready(_R) then
				Control.CastSpell(HK_R,target.pos)
		
		
		elseif myHero.pos:DistanceTo(target.pos) <= 1200 and self.Menu.Combo.UseR.Type:Value() == 3 and Ready(_R) then
			if GotBuff(myHero, "AhriTumble") then
				Control.CastSpell(HK_R,target.pos)
			if GotBuff(myHero, "AhriTumble") then
				Control.CastSpell(HK_R,target.pos)
			end	
			end
		end		
	end
end	



function Ahri:Draw()
local textPos = myHero.pos:To2D()	
if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
	Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
end 
if myHero.dead then return end
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 880, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 700, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 975, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawDamage:Value() then
		local hero = GetTarget(1500)
		if hero == nil then return end
		if IsValid(hero) then
			local barPos = hero.hpBar
			if not hero.dead and hero.pos2D.onScreen and barPos.onScreen and hero.visible then
				local QDamage = getdmg("Q",hero,myHero)
				local WDamage = getdmg("W",hero,myHero)
				local EDamage = getdmg("E",hero,myHero)
				local RDamage = getdmg("R",hero,myHero)
				local damage = QDamage + WDamage + EDamage + RDamage
				if damage > hero.health and Ready(_Q) and Ready(_W) and Ready(_E) and Ready(_R) then
					Draw.Text("killable", 24, hero.pos2D.x, hero.pos2D.y,Draw.Color(0xFF00FF00))
					
				else
					local percentHealthAfterDamage = math.max(0, hero.health - damage) / hero.maxHealth
					local xPosEnd = barPos.x + barXOffset + barWidth * hero.health/hero.maxHealth
					local xPosStart = barPos.x + barXOffset + percentHealthAfterDamage * 100
					Draw.Line(xPosStart, barPos.y + barYOffset, xPosEnd, barPos.y + barYOffset, 10, Draw.Color(200, 255, 255, 255))
				end
			end
		end	
	end				
end

function Ahri:GetHeroByHandle(handle)
	for i = 1, Game.HeroCount() do
		local unit = Game.Hero(i)
		if unit.handle == handle then return unit end
	end
end

function Ahri:UseR(i, s)
	local startPos = s.startPos; local endPos = s.endPos; local travelTime = 0
	if s.speed == math.huge then travelTime = s.delay else travelTime = s.range / s.speed + s.delay end
	if s.type == "rectangular" then
		local StartPosition = endPos-Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		local EndPosition = endPos+Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		startPos = StartPosition; endPos = EndPosition
	end
	if s.startTime + travelTime > Game.Timer() then
		local Col = Ahri:VectorPointProjectionOnLineSegment(startPos, endPos, myHero.pos)
		if s.type == "circular" and GetDistanceSqr(myHero.pos, endPos) < (s.radius + myHero.boundingRadius) ^ 2 or GetDistanceSqr(myHero.pos, Col) < (s.radius + myHero.boundingRadius * 1.25) ^ 2 then
			local t = s.speed ~= math.huge and Ahri:CalculateCollisionTime(startPos, endPos, myHero.pos, s.startTime, s.speed, s.delay, s.origin) or 0.29
			local MPos = myHero.pos:Extended(mousePos, 450)
			if t < 0.3 then Control.CastSpell(HK_R, MPos) end
		end
	else table.remove(self.DetectedSpells, i) end
end

function Ahri:OnProcessSpell()
	local unit, spell = OnProcessSpell()
	if unit and spell and CCSpells[spell.name] then
		if GetDistance(unit.pos, myHero.pos) > 3000 or not self.Menu.Combo.UseR.BlockList["Dodge"..spell.name]:Value() then return end
		local Detected = CCSpells[spell.name]
		if Detected.origin ~= "missile" then
			local type = Detected.type
			if type == "targeted" then
				local MPos = myHero.pos:Extended(mousePos, 450)
				if spell.target == myHero.handle then Control.CastSpell(HK_R, MPos) end
			else
				local startPos = Vector(spell.startPos); local placementPos = Vector(spell.placementPos); local unitPos = unit.pos
				local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
				local endPos, range2 = Ahri:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
				table.insert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = Game.Timer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "spell"})
			end
		end
	end
end


function Ahri:OnMissileCreate()
	if Game.Timer() > self.Timer + 0.15 then
		for i, mis in pairs(self.DetectedMissiles) do if Game.Timer() > mis.timer + 2 then table.remove(self.DetectedMissiles, i) end end
		self.Timer = Game.Timer()
	end
	for i = 1, Game.MissileCount() do
		local missile = Game.Missile(i)
		if CCSpells[missile.missileData.name] then
			local unit = Ahri:GetHeroByHandle(missile.missileData.owner)
			if (not unit.visible and CCSpells[missile.missileData.name].origin ~= "spell") or CCExceptions[missile.missileData.name] then
				if GetDistance(unit.pos, myHero.pos) > 3000 or not self.Menu.Combo.UseR.BlockList["Dodge"..missile.missileData.name]:Value() then return end
				local Detected = CCSpells[missile.missileData.name]
				if Detected.origin ~= "spell" then
					for i, mis in pairs(self.DetectedMissiles) do if mis.name == missile.missileData.name then return end end
					table.insert(self.DetectedMissiles, {name = missile.missileData.name, timer = Game.Timer()})
					local startPos = Vector(missile.missileData.startPos); local placementPos = Vector(missile.missileData.placementPos); local unitPos = unit.pos
					local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
					local endPos, range2 = Ahri:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
					table.insert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = Game.Timer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "missile"})
				end
			end
		end
	end
end

function Ahri:Combo()
if self:ActiveSpell() then return end
	if self.Menu.Combo.Type:Value() == 1 then
		self:Combo1()
	elseif self.Menu.Combo.Type:Value() == 2 then
		self:Combo2()
	elseif self.Menu.Combo.Type:Value() == 3 then
		self:Combo3()
	end
end

function Ahri:Combo1()
local target = GetTarget(1000)
if target == nil then return end
if IsValid(target, 1000) then    
	if myHero.pos:DistanceTo(target.pos) <= 880 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q,pred.CastPosition)
		    
	    end
    end

	if myHero.pos:DistanceTo(target.pos) <= 700 and self.Menu.Combo.UseW:Value() and Ready(_W) then
		local pred = GetGamsteronPrediction(target, WData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
			Control.CastSpell(HK_W,pred.CastPosition)
    
		end
	end
 
    if myHero.pos:DistanceTo(target.pos) <= 975 and self.Menu.Combo.UseE:Value() and Ready(_E) then
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			Control.CastSpell(HK_E,pred.CastPosition)
		  
	    end
    end
end
end


function Ahri:Combo2()
local target = GetTarget(1000)
if target == nil then return end
if IsValid(target, 1000) then    
	if myHero.pos:DistanceTo(target.pos) <= 975 then	
		if self.Menu.Combo.UseE:Value() and target and Ready(_E) then
			local pred = GetGamsteronPrediction(target, EData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			    Control.CastSpell(HK_E,pred.CastPosition)
		    end
	    end
    end
	
	if myHero.pos:DistanceTo(target.pos) <= 880 then	
		if self.Menu.Combo.UseQ:Value() and target and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			    Control.CastSpell(HK_Q,pred.CastPosition)
		    end
	    end
    end

	if myHero.pos:DistanceTo(target.pos) <= 700 then 	
		if self.Menu.Combo.UseW:Value() and target and Ready(_W) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
			    Control.CastSpell(HK_W,pred.CastPosition)
            end
		end
	end
end
end


function Ahri:Combo3()
local target = GetTarget(1000)
if target == nil then return end
if IsValid(target, 1000) then    
	if myHero.pos:DistanceTo(target.pos) <= 975 then	
		if self.Menu.Combo.UseE:Value() and target and Ready(_E) then
			local pred = GetGamsteronPrediction(target, EData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			    Control.CastSpell(HK_E,pred.CastPosition)
		    end
	    end
    end
	
	if myHero.pos:DistanceTo(target.pos) <= 700 then	
		if self.Menu.Combo.UseW:Value() and target and Ready(_W) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
			    Control.CastSpell(HK_W,pred.CastPosition)
            end
		end
	end
	
	if myHero.pos:DistanceTo(target.pos) <= 880 then	
		if self.Menu.Combo.UseQ:Value() and target and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			    Control.CastSpell(HK_Q,pred.CastPosition)
		    end
	    end
    end
end
end

function Ahri:Harass()
local target = GetTarget(1000)
if target == nil then return end
if IsValid(target, 1000) and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value()/100 then
	if myHero.pos:DistanceTo(target.pos) <= 880 then	
		if self.Menu.Harass.UseQ:Value() and target and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			    Control.CastSpell(HK_Q,pred.CastPosition)
		    end
	    end
    end

	if myHero.pos:DistanceTo(target.pos) <= 700 then	
		if self.Menu.Harass.UseW:Value() and target and Ready(_W) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
			    Control.CastSpell(HK_W,pred.CastPosition)
            end
		end
	end
end
end	

function Ahri:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
		if minion.team == TEAM_ENEMY and IsValid(minion,900) and myHero.pos:DistanceTo(minion.pos) <= 880 and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 then
			if self.Menu.Clear.UseQ:Value() and Ready(_Q) then
				local count = GetMinionCount(150, minion)
				if count >= self.Menu.Clear.Qmin:Value() then
					Control.CastSpell(HK_Q,minion)
				end
			end
		end
	end
end

function Ahri:JungleClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
		if minion.team == TEAM_JUNGLE and IsValid(minion,900) and myHero.pos:DistanceTo(minion.pos) <= 880 and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then
			if self.Menu.JClear.UseQ:Value() and Ready(_Q) then
				Control.CastSpell(HK_Q,minion)
				
			end
		end
	end
end

function Ahri:KS()
local target = GetTarget(1000)
if target == nil then return end

if IsValid(target, 1000) then    
	if myHero.pos:DistanceTo(target.pos) <= 880 and self.Menu.KillSteal.UseQ:Value() and target and Ready(_Q) then
	    local Qdmg = getdmg("Q", target, myHero)
		if Qdmg >= target.health then
		    local pred = GetGamsteronPrediction(target, QData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			    Control.CastSpell(HK_Q,pred.CastPosition)
		    end
	    end
    end

	if myHero.pos:DistanceTo(target.pos) <= 700 and self.Menu.KillSteal.UseW:Value() and target and Ready(_W) then
		local Wdmg = getdmg("W", target, myHero)
		if Wdmg >= target.health then 
			local pred = GetGamsteronPrediction(target, WData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
			    Control.CastSpell(HK_W,pred.CastPosition)
            end
		end
	end
 
    if myHero.pos:DistanceTo(target.pos) <= 975 and self.Menu.KillSteal.UseE:Value() and target and Ready(_E) then
	    local Edmg = getdmg("E", target, myHero)
		if Edmg >= target.health then
		    local pred = GetGamsteronPrediction(target, EData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			    Control.CastSpell(HK_E,pred.CastPosition)
		    end
	    end
    end
end
end


function Ahri:CC()
local target = GetTarget(1000)
if target == nil then return end
local Immobile = IsImmobileTarget(target)	
if IsValid(target, 1000) and Immobile then	
	if myHero.pos:DistanceTo(target.pos) <= 975 and self.Menu.CC.UseE:Value() and target and Ready(_E) then
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			Control.CastSpell(HK_E,pred.CastPosition)
			
		end
	end
	
	if myHero.pos:DistanceTo(target.pos) <= 880 and self.Menu.CC.UseQ:Value() and target and Ready(_Q) then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q,pred.CastPosition)
			
		end
	end	
end
end







-------------------------------------------------------------------------------------------------------------------------------------------------------------



class "Cassiopeia"



--require('GamsteronPrediction')


function Cassiopeia:LoadSpells()
	R = {Range = 825, Width = 200, Delay = 0.8, Speed = math.huge, Collision = false, aoe = false, Type = "circular"}

end

local QData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.8, Radius = 75, Range = 850, Speed = math.huge, Collision = false
}

local RData =
{
Type = _G.SPELLTYPE_CONE, Delay = 0.5, Radius = 80, Range = 825, Speed = 3200, Collision = false
}

	local AA = false
	local QRange = 850 * 850
	local MaxWRange = 800 * 800
	local MinWRange = 420 * 420
	local WMinCRange = 500 
	local WMaxCRange = 800 	
	local ERange = 700 * 700
	local RRange = 825 * 825

	function Cassiopeia:__init()
		
		Callback.Add("Tick", function() self:Tick() end)
		Callback.Add("Draw", function() self:Draw() end)
		self:Menu()
		self:LoadSpells()
		if _G.EOWLoaded then
			Orb = 1
		elseif _G.SDK and _G.SDK.Orbwalker then
			Orb = 2
		elseif _G.gsoSDK then
			Orb = 4			
		end
		print("PussyCassio Loaded")
	end

	function Cassiopeia:Menu()
		Cass = MenuElement({type = MENU, id = "Cass", name = "卡西奥佩娅"})		
		Cass:MenuElement({name = " ", drop = {"General Settings"}})
		
		--Prediction
		Cass:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
		Cass.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
		Cass.Pred:MenuElement({id = "PredR", name = "命中率[R]", value = 2, drop = {"Normal", "High", "Immobile"}})		
		
		--Combo   
		Cass:MenuElement({type = MENU, id = "c", leftIcon = Icons["Combo"]})
		Cass.c:MenuElement({id = "Block", name = "在走砍中阻止AA[?]", value = true, tooltip = "Reload Script after changing"})
		Cass.c:MenuElement({id = "Q", name = "使用Q", value = true})
		Cass.c:MenuElement({id = "W", name = "使用W", value = true})
		Cass.c:MenuElement({id = "E", name = "使用E", value = true})
		Cass.c:MenuElement({id = "SR", name = "手动R", key = string.byte("A")})
		Cass.c:MenuElement({id = "R", name = "使用R", value = true})
		Cass.c:MenuElement({id = "Count", name = "最小值达到R", value = 2, min = 1, max = 5, step = 1})
		Cass.c:MenuElement({id = "P", name = "使用恐惧R和幽灵疾步", value = true})
		Cass.c:MenuElement({id = "HP", name = "最低HP％恐惧R", value = 20, min = 0, max = 100, step = 1})
		
		--Harass
		Cass:MenuElement({type = MENU, id = "h", leftIcon = Icons["Harass"]})
		Cass.h:MenuElement({id = "Q", name = "使用Q", value = true})
		Cass.h:MenuElement({id = "E", name = "仅使用中毒", value = true})		
		
		--Clear
		Cass:MenuElement({type = MENU, id = "w", leftIcon = Icons["Clear"]})
		Cass.w:MenuElement({id = "Q", name = "使用Q", value = true})
		Cass.w:MenuElement({id = "W", name = "使用W", value = true})
		Cass.w:MenuElement({id = "Count", name = "命中的最小值W", value = 3, min = 1, max = 5, step = 1})		
		Cass.w:MenuElement({id = "E", name = "自动按E键", key = 84, toggle = true})
		
		--JungleClear
		Cass:MenuElement({type = MENU, id = "j", leftIcon = Icons["JClear"]})
		Cass.j:MenuElement({id = "Q", name = "使用Q", value = true})
		Cass.j:MenuElement({id = "W", name = "使用W", value = true})
		Cass.j:MenuElement({id = "E", name = "使用E [中毒或最后命中]", value = true})		
		
		--KillSteal
		Cass:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
		Cass.ks:MenuElement({id = "Q", name = "使用Q", value = true})
		Cass.ks:MenuElement({id = "W", name = "使用W", value = true})
		Cass.ks:MenuElement({id = "E", name = "使用E", value = true})
	

		--Engage
		Cass:MenuElement({type = MENU, id = "kill", leftIcon = Icons["Engage"]})
		Cass.kill:MenuElement({id = "Eng", name = "发动杀戮 1 vs 1", value = true, key = string.byte("T")})
		
		--Mana
		Cass:MenuElement({type = MENU, id = "m", leftIcon = Icons["Mana"]})
		Cass.m:MenuElement({name = " ", drop = {"Harass [%]"}})
		Cass.m:MenuElement({id = "Q", name = "Q 法力", value = 10, min = 0, max = 100, step = 1})
		Cass.m:MenuElement({id = "W", name = "W 法力", value = 10, min = 0, max = 100, step = 1})
		Cass.m:MenuElement({id = "E", name = "E 法力", value = 5, min = 0, max = 100, step = 1})
		Cass.m:MenuElement({id = "R", name = "R 法力", value = 5, min = 0, max = 100, step = 1})		
		Cass.m:MenuElement({name = " ", drop = {"Clear [%]"}})
		Cass.m:MenuElement({id = "QW", name = "Q 法力", value = 10, min = 0, max = 100, step = 1})
		Cass.m:MenuElement({id = "WW", name = "W 法力", value = 10, min = 0, max = 100, step = 1})
		Cass.m:MenuElement({id = "EW", name = "E 法力", value = 10, min = 0, max = 100, step = 1})
		
		Cass:MenuElement({name = " ", drop = {"Advanced Settings"}})

		--Drawings
		Cass:MenuElement({type = MENU, id = "d", leftIcon = Icons["Drawings"]})
		Cass.d:MenuElement({id = "ON", name = "启用绘图", value = true})
		Cass.d:MenuElement({id = "Text", name = "绘制文字", value = true})
		Cass.d:MenuElement({id = "Lines", name = "画线", value = true})
		Cass.d:MenuElement({type = MENU, id = "Q", name = "Q"})
		Cass.d.Q:MenuElement({id = "ON", name = "启用", value = true})       
		Cass.d.Q:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
		Cass.d.Q:MenuElement({id = "Color", name = "颜色", color = Draw.Color(255, 255, 255, 255)})
		Cass.d:MenuElement({type = MENU, id = "W", name = "W"})
		Cass.d.W:MenuElement({id = "ON", name = "启用", value = false})       
		Cass.d.W:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
		Cass.d.W:MenuElement({id = "Color", name = "颜色", color = Draw.Color(255, 255, 255, 255)})
		Cass.d:MenuElement({type = MENU, id = "E", name = "E"})
		Cass.d.E:MenuElement({id = "ON", name = "启用", value = true})       
		Cass.d.E:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
		Cass.d.E:MenuElement({id = "Color", name = "颜色", color = Draw.Color(255, 255, 255, 255)})
		Cass.d:MenuElement({type = MENU, id = "R", name = "R"})
		Cass.d.R:MenuElement({id = "ON", name = "启用", value = true})       
		Cass.d.R:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
		Cass.d.R:MenuElement({id = "Color", name = "颜色", color = Draw.Color(255, 255, 255, 255)})				
		if Cass.c.Block:Value() then
			AA = true 
		end
	end
	
	


	
	function Cassiopeia:EdmgCreep()
		local level = myHero.levelData.lvl
		local base = (48 + 4 * level) + (0.1 * myHero.ap)
		return base
	end	

	function Cassiopeia:PEdmgCreep()
		local level = myHero:GetSpellData(_E).level
		local bonus = (({10, 30, 50, 70, 90})[level] + 0.60 * myHero.ap)
		local PEdamage = self:EdmgCreep() + bonus
		return PEdamage
	end	

	function Cassiopeia:GetAngle(v1, v2)
		local vec1 = v1:Len()
		local vec2 = v2:Len()
		local Angle = math.abs(math.deg(math.acos((v1*v2)/(vec1*vec2))))
		if Angle < 90 then
			return true
		end
		return false
	end

	function Cassiopeia:Tick()
		if MyHeroReady() then
		local Mode = GetMode()
			if Mode == "Combo" then
				self:BlockAA()
				self:Check(Mode)
				self:Combo()
			elseif Mode == "Harass" then
				self:Check(Mode)
				self:Harass()
			elseif Mode == "Clear" then
				self:Check(Mode)
				self:Clear()
				self:JClear()
			elseif Mode == "Flee" then
				
			end
			if Cass.w.E:Value() and Mode ~= "Combo" then
				self:AutoE()
			end
			if Cass.kill.Eng:Value() then
				self:Engage()
			end	
			if Cass.c.SR:Value() then
				self:SemiR()
			end	
			self:UnBlockAA(Mode)
			self:KsQ()
			self:KsW()
			self:KsE()			
		end
	end

	function Cassiopeia:IsFacing(unit)
	    local V = Vector((unit.pos - myHero.pos))
	    local D = Vector(unit.dir)
	    local Angle = 180 - math.deg(math.acos(V*D/(V:Len()*D:Len())))
	    if math.abs(Angle) < 80 then 
	        return true  
	    end
	    return false
	end

	function Cassiopeia:RLogic()
		local RTarget = nil 
		local Most = 0
		local ShouldCast = false
			local InFace = {}
			for i = 1, Game.HeroCount() do
			local Hero = Game.Hero(i)
				if IsValid(Hero, 850) then 
					--local LS = LineSegment(myHero.pos, Hero.pos)
					--LS:__draw()
					InFace[#InFace + 1] = Hero
				end
			end
			local IsFace = {}
			for r = 1, #InFace do 
			local FHero = InFace[r]
				if self:IsFacing(FHero) then
					local Vectori = Vector(myHero.pos - FHero.pos)
					IsFace[#IsFace + 1] = {Vector = Vectori, Host = FHero}
				end
			end
			local Count = {}
			local Number = #InFace
			for c = 1, #IsFace do 
			local MainLine = IsFace[c]
			if Count[MainLine] == nil then Count[MainLine] = 1 end
				for w = 1, #IsFace do 
				local CloseLine = IsFace[w] 
				local A = CloseLine.Vector
				local B = MainLine.Vector
					if A ~= B then
						if self:GetAngle(A,B) and GetDistanceSqr(MainLine.Host.pos, myHero.pos) < 825 then 
							Count[MainLine] = Count[MainLine] + 1
						end
					end
				end
				if Count[MainLine] > Most then
					Most = Count[MainLine]
					RTarget = MainLine.Host
				end
			end
		--	print(Most)
			if Most >= Cass.c.Count:Value() or Most == Number then
				ShouldCast = true 
			end
		--	print(Most)
		--	if RTarget then
		--		LSS = Circle(Point(RTarget), 50)
		--		LSS:__draw()
		--	end
		return RTarget, ShouldCast
	end

	function Cassiopeia:BlockAA()
		if AA == true then
			if Orb == 1 then
				EOW:SetAttacks(false)
			elseif Orb == 2 then
				_G.SDK.Orbwalker:SetAttack(false)
			elseif Orb == 4 then
				_G.gsoSDK.Orbwalker:SetAttack(false)				
			else
				--GOS:BlockAttack(true)
			end
		end
	end
	

	function Cassiopeia:UnBlockAA(Mode)
		if Mode ~= "Combo" and AA == false then 
			if Orb == 1 then 
				EOW:SetAttacks(true)
			elseif Orb == 2 then
				_G.SDK.Orbwalker:SetAttack(true)
			elseif Orb == 4 then
				_G.gsoSDK.Orbwalker:SetAttack(true)				
			else
			--	GOS:BlockAttack()
			end
		end
	end
	
	function Cassiopeia:Check(Mode)
		if AA == false or Mode ~= "Combo" then
		local activeSpell = myHero.activeSpell
		local cd = myHero:GetSpellData(_E).currentCd
			if activeSpell.windup > cd then
				if Orb == 1 then
					EOW:SetAttacks(false)
				elseif Orb == 2 then
					_G.SDK.Orbwalker:SetAttack(false)
				elseif Orb == 4 then
					_G.gsoSDK.Orbwalker:SetAttack(false)					
				else
				--	GOS:BlockAttack(true)
				end
			else
				if Orb == 1 then 
					EOW:SetAttacks(true)
				elseif Orb == 2 then
					_G.SDK.Orbwalker:SetAttack(true)
				elseif Orb == 4 then
					_G.gsoSDK.Orbwalker:SetAttack(true)				
				else
				--	GOS:BlockAttack()
				end
			end
		end
	end

	function Cassiopeia:CastW(key, pos)
		local key = key or HK_W
		local Dist = pos:DistanceTo()
		local h = myHero.pos
		local v = Vector(pos - myHero.pos):Normalized()
		if Dist < WMinCRange then
			Control.CastSpell(key, h + v*500)
		elseif Dist > WMaxCRange then
			Control.CastSpell(key, h + v*800)
		else
			Control.CastSpell(key, pos)
		end
	end	

	
function Cassiopeia:Combo()

	local target = GetTarget(950)
	if target == nil then return end
	local RValue = Cass.c.R:Value()
	local Dist = GetDistanceSqr(myHero.pos, target.pos)
	local QWReady = Ready(_Q) 
	local RTarget, ShouldCast = self:RLogic()
	if IsValid(target, 950)  then	
		
        local result = false
        if not result and Cass.c.E:Value() and Ready(_E) and Dist < ERange then
            result = Control.CastSpell(HK_E, target)
        end
        if not result and Cass.c.Q:Value() and Ready(_Q) then 
            if Dist < QRange then 
            local pred = GetGamsteronPrediction(target, QData, myHero)
                if pred.Hitchance >= Cass.Pred.PredQ:Value() then
                    result = Control.CastSpell(HK_Q, pred.CastPosition)
                end
            end
        end
        if not result and Cass.c.W:Value() and Ready(_W) then 
            if Dist < MaxWRange and Dist > MinWRange then
            local Pos = GetPred(target, 1500, 0.25 + Game.Latency()/1000)
                if GetDistanceSqr(Pos, myHero.pos) < MaxWRange then 
                    self:CastW(HK_W, Pos)
                end
            end
        end
		local pred = GetGamsteronPrediction(RTarget, RData, myHero)
		local WData = myHero:GetSpellData(_W) 
		local WCheck = Ready(_W)
		local Panic = Cass.c.P:Value() and myHero.health/myHero.maxHealth < Cass.c.HP:Value()/100 
		if Panic then
			if myHero:GetSpellData(SUMMONER_1).name == "SummonerHaste" and Ready(SUMMONER_1) then
				Control.CastSpell(HK_SUMMONER_1)
			elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerHaste" and Ready(SUMMONER_2) then
				Control.CastSpell(HK_SUMMONER_2)
			end
		end
		if Cass.c.R:Value() and Ready(_R) and (HasPoison(target) or Panic) and ((WCheck == false or (WCheck and (Game.Timer() + WData.cd) - WData.castTime > 2)) or WValue == false) then
			if Panic then
				if Dist < RRange then
					if RTarget and pred.Hitchance >= Cass.Pred.PredR:Value() then 
						Control.CastSpell(HK_R, pred.CastPosition)
					else
						Control.CastSpell(HK_R, target.pos)
					end
				end
			end
		end				
		if Cass.c.R:Value() and Ready(_R) then
			if Dist < RRange then 
				if RTarget and ShouldCast == true and pred.Hitchance >= Cass.Pred.PredR:Value() then
					Control.CastSpell(HK_R, pred.CastPosition)
					
				end 
			end
		end
	end
end	
	
function Cassiopeia:SemiR()
	local target = GetTarget(950)
	if target == nil then return end
	local RTarget, ShouldCast = self:RLogic()
	local Dist = GetDistanceSqr(myHero.pos, target.pos)	
	local pred = GetGamsteronPrediction(RTarget, RData, myHero)
	if IsValid(target, 950) and Dist < RRange and Ready(_R) then
		if RTarget and pred.Hitchance >= Cass.Pred.PredR:Value() then
			Control.CastSpell(HK_R, pred.CastPosition)
		else
			Control.CastSpell(HK_R, target.pos)			
		end
	end 
end
	
		

function Cassiopeia:Harass()

	local target = GetTarget(950)
	if target == nil then return end
	
	if IsValid(target, 950)  then
		local EDmg = getdmg("E", target, myHero) * 2
		local Dist = GetDistanceSqr(myHero.pos, target.pos)
		local result = false
		if not result and Dist < ERange and Cass.h.E:Value() and Ready(_E) and (HasPoison(target) or EDmg >= target.health) then
            result = Control.CastSpell(HK_E, target)
        end
        if not result and Dist < QRange and Cass.h.Q:Value() and Ready(_Q) and myHero.mana/myHero.maxMana > Cass.m.Q:Value()/100 then 
        local pred = GetGamsteronPrediction(target, QData, myHero)
            if pred.Hitchance >= Cass.Pred.PredQ:Value() then
                result = Control.CastSpell(HK_Q, pred.CastPosition)
               
            end
        end
	end
end	
	
function Cassiopeia:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = myHero.mana/myHero.maxMana >= Cass.m.QW:Value() / 100
            local Dist = myHero.pos:DistanceTo(minion.pos)
			if Cass.w.Q:Value() and mana_ok and Dist <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if Cass.w.W:Value() and mana_ok and Dist <= MaxWRange and Ready(_W) then
                local Pos = GetPred(minion, 1500, 0.25 + Game.Latency()/1000)
				local Dist = GetDistanceSqr(minion.pos, myHero.pos)
				if Dist < MaxWRange and Dist > MinWRange and MinionsNear(minion,500) >= Cass.w.Count:Value() then
					self:CastW(HK_W, Pos)
				end	
            end
        end
    end
end

	
function Cassiopeia:JClear()
	for i = 1, Game.MinionCount() do 
	local Minion = Game.Minion(i)		 

	if Minion.team == TEAM_JUNGLE then	
		local Dist = myHero.pos:DistanceTo(Minion.pos)	
		if IsValid(Minion, 850) and Dist < QRange then	
			if Cass.j.Q:Value() and Ready(_Q) and myHero.mana/myHero.maxMana > Cass.m.QW:Value()/100 then
				Control.CastSpell(HK_Q, Minion.pos)
				
			end
		end
		if IsValid(Minion, 800) then
			local Pos = GetPred(Minion, 1500, 0.25 + Game.Latency()/1000)
			if Dist < MaxWRange then
				
				if Dist < MaxWRange and Dist > MinWRange then	
					if Cass.j.W:Value() and Ready(_W) and myHero.mana/myHero.maxMana > Cass.m.WW:Value()/100 then
						self:CastW(HK_W, Pos)
					end	
				end
			end
		end
		
		if IsValid(Minion, 750) and Dist < ERange then	
			if Cass.j.E:Value() and Ready(_E) then
				if HasPoison(Minion) then
					Block(true)
					Control.CastSpell(HK_E, Minion)
					break
				elseif self:EdmgCreep() > Minion.health then
					Block(true)
					Control.CastSpell(HK_E, Minion)
					break
				elseif HasPoison(Minion) and self:PEdmgCreep() > Minion.health then
					Block(true)
					Control.CastSpell(HK_E, Minion)
					break					
				end
			end
		end
		Block(false)
	end
	end
end

	
function Cassiopeia:KsE()
local target = GetTarget(750)
if target == nil then return end
local Dist = GetDistanceSqr(myHero.pos, target.pos)	 
	if IsValid(target, 750) and Dist < ERange then	
		local EDmg = getdmg("E", target, myHero) * 2
		local PEDmg = getdmg("E", target, myHero)
		if Cass.ks.E:Value() and Ready(_E) then 
			if HasPoison(target) and PEDmg > target.health then
				Control.CastSpell(HK_E, target)
				
			elseif EDmg > target.health then
				Control.CastSpell(HK_E, target)
			
			end
		end
	end	
end	
	
function Cassiopeia:KsQ()
local target = GetTarget(900)
if target == nil then return end
local Dist = GetDistanceSqr(myHero.pos, target.pos)	
	if IsValid(target, 900) and Dist < QRange then	
		if Cass.ks.Q:Value() and Ready(_Q) then 
			local QDmg = getdmg("Q", target, myHero)
			if QDmg > target.health then
				Control.CastSpell(HK_Q, target.pos)
			
			end
		end
	end
end	

function Cassiopeia:KsW()
local target = GetTarget(900)
if target == nil then return end
local Dist = GetDistanceSqr(myHero.pos, target.pos)	
	if IsValid(target, 900) and Dist < 800 then
		if Cass.ks.W:Value() and Ready(_W) then 
			local WDmg = getdmg("W", target, myHero)
			if WDmg > target.health then
				Control.CastSpell(HK_W, target.pos)
			
			end
		end
	end	
end	

	
	function Cassiopeia:Engage()
		local target = GetTarget(1200)
		if target == nil then return end
		local Dist = GetDistanceSqr(myHero.pos, target.pos)

		if IsValid(target, 1200) and Dist < ERange then
			local fulldmg = getdmg("Q", target, myHero) + getdmg("W", target, myHero) + getdmg("E", target, myHero) + getdmg("R", target, myHero)
			local Dist = GetDistanceSqr(myHero.pos, target.pos)
			local RCheck = Ready(_R)
			local RTarget, ShouldCast = self:RLogic()
		
		
			local pred = GetGamsteronPrediction(RTarget, RData, myHero)
			if EnemiesNear(myHero,825) == 1 and Ready(_R) and Ready(_W) and Ready(_Q) and Ready(_E) then 
				if RTarget and EnemyInRange(RRange) and fulldmg > target.health and pred.Hitchance >= Cass.Pred.PredR:Value() then
					Control.CastSpell(HK_R, pred.CastPosition)
				end
			end 
			if not Ready(_R) then
				if myHero:GetSpellData(SUMMONER_1).name == "SummonerHaste" and Ready(SUMMONER_1) then
					Control.CastSpell(HK_SUMMONER_1)
				elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerHaste" and Ready(SUMMONER_2) then
					Control.CastSpell(HK_SUMMONER_2)
				end
			end	
			if Ready(_Q) and not Ready(_R) then 
				if Dist < QRange then 
				local pred = GetGamsteronPrediction(target, QData, myHero)
					if Dist < QRange and pred.Hitchance >= Cass.Pred.PredQ:Value() then
						Control.CastSpell(HK_Q, pred.CastPosition)
					end
				end
			end
			if Ready(_E) and not Ready(_R) then 
				if Dist < ERange then
					Control.CastSpell(HK_E, target)
				end
			end	
			if Ready(_W) and not Ready(_R) then 
				if Dist < MaxWRange and Dist > MinWRange then
				local Pos = GetPred(target, 1500, 0.25 + Game.Latency()/1000)
					if Dist < MaxWRange then 
						self:CastW(HK_W, Pos)
					end
				end
			end
		end	
	end
	
	
	
function Cassiopeia:AutoE()
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,myHero:GetSpellData(_E).range) then	
			local mana_ok = myHero.mana/myHero.maxMana >= Cass.m.EW:Value() / 100
            local Dist = myHero.pos:DistanceTo(minion.pos)
			if Cass.w.E:Value() and mana_ok and Dist <= myHero:GetSpellData(_E).range and Ready(_E) then
				local PDmg = self:PEdmgCreep()
				local EDmg = self:EdmgCreep()
				if HasPoison(minion) and PDmg + 20 >= minion.health then 
					Block(true)
					if self:PEdmgCreep() >= minion.health then
						Control.CastSpell(HK_E, minion)
					end
				end
				if EDmg + 20 >= minion.health then 
					Block(true)
					if self:EdmgCreep() >= minion.health then
						Control.CastSpell(HK_E, minion)
					end
				end
				Block(false)
            end	
		end
	end	
end
					

	function Cassiopeia:Draw()
	local textPos = myHero.pos:To2D()	
		if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
			Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
		end
		if myHero.dead == false and Cass.d.ON:Value() then
			
			if Cass.d.Lines:Value() then
				local InFace = {}
				for i = 1, Game.HeroCount() do
				local Hero = Game.Hero(i)
					if IsValid(Hero, 850) and self:IsFacing(Hero) then 
						local Vectori = Vector(myHero.pos - Hero.pos)
						local LS = LineSegment(myHero.pos, Hero.pos)
						LS:__draw()
					end
				end
				local RTarget = self:RLogic()
				if RTarget then
					LSS = Circle(Point(RTarget), RTarget.boundingRadius)
					LSS:__draw()
				end
			end
			if Cass.d.Text:Value() then 
				if Cass.w.E:Value() then 
					Draw.Text("Auto E ON", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 000, 255, 000))
				else
					Draw.Text("Auto E OFF", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 220, 050, 000)) 
				end
			end
			if Cass.d.Q.ON:Value() then
				Draw.Circle(myHero.pos, 850, Cass.d.Q.Width:Value(), Cass.d.Q.Color:Value())
			end
			if Cass.d.W.ON:Value() then
				Draw.Circle(myHero.pos, 340, Cass.d.W.Width:Value(), Cass.d.W.Color:Value())
				Draw.Circle(myHero.pos, 960, Cass.d.W.Width:Value(), Cass.d.W.Color:Value())
			end
			if Cass.d.E.ON:Value() then
				Draw.Circle(myHero.pos, 750, Cass.d.E.Width:Value(), Cass.d.E.Color:Value())
			end	
			if Cass.d.R.ON:Value() then
				Draw.Circle(myHero.pos, 750, Cass.d.E.Width:Value(), Cass.d.E.Color:Value())
			end			
		end
		local target = GetTarget(1200)
		if target == nil then return end
	
		if EnemiesNear(myHero,1200) == 1 and Ready(_R) and Ready(_W) and Ready(_E) and Ready(_Q) then	
			local fulldmg = getdmg("Q", target, myHero) + getdmg("W", target, myHero) + getdmg("E", target, myHero) + getdmg("R", target, myHero)
			local textPos = target.pos:To2D()
			if IsValid(target, 1200) then
				if fulldmg > target.health then 
					Draw.Text("Engage PressKey", 25, textPos.x - 33, textPos.y + 60, Draw.Color(255, 255, 0, 0))
				end
			end
		end		
	end
	


-------------------------------------------------------------------------------------------------------------------------------------------------------------


class "Ekko"
--require('GamsteronPrediction')





function Ekko:__init()
	
	self.DetectedMissiles = {}; self.DetectedSpells = {}; self.Target = nil; self.Timer = 0
	if menu ~= 1 then return end
	menu = 2 
	twin = nil
	
	for i = 0, Game.ObjectCount() do
	local particle = Game.Object(i)
		if particle and not particle.dead and particle.name:find("Ekko") then
		twin = particle
		end
	end
  	
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 60, Range = 1075, Speed = 2000, Collision = false
}

local WData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.25, Radius = 375, Range = 1600, Speed = 1650, Collision = false
}

function Ekko:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Ekko", name = "艾克"})
	
	--Auto W 
	self.Menu:MenuElement({type = MENU, id = "Auto", leftIcon = Icons["AutoWImmo"]})
	self.Menu.Auto:MenuElement({id = "UseW", name = "[W]致命的刺", value = true})			
	self.Menu.Auto:MenuElement({id = "Targets", name = "最低目标", value = 2, min = 1, max = 5, step = 1})

	self.Menu:MenuElement({type = MENU, id = "Auto2", leftIcon = Icons["AutoWE"]})
	self.Menu.Auto2:MenuElement({id = "UseWE", name = "[W]+[E]眩晕", value = true})			
	self.Menu.Auto2:MenuElement({id = "Targets", name = "最低目标", value = 3, min = 1, max = 5, step = 1})

	--Auto R safe Life
	self.Menu:MenuElement({type = MENU, id = "Life", leftIcon = Icons["AutoRSafeLife"]})	
	self.Menu.Life:MenuElement({id = "UseR", name = "[R]致命的刺", value = true})	
	self.Menu.Life:MenuElement({id = "life", name = "最小HP", value = 20, min = 0, max = 100, identifier = "%"})	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})		
	self.Menu.Combo:MenuElement({id = "UseWE", name = "[W]+[E]眩晕", value = true})			
	

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})		
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E]抓住", value = false})  	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E]抓住", value = true})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})	
	self.Menu.ks:MenuElement({id = "UseR", name = "杀死双范围", value = true})	
	
	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredW", name = "机会[W]", value = 2, drop = {"Normal", "High", "Immobile"}})	

	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})

	
	
end

function Ekko:Tick()
	if MyHeroReady() then
		local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
				
		end	
		
		self:KillSteal()
		self:Auto()
		self:Auto2()	
		self:SafeLife()
		
	end
end


function Ekko:Draw()
local textPos = myHero.pos:To2D()	
if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
	Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
end  
  if myHero.dead then return end                                               
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 1075, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 1600, 1, Draw.Color(225, 225, 125, 10))
	end
	local target = GetTarget(1600)     	
	if target == nil then return end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) and IsValid(target) then
    Draw.Circle(target, 400, 1, Draw.Color(225, 225, 125, 10))
	end	
end

function Ekko:SafeLife()
	local target = GetTarget(1200)     	
	

		if twin and myHero.health/myHero.maxHealth <= self.Menu.Life.life:Value()/100 and self.Menu.Life.UseR:Value() and Ready(_R) and IsValid(target,1200) then
			if myHero.pos:DistanceTo(target.pos) <= 1200 and myHero.pos:DistanceTo(twin) >= 800 then
				Control.CastSpell(HK_R)
			end
		end
	end

function Ekko:Auto()
	local target = GetTarget(1700)     	
	if target == nil then return end
	local pred = GetGamsteronPrediction(target, WData, myHero)
	local Immo = GetImmobileCount(400, target)
	if IsValid(target, 1700) and myHero.pos:DistanceTo(target.pos) <= 1600 and Immo >= self.Menu.Auto.Targets:Value() then
		if self.Menu.Auto.UseW:Value() and Ready(_W) then
			if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
				Control.CastSpell(HK_W, pred.CastPosition)
			end
		end	
	end
end

function Ekko:Auto2()
	local target = GetTarget(1000)     	
	if target == nil then return end		
	local pred = GetGamsteronPrediction(target, WData, myHero)
	if self.Menu.Auto2.UseWE:Value() and IsValid(target, 1000) then
		if myHero.pos:DistanceTo(target.pos) <= 650 and Ready(_W) and Ready(_E) and CountEnemiesNear(target, 400) >= self.Menu.Auto2.Targets:Value() and pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
			Control.CastSpell(HK_W, pred.CastPosition)
		end
	
		if myHero.pos:DistanceTo(target.pos) <= 690 and Ready(_E) then
			local EPos = myHero.pos:Extended(target.pos, 325)
			DelayAction(function()
			Control.SetCursorPos(EPos)
			Control.KeyDown(HK_E)
			Control.KeyUp(HK_E)			
			end, 2.0)	
		end	
	end	
end 

     

function Ekko:KillSteal()	
	local target = GetTarget(1700)     	
	if target == nil then return end
	local hp = target.health
	local IGdamage = 50 + 20 * myHero.levelData.lvl
	local QDmg = getdmg("Q", target, myHero)
	local RDmg = getdmg("R", target, myHero)	
	local FullDmg = RDmg + QDmg
	local FullIgn = FullDmg + IGdamage
	if IsValid(target) then	
		
		if myHero.pos:DistanceTo(target.pos) <= 900 and self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if QDmg >= hp and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end

		if twin and target.pos:DistanceTo(twin) <= 400 and self.Menu.ks.UseR:Value() then
			if myHero:GetSpellData(SUMMONER_1).name == "SummonerDot" and Ready(SUMMONER_1) and Ready(_R) and Ready(_Q) and hp <= FullIgn then
				Control.CastSpell(HK_R)

				Control.CastSpell(HK_Q, target.pos)
				if myHero.pos:DistanceTo(target.pos) <= 600 then
					Control.CastSpell(HK_SUMMONER_1, target)
				end	
			elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerDot" and Ready(SUMMONER_2) and Ready(_R) and Ready(_Q) and hp <= FullIgn then
				Control.CastSpell(HK_R)
				self:AutoWE()
				Control.CastSpell(HK_Q, target.pos)
				if myHero.pos:DistanceTo(target.pos) <= 600 then
					Control.CastSpell(HK_SUMMONER_2, target)
				end
			elseif Ready(_R) and Ready(_Q) and hp <= FullDmg then
				Control.CastSpell(HK_R)
				self:AutoWE()
				Control.CastSpell(HK_Q, target.pos)
			elseif Ready(_R) and hp <= RDmg then
				Control.CastSpell(HK_R)
				self:AutoWE()
			end
		end	
	end
end	

function Ekko:Combo()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target, 1000) then
				
		if myHero.pos:DistanceTo(target.pos) <= 900 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 900 and Ready(_W) and self.Menu.Combo.UseWE:Value() then
			local pred = GetGamsteronPrediction(target, WData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
				Control.CastSpell(HK_W, pred.CastPosition)
			end
		end	
		if myHero.pos:DistanceTo(target.pos) <= 405 and Ready(_E) then
			Control.CastSpell(HK_E, target.pos)	
		end
	end
end	

function Ekko:Harass()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target, 1000) and myHero.pos:DistanceTo(target.pos) <= 900 and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if self.Menu.Harass.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
	end
end	

function Ekko:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.UseQ ~= nil and self.Menu.Clear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                Control.CastSpell(HK_E, minion.pos)
            end
            if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Ekko:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                Control.CastSpell(HK_E, minion.pos)
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end





-------------------------------------------------------------------------------------------------------------------------------------------------------------




class "Kayle"
--require('GamsteronPrediction')



function GunbladeDMG() 
    local level = myHero.levelData.lvl
    local damage = ({175,180,184,189,193,198,203,207,212,216,221,225,230,235,239,244,248,253})[level] + 0.30 * myHero.ap
	return damage
end

local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.5 - myHero.attackSpeed, Radius = 195, Range = 850, Speed = 500, Collision = false
}



function Kayle:__init()
	
	self:LoadMenu()                                            
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function Kayle:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Kayle", name = "凯尔"})

	--AutoW
	self.Menu:MenuElement({type = MENU, id = "AutoW", leftIcon = Icons["AutoW"]})
	self.Menu.AutoW:MenuElement({id = "self", name = "治愈自我", value = true})
	self.Menu.AutoW:MenuElement({id = "ally", name = "治愈盟友", value = true})
	self.Menu.AutoW:MenuElement({id = "HP", name = "HP自身/盟友", value = 50, min = 0, max = 100, step = 1, identifier = "%"})
	self.Menu.AutoW:MenuElement({id = "Mana", name = "最小法力", value = 50, min = 0, max = 100, step = 1, identifier = "%"})	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q] 耀焰冲击", value = true})		
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E] 星火符刃", value = true})			
	self.Menu.Combo:MenuElement({type = MENU, id = "UseR", name = "相应的设置"})
	self.Menu.Combo.UseR:MenuElement({id = "self", name = "大招自身", value = true})
	self.Menu.Combo.UseR:MenuElement({id = "ally", name = "大招盟友", value = true})
	self.Menu.Combo.UseR:MenuElement({id = "HP", name = "HP自身/盟友", value = 40, min = 0, max = 100, step = 1, identifier = "%"})	
	

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q] 耀焰冲击", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E] 星火符刃", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "最后一击[Q]耀焰冲击", value = true})		
	self.Menu.Clear:MenuElement({id = "UseE", name = "最后一击[E]星火符刃", value = true})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q] 耀焰冲击", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E] 星火符刃", value = true})	
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q] 耀焰冲击", value = true})		
	self.Menu.ks:MenuElement({id = "UseE", name = "[E] 星火符刃", value = true})	
	self.Menu.ks:MenuElement({id = "gun", name = "海克斯科技枪刃 + [Q]", value = true})	

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})

	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})

	
	
end

function Kayle:Tick()
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
		
		end
		self:KillSteal()
		self:KillStealE()
		self:AutoW()
	end
end	
	



function Kayle:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 500, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 850, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 900, 1, Draw.Color(225, 225, 125, 10))
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
end

function Kayle:AutoW()
local target = GetTarget(1200)     	
if target == nil then return end		
	if IsValid(target, 1200) and myHero.health/myHero.maxHealth <= self.Menu.AutoW.HP:Value()/100 and myHero.mana/myHero.maxMana >= self.Menu.AutoW.Mana:Value() / 100 then
		if self.Menu.AutoW.self:Value() and Ready(_W) then
			Control.CastSpell(HK_W, myHero)
			
		end
		if self.Menu.AutoW.ally:Value() and Ready(_W) then		
			for i = 1, Game.HeroCount() do
			local unit = Game.Hero(i)
				if unit.isAlly and IsValid(unit, 1000) then
				local Hp = GetPercentHP(unit)
						if Hp <= self.Menu.AutoW.HP:Value() and myHero.pos:DistanceTo(unit.pos) <= 900 then
							Control.CastSpell(HK_W, unit)	
						end	
					end
				end
			end
		end	
	end	

				
function Kayle:KillStealE()	
	local target = GetTarget(600)     	
	if target == nil then return end

	if IsValid(target, 600) and myHero.pos:DistanceTo(target.pos) <= 550 then
		local level = myHero.levelData.lvl
		local hp = target.health
		local EDmg = getdmg("E", target, myHero, 1)
		local E2Dmg = getdmg("E", target, myHero, 2)
		local E3Dmg = getdmg("E", target, myHero, 2) + getdmg("E", target, myHero, 3)
		
		if self.Menu.ks.UseE:Value() and Ready(_E) then
			if level >= 1 and level < 6 and EDmg >= hp then
				Control.CastSpell(HK_E)
		
			
			elseif level >= 6 and level < 16 and E2Dmg >= hp then
				Control.CastSpell(HK_E)
				
			elseif level >= 16 and E3Dmg >= hp then
				Control.CastSpell(HK_E)				
			end			
		end	
	end
end	
       
function Kayle:KillSteal()	
	local target = GetTarget(1000)     	
	if target == nil then return end
	
	if IsValid(target, 1000) and myHero.pos:DistanceTo(target.pos) <= 900 then	
		local hp = target.health
		local QDmg = getdmg("Q", target, myHero)
		local GunDmg = GunbladeDMG()
		if myHero.pos:DistanceTo(target.pos) <= 850 and QDmg >= hp and self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end

		local Gun = GetItemSlot(myHero, 3146)
		if myHero.pos:DistanceTo(target.pos) <= 700 and (QDmg + GunDmg) >= hp and self.Menu.ks.gun:Value() and Ready(_Q) and Gun > 0 and Ready(Gun) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(ItemHotKey[Gun], target.pos)
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
	end
end	

function Kayle:Combo()
local target = GetTarget(1200)
if target == nil then return end
	if IsValid(target, 1200) then
			
		
		if myHero.pos:DistanceTo(target.pos) <= 850 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 550 and self.Menu.Combo.UseE:Value() and Ready(_E) then					
			Control.CastSpell(HK_E)
	
		end
		
		if myHero.health/myHero.maxHealth <= self.Menu.Combo.UseR.HP:Value()/100 then	
			if Ready(_R) and self.Menu.Combo.UseR.self:Value() then
				Control.CastSpell(HK_R, myHero)
			end
		end
		if Ready(_R) and self.Menu.Combo.UseR.ally:Value() then
			for i = 1, Game.HeroCount() do
			local unit = Game.Hero(i)
				if unit.isAlly and IsValid(unit, 1000) then
				local enemy = EnemiesAround(unit, 650)			
					if enemy >= 1 and unit.health/unit.maxHealth <= self.Menu.Combo.UseR.HP:Value()/100 and myHero.pos:DistanceTo(unit.pos) <= 900  then
						Control.CastSpell(HK_R, unit)
					end
				end
			end	
		end
	end	
end	

function Kayle:Harass()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target, 1000) and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if myHero.pos:DistanceTo(target.pos) <= 850 and self.Menu.Harass.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 550 and self.Menu.Harass.UseE:Value() and Ready(_E) then
			Control.CastSpell(HK_E)
	
			
		end
	end
end	

function Kayle:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.UseQ ~= nil and self.Menu.Clear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
				local pred = GetGamsteronPrediction(minion, QData, myHero)	
				local QDmg = getdmg("Q", minion, myHero)	
				if QDmg > minion.health and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end	
            end
            if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                local EDmg = getdmg("E", minion, myHero, 1)
				local E2Dmg = getdmg("E", minion, myHero, 2)
				local E3Dmg = getdmg("E", minion, myHero, 2) + getdmg("E", minion, myHero, 3)
				local level = myHero.levelData.lvl
				if level >= 1 and level < 6 and EDmg > minion.health then
					Control.CastSpell(HK_E)
				
				elseif level >= 6 and level < 16 and E2Dmg > minion.health then
					Control.CastSpell(HK_E)
					
				elseif level >= 16 and E3Dmg > minion.health then
					Control.CastSpell(HK_E)	
				end
            end
            if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Kayle:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                Control.CastSpell(HK_E)
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------

class "Kalista"

local ChampTable = {["Blitzcrank"] = {charName = "Blitzcrank"}, ["Skarner"] = {charName = "Skarner"}, ["TahmKench"] = {charName = "TahmKench"}, ["Sion"] = {charName = "Sion"}}

function Kalista:__init()
	
	BoundAlly = nil
	stacks = 0
	QData =
	{
	Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 40, Range = 1150, Speed = 2100, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION, _G.COLLISION_YASUOWALL}
	}

 
 if menu ~= 1 then return end
  menu = 2   	
  self:LoadMenu()                                            
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end



function Kalista:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Kalista", name = "卡莉丝塔"})

	--AutoQ
	self.Menu:MenuElement({type = MENU, id = "AutoQ", leftIcon = Icons["AutoQImmo"]})
	self.Menu.AutoQ:MenuElement({id = "UseQ", name = "自动[Q]固定目标", value = true})
	
	self.Menu:MenuElement({type = MENU, id = "AutoQ2", leftIcon = Icons["QSet"]})
	self.Menu.AutoQ2:MenuElement({id = "UseQ", name = "[Q]将叠加小兵转移到敌人身上", value = true})	

	--AutoR 
	self.Menu:MenuElement({type = MENU, id = "AutoR", leftIcon = Icons["AutoR"]})
	self.Menu.AutoR:MenuElement({id = "UseR", name = "自动[R]誓约盟友", value = true})
	self.Menu.AutoR:MenuElement({id = "Heal", name = "最小Hp盟友或自己", value = 20, min = 0, max = 100, identifier = "%"})	

	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", leftIcon = Icons["AutoE"]})
	self.Menu.AutoE:MenuElement({id = "E", name = "自动触发E键[自动E小兵]", key = 84, toggle = true})	
	self.Menu.AutoE:MenuElement({id = "UseE", name = "如果敌人离开射程 则自动[E]", value = true})
	self.Menu.AutoE:MenuElement({id = "UseEM", name = "最小[E]叠加离开敌人", value = 7, min = 1, max = 20, step = 1})	
		
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]", value = true})		
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]", value = true})
	self.Menu.Combo:MenuElement({id = "UseEM", name = "最小[E]层数", value = 10, min = 1, max = 20, step = 1})	
	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E]", value = true})
	self.Menu.Harass:MenuElement({id = "UseEM", name = "最小[E]层数", value = 10, min = 1, max = 20, step = 1})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})			
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E]最后一击", value = true}) 		
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E]最后一击", value = true})	
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E]", value = true})				

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 1, drop = {"Normal", "High", "Immobile"}})	

 
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})


	self.Menu:MenuElement({type = MENU, id = "ally", name = "组合"})
	self.Menu.ally:MenuElement({type = SPACE, id = "Tip", name = "英雄[布里茨，斯卡纳，塔姆，赛恩]"})
	DelayAction(function()
	for i, Hero in pairs(GetAllyHeroes()) do
	
		if ChampTable[Hero.charName] then			
			self.Menu.ally:MenuElement({id = "Champ", name = Hero.charName, value = true})
			self.Menu.ally:MenuElement({id = "MyHP", name = "卡莉斯塔最小HP使用R",  value = 40, min = 0, max = 100, step = 1})			
		
		end
	end 
	end, 0.3)	

	

	
	
end	

function Kalista:Tick()
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()

		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		end	
	self:KillSteal()
	self:AutoQ()
	self:AutoQ2()
	self:AutoE()
	self:AutoR()
	self:BoundHero()
	self:KillMinion()
	self:WomboCombo()
	end
 
			

				
end

function Kalista:BoundHero()
	if BoundAlly then return end
	
	for i = 1, Game.HeroCount() do
		local hero = Game.Hero(i)
		if not hero.isMe and hero.isAlly and HasBuff(hero,"kalistacoopstrikeally")  then
			--print("Found")
			BoundAlly = hero
		end
	end	
end



function Kalista:WomboCombo()
local target = GetTarget(1500)     	
if target == nil then return end

	
	
	if self.Menu.ally.Champ ~= nil and BoundAlly and IsValid(BoundAlly,1300) and myHero.pos:DistanceTo(BoundAlly.pos) <= 1200 then
		if Ready(_R) and self.Menu.ally.Champ:Value() and myHero.health/myHero.maxHealth >= self.Menu.ally.MyHP:Value()/100 then
			
			if BoundAlly.charName == "Blitzcrank" and GotBuff(target, "rocketgrab2") > 0 then
				Control.CastSpell(HK_R)
			
			elseif BoundAlly.charName == "Skarner" and GotBuff(target, "SkarnerImpale") > 0 then
				Control.CastSpell(HK_R)
			
			elseif BoundAlly.charName == "TahmKench" and GotBuff(target, "tahmkenchwdevoured") > 0 then
				Control.CastSpell(HK_R)
			
			elseif BoundAlly.charName == "Sion" and (BoundAlly.activeSpell and BoundAlly.activeSpell.valid and BoundAlly.activeSpell.name == "SionR") then
				DelayAction(function()
				Control.CastSpell(HK_R) 
				end, 0.3)
			end
		end
	end
end




function Kalista:GetEstacks(unit)

	local stacks = 0
	if HasBuff(unit, "kalistaexpungemarker") then
		for i = 1, unit.buffCount do
			local buff = unit:GetBuff(i)
			if buff and buff.count > 0 and buff.name:lower() == "kalistaexpungemarker" then
				stacks = buff.count
			end
		end
	end
	return stacks
end

function Kalista:GetEDamage(unit,stacks)
	local level = myHero:GetSpellData(_E).level
	local basedmg = ({20, 30, 40, 50, 60})[level] + 0.6* (myHero.totalDamage)
	local stacksdmg = (stacks )*(({10, 14, 19, 25, 32})[level]+({0.198, 0.237, 0.274, 0.312, 0.349})[level] * myHero.totalDamage)
	return CalcPhysicalDamage(myHero, (basedmg + stacksdmg))
end

function Kalista:GetEDamageChamp(unit,stacks)
	local level = myHero:GetSpellData(_E).level
	local basedmg = ({20, 30, 40, 50, 60})[level] + 0.6* (myHero.totalDamage)
	local stacksdmg = (stacks+1)*(({10, 14, 19, 25, 32})[level]+({0.198, 0.237, 0.274, 0.312, 0.349})[level] * myHero.totalDamage)
	return CalcPhysicalDamage(myHero, (basedmg + stacksdmg))
end

function Kalista:GetQDamage(unit)
	local basedmg = ({20, 85, 150, 215, 280})[myHero:GetSpellData(_Q).level] + myHero.totalDamage
	return CalcPhysicalDamage(myHero,basedmg)
end

function Kalista:Draw()
  if myHero.dead then return end
	
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 1100, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 1150, 1, Draw.Color(225, 225, 0, 10))
	end
	
	local textPos = myHero.pos:To2D()
	if self.Menu.AutoE.E:Value() then 
		Draw.Text("AutoE ON", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 000, 255, 000))
	else
		Draw.Text("AutoE OFF", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 220, 050, 000)) 
	end

		
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
	for i, Hero in pairs(GetAllyHeroes()) do
		if ChampTable[Hero.charName] then
			Draw.Text("WomboCombo possible", 20, textPos.x + 1, textPos.y - 400, Draw.Color(255, 255, 0, 0))
		end
	end
end

function Kalista:AutoQ()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	if IsValid(target,1300) and myHero.pos:DistanceTo(target.pos) <= 1150 and IsImmobileTarget(target) and self.Menu.AutoQ.UseQ:Value() and Ready(_Q) then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q, pred.CastPosition)
		end	
	end
end

function Kalista:AutoQ2()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	if IsValid(target,1300) and myHero.pos:DistanceTo(target.pos) <= 1150 and self.Menu.AutoQ2.UseQ:Value() and Ready(_Q) then
        for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
			if minion.team == TEAM_ENEMY and IsValid(minion,1500) then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 1150, 0.25, 2100, 40, false)	
			local QDmg = self:GetQDamage(minion)
			local pointSegment, pointLine, isOnSegment = HPred:VectorPointProjectionOnLineSegment(myHero.pos, aimPosition, minion.pos)
				if isOnSegment and (minion.pos.x - pointSegment.x)^2 + (minion.pos.z - pointSegment.y)^2 < (40 + minion.boundingRadius + 15) * (40 + minion.boundingRadius + 15) and self:GetEstacks(minion) >= 1 and QDmg >= minion.health and hitRate and hitRate >= 1 then 
					Control.CastSpell(HK_Q, aimPosition)
				end
			end	
        end
	end
end

function Kalista:AutoE()
local target = GetTarget(1000)     	
if target == nil then return end
	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) > 800 and Ready(_E) then
		if self.Menu.AutoE.UseE:Value() and self:GetEstacks(target) >= self.Menu.AutoE.UseEM:Value() then
			Control.CastSpell(HK_E)
				
		end
	end	
end

function Kalista:AutoR()
	if BoundAlly then
		if IsValid(BoundAlly,1300) and myHero.pos:DistanceTo(BoundAlly.pos) <= 1200 and self.Menu.AutoR.UseR:Value() and Ready(_R) then

			if BoundAlly.health/BoundAlly.maxHealth <= self.Menu.AutoR.Heal:Value()/100 and BaseCheck(myHero) == false then
				Control.CastSpell(HK_R)
			end
		end
	end
end


function Kalista:Combo()
local target = GetTarget(1500)     	
if target == nil then return end
	if IsValid(target,1500) then
				
		if myHero.pos:DistanceTo(target.pos) <= 1150 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		if myHero.pos:DistanceTo(target.pos) <= 1500 and self.Menu.Combo.UseE:Value() and Ready(_E) then
			if self:GetEstacks(target) >= self.Menu.Combo.UseEM:Value() then	
				Control.CastSpell(HK_E)
			end
		end		
	end	
end	

function Kalista:Harass()
local target = GetTarget(1500)
if target == nil then return end
	if IsValid(target,1500) and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if myHero.pos:DistanceTo(target.pos) <= 1500 and self.Menu.Harass.UseE:Value() and Ready(_E) then
			if self:GetEstacks(target) >= self.Menu.Harass.UseEM:Value() then	
				Control.CastSpell(HK_E)
			end
		end
	end
end

function Kalista:Clear()
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,1000) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))

            if myHero.pos:DistanceTo(minion.pos) <= 1000 and self.Menu.Clear.UseE:Value() then
				if mana_ok and Ready(_E) then
					if (minion.charName == "Siege" or minion.charName == "super") and self:GetEDamage(minion,stacks) >= minion.health then
						Control.CastSpell(HK_E)
					                    
                    elseif self:GetEDamage(minion,stacks) >= minion.health then
                        Control.CastSpell(HK_E)
                    end
				end
            end
        end
    end
end



local JungleTable = {
	"SRU_Baron",
	"SRU_RiftHerald",
	"SRU_Dragon_Water",
	"SRU_Dragon_Fire",
	"SRU_Dragon_Earth",
	"SRU_Dragon_Air",
	"SRU_Dragon_Elder",
	"SRU_Blue",
	"SRU_Red",
}


function Kalista:JungleClear()
	
	
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,1000) then
            local mana_ok = myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100

            if myHero.pos:DistanceTo(minion.pos) <= 1000 and self.Menu.JClear.UseE:Value() then
				if mana_ok and Ready(_E) then  
                    if JungleTable[minion.charName] and self:GetEDamageChamp(minion,stacks) >= minion.health then
						 Control.CastSpell(HK_E)
					elseif self:GetEDamageChamp(minion,stacks) >= minion.health then
                        Control.CastSpell(HK_E)
					end	
                end
            end
        end
    end
end

function Kalista:KillMinion()
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,1000) then
            if myHero.pos:DistanceTo(minion.pos) <= 1000 then
				if self.Menu.AutoE.E:Value() and Ready(_E) then
					if (minion.charName == "Siege" or minion.charName == "super") and self:GetEDamage(minion,stacks) >= minion.health then
						Control.CastSpell(HK_E)
					                    
                    elseif self:GetEDamage(minion,stacks) >= minion.health then
                        Control.CastSpell(HK_E)
                    end
                end
            end
        end
    end
end


function Kalista:KillSteal()
	local target = GetTarget(1500)     	
	if target == nil then return end
	
	
	if IsValid(target,1500) then	

		if myHero.pos:DistanceTo(target.pos) <= 1150 and Ready(_Q) then
			local QDmg = self:GetQDamage(target)
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if QDmg >= target.health and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 1500 and Ready(_E) then
			local EDmg = self:GetEDamageChamp(target,stacks)
			if EDmg >= target.health then
				Control.CastSpell(HK_E)
			end
		end
	end
end	








-------------------------------------------------------------------------------------------------------------------------------------------------------------


class "Kassadin"





function Kassadin:__init()
 
  if menu ~= 1 then return end
  menu = 2
  self.passiveTracker = 0
  self.stacks = 0
  qdmg = 0
  edmg = 0
  rdmg = 0
  self:LoadSpells()   	
  self:LoadMenu()                                            
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("Draw", function() self:Draw() end) 
 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function Kassadin:LoadSpells()

  Q = { range = 650, delay = 0.25, speed = 1400, width = myHero:GetSpellData(_Q).width, radius = 50, Collision = false }
  W = { range = myHero:GetSpellData(_W).range, delay = myHero:GetSpellData(_W).delay, speed = myHero:GetSpellData(_W).speed, width = myHero:GetSpellData(_W).width }
  E = { range = myHero:GetSpellData(_E).range, delay = myHero:GetSpellData(_E).delay, speed = myHero:GetSpellData(_E).speed, width = myHero:GetSpellData(_E).width }
  R = { range = myHero:GetSpellData(_R).range, delay = myHero:GetSpellData(_R).delay, speed = myHero:GetSpellData(_R).speed, width = myHero:GetSpellData(_R).width }
end




function Kassadin:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Kassadin", leftIcon = Icons["Kassadin"]})
 
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]虚无法球", value = true})
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W]虚空之刃", value = true})
	self.Menu.Combo:MenuElement({id = "UseAW", name = "自动[W]虚空之刃", value = true})	
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]能量脉冲", value = true})
	self.Menu.Combo:MenuElement({id = "UseR", name = "[R] 虚空行走", value = true})
 
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu.Harass:MenuElement({id = "LastQ", name = "[Q] 最后一击小兵", value = true})
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]虚无法球", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E]能量脉冲", value = true})
	self.Menu.Harass:MenuElement({id = "UseAW", name = "自动[W]虚空之刃", value = true})	
	self.Menu.Harass:MenuElement({id = "UseR", name = "突进[R],[E],[Q]", value = true})
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 65, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]虚无法球", value = true})         
	self.Menu.Clear:MenuElement({id = "UseW", name = "[W]虚空之刃", value = true})
	self.Menu.Clear:MenuElement({id = "UseAW", name = "自动[W]虚空之刃", value = true})
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E]能量脉冲", value = true})
	self.Menu.Clear:MenuElement({id = "EHit", name = "[E]如果是X小兵", value = 3, min = 1, max = 7})
	self.Menu.Clear:MenuElement({id = "lastQ", name = "[Q]最后一击", value = true})         
	self.Menu.Clear:MenuElement({id = "lastW", name = "[W]最后一击", value = true})  
	self.Menu.Clear:MenuElement({id = "lastR", name = "[R]最后一击[只有不靠近的敌人]", value = true})
	self.Menu.Clear:MenuElement({id = "RHit", name = "[R]最后一次命中如果是X小兵", value = 3, min = 1, max = 7})  
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 50, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]虚无法球", value = true})         
	self.Menu.JClear:MenuElement({id = "UseW", name = "[W]虚空之刃", value = true})
	self.Menu.JClear:MenuElement({id = "UseAW", name = "自动[W]虚空之刃", value = true})	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E]能量脉冲", value = true})
	self.Menu.JClear:MenuElement({id = "UseR", name = "[R] 虚空行走", value = true})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 50, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]虚无法球", value = true})
	self.Menu.ks:MenuElement({id = "UseR", name = "[R] 虚空行走", value = true})
	self.Menu.ks:MenuElement({id = "UseQR", name = "[Q]然后[R]", value = true})
	self.Menu.ks:MenuElement({id = "UseRQ", name = "[R]然后[Q]", value = true})	
 
	--BlockSpellsMenu
	self.Menu:MenuElement({type = MENU, id = "block", leftIcon = Icons["BlockSpells"]})
	for i = 1, Game.HeroCount() do
	local unit = Game.Hero(i)
		if unit.team ~= myHero.team then
		units[#units + 1] = unit
			if cancelSpells[unit.charName] then
			foundAUnit = true
		self.Menu.block:MenuElement({type = MENU, id = unit.charName, name = unit.charName})
				for spell, sname in pairs(cancelSpells[unit.charName]) do
				self.Menu.block[unit.charName]:MenuElement({id = spell, name = sname.name, value = true})
  
				end
			end
		end
	end
	if not foundAUnit then
	self.Menu.block:MenuElement({id = "none", name = "找不到可阻挡的法术", type = SPACE}) 
	end 

	--EscapeMenu
	self.Menu:MenuElement({type = MENU, id = "evade", leftIcon = Icons["Escape"]})
	self.Menu.evade:MenuElement({type = MENU, id = "Life", name = "自动逃跑菜单"})	
	self.Menu.evade.Life:MenuElement({id = "UseR", name = "自动逃生[R]到盟友或塔", value = true})
	self.Menu.evade.Life:MenuElement({id = "MinR", name = "最短逃生时间", value = 20, min = 0, max = 100, identifier = "%"})	
	self.Menu.evade:MenuElement({type = MENU, id = "Flee", name = "手动逃跑菜单"})	
	self.Menu.evade.Flee:MenuElement({id = "UseR", name = "使用[R]以盟友或塔台[逃跑键]", value = true})
	self.Menu.evade.Flee:MenuElement({id = "UseRm", name = "使用[R]鼠标位置[逃跑键]", value = true})	
	self.Menu.evade.Flee:MenuElement({id = "Fleekey", name = "逃生键", key = string.byte("A")})
	
	
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "Kill", name = "在目标和迷你地图上绘制可杀死的", value = true})	
end

function Kassadin:Tick()
	if MyHeroReady() then
	self:EscapeR()
	self:OnBuff(myHero)
	self:KillSteal()

	
	if Ready(_Q) and foundAUnit then     
		for i = 1, #units do
		local unit = units[i]
		
			if IsValid(unit) and unit.isEnemy and unit.isChanneling == true and unit.activeSpell.valid then
			local spellToCancel = cancelSpells[unit.charName]
			local activeSpell = unit.activeSpell.name
			if spellToCancel == nil then return end
			local ignore = (unit.activeSpell.name == "PowerBall") or (unit.activeSpell.name == "PantheonE") or (unit.activeSpell.name == "Meditate") or (unit.activeSpell.name == "GragasW") or (unit.activeSpell.name == "FiddleSticksDrain")	
				if spellToCancel[activeSpell] and self.Menu.block[unit.charName][activeSpell]:Value() then
					if myHero.pos:DistanceTo(unit.pos) <= 650 then
						Control.CastSpell(HK_Q, unit)
					elseif Ready(_R) and myHero.pos:DistanceTo(unit.pos) > 650 and myHero.pos:DistanceTo(unit.pos) <= 1150 then
						if ignore then return end
						Control.CastSpell(HK_R, unit.pos)
						Control.CastSpell(HK_Q, unit)
					end
				end
			end    
		end
	end
	if self.Menu.evade.Flee.Fleekey:Value() then
		self:Flee()
	end
	if self.Menu.evade.Flee.Fleekey:Value() then
		self:FleeR()
	end	
	

	local Mode = GetMode()
		if Mode == "Combo" then
		self:Combo()
		self:Combo1()
		self:FullRKill()
		if self.Menu.Combo.UseAW:Value() then
			self:AutoW()
		end
		elseif Mode == "Harass" then
		self:Harass()
		self:LasthitQ()
		if self.Menu.Harass.UseAW:Value() then
			self:AutoW()
			self:AutoW1()
		end	
		elseif Mode == "Clear" then
		self:Clear()
		self:JungleClear()
		if self.Menu.Clear.UseAW:Value() then
			self:AutoW1()
		end
		if self.Menu.JClear.UseAW:Value() then
			self:AutoW1()
		end	
		elseif Mode == "Flee" then
		
		end	
	end
end

function Kassadin:Draw()
  if myHero.dead then return end
	if(self.Menu.Drawing.DrawR:Value()) and Ready(_R) then
    Draw.Circle(myHero, 500, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if(self.Menu.Drawing.DrawQ:Value()) and Ready(_Q) then
    Draw.Circle(myHero, Q.range, 1, Draw.Color(225, 225, 0, 10))
	end
  	local target = GetTarget(20000)
	if target == nil then return end	
	local hp = target.health
	local Dmg = (getdmg("Q", target)), (getdmg("E", target)), (getdmg("Q", target) + getdmg("R", target)), (getdmg("Q", target) + getdmg("E", target)), (getdmg("Q", target) + getdmg("E", target) + getdmg("R", target)), (getdmg("Q", target) + getdmg("W", target) + getdmg("E", target) + getdmg("R", target))
	local QWEdmg = getdmg("Q", target) + getdmg("W", target) + getdmg("E", target)
	local FullReady = Ready(_Q), Ready(_W), Ready(_E), Ready(_R)
	local QWEReady = Ready(_Q), Ready(_W), Ready(_E)	
	if IsValid(target, 20000) and self.Menu.Drawing.Kill:Value() then
				
		if Ready(_R) and getdmg("R", target) > hp then
			Draw.Text("Killable Combo", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))
		end	
		if Ready(_R) and (getdmg("R", target) + getdmg("R", target, myHero, 2)) > hp then
			Draw.Text("Killable Combo", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))		
		end	
		if FullReady and (getdmg("R", target) + getdmg("R", target, myHero, 2) + QWEdmg) > hp then
			Draw.Text("Killable Combo", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))	
		end	
		if Dmg > hp then
			Draw.Text("Killable Combo", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))			
		end
		if QWEReady and QWEdmg > hp then
			Draw.Text("Killable Combo", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))	
		end
	end
end

function Kassadin:OnBuff(unit)

  if unit.buffCount == nil then self.passiveTracker = 0 self.stacks = 0 return end
  for i = 0, unit.buffCount do
    local buff = unit:GetBuff(i)
    
    if buff.name == "forcepulsecancast" then
      self.passiveTracker = buff.count
	end  
    if buff.name == "RiftWalk" then
      self.stacks = buff.count      
    end     
  end
end

function Kassadin:ClearLogic()
  local EPos = nil 
  local Most = 0 
    for i = 1, Game.MinionCount() do
    local Minion = Game.Minion(i)
      if IsValid(Minion, 650) then
        local Count = GetMinionCount(650, Minion)
        if Count > Most then
          Most = Count
          EPos = Minion.pos
        end
      end
    end
    return EPos, Most
end 

function Kassadin:KillSteal()
	local target = GetTarget(1150)
	if target == nil then return end

	
	
	if IsValid(target, 1150) then
		local hp = target.health	
		if myHero.pos:DistanceTo(target.pos) <= 650 then	
			local QDmg = getdmg("Q", target)
			if self.Menu.ks.UseQ:Value() and Ready(_Q) and QDmg >= hp then
				Control.CastSpell(HK_Q, target.pos)					
			end				
		end
	
		if myHero.pos:DistanceTo(target.pos) <= 500 then	
			local RDmg = getdmg("R", target)
			if self.Menu.ks.UseR:Value() and Ready(_R) and not IsUnderTurret(target) and RDmg >= hp then
				Control.CastSpell(HK_R, target)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 500 and self.Menu.ks.UseQR:Value() and Ready(_R) and Ready(_Q) then
			local RDmg = getdmg("R", target)
			local QDmg = getdmg("Q", target)
			if (RDmg + QDmg) >= hp and not IsUnderTurret(target) then
				Control.CastSpell(HK_Q, target.pos)
				Control.CastSpell(HK_R, target)
								
			end
		end	
		if myHero.pos:DistanceTo(target.pos) < 1150 and myHero.pos:DistanceTo(target.pos) > 650 and self.Menu.ks.UseRQ:Value() and Ready(_R) and Ready(_Q) then
			local RDmg = getdmg("R", target)
			local QDmg = getdmg("Q", target)
			if (RDmg + QDmg) >= hp and not IsUnderTurret(target) then
				Control.CastSpell(HK_R, target)
				Control.CastSpell(HK_Q, target.pos)
								
			end
		end
	end
end	



function Kassadin:AutoW()  
	local target = GetTarget(300)
	if target == nil then return end
	if IsValid(target, 300) and myHero.pos:DistanceTo(target.pos) <= 300 and Ready(_W) then
		Control.CastSpell(HK_W)
	end
end	
	
function Kassadin:AutoW1()	
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
		if minion.team == TEAM_ENEMY or minion.team == TEAM_JUNGLE then	
			if IsValid(minion,300) and myHero.pos:DistanceTo(minion.pos) <= 300 and Ready(_W) then
				Control.CastSpell(HK_W)
			end
		end
	end
end	


	
function Kassadin:Combo()
local target = GetTarget(650)
if target == nil then return end
	
	if IsValid(target, 650) and myHero.pos:DistanceTo(target.pos) < 650 then	
		if self.Menu.Combo.UseQ:Value() and Ready(_Q) then	
			Control.CastSpell(HK_Q, target.pos)
			
		end	
	end	
	
	if IsValid(target, 600) and myHero.pos:DistanceTo(target.pos) < 600 and self.passiveTracker >= 1 and self.Menu.Combo.UseE:Value() and Ready(_E) then	
		Control.CastSpell(HK_E, target)
	end
end	
	

function Kassadin:EscapeR()
	local target = GetTarget(2000)
	if target == nil then return end
	if IsValid(target, 2000) and myHero.pos:DistanceTo(target.pos) <= 600 and myHero.health/myHero.maxHealth <= self.Menu.evade.Life.MinR:Value()/100 and self.Menu.evade.Life.UseR:Value() and Ready(_R) then 
		for i,ally in pairs(GetAllyHeroes()) do
			if IsValid(ally, 2000) and myHero.pos:DistanceTo(ally.pos) < 2000 and myHero.pos:DistanceTo(ally.pos) > 500 then
				if GetEnemyCount(1000, ally) < 1 then
				Control.CastSpell(HK_R, ally.pos)
				end
			end	
		end
		for i,tower in pairs(GetAllyTurret()) do
			if IsValid(tower, 2000) and myHero.pos:DistanceTo(tower.pos) < 2000 and myHero.pos:DistanceTo(tower.pos) > 750 then
				Control.CastSpell(HK_R, tower.pos)
			end	
		end
	end
end
	

function Kassadin:Flee()
	if self.Menu.evade.Flee.UseR:Value() and Ready(_R) then		
	for i,ally in pairs(GetAllyHeroes()) do
			if IsValid(ally, 2000) and myHero.pos:DistanceTo(ally.pos) < 2000 and myHero.pos:DistanceTo(ally.pos) > 500 then
				if GetEnemyCount(1000, ally) < 1 then
					Control.CastSpell(HK_R, ally)
				end
			end
		end	
		for i,tower in pairs(GetAllyTurret()) do
			if IsValid(tower, 2000) and myHero.pos:DistanceTo(tower.pos) < 2000 and myHero.pos:DistanceTo(tower.pos) > 750 then
				Control.CastSpell(HK_R, tower)
					
			end	
		end
	end
end	

function Kassadin:FleeR()
	if self.Menu.evade.Flee.UseRm:Value() and Ready(_R) then				
		Control.CastSpell(HK_R)
	end
end			

function Kassadin:Harass()	
local target = GetTarget(1100)
if target == nil then return end	


	if IsValid(target, 1100) then
	
		if myHero.pos:DistanceTo(target.pos) <= 1000 and myHero.pos:DistanceTo(target.pos) >= 700 then
			if self.stacks == 0 and self.passiveTracker >= 1 and not IsUnderTurret(target) then	
				if self.Menu.Harass.UseR:Value() and Ready(_Q) and Ready(_E) and Ready(_R) and (myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 ) then		
					Control.CastSpell(HK_R, target)
					Control.CastSpell(HK_E, target)
					Control.CastSpell(HK_Q, target.pos)
						
				end				
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 550 and self.passiveTracker >= 1 then	
			if self.Menu.Harass.UseE:Value() and Ready(_E) and (myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 ) then
				Control.CastSpell(HK_E, target)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 650 and self.Menu.Harass.UseQ:Value() and Ready(_Q) and (myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 ) then
			Control.CastSpell(HK_Q, target)
		end 
	end
end

function Kassadin:LasthitQ()
local target = GetTarget(650)
	if target == nil then
	    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
		if max_range > 1500 then
			max_range = 1500
		end
		for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
			if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then	
				local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
				if self.Menu.Harass.LastQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and myHero.pos:DistanceTo(minion.pos) > myHero.range and Ready(_Q) then
					local Qdamage = getdmg("Q", minion)
					if Qdamage >= minion.health then
						Control.CastSpell(HK_Q, minion.pos)
					end	
				end
			end
		end
	end
end	

function Kassadin:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.lastQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and myHero.pos:DistanceTo(minion.pos) > myHero.range and Ready(_Q) then
				local Qdamage = getdmg("Q", minion)
				if Qdamage >= minion.health then
					Control.CastSpell(HK_Q, minion.pos)
				end	
            end
            if self.Menu.Clear.lastW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero.range and Ready(_W) then
                local Wdamage = getdmg("W", minion)
				if Wdamage >= minion.health then
					Control.CastSpell(HK_W, minion.pos)
				end	
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and myHero.pos:DistanceTo(minion.pos) > myHero.range and Ready(_E) then
                local EPos, Count = self:ClearLogic()
				if self.passiveTracker >= 1 and Count >= self.Menu.Clear.EHit:Value() then
					Control.CastSpell(HK_E, EPos)
				end
            end
			local target = GetTarget(max_range)
			if target == nil then
				if self.Menu.Clear.lastR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and myHero.pos:DistanceTo(minion.pos) > myHero.range and self.stacks == 0 and Ready(_R) then
					local Rdamage = getdmg("R", minion)
					local EPos, Count = self:ClearLogic()	
					if Rdamage >= minion.health and Count >= self.Menu.Clear.RHit:Value() then
						Control.CastSpell(HK_R, minion)
					end
				end
            end
        end
    end
end

function Kassadin:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and self.passiveTracker >= 1 and Ready(_E) then
                Control.CastSpell(HK_E, minion.pos)
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Kassadin:FullRKill()
	local target = GetTarget(2500)
	if target == nil then return end
		
	
	if IsValid(target, 2500) and myHero.pos:DistanceTo(target.pos) < 2500 and self.Menu.Combo.UseR:Value() and Ready(_R) then	
		local hp = target.health
		local dist = myHero.pos:DistanceTo(target.pos)
		local level = myHero:GetSpellData(_R).level
		local Fulldmg1 = CalcMagicalDamage(target,(({120, 150, 180})[level] + 0.5 * myHero.ap) + 0.03 * myHero.maxMana)
		local Fulldmg2 = CalcMagicalDamage(target,(({160, 200, 240})[level] + 0.6 * myHero.ap) + 0.04 * myHero.maxMana)
		local Fulldmg3 = CalcMagicalDamage(target,(({200, 250, 300})[level] + 0.7 * myHero.ap) + 0.05 * myHero.maxMana)
		local Fulldmg4 = CalcMagicalDamage(target,(({240, 300, 360})[level] + 0.8 * myHero.ap) + 0.06 * myHero.maxMana)
		local QWEdmg = getdmg("Q", target) + getdmg("W", target) + getdmg("E", target)
			
			
			if getdmg("R", target) > hp then
				if dist < 500 and self.stacks == 0 then 
					Control.CastSpell(HK_R, target.pos)
				end
			end	
			if self.stacks == 1 then
				if Fulldmg1 > hp and dist < 500 then
				Control.CastSpell(HK_R, target.pos)
				end
			end
			if self.stacks == 2 then
				if Fulldmg2 > hp and dist < 500 then
					Control.CastSpell(HK_R, target.pos)
				end
			end
			if self.stacks == 3 then
				if Fulldmg3 > hp and dist < 500 then
					Control.CastSpell(HK_R, target.pos)
				end
			end	
			if self.stacks == 4 then
				if Fulldmg4 > hp and dist < 500 then
					Control.CastSpell(HK_R, target.pos)
				end
			end		
	-----------------------------------------------------	
			if (getdmg("R", target) + QWEdmg) > hp then
				if dist < 500 and self.stacks == 0 then 
					Control.CastSpell(HK_R, target.pos)
				end
			end	
			if self.stacks == 1 then
				if (Fulldmg1 + QWEdmg) > hp and dist < 500 then
					Control.CastSpell(HK_R, target.pos)
				end
			end	
			if self.stacks == 2 then
				if (Fulldmg2 + QWEdmg) > hp and dist < 500 then
					Control.CastSpell(HK_R, target.pos)
				end
			end
			if self.stacks == 3 then
				if (Fulldmg3 + QWEdmg) > hp and dist < 500 then
					Control.CastSpell(HK_R, target.pos)
				end
			end
			if self.stacks == 4 then
				if (Fulldmg4 + QWEdmg) > hp and dist < 500 then
					Control.CastSpell(HK_R, target.pos)
				end
			end
			
	---------------------------------------------------------------
		local Full1 = Fulldmg1 + QWEdmg
		if getdmg("R", target) > target.health or Full1 > target.health then
			if myHero.pos:DistanceTo(target.pos) < 1000 and myHero.pos:DistanceTo(target.pos) > 500 then
				Control.CastSpell(HK_R, target)
					
					
				
			end
		end	
		local Full2 = Fulldmg2 + QWEdmg			
		if getdmg("R", target) > target.health or Full2 > target.health then
			if myHero.pos:DistanceTo(target.pos) < 1500 and myHero.pos:DistanceTo(target.pos) > 1000 then
				Control.CastSpell(HK_R, target)
					
					
				
			end
		end
		local Full3 = Fulldmg3 + QWEdmg			
		if getdmg("R", target) > target.health or Full3 > target.health then
			if myHero.pos:DistanceTo(target.pos) < 2000 and myHero.pos:DistanceTo(target.pos) > 1500 then
				Control.CastSpell(HK_R, target)
					
				
				
			end
		end	
		local Full4 = Fulldmg4 + QWEdmg		
		if getdmg("R", target) > target.health or Full4 > target.health then
			if myHero.pos:DistanceTo(target.pos) < 2500 and myHero.pos:DistanceTo(target.pos) > 2000 then
				Control.CastSpell(HK_R, target)
					
					
			end
		end
	end
end

	
function Kassadin:Combo1()
	local target = GetTarget(2000)
	if target == nil then return end

if IsValid(target, 2000) and myHero.pos:DistanceTo(target.pos) < 2000 then 
	local hp = target.health
	local dist = myHero.pos:DistanceTo(target.pos)
	local qdmg = getdmg("Q", target) 		
	local wdmg = getdmg("W", target) 
	local edmg = getdmg("E", target) 
	local rdmg = getdmg("R", target) 


	if Ready(_Q) and self.Menu.Combo.UseQ:Value() then 
		if dist < 650 and qdmg > hp then
			Control.CastSpell(HK_Q, target.pos)
	
		end
	end
	if Ready(_E) and self.Menu.Combo.UseE:Value() then	
		if dist < 600 and edmg > hp and self.passiveTracker >= 1 then	
			Control.CastSpell(HK_E, target)
		
		end
	end

	if Ready(_E) and Ready(_Q) and self.Menu.Combo.UseE:Value() and self.Menu.Combo.UseQ:Value() then	
		if dist < 600 and (qdmg+edmg) > hp then
	
			Control.CastSpell(HK_E, target)
			Control.CastSpell(HK_Q, target.pos)
		
		end
	end	
	
	if Ready(_Q) and Ready(_R) and self.Menu.Combo.UseQ:Value() and self.Menu.Combo.UseR:Value() then	
		if dist < 500 and (rdmg+qdmg) > hp then
			Control.CastSpell(HK_R, target)
			Control.CastSpell(HK_Q, target.pos)
				
		end
	end
	if Ready(_E) and Ready(_Q) and Ready(_R) and self.Menu.Combo.UseE:Value() and self.Menu.Combo.UseQ:Value() and self.Menu.Combo.UseR:Value() then	
		if dist < 500 and (qdmg+edmg+rdmg) > hp then	
			Control.CastSpell(HK_R, target)
			Control.CastSpell(HK_E, target)
			Control.CastSpell(HK_Q, target.pos)
				
		end
	end
	if Ready(_E) and Ready(_Q) and Ready(_R) and Ready(_W) and self.Menu.Combo.UseE:Value() and self.Menu.Combo.UseQ:Value() and self.Menu.Combo.UseR:Value() and self.Menu.Combo.UseW:Value() then	
		if dist < 500 and (qdmg+edmg+rdmg+wdmg) > hp then	
			Control.CastSpell(HK_R, target)
			Control.CastSpell(HK_E, target)
			Control.CastSpell(HK_Q, target.pos)
			Control.CastSpell(HK_W)	
		end
	end
	local Killable = (qdmg > hp and Ready(_Q)), (edmg > hp and Ready(_E)), (rdmg+qdmg > hp and Ready(_Q)), (qdmg+edmg > hp and Ready(_Q) and Ready(_E)), (qdmg+edmg+rdmg > hp and Ready(_Q) and Ready(_E)), (qdmg+edmg+rdmg+wdmg > hp and Ready(_Q) and Ready(_E) and Ready(_W))
	if Ready(_R) and self.Menu.Combo.UseR:Value() then
		if Killable and dist > 650 and dist < 2000 then
			Control.CastSpell(HK_R, target)
				
		end
	end
end
end	

function OnDraw()

	local Spells = myHero:GetSpellData(_Q).level < 1  
	local textPos = myHero.pos:To2D()
	if foundAUnit and Spells then
		Draw.Text("Blockable Spell Found", 25, textPos.x - 33, textPos.y + 60, Draw.Color(255, 255, 0, 0))
	end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------

class "LeeSin"





local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 65, Range = 1200, Speed = 1750, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION, _G.COLLISION_YASUOWALL}
}



require 'MapPositionGOS'

local _wards = {2055, 2049, 2050, 2301, 2302, 2303, 3340, 3361, 3362, 3711, 1408, 1409, 1410, 1411, 2043, 3350, 3205, 3207, 2045, 2044, 3154, 3160}
				
function LeeSin:__init()
  mySmiteSlot = self:GetSmite(SUMMONER_1);
  if mySmiteSlot == 0 then
	mySmiteSlot = self:GetSmite(SUMMONER_2);
  end	

  if menu ~= 1 then return end
  menu = 2   	
  self:LoadMenu()                                            
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function LeeSin:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "LeeSin", name = "李青"})

	--AutoQ
	self.Menu:MenuElement({type = MENU, id = "AutoQ", leftIcon = Icons["AutoQImmo"]})
	self.Menu.AutoQ:MenuElement({id = "UseQ", name = "自动[Q] +自动[W]保护位置", value = true})

	--AutoW 
	self.Menu:MenuElement({type = MENU, id = "AutoW", leftIcon = Icons["AutoW"]})
	self.Menu.AutoW:MenuElement({id = "UseW", name = "安全盟友/自我", value = true})
	self.Menu.AutoW:MenuElement({id = "Heal", name = "最小HP自己或盟友", value = 30, min = 0, max = 100, identifier = "%"})	

	--AutoR
	self.Menu:MenuElement({type = MENU, id = "AutoR", leftIcon = Icons["AutoRSafeLife"]})
	self.Menu.AutoR:MenuElement({id = "UseR", name = "自动[R]保护自己", value = true})
	self.Menu.AutoR:MenuElement({id = "Heal", name = "最小HP", value = 20, min = 0, max = 100, identifier = "%"})	
		
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]", value = true})		
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]", value = true})
	self.Menu.Combo:MenuElement({id = "Gap", name = "间隙近距保护", value = true})
	
	self.Menu.Combo:MenuElement({id = "Set", name = "间隙距离设置", type = MENU})		
	self.Menu.Combo.Set:MenuElement({id = "minRange", name = "未准备好时的最小距离[Q]", value = 600, min = 600, max = 1000, step = 50})	
	self.Menu.Combo.Set:MenuElement({id = "maxRange", name = "未准备好时的最大距离[Q]", value = 1000, min = 1000, max = 1500, step = 50})	
	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E]", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小能量到骚扰", value = 40, min = 0, max = 100, identifier = "%"})
   
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})			
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.Clear:MenuElement({id = "UseW", name = "[W]", value = true})
	self.Menu.Clear:MenuElement({id = "Heal", name = "最小自我HP使用[W]", value = 70, min = 0, max = 100, identifier = "%"})	
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E]", value = true})
	self.Menu.Clear:MenuElement({id = "UseEM", name = "使用[E]最小值", value = 3, min = 1, max = 6, step = 1})  		
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小能量清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})         	
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.JClear:MenuElement({id = "UseW", name = "[W]", value = true})	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E]", value = true})	
	self.Menu.JClear:MenuElement({id = "Mana", name = "最小能量到野区清怪", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E]", value = true})				
	self.Menu.ks:MenuElement({id = "UseR", name = "[R]", value = true})	
	self.Menu.ks:MenuElement({id = "UseQR", name = "[Q] + [R]", value = true})	
	
	
	--JungleSteal
	self.Menu:MenuElement({type = MENU, id = "Jsteal", leftIcon = Icons["junglesteal"]})
	self.Menu.Jsteal:MenuElement({name = " ", drop = {"Ward+Q1+Q2+W back Ward [You need Smite Activator]"}})
	self.Menu.Jsteal:MenuElement({id = "Dragon", name = "偷龙", value = true})
	self.Menu.Jsteal:MenuElement({id = "Baron", name = "窃取男爵", value = true})
	self.Menu.Jsteal:MenuElement({id = "Herald", name = "窃取峡谷先锋", value = true})	
	self.Menu.Jsteal:MenuElement({id = "Active", name = "激活键", key = string.byte("Z")})	

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 1, drop = {"Normal", "High", "Immobile"}})	

	--Insec
	self.Menu:MenuElement({id = "Modes", leftIcon = Icons["InsecMode"], type = MENU}) 
	self.Menu.Modes:MenuElement({id = "Modes1", name = "回旋踢模式1", type = MENU})	
	self.Menu.Modes.Modes1:MenuElement({name = " ", drop = {"Fast Near Insec = Ward+W+R+Q1+Q2"}})
	self.Menu.Modes.Modes1:MenuElement({name = " ", drop = {"Burst Near Insec = Ward+W+E1+R+Q1+Q2+E2"}})	
	self.Menu.Modes.Modes1:MenuElement({name = " ", drop = {"Fast Far Insec = Q1+Q2+Ward+W+R"}})
	self.Menu.Modes.Modes1:MenuElement({name = " ", drop = {"Burst Far Insec = Q1+Q2+Ward+W+E1+E2+R"}})	
	self.Menu.Modes.Modes1:MenuElement({id = "Logic", name = "触发键 近/最远 回旋踢", key = string.byte("I"), toggle = true})
	self.Menu.Modes.Modes1:MenuElement({id = "Burst", name = "触发键 快速/突进回旋踢", key = string.byte("O"), toggle = true})
	self.Menu.Modes.Modes1:MenuElement({id = "Item", name = "使用提亚马特 /巨型九头蛇 突发模式", value = true})
	self.Menu.Modes.Modes1:MenuElement({id = "Insec", name = "回旋踢激活键", key = string.byte("T")})
	self.Menu.Modes.Modes1:MenuElement({id = "Draw", name = "绘制回旋踢线/圆", value = true})
	self.Menu.Modes.Modes1:MenuElement({id = "Type", name = "绘制选项", value = 1, drop = {"Always", "Pressed Insec Key"}})
	
	self.Menu.Modes:MenuElement({id = "Modes2", name = "回旋踢模式2", type = MENU})
	self.Menu.Modes.Modes2:MenuElement({id = "Insec", name = "保护", key = string.byte("A")})
	
	self.Menu.Modes:MenuElement({id = "Modes3", name = "回旋踢模式3", type = MENU})
	self.Menu.Modes.Modes3:MenuElement({id = "Insec", name = "如果可以杀死[Q1+E+R+Q2+E2]", value = true})
	self.Menu.Modes.Modes3:MenuElement({id = "Draw", name = "绘制可杀死的文本", value = true})	
	
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})
end	



function LeeSin:Tick()
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
			self:WardJump()
		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
			self:WardJump()	
		
		end
	self:OnCreateObj()
	self:JungleSteal()
	self:KillSteal()
	self:KillStealInsec()
	self:AutoQ()
	self:AutoR()
	self:AutoW()
	self:Activator()
	
	if self.Menu.Modes.Modes1.Insec:Value() then
		if self.Menu.Modes.Modes1.Logic:Value() then
			if self.Menu.Modes.Modes1.Burst:Value() then
				self:Insec1()
			else
				self:BurstInsec1()
				
			end	
		else	
			if self.Menu.Modes.Modes1.Burst:Value() then	
				self:Insec2()
			else
				self:BurstInsec2()
				
			end				
		end	
	end
	end
end

local SmiteNames = {'SummonerSmite','S5_SummonerSmiteDuel','S5_SummonerSmitePlayerGanker','S5_SummonerSmiteQuick','ItemSmiteAoE'};

function LeeSin:GetSmite(smiteSlot)
	local returnVal = 0;
	local spellName = myHero:GetSpellData(smiteSlot).name;
	for i = 1, 5 do
		if spellName == SmiteNames[i] then
			returnVal = smiteSlot
		end
	end
	return returnVal;
end

local JungleTable = {
["SRU_Baron"] = {charName = "SRU_Baron"}, 
["SRU_RiftHerald"] = {charName = "SRU_RiftHerald"}, 
["SRU_Dragon_Water"] = {charName = "SRU_Dragon_Water"}, 
["SRU_Dragon_Earth"] = {charName = "SRU_Dragon_Earth"}, 
["SRU_Dragon_Air"] = {charName = "SRU_Dragon_Air"},
["SRU_Dragon_Elder"] = {charName = "SRU_Dragon_Elder"},
["SRU_Dragon_Fire"] = {charName = "SRU_Dragon_Fire"}
}


local WardTicks = 0;
local SmiteDamage = {390 , 410 , 430 , 450 , 480 , 510 , 540 , 570 , 600 , 640 , 680 , 720 , 760 , 800 , 850 , 900 , 950 , 1000};
local LastCast = 0

function LeeSin:Cast(spell,pos)
	Control.SetCursorPos(pos)
	Control.KeyDown(spell)
	Control.KeyUp(spell)
end

function LeeSin:IsValid(unit)
	return unit == nil or not unit.valid or not unit.visible or unit.dead or not unit.isTargetable
end

function LeeSin:GetInventorySlotItem(itemID, target)
	local target = myHero
	for _, j in pairs({ ITEM_1, ITEM_2, ITEM_3, ITEM_4, ITEM_5, ITEM_6, ITEM_7 }) do
		if target:GetItemData(j).itemID == itemID and (target:GetSpellData(j).ammo > 0 or target:GetItemData(j).ammo > 0) then return j end
	end
	return nil
end

function LeeSin:Activator()
if myHero.dead then return end
local target = GetTarget(500)     	
if target == nil then return end	
local Tia, Rave, Tita = GetInventorySlotItem(3077), GetInventorySlotItem(3074), GetInventorySlotItem(3748)   
	if IsValid(target, 500) and self.Menu.Modes.Modes1.Insec:Value() and self.Menu.Modes.Modes1.Item:Value() and not self.Menu.Modes.Modes1.Burst:Value() then
        
		if Tia and myHero.pos:DistanceTo(target.pos) <= 400 then
            Control.CastSpell(ItemHotKey[Tia])
        end
		
		if Rave and myHero.pos:DistanceTo(target.pos) <= 400 then
            Control.CastSpell(ItemHotKey[Rave])
        end
		
		if Tita and myHero.pos:DistanceTo(target.pos) <= 400 then
            Control.CastSpell(ItemHotKey[Tita])
        end		
	end
end	

function LeeSin:KillStealInsec()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	if IsValid(target, 1300) then
		local hp = target.health
		local QDmg = getdmg("Q", target, myHero)
		local EDmg = getdmg("E", target, myHero)
		local RDmg = getdmg("R", target, myHero)
		local FullDmg = (QDmg + RDmg + EDmg)
		if hp <= FullDmg and self.Menu.Modes.Modes3.Insec:Value() then
			if myHero.pos:DistanceTo(target.pos) < 500 and myHero:GetSpellData(_E).name == "BlindMonkETwo" and HasBuff(target, "BlindMonkRKick") then
				Control.CastSpell(HK_E)
			end	
			
			if myHero.pos:DistanceTo(target.pos) < 350 and Ready(_E) and myHero:GetSpellData(_E).name == "BlindMonkEOne" and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_E)
			end			
			
			if myHero.pos:DistanceTo(target.pos) < 375 and Ready(_R) and myHero:GetSpellData(_E).name == "BlindMonkETwo" then
				Control.CastSpell(HK_R, target.pos)
			end
						
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if myHero.pos:DistanceTo(target.pos) <= 350 and not HasBuff(target, "BlindMonkQOne") and Ready(_Q) and pred.Hitchance >= 2 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
			
			if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkRKick") and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_Q)
			end				
		end				
	end
end


function LeeSin:WardJump(key, param)
	local mouseRadius = 200
	if Ready(_W) and myHero:GetSpellData(_W).name == "BlindMonkWOne" then
		local wardslot = nil
		for t, VisionItem in pairs(_wards) do
			if not wardslot then
				wardslot = GetInventorySlotItem(VisionItem)
			end
		end
		if self.Menu.Modes.Modes2.Insec:Value() then	
			if wardslot then
				local ward,dis = self:WardM()
				if ward~=nil and dis~=nil and dis<mouseRadius then
					if myHero.pos:DistanceTo(ward.pos) <=600 then
						self:Cast(HK_W, ward.pos)
					end
				elseif GetTickCount() > LastCast + 200 then
					LastCast = GetTickCount()
					local Data = myHero:GetSpellData(wardslot);
					if Data.ammo > 0 then
						if myHero.pos:DistanceTo(mousePos) < 600 then
							self:Cast(ItemHotKey[wardslot], mousePos)
							self:Cast(HK_W, mousePos)
						else
							newpos = myHero.pos:Extended(mousePos,600)
							self:Cast(ItemHotKey[wardslot], newpos)
							self:Cast(HK_W, newpos)
						end	
					end
				end
			end
		else
			local target = GetTarget(1300)     	
			if target == nil then return end
			if wardslot and self.Menu.Combo.Gap:Value() and not Ready(_Q) then
				if myHero.pos:DistanceTo(target.pos) <= self.Menu.Combo.Set.maxRange:Value() and myHero.pos:DistanceTo(target.pos) >= self.Menu.Combo.Set.minRange:Value() then		
					local ward,dis = self:WardM()
					if ward~=nil and dis~=nil and dis<mouseRadius then
						if myHero.pos:DistanceTo(ward.pos) <=600 then
							self:Cast(HK_W, ward.pos)
						end
					elseif GetTickCount() > LastCast + 200 then
						LastCast = GetTickCount()
						local Data = myHero:GetSpellData(wardslot);
						if Data.ammo > 0 then
							newpos = myHero.pos:Extended(target.pos,600)
							self:Cast(ItemHotKey[wardslot], newpos)
							self:Cast(HK_W, newpos)
									
													
						end	
					end
				end
			end
		end
	end
end


function LeeSin:WardM()
	local closer, near = math.huge, nil
	for i = 1, Game.WardCount() do
		local ward = Game.Ward(i)
		if ward~=nil then
			if (ward.isAlly and not ward.isMe) then
				if not self:IsValid(ward) and myHero.pos:DistanceTo(ward.pos) < 700 then
					local CurrentDistance = ward.pos:DistanceTo(mousePos)
					if CurrentDistance < closer then
						closer = CurrentDistance
						near = ward
					end
				end
			end
		end
	end
	for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
		if minion~=nil then
			if (minion.isAlly) then
				if not self:IsValid(minion) and myHero.pos:DistanceTo(minion.pos) < 700 then
					local CurrentDistance = minion.pos:DistanceTo(mousePos)
					if CurrentDistance < closer then
						closer = CurrentDistance
						near = minion
					end
				end
			end
		end
	end
	
	for i = 1, Game.HeroCount() do
		local hero = Game.Hero(i)
		if hero~=nil then
			if (hero.isAlly and not hero.isMe) then
				if not self:IsValid(hero) and myHero.pos:DistanceTo(hero.pos) < 700 then
					local CurrentDistance = hero.pos:DistanceTo(mousePos)
					if CurrentDistance < closer then
						closer = CurrentDistance
						near = hero
					end
				end
			end
		end
	end
	return near, closer
end


function LeeSin:Insec1()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	for v, spell in pairs(_wards) do
	local Item = GetInventorySlotItem(spell)
		if IsValid(target, 1300) then
			
			if myHero.pos:DistanceTo(target.pos) < 375 and Ready(_R) and myHero:GetSpellData(_W).name == "BlindMonkWTwo" then
				self:Cast(HK_R, target.pos)
			end
						
			--local pred = GetGamsteronPrediction(target, QData, myHero)
			if myHero.pos:DistanceTo(target.pos) <= 1200 and HasBuff(target, "BlindMonkRKick") and Ready(_Q) then
				self:Cast(HK_Q, target.pos)
			end
			
			if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_Q)
			end				
	
		for i, tower in pairs(GetAllyTurret()) do			
			if WardsAround(target, 400) == 0 and Ready(_R) then 
				local Data = myHero:GetSpellData(Item);
	
					
						
				if tower.pos:DistanceTo(target.pos) <= 1600 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 650 then
					local CastPos = target.pos + (target.pos-tower.pos):Normalized() * (150)
					self:InsecStart(CastPos)
				
				end	
			end
					
			for i, ally in pairs(GetAllyHeroes()) do
				if WardsAround(target, 400) == 0 and Ready(_R) then 
					local Data = myHero:GetSpellData(Item);
	
						
					if not IsValid(tower, 1600) and IsValid(ally, 1300) and ally.pos:DistanceTo(target.pos) <= 1200 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 650 then
						local CastPos = target.pos + (target.pos-ally.pos):Normalized() * (150)
						self:InsecStart(CastPos)
							
					end	
				end
			end				
		end
		end	
	end
end

function LeeSin:BurstInsec1()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	for v, spell in pairs(_wards) do
	local Item = GetInventorySlotItem(spell)
		if IsValid(target, 1300) then
			
			if myHero.pos:DistanceTo(target.pos) < 500 and HasBuff(myHero, "BlindMonkQTwoDash") and myHero:GetSpellData(_E).name == "BlindMonkETwo" then
				Control.CastSpell(HK_E)
			end				
			
			if myHero.pos:DistanceTo(target.pos) < 350 and Ready(_E) and myHero:GetSpellData(_W).name == "BlindMonkWTwo" and myHero:GetSpellData(_E).name == "BlindMonkEOne" then
				Control.CastSpell(HK_E)
			end			
			
			if myHero.pos:DistanceTo(target.pos) < 375 and Ready(_R) and myHero:GetSpellData(_E).name == "BlindMonkETwo" then
				self:Cast(HK_R, target.pos)
			end
						
			--local pred = GetGamsteronPrediction(target, QData, myHero)
			if myHero.pos:DistanceTo(target.pos) <= 1200 and HasBuff(target, "BlindMonkRKick") and Ready(_Q) then
				self:Cast(HK_Q, target.pos)
			end
			
			if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_Q)
			end				
	
		for i, tower in pairs(GetAllyTurret()) do			
			if WardsAround(target, 400) == 0 and Ready(_R) then 
				local Data = myHero:GetSpellData(Item);
	
					
						
				if tower.pos:DistanceTo(target.pos) <= 1600 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 650 then
					local CastPos = target.pos + (target.pos-tower.pos):Normalized() * (150)
					self:InsecStart(CastPos)
				
				end	
			end
					
			for i, ally in pairs(GetAllyHeroes()) do
				if WardsAround(target, 400) == 0 and Ready(_R) then 
					local Data = myHero:GetSpellData(Item);
	
						
					if not IsValid(tower, 1600) and IsValid(ally, 1300) and ally.pos:DistanceTo(target.pos) <= 1200 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 650 then
						local CastPos = target.pos + (target.pos-ally.pos):Normalized() * (150)
						self:InsecStart(CastPos)
							
					end	
				end
			end				
		end
		end	
	end
end

function LeeSin:Insec2()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	for v, spell in pairs(_wards) do
	local Item = GetInventorySlotItem(spell)
		if IsValid(target, 1300) then
			
			if myHero.pos:DistanceTo(target.pos) < 375 and Ready(_R) and myHero:GetSpellData(_W).name == "BlindMonkWTwo" then
				self:Cast(HK_R, target.pos)
			end
						
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if myHero.pos:DistanceTo(target.pos) <= 1200 and Ready(_Q) then
				self:Cast(HK_Q, pred.CastPosition)
			end
			
			if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_Q)
			end				
	
		for i, tower in pairs(GetAllyTurret()) do			
			if WardsAround(target, 400) == 0 and Ready(_R) then 
				local Data = myHero:GetSpellData(Item);
	
					
						
				if tower.pos:DistanceTo(target.pos) <= 1600 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 250 then
					local CastPos = target.pos + (target.pos-tower.pos):Normalized() * (300)
					self:InsecStart(CastPos)
									
				end	
			end
					
			for i, ally in pairs(GetAllyHeroes()) do
				if WardsAround(target, 400) == 0 and Ready(_R) then 
					local Data = myHero:GetSpellData(Item);
	
						
					if not IsValid(tower, 1600) and IsValid(ally, 1300) and ally.pos:DistanceTo(target.pos) <= 1500 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 250 then
						local CastPos = target.pos + (target.pos-ally.pos):Normalized() * (300)
						self:InsecStart(CastPos)
							
					end	
				end
			end				
		end
		end	
	end
end

function LeeSin:BurstInsec2()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	for v, spell in pairs(_wards) do
	local Item = GetInventorySlotItem(spell)
		if IsValid(target, 1300) then
			
			if myHero.pos:DistanceTo(target.pos) < 500 and myHero:GetSpellData(_E).name == "BlindMonkETwo" then
				Control.CastSpell(HK_E)
			end				
			
			if myHero.pos:DistanceTo(target.pos) < 350 and Ready(_E) and myHero:GetSpellData(_W).name == "BlindMonkWTwo" and myHero:GetSpellData(_E).name == "BlindMonkEOne" then
				Control.CastSpell(HK_E)
			end				
			
			if myHero.pos:DistanceTo(target.pos) < 375 and Ready(_R) and not Ready(_E) then
				self:Cast(HK_R, target.pos)
			end
						
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if myHero.pos:DistanceTo(target.pos) <= 1200 and Ready(_Q) then
				self:Cast(HK_Q, pred.CastPosition)
			end
			
			if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_Q)
			end				
	
		for i, tower in pairs(GetAllyTurret()) do			
			if WardsAround(target, 400) == 0 and Ready(_R) then 
				local Data = myHero:GetSpellData(Item);
	
					
						
				if tower.pos:DistanceTo(target.pos) <= 1600 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 250 then
					local CastPos = target.pos + (target.pos-tower.pos):Normalized() * (300)
					self:InsecStart(CastPos)
									
				end	
			end
					
			for i, ally in pairs(GetAllyHeroes()) do
				if WardsAround(target, 400) == 0 and Ready(_R) then 
					local Data = myHero:GetSpellData(Item);
	
						
					if not IsValid(tower, 1600) and IsValid(ally, 1300) and ally.pos:DistanceTo(target.pos) <= 1500 and Item and Data.ammo > 0 and myHero.pos:DistanceTo(target.pos) <= 250 then
						local CastPos = target.pos + (target.pos-ally.pos):Normalized() * (300)
						self:InsecStart(CastPos)
							
					end	
				end
			end				
		end
		end	
	end
end

function LeeSin:InsecStart(CastPos)
local target = GetTarget(1300)     	
if target == nil then return end
local wardslot = nil
	for t, VisionItem in pairs(_wards) do
		if not wardslot then
			wardslot = GetInventorySlotItem(VisionItem)
elseif GetTickCount() > LastCast + 200 then
			LastCast = GetTickCount()
			if myHero.pos:DistanceTo(mousePos) < 1300 then		
				if target and Ready(_R) and wardslot then


					if Vector(myHero.pos):DistanceTo(CastPos)<=625 then
						if Ready(_W) and myHero:GetSpellData(_W).name == "BlindMonkWOne" then
							Control.SetCursorPos(CastPos)
							self:Cast(ItemHotKey[wardslot], CastPos)
							self:Cast(HK_W, CastPos)		
						end
					end
				end
			end
		end
	end
end

function LeeSin:NearestEnemy(entity)
	local distance = 999999
	local enemy = nil
	for i = 1,Game.HeroCount()  do
		local hero = Game.Hero(i)	
		if hero and HPred:CanTarget(hero) then
			local d = HPred:GetDistanceSqr(entity.pos, hero.pos)
			if d < distance then
				distance = d
				enemy = hero
			end
		end
	end
	return _sqrt(distance), enemy
end

function LeeSin:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 375, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) and myHero:GetSpellData(_Q).name == "BlindMonkQOne" then
    Draw.Circle(myHero, 1200, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) and myHero:GetSpellData(_E).name == "BlindMonkEOne"  then
    Draw.Circle(myHero, 350, 1, Draw.Color(225, 225, 125, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 700, 1, Draw.Color(225, 225, 125, 10))
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
	
	
	if self.Menu.Modes.Modes1.Burst:Value() then
		Draw.Text("Fast Insec", 20, textPos.x - 80, textPos.y + 60, Draw.Color(255, 000, 255, 000))
	else
		Draw.Text("Burst Insec", 20, textPos.x - 80, textPos.y + 60, Draw.Color(255, 000, 255, 000))
	end	
	
	if self.Menu.Modes.Modes1.Logic:Value() then
		Draw.Text("Near Insec", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 000, 255, 000))
	else
		Draw.Text("Far Insec", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 000, 255, 000))	
	end
	
	if self.Menu.Modes.Modes1.Draw:Value() then
		
		
		for v, spell in pairs(_wards) do
		local Item = GetInventorySlotItem(spell)	
		local Data = myHero:GetSpellData(Item);	
	
			if Item and Data.ammo > 0 and Ready(_Q) and Ready(_R) and Ready(_W) then
				for i = 1, Game.HeroCount() do
				local Hero = Game.Hero(i)
				local textPos = Hero.pos:To2D()
					if self.Menu.Modes.Modes1.Logic:Value() then	 
						
						if self.Menu.Modes.Modes1.Type:Value() == 2 and self.Menu.Modes.Modes1.Insec:Value() then 	
							if IsValid(Hero, 1300) and Hero.isEnemy and myHero.pos:DistanceTo(Hero.pos) <= 1300 then	
								local Vectori = Vector(myHero.pos - Hero.pos)
								local LS = LineSegment(myHero.pos, Hero.pos)
								LS:__draw()
								LSS = Circle(Point(Hero), Hero.boundingRadius)
								LSS:__draw()
								Draw.Text("Insec Mode", 20, textPos.x - 33, textPos.y + 60, Draw.Color(255, 255, 0, 0))
								Draw.Circle(myHero, 475, 1, Draw.Color(225, 225, 0, 0))
							end
						end	
						if self.Menu.Modes.Modes1.Type:Value() == 1 then
							if IsValid(Hero, 1300) and Hero.isEnemy and myHero.pos:DistanceTo(Hero.pos) <= 1300 then	
								local Vectori = Vector(myHero.pos - Hero.pos)
								local LS = LineSegment(myHero.pos, Hero.pos)
								LS:__draw()
								LSS = Circle(Point(Hero), Hero.boundingRadius)
								LSS:__draw()
								Draw.Text("Insec Mode", 20, textPos.x - 33, textPos.y + 60, Draw.Color(255, 255, 0, 0))
								Draw.Circle(myHero, 475, 1, Draw.Color(225, 225, 0, 0))
							end
						end	
					end
					
					if not self.Menu.Modes.Modes1.Logic:Value() then
						
						if self.Menu.Modes.Modes1.Type:Value() == 2 and self.Menu.Modes.Modes1.Insec:Value() then 	
							if IsValid(Hero, 1500) and Hero.isEnemy and myHero.pos:DistanceTo(Hero.pos) <= 1500 then								
								local Vectori = Vector(myHero.pos - Hero.pos)
								local LS = LineSegment(myHero.pos, Hero.pos)
								LS:__draw()
								LSS = Circle(Point(Hero), Hero.boundingRadius)
								LSS:__draw()
								Draw.Text("Insec Mode", 20, textPos.x - 33, textPos.y + 60, Draw.Color(255, 255, 0, 0))
								Draw.Circle(myHero, 1200, 1, Draw.Color(225, 225, 0, 0))
							end
						end	
						if self.Menu.Modes.Modes1.Type:Value() == 1 then
							if IsValid(Hero, 1500) and Hero.isEnemy and myHero.pos:DistanceTo(Hero.pos) <= 1500 then	
								local Vectori = Vector(myHero.pos - Hero.pos)
								local LS = LineSegment(myHero.pos, Hero.pos)
								LS:__draw()
								LSS = Circle(Point(Hero), Hero.boundingRadius)
								LSS:__draw()
								Draw.Text("Insec Mode", 20, textPos.x - 33, textPos.y + 60, Draw.Color(255, 255, 0, 0))
								Draw.Circle(myHero, 1200, 1, Draw.Color(225, 225, 0, 0))
							end
						end	
					end					
				end
			end
		end
	end
	local target = GetTarget(20000)
	if target == nil then return end	
	if target and self.Menu.Modes.Modes3.Draw:Value() and not target.dead then
	local hp = target.health	
	local QDmg = getdmg("Q", target, myHero)
	local EDmg = getdmg("E", target, myHero)
	local RDmg = getdmg("R", target, myHero)
	local FullDmg = (QDmg + RDmg + EDmg)	
		if Ready(_Q) and Ready(_E) and Ready(_R) and FullDmg > hp then
			Draw.Text("Insec Kill", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Insec Kill", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))
	
		end	
	end
end

function LeeSin:AutoQ()
local target = GetTarget(1500)     	
if target == nil or IsUnderTurret(target) then return end	
	
	if IsValid(target,1500) and myHero.pos:DistanceTo(target.pos) <= 1200 and self.Menu.AutoQ.UseQ:Value() and Ready(_Q) then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if IsImmobileTarget(target) and myHero.pos:DistanceTo(target.pos) <= 1200 and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q, pred.CastPosition)
		end	
		if IsImmobileTarget(target) and myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
			Control.CastSpell(HK_Q)
		end	
	end
end


function LeeSin:AutoR()
local target = GetTarget(1000)     	
if target == nil then return end
	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) <= 1000 then
		if myHero.health/myHero.maxHealth <= self.Menu.AutoR.Heal:Value()/100 and self.Menu.AutoR.UseR:Value() and Ready(_R) then
			if myHero.pos:DistanceTo(target.pos) <= 375 then
				Control.CastSpell(HK_R, target)
			end
			
			if myHero.pos:DistanceTo(target.pos) > 375 and myHero.pos:DistanceTo(target.pos) <= 800 and Ready(_Q) then
				local pred = GetGamsteronPrediction(target, QData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end
			end	
		end
	end	
end

function LeeSin:AutoW()
local target = GetTarget(800)     	
if target == nil then return end	
	
	if self.Menu.AutoW.UseW:Value() and Ready(_W) then
		if myHero.health/myHero.maxHealth <= self.Menu.AutoW.Heal:Value()/100 then
			Control.CastSpell(HK_W, myHero)
			if myHero:GetSpellData(_W).name == "BlindMonkWTwo" then
				Control.CastSpell(HK_W)
			end
		end
		for i, ally in pairs(GetAllyHeroes()) do
			if IsValid(ally,1000) and myHero.pos:DistanceTo(ally.pos) <= 700 and ally.health/ally.maxHealth <= self.Menu.AutoW.Heal:Value()/100 then
				Control.CastSpell(HK_W, ally)
				if HasBuff(ally, "blindmonkwoneshield") then
					Control.CastSpell(HK_W)
				end
			end
		end
	end
end


function LeeSin:Combo()
local target = GetTarget(1500)     	
if target == nil then return end
	if IsValid(target,1500) then
		
		if self.Menu.Combo.UseQ:Value() then
			if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_Q)
					
			elseif myHero.pos:DistanceTo(target.pos) <= 1200 and Ready(_Q) then
				local pred = GetGamsteronPrediction(target, QData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end	
			end
		end
		if self.Menu.Combo.UseE:Value() then
			if myHero:GetSpellData(_E).name == "BlindMonkETwo" and EnemiesAround(myHero, 500) >= 1 then
				Control.CastSpell(HK_E)
				
			elseif myHero.pos:DistanceTo(target.pos) <= 350 and Ready(_E) then	
				Control.CastSpell(HK_E)
			end
		end
	end	
end	

function LeeSin:Harass()
local target = GetTarget(1500)
if target == nil then return end
	if IsValid(target,1500) then
		local Mana = myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 	
		if self.Menu.Harass.UseQ:Value() then
			if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
				Control.CastSpell(HK_Q)
					
		
			elseif myHero.pos:DistanceTo(target.pos) <= 1200 and Ready(_Q) and Mana then
				local pred = GetGamsteronPrediction(target, QData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end	
			end	
		end
		if self.Menu.Harass.UseE:Value() then
			if myHero:GetSpellData(_E).name == "BlindMonkETwo" and EnemiesAround(myHero, 500) >= 1 then
				Control.CastSpell(HK_E)
					
			elseif myHero.pos:DistanceTo(target.pos) <= 350 and Ready(_E) then	
				Control.CastSpell(HK_E)
			end
		end	
	end	
end	

function LeeSin:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
			
			if self.Menu.Clear.UseQ ~= nil and self.Menu.Clear.UseQ:Value() then
			
				if HasBuff(minion, "BlindMonkQOne") and myHero.pos:DistanceTo(minion.pos) <= 1300 then
					Control.CastSpell(HK_Q)
				
				elseif mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and myHero.pos:DistanceTo(minion.pos) >= 500 and Ready(_Q) then
					Control.CastSpell(HK_Q, minion.pos)
				end
			end

			local passiveBuff = GetBuffData(myHero,"blindmonkpassive_cosmetic")
			if  passiveBuff.count == 1 then return end
            
			if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() then
			
				if myHero:GetSpellData(_W).name == "BlindMonkWTwo" then
					Control.CastSpell(HK_W)
			
				elseif mana_ok and myHero.pos:DistanceTo(minion.pos) <= 500 and Ready(_W) then
					if myHero.health/myHero.maxHealth <= self.Menu.Clear.Heal:Value()/100 then
						Control.CastSpell(HK_W, myHero)
					end
				end
			end
            
			if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() then
			
				if myHero:GetSpellData(_E).name == "BlindMonkETwo" and GetMinionCount(500, myHero) >= self.Menu.Clear.UseEM:Value() then
					Control.CastSpell(HK_E)
					
				elseif mana_ok and GetMinionCount(350, myHero) >= self.Menu.Clear.UseEM:Value() and Ready(_E) then
					Control.CastSpell(HK_E)
				end
			end
            
			if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end



function LeeSin:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            
			if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() then
			
				if myHero:GetSpellData(_Q).name == "BlindMonkQTwo" and myHero.pos:DistanceTo(minion.pos) <= 1300 then
					Control.CastSpell(HK_Q)
			
				elseif mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
					Control.CastSpell(HK_Q, minion.pos)
				end
			end
			
			
			local passiveBuff = GetBuffData(myHero,"blindmonkpassive_cosmetic")
			if  passiveBuff.count == 1 then return end
           
			if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() then
			
				if myHero:GetSpellData(_W).name == "BlindMonkWTwo" then
					Control.CastSpell(HK_W)		    
			
				elseif mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
					Control.CastSpell(HK_W, myHero)
				end
			end
            
			if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() then
			
				if myHero:GetSpellData(_E).name == "BlindMonkETwo" and GetMinionCount(500, myHero) >= 1 then
					Control.CastSpell(HK_E)
						
				elseif mana_ok and GetMinionCount(350, myHero) >= 1 and Ready(_E) and not Ready(_W) then
					Control.CastSpell(HK_E)
				end
			end
            
			if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

local lastWard = nil

function LeeSin:OnCreateObj()
if myHero.dead then return end
	for i = 1, Game.WardCount() do
	local object = Game.Ward(i)	
		if object ~= nil and object.valid and object.isAlly and (object.name == "VisionWard" or object.name == "SightWard") then
			lastWard = object
			lastTime = GetTickCount()
		end
	end
end

function LeeSin:JungleSteal()
--if mySmiteSlot == 0 then return end	
local minionlist = {}
	if _G.SDK then
		minionlist = _G.SDK.ObjectManager:GetMonsters(1500)
	elseif _G.GOS then
		for i = 1, Game.MinionCount() do
			local minion = Game.Minion(i)
			
			if minion.valid and minion.isEnemy and minion.pos:DistanceTo(myHero.pos) < 1500 then
				table.insert(minionlist, minion)
			end
		end
	end
	
for i, minion in pairs(minionlist) do
					
		
		if self.Menu.Jsteal.Active:Value() then
			local count = GetEnemyCount(1000, myHero)
			if Ready(_W) and myHero:GetSpellData(_W).name == "BlindMonkWOne" and count >= 1 then
				if lastTime > (GetTickCount() - 1000) then
					if (GetTickCount() - lastTime) >= 10 then	
						self:Cast(HK_W, lastWard)
					end
				end
			end		
		end	
	
	
	
	if minion.pos:DistanceTo(myHero.pos) < 1300 and self.Menu.Jsteal.Active:Value() then
		local Damage = (SmiteDamage[myHero.levelData.lvl] + getdmg("Q", minion, myHero))
		local SData = myHero:GetSpellData(mySmiteSlot);

		--if SData.level > 0 and SData.ammo > 0 then	
			
			if minion.pos:DistanceTo(myHero.pos) < 1200 and (JungleTable[minion.charName] or minion.charName == "SRU_RiftHerald" or minion.charName == "SRU_Baron") then
				for v, spell in pairs(_wards) do
				local Item = GetInventorySlotItem(spell)
				local Data = myHero:GetSpellData(Item);
				local count = GetEnemyCount(500, myHero)	
					if WardTicks + 200 < GetTickCount() then 
					local WardTicks = GetTickCount();
					UsedWard = false;	
						if UsedWard == false and Item and Data.ammo > 0 and Damage > minion.health and count == 0 then
							self:Cast(ItemHotKey[Item], myHero.pos)
						end	
					end
				end
			end
			
			if self.Menu.Jsteal.Dragon:Value() then
				if JungleTable[minion.charName] and minion.pos:DistanceTo(myHero.pos) < 1300 and Ready(_Q) then
					if myHero:GetSpellData(_Q).name == "BlindMonkQTwo" and minion.pos:DistanceTo(myHero.pos) < 1300 then
						Control.CastSpell(HK_Q)
						
					end
					if minion.pos:DistanceTo(myHero.pos) < 1200 and Damage > minion.health then
						self:Cast(HK_Q, minion.pos)
					end
				end
			end
			
			if self.Menu.Jsteal.Herald:Value() then
				if minion.charName == "SRU_RiftHerald" and minion.pos:DistanceTo(myHero.pos) < 1300 and Ready(_Q) then
					if myHero:GetSpellData(_Q).name == "BlindMonkQTwo" and minion.pos:DistanceTo(myHero.pos) < 1300 then
						Control.CastSpell(HK_Q)
						
					end
					if minion.pos:DistanceTo(myHero.pos) < 1200 and Damage > minion.health then
						self:Cast(HK_Q, minion.pos)
					end
				end
			end
			
			if self.Menu.Jsteal.Baron:Value() then
				if minion.charName == "SRU_Baron" and minion.pos:DistanceTo(myHero.pos) < 1300 and Ready(_Q) then
					if myHero:GetSpellData(_Q).name == "BlindMonkQTwo" and minion.pos:DistanceTo(myHero.pos) < 1300 then
						Control.CastSpell(HK_Q)
						
					end
					if minion.pos:DistanceTo(myHero.pos) < 1200 and Damage > minion.health then
						self:Cast(HK_Q, minion.pos)
					end
				end
			end 
		--end	
	end
end
end


function LeeSin:KillSteal()
	local target = GetTarget(1500)     	
	if target == nil then return end
	
	

	if IsValid(target,1500) and myHero.pos:DistanceTo(target.pos) <= 1300 then
		local hp = target.health
		local QDmg = getdmg("Q", target, myHero)
		local EDmg = getdmg("E", target, myHero)
		local RDmg = getdmg("R", target, myHero)
		local QRDmg = QDmg + RDmg
		
		if IsUnderTurret(target) then return end
			
			if QRDmg >= hp and self.Menu.ks.UseQR:Value() and Ready(_Q) and Ready(_R) then
				local pred = GetGamsteronPrediction(target, QData, myHero)
				if myHero.pos:DistanceTo(target.pos) <= 1200 and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end
				if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
					Control.CastSpell(HK_Q)
				end	
				if myHero.pos:DistanceTo(target.pos) <= 350 and HasBuff(myHero, "BlindMonkQTwoDash") then
					Control.CastSpell(HK_R, target)
				end
			end
			if QDmg >= hp and self.Menu.ks.UseQ:Value() and Ready(_Q) then
				local pred = GetGamsteronPrediction(target, QData, myHero)
				if myHero.pos:DistanceTo(target.pos) <= 1200 and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end
				if myHero.pos:DistanceTo(target.pos) <= 1300 and HasBuff(target, "BlindMonkQOne") then
					Control.CastSpell(HK_Q)
				end	
			end

		if myHero.pos:DistanceTo(target.pos) <= 350 and EDmg >= hp then
			if self.Menu.ks.UseE:Value() and Ready(_E) then
				Control.CastSpell(HK_E)
			end
			if myHero:GetSpellData(_E).name == "BlindMonkETwo" and myHero.pos:DistanceTo(target.pos) <= 500 then
				Control.CastSpell(HK_E)
			end
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 375 and RDmg >= hp and self.Menu.ks.UseR:Value() and Ready(_R) then
			Control.CastSpell(HK_R, target)
			
		end
	end
end	





-------------------------------------------------------------------------------------------------------------------------------------------------------------

class "Lux"
--require('GamsteronPrediction')



local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 70, Range = 1175, Speed = 1200, Collision = true, MaxCollision = 1, CollisionTypes = {_G.COLLISION_MINION, _G.COLLISION_YASUOWALL}
}

local EData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.25, Radius = 310, Range = 1000, Speed = 1200, Collision = false
}

function Lux:__init()

  if menu ~= 1 then return end
  menu = 2   	
  self:LoadMenu()                                            
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function Lux:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Lux", name = "拉克丝"})

	--AutoQ
	self.Menu:MenuElement({type = MENU, id = "AutoQ", leftIcon = Icons["AutoQImmo"]})
	self.Menu.AutoQ:MenuElement({id = "UseQ", name = "自动[Q]固定目标", value = true})

	--AutoW 
	self.Menu:MenuElement({type = MENU, id = "AutoW", leftIcon = Icons["AutoW"]})
	self.Menu.AutoW:MenuElement({id = "UseW", name = "自动[W]盟友+自己", value = true})
	self.Menu.AutoW:MenuElement({id = "Heal", name = "最小Hp盟友或自己", value = 40, min = 0, max = 100, identifier = "%"})	

	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", leftIcon = Icons["AutoE"]})
	self.Menu.AutoE:MenuElement({id = "UseE", name = "自动[E]固定目标", value = true})	
		
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]光之束缚", value = true})		
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]透光奇点", value = true})			
	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]光之束缚", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E]透光奇点", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})			
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E]透光奇点", value = true})
	self.Menu.Clear:MenuElement({id = "UseEM", name = "使用[E]最小值", value = 4, min = 1, max = 6, step = 1})  		
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E]透光奇点", value = true})	
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]光之束缚", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E]透光奇点", value = true})				
	self.Menu.ks:MenuElement({id = "UseR", name = "[R] 终极闪光", value = true})	
	
	
	--JungleSteal
	self.Menu:MenuElement({type = MENU, id = "Jsteal", leftIcon = Icons["junglesteal"]})
	self.Menu.Jsteal:MenuElement({id = "Dragon", name = "自动R偷龙", value = true})
	self.Menu.Jsteal:MenuElement({id = "Baron", name = "自动R偷男爵", value = true})
	self.Menu.Jsteal:MenuElement({id = "Herald", name = "自动R偷峡谷先锋", value = true})	

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 1, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredE", name = "机会[E]", value = 1, drop = {"Normal", "High", "Immobile"}})
 
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})

	
	
end	

function Lux:Tick()
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()

		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		end	
	self:JungleSteal()
	self:KillSteal()
	self:AutoQ()
	self:AutoE()
	self:AutoW()
	
	end
end

function Lux:NearestEnemy(entity)
	local distance = 999999
	local enemy = nil
	for i = 1,Game.HeroCount()  do
		local hero = Game.Hero(i)	
		if hero and HPred:CanTarget(hero) then
			local d = HPred:GetDistanceSqr(entity.pos, hero.pos)
			if d < distance then
				distance = d
				enemy = hero
			end
		end
	end
	return _sqrt(distance), enemy
end

function Lux:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 3340, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 1175, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 1000, 1, Draw.Color(225, 225, 125, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 1075, 1, Draw.Color(225, 225, 125, 10))
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
end

function Lux:AutoQ()
local target = GetTarget(1300)     	
if target == nil then return end	
	
	if IsValid(target,1300) and myHero.pos:DistanceTo(target.pos) <= 1175 and IsImmobileTarget(target) and self.Menu.AutoQ.UseQ:Value() and Ready(_Q) then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q, pred.CastPosition)
		end	
	end
end

local eMissile
local eParticle

function Lux:IsETraveling()
	return eMissile and eMissile.name and eMissile.name == "LuxLightStrikeKugel"
end

function Lux:IsELanded()
	return eParticle and eParticle.name and _find(eParticle.name, "E_tar_aoe_sound") --Lux_.+_E_tar_aoe_
end

function Lux:AutoE()
local target = GetTarget(1300)     	
if target == nil then return end
	if IsValid(target,1300) and self:IsELanded() then
		if self:NearestEnemy(eParticle) < 310 then	
			Control.CastSpell(HK_E)
			eParticle = nil
		end	
	else		

		local eData = myHero:GetSpellData(_E)
		if eData.toggleState == 1 then

			if not self:IsETraveling() then
				for i = 1, Game.MissileCount() do
					local missile = Game.Missile(i)			
					if missle and missile.name == "LuxLightStrikeKugel" and HPred:IsInRange(missile.pos, myHero.pos, 400) then
						eMissile = missile
						break
					end
				end
			end
		elseif eData.toggleState == 2 then		
			for i = 1, Game.ParticleCount() do 
				local particle = Game.Particle(i)
				if particle and _find(particle.name, "E_tar_aoe_sound") then
					eParticle = particle
					break
				end
			end	
		end
		if myHero.pos:DistanceTo(target.pos) <= 1000 and Ready(_E) and IsImmobileTarget(target) then
			if self.Menu.AutoE.UseE:Value() then
				Control.CastSpell(HK_E, target.pos)
				eMissile = nil

			end
		end
	end	
end

function Lux:AutoW()
	for i, ally in pairs(GetAllyHeroes()) do
		if self.Menu.AutoW.UseW:Value() and Ready(_W) then
			if myHero.health/myHero.maxHealth <= self.Menu.AutoW.Heal:Value()/100 and BaseCheck(myHero) == false then
				Control.CastSpell(HK_W)
			end
			if IsValid(ally,1300) and myHero.pos:DistanceTo(ally.pos) <= 1075 and ally.health/ally.maxHealth <= self.Menu.AutoW.Heal:Value()/100 and BaseCheck(myHero) == false then
				Control.CastSpell(HK_W, ally.pos)
			end
		end
	end
end


function Lux:Combo()
local target = GetTarget(1300)     	
if target == nil then return end
	if IsValid(target,1300) then
				
		if myHero.pos:DistanceTo(target.pos) <= 1175 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		if self.Menu.Combo.UseE:Value() and Ready(_E) then
			if self:IsELanded() then
				self:AutoE()
			elseif myHero.pos:DistanceTo(target.pos) <= 1000 then	
				local pred = GetGamsteronPrediction(target, EData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then				
					Control.CastSpell(HK_E, pred.CastPosition)
				end
			end
		end		
	end	
end	

function Lux:Harass()
local target = GetTarget(1300)
if target == nil then return end
	if IsValid(target,1300) and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if myHero.pos:DistanceTo(target.pos) <= 1175 and self.Menu.Harass.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if self.Menu.Harass.UseE:Value() and Ready(_E) then
			if self:IsELanded() then
				self:AutoE()
			elseif myHero.pos:DistanceTo(target.pos) <= 1000 then	
				local pred = GetGamsteronPrediction(target, EData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then				
					Control.CastSpell(HK_E, pred.CastPosition)
				end
			end
		end
	end
end

function Lux:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.UseQ ~= nil and self.Menu.Clear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() then
                if self:IsELanded() then
                    Control.CastSpell(HK_E)
                elseif mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                    local count = GetMinionCount(500, minion)
                    if count >= self.Menu.Clear.UseEM:Value() then
                        Control.CastSpell(HK_E, minion.pos)
                    end
                end
            end
            if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Lux:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() then
                if self:IsELanded() then
                    Control.CastSpell(HK_E)
                elseif mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                    Control.CastSpell(HK_E, minion.pos)
                end
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end


local JungleTable = {
	SRU_Dragon_Water = "",
	SRU_Dragon_Fire = "",
	SRU_Dragon_Earth = "",
	SRU_Dragon_Air = "",
	SRU_Dragon_Elder = "",
}



function Lux:JungleSteal()
local minionlist = {}
	if _G.SDK then
		minionlist = _G.SDK.ObjectManager:GetMonsters(3500)
	elseif _G.GOS then
		for i = 1, Game.MinionCount() do
			local minion = Game.Minion(i)
			
			if minion.valid and minion.isEnemy and minion.pos:DistanceTo(myHero.pos) < 3340 then
				table.insert(minionlist, minion)
			end
		end
	end
	
	for i, minion in pairs(minionlist) do
	if minion == nil then return end	
	if minion.pos:DistanceTo(myHero.pos) < 3340 then
		local RDamage = getdmg("R", minion, myHero)	
		if self.Menu.Jsteal.Dragon:Value() and Ready(_R) then
			
			if JungleTable[minion.charName] and RDamage > minion.health then
				if minion.pos:To2D().onScreen then 		
					Control.CastSpell(HK_R, minion.pos) 
				
				elseif not minion.pos:To2D().onScreen then	
				local castPos = myHero.pos:Extended(minion.pos, 1000)    
					Control.CastSpell(HK_R, castPos)
				end
			end
		end
		if self.Menu.Jsteal.Herald:Value() and Ready(_R) then

			if minion.charName == "SRU_RiftHerald" and RDamage > minion.health then
				if minion.pos:To2D().onScreen then 		
					Control.CastSpell(HK_R, minion.pos) 
				
				elseif not minion.pos:To2D().onScreen then	
				local castPos = myHero.pos:Extended(minion.pos, 1000)    
					Control.CastSpell(HK_R, castPos)
				end				
			end
		end
		if self.Menu.Jsteal.Baron:Value() and Ready(_R) then
			
			if minion.charName == "SRU_Baron" and RDamage > minion.health then
				if minion.pos:To2D().onScreen then 		
					Control.CastSpell(HK_R, minion.pos) 
				
				elseif not minion.pos:To2D().onScreen then	
				local castPos = myHero.pos:Extended(minion.pos, 1000)    
					Control.CastSpell(HK_R, castPos)
				end
			end
		end
	end
	end
end

function Lux:DMGJng()
    local level = myHero:GetSpellData(_R).level
    local rdamage = (({900, 1100, 1400})[level] + 0.75 * myHero.ap)
	return rdamage
end
function Lux:DMGBaron()
    local level = myHero:GetSpellData(_R).level
    local rdamage = (({900, 1100, 1900})[level] + 0.75 * myHero.ap)
	return rdamage
end

function Lux:KillSteal()
	local target = GetTarget(3500)     	
	if target == nil then return end
	
	
	if IsValid(target,3500) then	
		local hp = target.health
		if myHero.pos:DistanceTo(target.pos) <= 1175 and Ready(_Q) then
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= hp then
				self:KillstealQ()
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 1000 and Ready(_E) then
			local EDmg = getdmg("E", target, myHero)
			if EDmg >= hp then
				self:KillstealE()
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 3340 and Ready(_R) then
			local RDmg = getdmg("R", target, myHero) 
			local RDmg2 = getdmg("R", target, myHero) + (10 + 10 * myHero.levelData.lvl + myHero.ap * 0.2)
			if HPred:HasBuff(target, "LuxIlluminatingFraulein",1.25) and RDmg2 >= hp then    
				self:KillstealR()
			end
			if RDmg >= hp then
				self:KillstealR()
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 1175 and Ready(_R) and Ready(_Q) then
			local RDmg = getdmg("R", target, myHero)
			local QDmg = getdmg("Q", target, myHero)
			local QRDmg = QDmg + RDmg
			if QRDmg >= hp then
				self:KillstealQ()
			end	
		end
	end
end	

function Lux:KillstealQ()
	local target = GetTarget(1300)
	if target == nil then return end
	if IsValid(target,1300) and myHero.pos:DistanceTo(target.pos) <= 1175 then 	
		if self.Menu.ks.UseQ:Value() then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			
			end
		end
	end
end

function Lux:KillstealE()
	local target = GetTarget(1300)
	if target == nil then return end
	if IsValid(target,1300) and myHero.pos:DistanceTo(target.pos) <= 1000 and self.Menu.ks.UseE:Value() then
		Control.CastSpell(HK_E, target.pos)
			
		
	end
end

function Lux:KillstealR()
    local target = GetTarget(3400)
	if target == nil then return end
	if IsValid(target,3400) and myHero.pos:DistanceTo(target.pos) <= 3340 then	
		if self.Menu.ks.UseR:Value() then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 3340, 1.0, 1000, 190, false)
			if hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 		
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)    
					Control.CastSpell(HK_R, castPos)
				end		
			end
		end
	end
end




-------------------------------------------------------------------------------------------------------------------------------------------------------------

class "Malzahar"
--require('GamsteronPrediction')



local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 1.0, Radius = 85, Range = 900, Speed = 3200, Collision = false
}

function Malzahar:__init()

  if menu ~= 1 then return end
  menu = 2   	
  self:LoadMenu()                                            
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function Malzahar:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Malzahar", name = "玛尔扎哈"})

	--AutoQ
	self.Menu:MenuElement({type = MENU, id = "AutoQ", leftIcon = Icons["AutoQImmo"]})
	self.Menu.AutoQ:MenuElement({id = "UseQ", name = "[问]虚空召唤", value = true})	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[问]虚空召唤", value = true})		
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W] 虚空虫群", value = true})
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E] 煞星幻象", value = true})			
	self.Menu.Combo:MenuElement({id = "UseR", name = "[R] 冥府之握", value = false})	
	

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[问]虚空召唤", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E] 煞星幻象", value = true})
	self.Menu.Harass:MenuElement({id = "UseW", name = "[W] 虚空虫群", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[问]虚空召唤", value = true})		
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E] 煞星幻象", value = true})
	self.Menu.Clear:MenuElement({id = "UseEM", name = "使用[E]最小值", value = 2, min = 1, max = 6})  	
	self.Menu.Clear:MenuElement({id = "hp", name = "使用[E]如果小兵HP小于", value = 50, min = 1, max = 100, identifier = "%"})	
	self.Menu.Clear:MenuElement({id = "UseW", name = "[W] 虚空虫群", value = true})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[问]虚空召唤", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E] 煞星幻象", value = true})
	self.Menu.JClear:MenuElement({id = "UseW", name = "[W] 虚空虫群", value = true})	
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[问]虚空召唤", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E] 煞星幻象", value = true})	
	self.Menu.ks:MenuElement({id = "UseW", name = "[W] +煞星幻象", value = true})			
	self.Menu.ks:MenuElement({id = "UseR", name = "[R] +虚空虫群", value = true})
	self.Menu.ks:MenuElement({id = "full", name = "完整组合", value = true})

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	

 
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})

	
	
end

function Malzahar:IsRCharging()
	return myHero.activeSpell and myHero.activeSpell.valid and myHero.activeSpell.name == "MalzaharR"
end

function Malzahar:Tick()
self:ActiveUlt()	
if self:IsRCharging() then return end
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()

		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
		
		end	

	self:KillSteal()
	self:AutoQ()
	
	
	end
end 

function Malzahar:AutoQ()
local target = GetTarget(1000)     	
if target == nil then return end	
local pred = GetGamsteronPrediction(target, QData, myHero)	
	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) <= 900 and IsImmobileTarget(target) and self.Menu.AutoQ.UseQ:Value() and Ready(_Q) then
		if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q, pred.CastPosition)
		end	
	end
end

function Malzahar:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 700, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 800, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 1100, 1, Draw.Color(225, 225, 125, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 850, 1, Draw.Color(225, 225, 125, 10))
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
end

function Malzahar:ActiveUlt()
	if myHero.activeSpell and myHero.activeSpell.valid and myHero.activeSpell.name == "MalzaharR" then	
		_G.SDK.Orbwalker:SetMovement(false)
		_G.SDK.Orbwalker:SetAttack(false)	
	else
		_G.SDK.Orbwalker:SetMovement(true)
		_G.SDK.Orbwalker:SetAttack(true)
	end
end
       
function Malzahar:KillSteal()	
	local target = GetTarget(1000)     	
	if target == nil then return end
 

	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) <= 900 then
		local ready = Ready(_Q) and Ready(_E) and Ready(_W) and Ready(_R)
		local hp = target.health
		local QDmg = getdmg("Q", target, myHero)
		local EDmg = getdmg("E", target, myHero)
		local WDmg = getdmg("W", target, myHero)
		local RDmg = (getdmg("R", target, myHero) + getdmg("R", target, myHero, 2))	
		local fullDmg = (QDmg + EDmg + WDmg + RDmg)
	
		
		if myHero.pos:DistanceTo(target.pos) <= 900 and QDmg >= hp and self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 650 and EDmg >= hp then	
			if self.Menu.ks.UseE:Value() and Ready(_E) then
				Control.CastSpell(HK_E, target)
	
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 650 and WDmg >= hp then	
			if self.Menu.ks.UseW:Value() and Ready(_W) then
				Control.CastSpell(HK_W, target.pos)
	
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 700 and RDmg >= hp then	
			if self.Menu.ks.UseR:Value() and Ready(_R) then
				Control.CastSpell(HK_R, target)	
	
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 700 and fullDmg >= hp then	
			if self.Menu.ks.full:Value() and ready then
				self:KsFull(target)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 700 and RDmg >= hp and self.Menu.ks.full:Value() and Ready(_R) then
			Control.CastSpell(HK_R, target)
		end
	end
end	

function Malzahar:KsFull(target)
	local pred = GetGamsteronPrediction(target, QData, myHero)
	
	if myHero.pos:DistanceTo(target.pos) <= 650 then
		Control.CastSpell(HK_E, target)
	end	
	if myHero.pos:DistanceTo(target.pos) <= 900 and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then 
		Control.CastSpell(HK_Q, pred.CastPosition)
	end	
	if myHero.pos:DistanceTo(target.pos) <= 650 then
		Control.CastSpell(HK_W, target.pos)
	end	
end
				

function Malzahar:Combo()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target,1000) then

		if myHero.pos:DistanceTo(target.pos) <= 650 then 	
			if self.Menu.Combo.UseW:Value() and Ready(_W) then
				Control.CastSpell(HK_W, target.pos) 
			end
		end			
		
		if myHero.pos:DistanceTo(target.pos) <= 900 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 650 then	
			if self.Menu.Combo.UseE:Value() and Ready(_E) then			
				Control.CastSpell(HK_E, target)
	
			end
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 700 then	
			if Ready(_R) and self.Menu.Combo.UseR:Value() then
				Control.CastSpell(HK_R, target)
			end
		end
	end
	if self:IsRCharging() then	
		_G.SDK.Orbwalker:SetMovement(false)
		_G.SDK.Orbwalker:SetAttack(false)	
	end
	
	_G.SDK.Orbwalker:SetMovement(true)
	_G.SDK.Orbwalker:SetAttack(true)	
end	

function Malzahar:Harass()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target,1000) and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if myHero.pos:DistanceTo(target.pos) <= 900 and self.Menu.Harass.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 650 then	
			if self.Menu.Harass.UseE:Value() and Ready(_E) then			
				Control.CastSpell(HK_E, target)
	
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 650 then	
			if self.Menu.Harass.UseW:Value() and Ready(_W) then			
				Control.CastSpell(HK_W, target.pos)
	
			end
		end
	end
end	

function Malzahar:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.UseQ ~= nil and self.Menu.Clear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
				local count = GetMinionCount(650, minion)
				if minion.health/minion.maxHealth <= self.Menu.Clear.hp:Value()/100 and count >= self.Menu.Clear.UseEM:Value() then	
					Control.CastSpell(HK_E, minion)
				end	
            end
            if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Malzahar:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                Control.CastSpell(HK_E, minion)
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end



-------------------------------------------------------------------------------------------------------------------------------------------------------------


class "Morgana"

--require('GamsteronPrediction')
function Morgana:__init()
	self.DetectedMissiles = {}; self.DetectedSpells = {}; self.Target = nil; self.Timer = 0
	
	
	if menu ~= 1 then return end
	menu = 2
	self:LoadSpells()   	
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
	
end

 
function Morgana:VectorPointProjectionOnLineSegment(v1, v2, v)
	local cx, cy, ax, ay, bx, by = v.x, v.z, v1.x, v1.z, v2.x, v2.z
	local rL = ((cx - ax) * (bx - ax) + (cy - ay) * (by - ay)) / ((bx - ax) ^ 2 + (by - ay) ^ 2)
	local pointLine = { x = ax + rL * (bx - ax), y = ay + rL * (by - ay) }
	local rS = rL < 0 and 0 or (rL > 1 and 1 or rL)
	local isOnSegment = rS == rL
	local pointSegment = isOnSegment and pointLine or { x = ax + rS * (bx - ax), y = ay + rS * (by - ay) }
	return pointSegment, pointLine, isOnSegment
end

function Morgana:CalculateCollisionTime(startPos, endPos, unitPos, startTime, speed, delay, origin)
	local delay = origin == "spell" and delay or 0
	local pos = startPos:Extended(endPos, speed * (Game.Timer() - delay - startTime))
	return GetDistance(unitPos, pos) / speed
end

function Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, collision, type)
	local range = range or 3000; local endPos = startPos:Extended(placementPos, range)
	if type == "circular" or type == "rectangular" then
		if range > 0 then if GetDistance(unitPos, placementPos) < range then endPos = placementPos end
		else endPos = unitPos end
	elseif collision then
		for i = 1, Game.MinionCount() do
			local minion = Game.Minion(i)
			if minion and minion.team == myHero.team and not minion.dead and GetDistance(minion.pos, startPos) < range then
				local col = self:VectorPointProjectionOnLineSegment(startPos, placementPos, minion.pos)
				if col and GetDistance(col, minion.pos) < (radius + minion.boundingRadius / 2) then
					range = GetDistance(startPos, col); endPos = startPos:Extended(placementPos, range); break
				end
			end
		end
	end
	return endPos, range

end

function Morgana:LoadSpells()
 
	Q = {range = 1175, radius = 70, delay = 0.25, speed = 1200, collision = true}    
	W = {range = 900, radius = 280, delay = 0.25, speed = math.huge, collision = false}   
	E = {range = 800,}    
	R = {range = 625,}  

end


local WData =
{
Type = _G.SPELLTYPE_CIRCLE, Collision = false, Delay = 0.25, Radius = 150, Range = 900, Speed = math.huge
}

local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 70, Range = 1175, Speed = 1200, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION, _G.COLLISION_YASUOWALL}
}



function Morgana:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Morgana", name = "莫甘娜"})

	--AutoE
	self.Menu:MenuElement({id = "AutoE", leftIcon = Icons["AutoE"], type = MENU})
	self.Menu.AutoE:MenuElement({id = "self", name = "使用自我免控",value = true})
	self.Menu.AutoE:MenuElement({id = "ally", name = "盟友使用免控",value = true})	
	self.Menu.AutoE:MenuElement({id = "Targets", name = "盟友设置", type = MENU})
	for i, Hero in pairs(GetAllyHeroes()) do
		self.Menu.AutoE.Targets:MenuElement({id = Hero.charName, name = Hero.charName, value = true})		
	end		
	
	self.Menu:MenuElement({type = MENU, id = "ESet", leftIcon = Icons["AutoECCSpells"]})	
	self.Menu.ESet:MenuElement({id = "UseE", name = "使用E自我", value = true})
	self.Menu.ESet:MenuElement({id = "UseEally", name = "使用E盟友", value = true})	
	self.Menu.ESet:MenuElement({id = "ST", name = "跟踪法术", drop = {"Channeling", "Missiles", "Both"}, value = 1})	
	self.Menu.ESet:MenuElement({id = "BlockList", name = "法术列表", type = MENU})	
	
	--AutoW
	self.Menu:MenuElement({type = MENU, id = "AutoW", leftIcon = Icons["AutoWImmo"]})	
	self.Menu.AutoW:MenuElement({id = "UseW", name = "自动[W]", value = true})
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q] 暗之禁锢", value = true})		
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W]只有不准备好 [Q]", value = true})		
	
	--UltSettings
	self.Menu.Combo:MenuElement({type = MENU, id = "Ult", name = "终极设置"})
	self.Menu.Combo.Ult:MenuElement({id = "UseR", name = "[R] +暗之禁锢", value = true})
	self.Menu.Combo.Ult:MenuElement({id = "UseRE", name = "使用[R]最小目标", value = 2, min = 1, max = 5})

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q] 暗之禁锢", value = true})	
	self.Menu.Harass:MenuElement({id = "UseW", name = "[W]只有不准备好 [Q]", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQL", name = "最后一击[Q]暗之禁锢", value = true})		
	self.Menu.Clear:MenuElement({id = "UseW", name = "[W] 折磨之影", value = true})  
	self.Menu.Clear:MenuElement({id = "UseWM", name = "使用[W]最小值", value = 3, min = 1, max = 6})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q] 暗之禁锢", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseW", name = "[W] 折磨之影", value = true})
	self.Menu.JClear:MenuElement({id = "UseWM", name = "使用[W]最小值", value = 3, min = 1, max = 6})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q] 暗之禁锢", value = true})	
	self.Menu.ks:MenuElement({id = "UseW", name = "[W] 折磨之影", value = true})	

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredW", name = "机会[W]", value = 2, drop = {"Normal", "High", "Immobile"}})
 
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "Kill", name = "画出可杀死的目标", value = true})
	
	self.Slot = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
	DelayAction(function()
		for i, spell in pairs(CCSpells) do
			if not CCSpells[i] then return end
			for j, k in pairs(GetEnemyHeroes()) do
				if spell.charName == k.charName and not self.Menu.ESet.BlockList[i] then
					if not self.Menu.ESet.BlockList[i] then self.Menu.ESet.BlockList:MenuElement({id = "Dodge"..i, name = ""..spell.charName.." "..self.Slot[spell.slot].." | "..spell.displayName, value = true}) end
				end
			end
		end
	end, 0.01)
      
end                     

function Morgana:Tick()

	if MyHeroReady() then
		local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
				
		end	

		self:KillSteal()
		self:AutoW()
		self:AutoE()
		self:Auto1()
		self:Auto2()
		
	end
end 


function Morgana:Auto2()
	if self.Menu.ESet.UseE:Value() and Ready(_E) then
		if self.Menu.ESet.ST:Value() ~= 1 then self:OnMissileCreate() end
		if self.Menu.ESet.ST:Value() ~= 2 then self:OnProcessSpell() end
		for i, spell in pairs(self.DetectedSpells) do self:UseE(i, spell) end
	end
end

function Morgana:Auto1()
	if self.Menu.ESet.UseEally:Value() and Ready(_E) then
		if self.Menu.ESet.ST:Value() ~= 1 then self:OnMissileCreate1() end
		if self.Menu.ESet.ST:Value() ~= 2 then self:OnProcessSpell1() end
		for i, spell in pairs(self.DetectedSpells) do self:UseEally(i, spell) end
	end	
end 

function Morgana:GetHeroByHandle(handle)
	for i = 1, Game.HeroCount() do
		local unit = Game.Hero(i)
		if unit.handle == handle then return unit end
	end  
end

function Morgana:UseE(i, s)


	local startPos = s.startPos; local endPos = s.endPos; local travelTime = 0
	if s.speed == math.huge then travelTime = s.delay else travelTime = s.range / s.speed + s.delay end
	if s.type == "rectangular" then
		local StartPosition = endPos-Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		local EndPosition = endPos+Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		startPos = StartPosition; endPos = EndPosition
	end
	if s.startTime + travelTime > Game.Timer() then
		local Col = Morgana:VectorPointProjectionOnLineSegment(startPos, endPos, myHero.pos)
		if s.type == "circular" and GetDistanceSqr(myHero.pos, endPos) < (s.radius + myHero.boundingRadius) ^ 2 or GetDistanceSqr(myHero.pos, Col) < (s.radius + myHero.boundingRadius * 1.25) ^ 2 then
			local t = 0.29; t = s.speed ~= math.huge and Morgana:CalculateCollisionTime(startPos, endPos, myHero.pos, s.startTime, s.speed, s.delay, s.origin)
			if t < 0.3 then Control.CastSpell(HK_E, myHero) end
		end
	else table.remove(self.DetectedSpells, i) end
end

function Morgana:OnMissileCreate()
	
	if Game.Timer() > self.Timer + 0.15 then
		for i, mis in pairs(self.DetectedMissiles) do if Game.Timer() > mis.timer + 2 then table.remove(self.DetectedMissiles, i) end end
		self.Timer = Game.Timer()
	end
	for i = 1, Game.MissileCount() do
		local missile = Game.Missile(i)
		if CCSpells[missile.missileData.name] then
			local unit = Morgana:GetHeroByHandle(missile.missileData.owner)
			if (not unit.visible and CCSpells[missile.missileData.name].origin ~= "spell") or CCExceptions[missile.missileData.name] then
				if GetDistance(unit.pos, myHero.pos) > 3000 or not self.Menu.ESet.BlockList["Dodge"..missile.missileData.name]:Value() then return end
				local Detected = CCSpells[missile.missileData.name]
				if Detected.origin ~= "spell" then
					for i, mis in pairs(self.DetectedMissiles) do if mis.name == missile.missileData.name then return end end
					table.insert(DetectedMissiles, {name = missile.missileData.name, timer = Game.Timer()})
					local startPos = Vector(missile.missileData.startPos); local placementPos = Vector(missile.missileData.placementPos); local unitPos = unit.pos
					local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
					local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
					table.insert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = Game.Timer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "missile"})
				end
			end
		end
	end
end

function Morgana:OnProcessSpell()
	local unit, spell = OnProcessSpell()
	if unit and spell and CCSpells[spell.name] then
		if GetDistance(unit.pos, myHero.pos) > 3000 or not self.Menu.ESet.BlockList["Dodge"..spell.name]:Value() then return end
		local Detected = CCSpells[spell.name]
		if Detected.origin ~= "missile" then
			local type = Detected.type
			if type == "targeted" then
				if spell.target == myHero.handle then Control.CastSpell(HK_E, myHero) end
			else
				local startPos = Vector(spell.startPos); local placementPos = Vector(spell.placementPos); local unitPos = unit.pos
				local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
				local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
				table.insert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = Game.Timer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "spell"})
			end
		end
	end
end

function Morgana:UseEally(i, s)
for i, Hero in pairs(GetAllyHeroes()) do	
	local startPos = s.startPos; local endPos = s.endPos; local travelTime = 0
	if s.speed == math.huge then travelTime = s.delay else travelTime = s.range / s.speed + s.delay end
	if s.type == "rectangular" then
		local StartPosition = endPos-Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		local EndPosition = endPos+Vector(endPos-startPos):Normalized():Perpendicular()*(s.radius2 or 400)
		startPos = StartPosition; endPos = EndPosition
	end
	if s.startTime + travelTime > Game.Timer() then
		local Col = Morgana:VectorPointProjectionOnLineSegment(startPos, endPos, Hero.pos)
		if s.type == "circular" and GetDistanceSqr(Hero.pos, endPos) < (s.radius + Hero.boundingRadius) ^ 2 or GetDistanceSqr(Hero.pos, Col) < (s.radius + Hero.boundingRadius * 1.25) ^ 2 then
			local t = s.speed ~= math.huge and Morgana:CalculateCollisionTime(startPos, endPos, Hero.pos, s.startTime, s.speed, s.delay, s.origin) or 0.29
			if t < 0.3 and myHero.pos:DistanceTo(Hero.pos) <= 800 then Control.CastSpell(HK_E, Hero) end
		end
	else table.remove(self.DetectedSpells, i) end
end
end

function Morgana:OnProcessSpell1()
for i, Hero in pairs(GetAllyHeroes()) do
	
	local unit, spell = OnProcessSpell()
	if unit and spell and CCSpells[spell.name] then
		if GetDistance(unit.pos, Hero.pos) > 3000 or not self.Menu.ESet.BlockList["Dodge"..spell.name]:Value() then return end
		local Detected = CCSpells[spell.name]
		if Detected.origin ~= "missile" then
			local type = Detected.type
			if type == "targeted" then
				if spell.target == Hero.handle and myHero.pos:DistanceTo(Hero.pos) <= 800 then Control.CastSpell(HK_E, Hero) end
			else
				local startPos = Vector(spell.startPos); local placementPos = Vector(spell.placementPos); local unitPos = unit.pos
				local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
				local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
				table.insert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = Game.Timer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "spell"})
			end
		end
	end
end
end


function Morgana:OnMissileCreate1()
for i, Hero in pairs(GetAllyHeroes()) do
	if Game.Timer() > self.Timer + 0.15 then
		for i, mis in pairs(self.DetectedMissiles) do if Game.Timer() > mis.timer + 2 then table.remove(self.DetectedMissiles, i) end end
		self.Timer = Game.Timer()
	end
	for i = 1, Game.MissileCount() do
		local missile = Game.Missile(i)
		if CCSpells[missile.missileData.name] then
			local unit = Morgana:GetHeroByHandle(missile.missileData.owner)
			if (not unit.visible and CCSpells[missile.missileData.name].origin ~= "spell") or CCExceptions[missile.missileData.name] then
				if GetDistance(unit.pos, Hero.pos) > 3000 or not self.Menu.ESet.BlockList["Dodge"..missile.missileData.name]:Value() then return end
				local Detected = CCSpells[missile.missileData.name]
				if Detected.origin ~= "spell" then
					for i, mis in pairs(self.DetectedMissiles) do if mis.name == missile.missileData.name then return end end
					table.insert(self.DetectedMissiles, {name = missile.missileData.name, timer = Game.Timer()})
					local startPos = Vector(missile.missileData.startPos); local placementPos = Vector(missile.missileData.placementPos); local unitPos = unit.pos
					local radius = Detected.radius; local range = Detected.range; local col = Detected.collision; local type = Detected.type
					local endPos, range2 = Morgana:CalculateEndPos(startPos, placementPos, unitPos, range, radius, col, type)
					table.insert(self.DetectedSpells, {startPos = startPos, endPos = endPos, startTime = Game.Timer(), speed = Detected.speed, range = range2, delay = Detected.delay, radius = radius, radius2 = radius2 or nil, angle = angle or nil, type = type, collision = col, origin = "missile"})
				end
			end
		end
	end
end
end

function Morgana:AutoE()
		if IsImmobileTarget(myHero) and self.Menu.AutoE.self:Value() and Ready(_E) then
			Control.CastSpell(HK_E, myHero)
		end
		for i = 1, Game.HeroCount() do
		local ally = Game.Hero(i)
		if ally.isAlly and ally ~= myHero then
		if IsValid(ally) then 
			if myHero.pos:DistanceTo(ally.pos) <= 800 and IsImmobileTarget(ally) and self.Menu.AutoE.ally:Value() and self.Menu.AutoE.Targets[ally.charName] and self.Menu.AutoE.Targets[ally.charName]:Value() and Ready(_E) then
				Control.CastSpell(HK_E, ally.pos)
			end
		end
		end
	end
end
	
			
function Morgana:Draw()
local textPos = myHero.pos:To2D()	
if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
	Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
end  
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 625, 3, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 1175, 3, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 800, 3, Draw.Color(225, 225, 125, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 900, 3, Draw.Color(225, 225, 125, 10))
	end
	local target = GetTarget(20000)
	if target == nil then return end	
	if target and self.Menu.Drawing.Kill:Value() and not target.dead then
	local hp = target.health	
		if Ready(_Q) and getdmg("Q", target) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))
		end	
		if Ready(_W) and getdmg("W", target) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))		
		end	
	end
end

function Morgana:KillSteal()	
	local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
        
		if self.Menu.ks.UseQ ~= nil and self.Menu.ks.UseQ:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
			local QDmg = getdmg("Q", target, myHero)
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if QDmg >= target.health and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
        end
        if self.Menu.ks.UseW ~= nil and self.Menu.ks.UseW:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
            local WDmg = getdmg("W", target, myHero)
			local pred = GetGamsteronPrediction(target, WData, myHero)
			if WDmg >= target.health and pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then			
				Control.CastSpell(HK_W, pred.CastPosition)
			end	
        end
	end	
end

function Morgana:AutoW()
	local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
		if myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_W).range and IsImmobileTarget(target) and self.Menu.AutoW.UseW:Value() and Ready(_W) then
			Control.CastSpell(HK_W, target.pos)
		
		elseif myHero.pos:DistanceTo(target.pos) > 900 and myHero.pos:DistanceTo(target.pos) < 1175 and IsImmobileTarget(target) and self.Menu.AutoW.UseW:Value() and Ready(_W) then
			local WPos = myHero.pos:Shortened(target.pos - 900)
			Control.SetCursorPos(WPos)
			Control.KeyDown(HK_W)
			Control.KeyUp(HK_W)
		end	
	end
end	


function Morgana:Combo()
	local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
        
		if self.Menu.Combo.UseQ ~= nil and self.Menu.Combo.UseQ:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
        end
        if self.Menu.Combo.UseW ~= nil and self.Menu.Combo.UseW:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_W).range and Ready(_W) and not Ready(_Q) then
            local pred = GetGamsteronPrediction(target, WData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then			
				Control.CastSpell(HK_W, pred.CastPosition)
			end	
        end
        if self.Menu.Combo.UseE ~= nil and self.Menu.Combo.UseE:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
			Control.CastSpell(HK_E, target.pos)
        end
        if self.Menu.Combo.Ult.UseR:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
            local count = GetEnemyCount(625, myHero)
			if count >= self.Menu.Combo.Ult.UseRE:Value() then
				Control.CastSpell(HK_R)
			end	
		end
	end
end

function Morgana:Harass()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
        local mana_ok = (self.Menu.Harass.Mana == nil or (self.Menu.Harass.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100))
        
		if self.Menu.Harass.UseQ ~= nil and self.Menu.Harass.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
        end
        if self.Menu.Harass.UseW ~= nil and self.Menu.Harass.UseW:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_W).range and Ready(_W) and not Ready(_Q) then
            local pred = GetGamsteronPrediction(target, WData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then			
				Control.CastSpell(HK_W, pred.CastPosition)
	
			end
        end
        if self.Menu.Harass.UseE ~= nil and self.Menu.Harass.UseE:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
            Control.CastSpell(HK_E, target.pos)
        end
        if self.Menu.Harass.UseR ~= nil and self.Menu.Harass.UseR:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
            Control.CastSpell(HK_R, target.pos)
        end		
	end
end	

function Morgana:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.UseQL ~= nil and self.Menu.Clear.UseQL:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                local QDmg = getdmg("Q", minion, myHero)
				if QDmg >= minion.health then
					Control.CastSpell(HK_Q, minion.pos)
				end	
            end
            if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                local count = GetMinionCount(275, minion)
				if count >= self.Menu.Clear.UseWM:Value() then
					Control.CastSpell(HK_W, minion.pos)
				end
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                Control.CastSpell(HK_E, minion.pos)
            end
            if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Morgana:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                local count = GetMinionCount(275, minion)
				if count >= self.Menu.JClear.UseWM:Value() then	
					Control.CastSpell(HK_W, minion.pos)
				end	
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                Control.CastSpell(HK_E, minion.pos)
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end






-------------------------------------------------------------------------------------------------------------------------------------------------------------


class "Mordekaiser"



function Mordekaiser:__init()
	
	QData =
	{
	Type = _G.SPELLTYPE_LINE, Delay = 0.5, Radius = 400, Range = 675, Speed = 500, Collision = false
	}
  	
	self:LoadMenu()                                            
 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)	
end



function Mordekaiser:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Mordekaiser", name = "莫德凯撒"})

	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", leftIcon = Icons["AutoE"]})
	self.Menu.AutoE:MenuElement({id = "UseE", name = "把敌人拉到塔下",value = true})

	--AutoW
	self.Menu:MenuElement({type = MENU, id = "AutoW", leftIcon = Icons["AutoW"]})
	self.Menu.AutoW:MenuElement({id = "UseW", name = "自动W", value = true})
	self.Menu.AutoW:MenuElement({id = "UseWE", name = "最低健康", value = 50, min = 0, max = 100, identifier = "%"})	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]", value = true})		
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]", value = true})
	self.Menu.Combo:MenuElement({id = "count", name = "[E]最小目标", value = 2, min = 1, max = 5})	
	
	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]", value = true})

  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E]", value = true})	

	
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]", value = true}) 
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E]", value = true})	
 	
    
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E]", value = true})			
	self.Menu.ks:MenuElement({id = "Targets", name = "相应的设置", type = MENU})	
	self.Menu.ks.Targets:MenuElement({id = "UseR", name = "[R] FullDmg", value = true})
	for i, Hero in pairs(GetEnemyHeroes()) do
		self.Menu.ks.Targets:MenuElement({id = Hero.charName, name = Hero.charName, value = true})		
	end		
	
	
	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})	
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 1, drop = {"Normal", "High", "Immobile"}})	

 
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})


end

function Mordekaiser:Tick()
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
		
		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JClear()			
		elseif Mode == "Flee" then
		
		end	

	self:KillSteal()
	self:AutoE()
	self:AutoW()

	
	end
end 

function Mordekaiser:Draw()
  if myHero.dead then return end
	if(self.Menu.Drawing.DrawR:Value()) and Ready(_R) then
    Draw.Circle(myHero, 650, 1, Draw.Color(255, 225, 255, 10)) 
	end                                                 
	if(self.Menu.Drawing.DrawQ:Value()) and Ready(_Q) then
    Draw.Circle(myHero, 675, 1, Draw.Color(225, 225, 0, 10))
	end
	if(self.Menu.Drawing.DrawE:Value()) and Ready(_E) then
    Draw.Circle(myHero, 900, 1, Draw.Color(225, 225, 125, 10))
	end

	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end				
end	

function Mordekaiser:AutoW()
	if myHero.health/myHero.maxHealth <= self.Menu.AutoW.UseWE:Value()/100 and self.Menu.AutoW.UseW:Value() and Ready(_W) then
		if HasBuff(myHero, "MordekaiserW") then 
			Control.CastSpell(HK_W)
		end
		if not HasBuff(myHero, "MordekaiserW") then 
			Control.CastSpell(HK_W)
		end			
	end
end



function Mordekaiser:AutoE()
	local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
		
        if self.Menu.AutoE.UseE:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_E).range and IsUnderAllyTurret(myHero) and Ready(_E) then
			Control.CastSpell(HK_E, target.pos)
        end		
	end
end

function Mordekaiser:KillSteal()	
	local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
        
		if self.Menu.ks.UseQ ~= nil and self.Menu.ks.UseQ:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= target.health then
				local pred = GetGamsteronPrediction(target, QData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then	
					Control.CastSpell(HK_Q, pred.CastPosition)
				end
			end	
        end
        if self.Menu.ks.UseW ~= nil and self.Menu.ks.UseW:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
            Control.CastSpell(HK_W, target.pos)
        end
        if self.Menu.ks.UseE ~= nil and self.Menu.ks.UseE:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
            local EDmg = getdmg("E", target, myHero)
			if EDmg >= target.health then
				local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 700, 0.5, 500, 180, false)
				if hitRate and hitRate >= 1 then	
					Control.CastSpell(HK_E, aimPosition)	
				end	
			end	
        end
        if self.Menu.ks.Targets.UseR:Value() and self.Menu.ks.Targets[target.charName] and self.Menu.ks.Targets[target.charName]:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
			if (getdmg("Q", target, myHero)+getdmg("E", target, myHero))*2 >= target.health then
				Control.CastSpell(HK_R, target.pos)
			end	
		end
	end	
end	

function Mordekaiser:Combo()
	local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
        
		if self.Menu.Combo.UseQ ~= nil and self.Menu.Combo.UseQ:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then	
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
        end
        if self.Menu.Combo.UseW ~= nil and self.Menu.Combo.UseW:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
            Control.CastSpell(HK_W, target.pos)
        end
        if self.Menu.Combo.UseE ~= nil and self.Menu.Combo.UseE:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
            local count = GetEnemyCount(200, target)
			if count >= self.Menu.Combo.count:Value() then
				local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 700, 0.5, 500, 180, false)
				if hitRate and hitRate >= 1 then	
					Control.CastSpell(HK_E, aimPosition)	
				end	
			end	
        end
        if self.Menu.Combo.UseR ~= nil and self.Menu.Combo.UseR:Value() and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
            Control.CastSpell(HK_R, target.pos)
		end
	end
end


function Mordekaiser:Harass()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
	local target = GetTarget(max_range)
	if target == nil then return end
	if IsValid(target,max_range) then
        local mana_ok = (self.Menu.Harass.Mana == nil or (self.Menu.Harass.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100))
        
		if self.Menu.Harass.UseQ ~= nil and self.Menu.Harass.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then	
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
        end
        if self.Menu.Harass.UseW ~= nil and self.Menu.Harass.UseW:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
            Control.CastSpell(HK_W, target.pos)
        end
        if self.Menu.Harass.UseE ~= nil and self.Menu.Harass.UseE:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
            Control.CastSpell(HK_E, target.pos)
        end
        if self.Menu.Harass.UseR ~= nil and self.Menu.Harass.UseR:Value() and mana_ok and myHero.pos:DistanceTo(target.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
            Control.CastSpell(HK_R, target.pos)
        end		
	end
end	


function Mordekaiser:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.UseQ ~= nil and self.Menu.Clear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
				Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
				local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, minion, 700, 0.5, 500, 180, false)
				if hitRate and hitRate >= 1 then	
					Control.CastSpell(HK_E, aimPosition)	
				end	
            end
            if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Mordekaiser:JClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
				Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
				local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, minion, 700, 0.5, 500, 180, false)
				if hitRate and hitRate >= 1 then	
					Control.CastSpell(HK_E, aimPosition)	
				end	
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end





-------------------------------------------------------------------------------------------------------------------------------------------------------------







class "Neeko"



function Neeko:__init()

	if menu ~= 1 then return end
	menu = 2
	self:LoadSpells()   	
	self:LoadMenu()                                            
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end) 
 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end


function Neeko:LoadSpells()
	
	Q = {range = 800, width = 225, delay = 0.25, speed = 500, collision = false}    
	E = {range = 1000, width = 70, delay = 0.25, speed = 1300, collision = false}   


end

function Neeko:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Neeko", name = "妮蔻"})

	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", leftIcon = Icons["AutoE"]})	
	self.Menu.AutoE:MenuElement({id = "UseE", name = "自动[E]2-5个目标", value = true})	
 
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]盛开花种", value = true})	
	self.Menu.Combo:MenuElement({id = "PredQ", name = "命中几率[Q][1]=低[5]=高", value = 1, min = 1, max = 5})	
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E] 缠结倒刺", value = true})
	self.Menu.Combo:MenuElement({id = "PredE", name = "命中几率[E][1]=低[5]=高", value = 2, min = 1, max = 5})	
	--UltSettings
	self.Menu.Combo:MenuElement({type = MENU, id = "Ult", name = "终极设置"})
	--[W]+[R]
	self.Menu.Combo.Ult:MenuElement({type = MENU, id = "WR", name = "检查妮蔻范围"})	
	self.Menu.Combo.Ult.WR:MenuElement({id = "UseR", name = "[R] + [W]", value = true, tooltip = "If [W] not Ready then only [R]"})
 	self.Menu.Combo.Ult.WR:MenuElement({id = "RHit", name = "最小目标", value = 2, min = 1, max = 5})	
	--Ult Ally Range
	self.Menu.Combo.Ult:MenuElement({type = MENU, id = "Ally", name = "检查盟军范围"})
	self.Menu.Combo.Ult.Ally:MenuElement({id = "UseR2", name = "闪现+[R]+[W]2-5目标", value = true, tooltip = "Check Enemys in Ally Range"})
	--Ult Immobile
	self.Menu.Combo.Ult:MenuElement({type = MENU, id = "Immo", name = "Ult 固定"})	
	self.Menu.Combo.Ult.Immo:MenuElement({id = "UseR3", name = "闪现+[R]+[W]", value = true, tooltip = "Check Immobile Targets"})
 	self.Menu.Combo.Ult.Immo:MenuElement({id = "UseR3M", name = "最小固定目标", value = 2, min = 1, max = 5})
	--Ult 1vs1
	self.Menu.Combo.Ult:MenuElement({type = MENU, id = "One", name = "1vs1"})	
	self.Menu.Combo.Ult.One:MenuElement({id = "UseR1", name = "[R]+[W]如果可以杀死", value = true, tooltip = "If [W] not Ready then only [R]"})	
	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu.Harass:MenuElement({type = MENU, id = "LH", name = "最后一击"})	
	self.Menu.Harass.LH:MenuElement({id = "UseQL", name = "最后一击[Q]小兵", value = true, tooltip = "There is no Enemy nearby"})	
	self.Menu.Harass.LH:MenuElement({id = "UseQLM", name = "最小值", value = 2, min = 1, max = 6})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]盛开花种", value = true})
	self.Menu.Harass:MenuElement({id = "PredQ", name = "命中几率[Q][1]=低[5]=高", value = 1, min = 1, max = 5})	
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E] 缠结倒刺", value = true})
	self.Menu.Harass:MenuElement({id = "PredE", name = "命中几率[E][1]=低[5]=高", value = 2, min = 1, max = 5})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQL", name = "最后一击[Q] 盛开花种", value = true})	
	self.Menu.Clear:MenuElement({id = "UseQLM", name = "最后一击[Q]最低小兵", value = 2, min = 1, max = 6})	
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E] 缠结倒刺", value = true})  
	self.Menu.Clear:MenuElement({id = "UseEM", name = "使用[E]最小值", value = 3, min = 1, max = 6})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]盛开花种", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E] 缠结倒刺", value = true})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]盛开花种", value = true})
	self.Menu.ks:MenuElement({id = "PredQ", name = "命中几率[Q][1]=低[5]=高", value = 1, min = 1, max = 5})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E] 缠结倒刺", value = true})
	self.Menu.ks:MenuElement({id = "PredE", name = "命中几率[E][1]=低[5]=高", value = 2, min = 1, max = 5})	
	self.Menu.ks:MenuElement({id = "UseEQ", name = "[E] + [问]", value = true})

	
	--Activator
	self.Menu:MenuElement({type = MENU, id = "a", leftIcon = Icons["Activator"]})		
	self.Menu.a:MenuElement({id = "ON", name = "原形腰带所有默认设置", value = true, tooltip = "Free Flash"})	


	--EscapeMenu
	self.Menu:MenuElement({type = MENU, id = "evade", leftIcon = Icons["Escape"]})	
	self.Menu.evade:MenuElement({id = "UseW", name = "自动[W]生成克隆", value = true})
	self.Menu.evade:MenuElement({id = "Min", name = "产生克隆的最小生命", value = 30, min = 0, max = 100, identifier = "%"})	
	self.Menu.evade:MenuElement({id = "gank", name = "自动[W]生成克隆 gank", value = true})
	
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "Kill", name = "画出可杀死的目标", value = true})
end

function Neeko:Tick()
	if MyHeroReady() then
	
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
			self:checkUltSpell()
			self:AutoR()
			self:AutoR1()
		elseif Mode == "Harass" then
			self:Harass()
			for i = 1, Game.MinionCount() do
			local minion = Game.Minion(i)
			local target = GetTarget(1000)
				if target == nil then	
					if minion.team == TEAM_ENEMY and IsValid(minion,1000) and myHero.pos:DistanceTo(minion.pos) <= 800 and (myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 ) then	
						local count = GetMinionCount(225, minion)			
						local hp = minion.health
						local level = myHero:GetSpellData(_Q).level
						local QDmg = ({70,115,160,205,250})[level] + 0.5 * myHero.ap
						if self.Menu.Harass.LH.UseQL:Value() and Ready(_Q) and minion.health <= QDmg and count >= self.Menu.Harass.LH.UseQLM:Value() then
							Control.CastSpell(HK_Q, minion)
						end	 
					end
				end
			end
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
		
		end	
		self:EscapeW()
		self:KillSteal()
		self:GankW()
		self:AutoE()
	end
end 


function Neeko:Draw()
local textPos = myHero.pos:To2D()	


if myHero.dead then return end
	if(self.Menu.Drawing.DrawR:Value()) and Ready(_R) then
    Draw.Circle(myHero, 600, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if(self.Menu.Drawing.DrawQ:Value()) and Ready(_Q) then
    Draw.Circle(myHero, 800, 1, Draw.Color(225, 225, 0, 10))
	end
	if(self.Menu.Drawing.DrawE:Value()) and Ready(_E) then
    Draw.Circle(myHero, 1000, 1, Draw.Color(225, 225, 125, 10))
	end
	local target = GetTarget(20000)
	if target == nil then return end	
	if target and self.Menu.Drawing.Kill:Value() and not target.dead then
	local hp = target.health	
		if Ready(_Q) and getdmg("Q", target) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))
		end	
		if Ready(_E) and getdmg("E", target) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))		
		end	
		if Ready(_E) and Ready(_Q) and (getdmg("E", target) + getdmg("Q", target)) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))	
		end
	end
	
end

			
function Neeko:AutoE()
local target = GetTarget(1500)     	
if target == nil then return end
	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) <= 1000 and self.Menu.AutoE.UseE:Value() and Ready(_E) then	
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.width, E.collision)
		local targetCount = HPred:GetLineTargetCount(myHero.pos, aimPosition, E.delay, E.speed, E.width, false)	
		if hitRate and hitRate >= 1 and targetCount >= 2 then
			Control.CastSpell(HK_E, aimPosition)
		end
	end
end


function Neeko:checkUltSpell()
local target = GetTarget(1500)     	
if target == nil then return end

if IsValid(target,1000) then
	local Protobelt = GetItemSlot(myHero, 3152)		
	
	if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" and Ready(SUMMONER_1) then
		if  Ready(_R) and Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt1()
			self:Immo1()
			self:Proto()
		end
	elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" and Ready(SUMMONER_2) then
		if Ready(_R) and Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt1()
			self:Immo1()
			self:Proto()	
		end	
	end

	if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" and Ready(SUMMONER_1) then
		if Ready(_R) and not Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt2()
			self:Immo2()
			self:Proto()	
		end
	elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" and Ready(SUMMONER_2) then
		if  Ready(_R) and not Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt2()
			self:Immo2()
			self:Proto()	
		end	
	end
	
	if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" and Ready(SUMMONER_1) then
		if  Ready(_R) and Ready(_W) and (Protobelt > 0 and not Ready(Protobelt) or Protobelt == 0) then
			self:AutoUlt3()
			self:Immo3()
		end
	elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" and Ready(SUMMONER_2) then
		if  Ready(_R) and Ready(_W) and (Protobelt > 0 and not Ready(Protobelt) or Protobelt == 0) then
			self:AutoUlt3()
			self:Immo3()
		end	
	end
	
	if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" and not Ready(SUMMONER_1) then
		if  Ready(_R) and Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt4()
			self:Immo4()
			self:Proto()	
		end
	elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" and not Ready(SUMMONER_2) then
		if Ready(_R) and Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt4()
			self:Immo4()
			self:Proto()	
		end	
	end	
	
	if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" and not Ready(SUMMONER_1) then
		if Ready(_R) and not Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt5()
			self:Immo5()
			self:Proto()	
		end
	elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" and not Ready(SUMMONER_2) then
		if Ready(_R) and not Ready(_W) and Protobelt > 0 and Ready(Protobelt) then
			self:AutoUlt5()
			self:Immo5()
			self:Proto()	
		end	
	end	
	
	if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" and Ready(SUMMONER_1) then
		if Ready(_R) and not Ready(_W) and (Protobelt > 0 and not Ready(Protobelt)) or Protobelt == 0 then
			self:AutoUlt6()
			self:Immo6()
		end
	elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" and Ready(SUMMONER_2) then
		if Ready(_R) and not Ready(_W) and (Protobelt > 0 and not Ready(Protobelt)) or Protobelt == 0 then
			self:AutoUlt6()
			self:Immo6()
		end	
	end	
end	
end


function Neeko:KillSteal()
if myHero.dead then return end	
	local target = GetTarget(1100)     	
	if target == nil then return end
		
	if IsValid(target,1100) and myHero.pos:DistanceTo(target.pos) <= 800 then
		local QDmg = getdmg("Q", target, myHero)
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.width, Q.collision)
		if self.Menu.ks.UseQ:Value() and Ready(_Q) and QDmg >= target.health and hitRate and hitRate >= self.Menu.ks.PredQ:Value() then
			Control.CastSpell(HK_Q, aimPosition)
		end
	end	
	if IsValid(target,1100) and myHero.pos:DistanceTo(target.pos) <= 1000 then
		local EDmg = getdmg("E", target, myHero)
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.width, E.collision)
		if self.Menu.ks.UseE:Value() and Ready(_E) and EDmg >= target.health and hitRate and hitRate >= self.Menu.ks.PredE:Value() then
				Control.CastSpell(HK_E, aimPosition)
		end
	end	
	if IsValid(target,1100) and myHero.pos:DistanceTo(target.pos) <= 800 then	
		local EDmg = getdmg("E", target, myHero)
		local hitRateE, aimPositionE = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.width, E.collision)
		local hitRateQ, aimPositionQ = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.width, Q.collision)
		if self.Menu.ks.UseEQ:Value() and Ready(_E) and Ready(_Q) and (EDmg + QDmg) >= target.health and hitRateE and hitRateQ and hitRateE >= self.Menu.ks.PredE:Value() and hitRateQ >= self.Menu.ks.PredQ:Value() then
			Control.CastSpell(HK_E, aimPositionE)
			Control.CastSpell(HK_Q, aimPositionQ)
		
		end
	end
end	


function Neeko:EscapeW()  
	local target = GetTarget(1500)
	if target == nil then return end
	if IsValid(target,1500) and myHero.pos:DistanceTo(target.pos) <= 1000 then
	local hp = myHero.health
		if hp <= self.Menu.evade.Min:Value() and self.Menu.evade.UseW:Value() and Ready(_W) then
			local attackFalse = _G.SDK.Orbwalker:SetAttack(false)
			local attackTrue = _G.SDK.Orbwalker:SetAttack(true)
			local MPos = myHero.pos:Shortened(target.pos, 1000)
			DelayAction(attackFalse,0)
			Control.SetCursorPos(MPos)
			Control.KeyDown(HK_W)
			Control.KeyUp(HK_W)
			DelayAction(attackTrue, 0.2)
		end
	end
end	

function Neeko:GankW()  
	local target = GetTarget(1500)
	if target == nil then return end
	if IsValid(target,1500) and myHero.pos:DistanceTo(target.pos) <= 1500 then
		if self.Menu.evade.gank:Value() and Ready(_W) then
			local targetCount = CountEnemiesNear(myHero, 1000)
			local allyCount = GetAllyCount(1500, myHero)
			if targetCount > 1 and allyCount == 0 then
				local attackFalse = _G.SDK.Orbwalker:SetAttack(false)
				local attackTrue = _G.SDK.Orbwalker:SetAttack(true)
				local MPos = myHero.pos:Shortened(target.pos, 1000)
				DelayAction(attackFalse,0)
				Control.SetCursorPos(MPos)
				Control.KeyDown(HK_W)
				Control.KeyUp(HK_W)
				DelayAction(attackTrue, 0.2)				
			end
		end
	end
end	


function Neeko:AutoR()
local target = GetTarget(1000)
if target == nil then return end

local Protobelt = GetItemSlot(myHero, 3152)	
	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) < 400 and self.Menu.Combo.Ult.WR.UseR:Value() and self.Menu.a.ON:Value() then
		if Ready(_R) and Ready(_W) and ((Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then
			local targetCount = CountEnemiesNear(myHero, 600)
			if targetCount >= self.Menu.Combo.Ult.WR.RHit:Value() then
				SetAttack(false)
				Control.CastSpell(HK_W)
				self:Proto()
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)				
			end
			
		elseif Ready(_R) and not Ready(_W) and ((Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then	
			local targetCount = CountEnemiesNear(myHero, 600)
			if targetCount >= self.Menu.Combo.Ult.WR.RHit:Value() then
				SetAttack(false)
				self:Proto()
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)
			end
		
		elseif Ready(_R) and Ready(_W) and ((not Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then
			local targetCount = CountEnemiesNear(myHero, 600)
			if targetCount >= self.Menu.Combo.Ult.WR.RHit:Value() then
				SetAttack(false)
				Control.CastSpell(HK_W)
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)				
			end
			
		elseif Ready(_R) and not Ready(_W) and ((not Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then	
			local targetCount = CountEnemiesNear(myHero, 600)
			if targetCount >= self.Menu.Combo.Ult.WR.RHit:Value() then
				SetAttack(false)
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)
			end			
		end
	end
end

			
	

function Neeko:AutoR1()
local target = GetTarget(2000)
if target == nil then return end
local hp = target.health
local RDmg = getdmg("R", target, myHero)
local QDmg = getdmg("Q", target, myHero)
local EDmg = getdmg("E", target, myHero)
local Protobelt = GetItemSlot(myHero, 3152)	
	if IsValid(target,500) then
		
		if self.Menu.Combo.Ult.One.UseR1:Value() and self.Menu.a.ON:Value() and Ready(_R) and Ready(_W) and ((Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then
			local targetCount = CountEnemiesNear(myHero, 2000)
			local allyCount = GetAllyCount(1500, myHero)
			if targetCount <= 1 and allyCount == 0 and myHero.pos:DistanceTo(target.pos) <= 400 and hp < (RDmg+QDmg+EDmg) then
				SetAttack(false)
				Control.CastSpell(HK_W)
				self:Proto()
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)
			end
		elseif self.Menu.Combo.Ult.One.UseR1:Value() and self.Menu.a.ON:Value() and Ready(_R) and not Ready(_W) and ((Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then
			local targetCount = CountEnemiesNear(myHero, 2000)
			local allyCount = GetAllyCount(1500, myHero)
			if targetCount <= 1 and allyCount == 0 and myHero.pos:DistanceTo(target.pos) <= 400 and hp < (RDmg+QDmg+EDmg) then
				SetAttack(false)
				self:Proto()
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)
			end	
		elseif self.Menu.Combo.Ult.One.UseR1:Value() and self.Menu.a.ON:Value() and Ready(_R) and Ready(_W) and ((not Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then
			local targetCount = CountEnemiesNear(myHero, 2000)
			local allyCount = GetAllyCount(1500, myHero)
			if targetCount <= 1 and allyCount == 0 and myHero.pos:DistanceTo(target.pos) <= 300 and hp < (RDmg+QDmg+EDmg) then
				SetAttack(false)
				Control.CastSpell(HK_W)
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)
			end
		elseif self.Menu.Combo.Ult.One.UseR1:Value() and self.Menu.a.ON:Value() and Ready(_R) and not Ready(_W) and (( not Ready(Protobelt) and Protobelt > 0) or (Protobelt == 0)) then
			local targetCount = CountEnemiesNear(myHero, 2000)
			local allyCount = GetAllyCount(1500, myHero)
			if targetCount <= 1 and allyCount == 0 and myHero.pos:DistanceTo(target.pos) <= 300 and hp < (RDmg+QDmg+EDmg) then
				SetAttack(false)
				Control.CastSpell(HK_R)	
				DelayAction(function()SetAttack(true) end, 0.3)
			end			
		end
	end
end

			--Hextech Protobelt
function Neeko:Proto()	
if myHero.dead then return end	
	local target = GetTarget(1000)
	if target == nil then return end
	local Protobelt = GetItemSlot(myHero, 3152)
	if IsValid(target,600) and self.Menu.a.ON:Value() then
		if myHero.pos:DistanceTo(target.pos) < 500 and Protobelt > 0 and Ready(Protobelt)  then	
			Control.CastSpell(ItemHotKey[Protobelt], target)
			CastSpell(ItemHotKey[Protobelt], target, 2.0)
		end
	end
end	


function Neeko:AutoUlt1() --full
	local target = GetTarget(1400)
	if target == nil then return end

	for i,ally in pairs(GetAllyHeroes()) do	
		if IsValid(ally,900) then
		local targetCount = CountEnemiesNear(ally, 600)	
			if targetCount >= 2 and myHero.pos:DistanceTo(ally.pos) <= 800 and myHero.pos:DistanceTo(ally.pos) >= 300 then	
				if self.Menu.Combo.Ult.Ally.UseR2:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
					if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, ally.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
					elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, ally.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
					end	
				end
			end
		end
	end
end

function Neeko:AutoUlt2()   --no[W]
	local target = GetTarget(1400)
	if target == nil then return end

	for i,ally in pairs(GetAllyHeroes()) do	
		if IsValid(ally,900) then
		local targetCount = CountEnemiesNear(ally, 600)		
			if self.Menu.Combo.Ult.Ally.UseR2:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
				if targetCount >= 2 and myHero.pos:DistanceTo(ally.pos) <= 800 and myHero.pos:DistanceTo(ally.pos) >= 300 then
					if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, ally.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
					elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, ally.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
					end	
				end
			end
		end
	end
end

function Neeko:AutoUlt3() --noProtobelt
	local target = GetTarget(1200)
	if target == nil then return end

	for i,ally in pairs(GetAllyHeroes()) do	
		if IsValid(ally,500) then
		local targetCount = CountEnemiesNear(ally, 600)		
			if self.Menu.Combo.Ult.Ally.UseR2:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
				if targetCount >= 2 and myHero.pos:DistanceTo(ally.pos) <= 500 and myHero.pos:DistanceTo(ally.pos) >= 200 then
					if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, ally.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
					elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, ally.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
					end	
				end
			end
		end
	end
end

function Neeko:AutoUlt4()  --noFlash
	local target = GetTarget(1200)
	if target == nil then return end

	for i,ally in pairs(GetAllyHeroes()) do	
		if IsValid(ally,500) then
		local targetCount = CountEnemiesNear(ally, 600)		
			if self.Menu.Combo.Ult.Ally.UseR2:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
				if targetCount >= 2 and myHero.pos:DistanceTo(ally.pos) <= 400 and myHero.pos:DistanceTo(ally.pos) >= 100 then
					SetAttack(false)
					Control.CastSpell(HK_W)
					Control.CastSpell(HK_R)
					DelayAction(function()SetAttack(true) end, 0.3)
				end
			end
		end
	end
end



function Neeko:AutoUlt5()  --noFlash, no[W]
	local target = GetTarget(1200)
	if target == nil then return end

	for i,ally in pairs(GetAllyHeroes()) do	
		if IsValid(ally,500) then
		local targetCount = CountEnemiesNear(ally, 600)	
			if self.Menu.Combo.Ult.Ally.UseR2:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
				if targetCount >= 2 and myHero.pos:DistanceTo(ally.pos) <= 400 and myHero.pos:DistanceTo(ally.pos) >= 100 then
					SetAttack(false)
					Control.CastSpell(HK_R)
					DelayAction(function()SetAttack(true) end, 0.3)
				end
			end
		end
	end
end

function Neeko:AutoUlt6() --noProtobelt, no[W]
	local target = GetTarget(1200)
	if target == nil then return end

	for i,ally in pairs(GetAllyHeroes()) do
		if IsValid(ally,500) then
		local targetCount = CountEnemiesNear(ally, 600)		
			if self.Menu.Combo.Ult.Ally.UseR2:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
				if targetCount >= 2 and myHero.pos:DistanceTo(ally.pos) <= 400 and myHero.pos:DistanceTo(ally.pos) >= 200 then
					if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, ally.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
					elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, ally.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
					end	
				end
			end
		end    
	end
end

	
function Neeko:Immo1() --full
	local target = GetTarget(1400)
	if target == nil then return end
	local targetCount = GetImmobileCount(600, target.pos)
	if IsValid(target,900) and targetCount >= self.Menu.Combo.Ult.Immo.UseR3M:Value() then			
		if self.Menu.Combo.Ult.Immo.UseR3:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
			if myHero.pos:DistanceTo(target.pos) <= 800 and myHero.pos:DistanceTo(target.pos) >= 300 then
				if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, target.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
				elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, target.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				end
			end
		end
	end
end

function Neeko:Immo2() --no[W]
	local target = GetTarget(1400)
	if target == nil then return end
	local targetCount = GetImmobileCount(600, target.pos)
	if IsValid(target,900) and targetCount >= self.Menu.Combo.Ult.Immo.UseR3M:Value() then		
		if self.Menu.Combo.Ult.Immo.UseR3:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
			if myHero.pos:DistanceTo(target.pos) <= 800 and myHero.pos:DistanceTo(target.pos) >= 300 then
				if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, target.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
				elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, target.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				end
			end
		end
	end
end

function Neeko:Immo3() --noProtobelt
	local target = GetTarget(1200)
	if target == nil then return end
	local targetCount = GetImmobileCount(600, target.pos)
	if IsValid(target,500) and targetCount >= self.Menu.Combo.Ult.Immo.UseR3M:Value() then			
		if self.Menu.Combo.Ult.Immo.UseR3:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
			if myHero.pos:DistanceTo(target.pos) <= 500 and myHero.pos:DistanceTo(target.pos) >= 200 then
				if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, target.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
				elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, target.pos)
						Control.CastSpell(HK_W)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				end
			end
		end
	end
end

function Neeko:Immo4() --noFlash
	local target = GetTarget(1100)
	if target == nil then return end
	local targetCount = GetImmobileCount(600, target.pos)
	if IsValid(target,500) and targetCount >= self.Menu.Combo.Ult.Immo.UseR3M:Value() then			
		if self.Menu.Combo.Ult.Immo.UseR3:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
			if myHero.pos:DistanceTo(target.pos) <= 400 and myHero.pos:DistanceTo(target.pos) >= 100 then
				SetAttack(false)
				Control.CastSpell(HK_W)
				Control.CastSpell(HK_R)
				DelayAction(function()SetAttack(true) end, 0.3)
			end
		end
	end
end

function Neeko:Immo5() --noFlash, no[W]
	local target = GetTarget(1100)
	if target == nil then return end
	local targetCount = GetImmobileCount(600, target.pos)
	if IsValid(target,500) and targetCount >= self.Menu.Combo.Ult.Immo.UseR3M:Value() then		
		if self.Menu.Combo.Ult.Immo.UseR3:Value()  --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
			if myHero.pos:DistanceTo(target.pos) <= 400 and myHero.pos:DistanceTo(target.pos) >= 100 then
				SetAttack(false)
				Control.CastSpell(HK_R)
				DelayAction(function()SetAttack(true) end, 0.3)
			end
		end
	end
end

function Neeko:Immo6() --noProtobelt, no[W]
	local target = GetTarget(1200)
	if target == nil then return end
	local targetCount = GetImmobileCount(600, target.pos)
	if IsValid(target,500) and targetCount >= self.Menu.Combo.Ult.Immo.UseR3M:Value() then			
		if self.Menu.Combo.Ult.Immo.UseR3:Value() --[[and GetAllyCount(1500, myHero) >= CountEnemiesNear(myHero.pos, 2000)]] then
			if myHero.pos:DistanceTo(target.pos) <= 500 and myHero.pos:DistanceTo(target.pos) >= 200 then
				if myHero:GetSpellData(SUMMONER_1).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_1, target.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				
				elseif myHero:GetSpellData(SUMMONER_2).name == "SummonerFlash" then
						SetAttack(false)
						Control.CastSpell(HK_SUMMONER_2, target.pos)
						Control.CastSpell(HK_R)
						DelayAction(function()SetAttack(true) end, 0.3)
				end
			end
		end
	end
end
	
	
	
function Neeko:Combo()
	local target = GetTarget(1100)
	if target == nil then return end
	if IsValid(target,1000) then
		local hitRateE, aimPositionE = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.width, E.collision)
		if self.Menu.Combo.UseE:Value() and Ready(_E) and hitRateE and hitRateE >= self.Menu.Combo.PredE:Value() and myHero.pos:DistanceTo(target.pos) <= 1000 then			
			Control.CastSpell(HK_E, aimPositionE)
		
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.width, Q.collision)
		if self.Menu.Combo.UseQ:Value() and Ready(_Q) and myHero.pos:DistanceTo(target.pos) <= 800 and hitRate and hitRate >= self.Menu.Combo.PredQ:Value() then 
			Control.CastSpell(HK_Q, aimPosition)
		end
		end
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.width, Q.collision)
		if self.Menu.Combo.UseQ:Value() and Ready(_Q) and not Ready(_E) and myHero.pos:DistanceTo(target.pos) <= 800 and hitRate and hitRate >= self.Menu.Combo.PredQ:Value() and not IsImmobileTarget(target) then
			Control.CastSpell(HK_Q, aimPosition)
		end	
	end
end

	
		

function Neeko:Harass()	
	local target = GetTarget(800)
	if target == nil then return end	
	if IsValid(target,900)  and (myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 ) then
		local hitRateE, aimPositionE = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.width, E.collision)
		if Ready(_E) and Ready(_Q) and hitRateE and hitRateE >= self.Menu.Harass.PredE:Value() and myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.Harass.UseE:Value() then
			Control.CastSpell(HK_E, aimPositionE)
			
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.width, Q.collision)
		if self.Menu.Harass.UseQ:Value() and Ready(_Q) and hitRate and hitRate >= self.Menu.Harass.PredQ:Value() then	
			Control.CastSpell(HK_Q, aimPosition)
		end
		end
		
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.width, Q.collision)
		if self.Menu.Harass.UseQ:Value() and Ready(_Q) and not Ready(_E) and myHero.pos:DistanceTo(target.pos) <= 800 and hitRate and hitRate >= self.Menu.Harass.PredQ:Value() then
			Control.CastSpell(HK_Q, aimPosition)
		end
	end
end

function Neeko:Clear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_ENEMY and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.Clear.Mana == nil or (self.Menu.Clear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100))
            if self.Menu.Clear.UseQL:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                local count = GetMinionCount(225, minion)
				local level = myHero:GetSpellData(_Q).level
				local QDmg = ({70,115,160,205,250})[level] + 0.5 * myHero.ap
				if count >= self.Menu.Clear.UseQLM:Value() and minion.health <= QDmg then	
					Control.CastSpell(HK_Q, minion.pos)
				end	
            end
            if self.Menu.Clear.UseW ~= nil and self.Menu.Clear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.Clear.UseE ~= nil and self.Menu.Clear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                local count = GetMinionCount(1000, myHero)
				if count >= self.Menu.Clear.UseEM:Value() then	
					Control.CastSpell(HK_E, minion.pos)
				end	
            end
            if self.Menu.Clear.UseR ~= nil and self.Menu.Clear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end

function Neeko:JungleClear()
    local max_range = math.max(myHero.range + myHero.boundingRadius, myHero:GetSpellData(_Q).range, myHero:GetSpellData(_W).range, myHero:GetSpellData(_E).range, myHero:GetSpellData(_R).range)
    if max_range > 1500 then
        max_range = 1500
    end
    for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
        if minion.team == TEAM_JUNGLE and IsValid(minion,max_range) then
            local mana_ok = (self.Menu.JClear.Mana == nil or (self.Menu.JClear.Mana ~= nil and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100))
            if self.Menu.JClear.UseQ ~= nil and self.Menu.JClear.UseQ:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_Q).range and Ready(_Q) then
                Control.CastSpell(HK_Q, minion.pos)
            end
            if self.Menu.JClear.UseW ~= nil and self.Menu.JClear.UseW:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_W).range and Ready(_W) then
                Control.CastSpell(HK_W, minion.pos)
            end
            if self.Menu.JClear.UseE ~= nil and self.Menu.JClear.UseE:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_E).range and Ready(_E) then
                Control.CastSpell(HK_E, minion.pos)
            end
            if self.Menu.JClear.UseR ~= nil and self.Menu.JClear.UseR:Value() and mana_ok and myHero.pos:DistanceTo(minion.pos) <= myHero:GetSpellData(_R).range and Ready(_R) then
                Control.CastSpell(HK_R, minion.pos)
            end
        end
    end
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------


class "Nidalee"
--require('GamsteronPrediction')




function Nidalee:__init()
	
	if menu ~= 1 then return end
	menu = 2
	
	self:LoadSpells()
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4
	end

end

function Nidalee:LoadSpells()
	Q = {Range = 1500, width = 40, Delay = 0.25, Radius = 40, Speed = 1300, Collision = true, aoe = false, type = "linear"}
	W = {Range = 900, width = 50, Delay = 1.0, Radius = 100, Speed = 1000, Collision = false, aoe = true}
	E = {Range = 600, Delay = 0.25}
    QC = {Range = 200, Delay = 0.25}
	WC = {Range = 700, Delay = 0.25}
	EC = {Range = 300, Delay = 0.25}

end

local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 40, Range = 1500, Speed = 1300, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION,_G.COLLISION_YASUOWALL}
}

local W1Data =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 1.0, Radius = 100, Range = 900, Speed = 1000, Collision = false
}

local W2Data =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 75, Range = 375, Speed = 1000, Collision = false
}


function Nidalee:LoadMenu()
	self.Menu = MenuElement({type = MENU, id = "Nidalee", name = "奈德丽"})
	
	--Combo
	self.Menu:MenuElement({type = MENU, id = "ComboMode", leftIcon = Icons["Combo"]})
	self.Menu.ComboMode:MenuElement({id = "UseQ", name = "Q：标枪投掷", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseW", name = "W：丛林伏击", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseE", name = "E：野性奔腾", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseQQ", name = "Q: 推倒", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseWW", name = "W：猛扑", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseEE", name = "E：挥击", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseR", name = "R：美洲狮", value = true})
	self.Menu.ComboMode:MenuElement({id = "DrawDamage", name = "画出低HP", value = true})
		
	--Harass
	self.Menu:MenuElement({type = MENU, id = "HarassMode", leftIcon = Icons["Harass"]})
	self.Menu.HarassMode:MenuElement({id = "UseQ", name = "Q：标枪投掷", value = true})

	--Lane/JungleClear
	self.Menu:MenuElement({type = MENU, id = "ClearMode", leftIcon = Icons["Clear"]})
	self.Menu.ClearMode:MenuElement({id = "UseQ", name = "Q：标枪投掷", value = true})
	self.Menu.ClearMode:MenuElement({id = "UseW", name = "W：丛林伏击", value = true})
	self.Menu.ClearMode:MenuElement({id = "UseE", name = "E：野性奔腾", value = true})
	self.Menu.ClearMode:MenuElement({id = "UseQQ", name = "Q: 推倒", value = true})
	self.Menu.ClearMode:MenuElement({id = "UseWW", name = "W：猛扑", value = true})
    self.Menu.ClearMode:MenuElement({id = "UseEE", name = "E：挥击", value = true})
	self.Menu.ClearMode:MenuElement({id = "UseR", name = "R：美洲狮", value = true})
	
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "KS", leftIcon = Icons["ks"]})
	self.Menu.KS:MenuElement({id = "UseQ", name = "Q：标枪投掷", value = true})

	--Flee
	self.Menu:MenuElement({type = MENU, id = "Fl", leftIcon = Icons["Flee"]})
	self.Menu.Fl:MenuElement({id = "UseW", name = "W：猛扑", value = true, key = string.byte("A")})	
	
	self.Menu:MenuElement({type = MENU, id = "DrawQ", leftIcon = Icons["Drawings"]})
	self.Menu.DrawQ:MenuElement({id = "Q", name = "画Q", value = true})

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "命中率[Q 人类]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredW1", name = "命中率[W 人类]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredW2", name = "命中率[W 美洲狮]", value = 2, drop = {"Normal", "High", "Immobile"}})
end

function Nidalee:Tick()
if MyHeroReady() then
	self:KillSteal()
	local Mode = GetMode()
	if Mode == "Combo" then
		self:Combo()
	elseif Mode == "Harass" then
		self:Harass()
	elseif Mode == "Clear" then
		self:Jungle()
	elseif Mode == "Flee" then
		self:Flee()
	end	
end
end

function Nidalee:Qdmg(target)
    local qLvl = myHero:GetSpellData(_Q).level
	local result = 55 + 15 * qLvl + myHero.ap * 0.4
    
    local dist = target.distance
    if dist > 525 then
        if dist > 1300 then
            result = result + 2 * result
        else
            local num = (dist - 525) * 0.25 / 96.875
            result = result + num * result
        end
    end
    
    return CalcMagicalDamage(target, result)
end

function Nidalee:Wdmg(target)
	local level = myHero:GetSpellData(_R).level
	local base = ({60, 110, 160, 210})[level] + 0.3 * myHero.ap
	return CalcMagicalDamage(target, base)
end

function Nidalee:Edmg(target)
	local level = myHero:GetSpellData(_R).level
	local base = ({70, 130, 190, 250})[level] + 0.45 * myHero.ap
	return CalcMagicalDamage(target, base)
end

function Nidalee:Draw()
    if Ready(_Q) and self.Menu.DrawQ.Q:Value() then Draw.Circle(myHero.pos, 1500, 1,  Draw.Color(255, 000, 222, 255)) end
	if self.Menu.ComboMode.DrawDamage:Value() then
		for i, target in pairs(GetEnemyHeroes()) do
			local barPos = target.hpBar
			if not target.dead and target.pos2D.onScreen and barPos.onScreen and target.visible then
				local QDamage = (Ready(_Q) and self:Qdmg(target) or 0)
				local WDamage = (Ready(_W) and self:Wdmg(target) or 0)
				local EDamage = (Ready(_E) and self:Edmg(target) or 0)
				local damage = QDamage + WDamage + EDamage
				if damage > target.health then
					Draw.Text("killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
					
				else
					local percentHealthAfterDamage = math.max(0, target.health - damage) / target.maxHealth
					local xPosEnd = barPos.x + barXOffset + barWidth * target.health/target.maxHealth
					local xPosStart = barPos.x + barXOffset + percentHealthAfterDamage * 100
					Draw.Line(xPosStart, barPos.y + barYOffset, xPosEnd, barPos.y + barYOffset, 10, Draw.Color(0xFF00FF00))
				end
			end
		end	
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
end

function ForceCat()
    local RRTarget = GetTarget(1000)
	local count = 0
	for i = 0, Game.HeroCount() do
		local hero = Game.Hero(i)
		if myHero.pos:DistanceTo(RRTarget.pos) < 700 then
			if hero == nil then return end
			local t = {}
 			for i = 0, hero.buffCount do
    			local buff = hero:GetBuff(i)
    			if buff.count > 0 then
    				table.insert(t, buff)
    			end
  			end
  			if t ~= nil then
  				for i, buff in pairs(t) do
					if buff.name == "NidaleePassiveHunting" and buff.expireTime >= 2 then
						count = count +1
							return true
					end
				end
			end
		end
	end
	return false
end

function Nidalee:Flee()
    if self.Menu.Fl.UseW:Value() then 
		if myHero:GetSpellData(_W).name == "Pounce" and Ready(_W) then
			Control.CastSpell(HK_W, mousePos)
		
		elseif myHero:GetSpellData(_W).name == "Bushwhack" and Ready(_R) then
			Control.CastSpell(HK_R)
		end
	end
end	

function Nidalee:Combo()
local target = GetTarget(1600)
if target == nil then return end
if IsValid(target, 1600) then	
	if Ready(_Q) and myHero.pos:DistanceTo(target.pos) <= 1500 then 
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if self.Menu.ComboMode.UseQ:Value() then
            if myHero:GetSpellData(_Q).name == "JavelinToss" and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				CastSpell(HK_Q, pred.CastPosition)
            end
		end
	end
	
    if Ready(_R) and myHero.pos:DistanceTo(target.pos) < 800 then
        if self.Menu.ComboMode.UseR:Value() and myHero:GetSpellData(_Q).name == "JavelinToss" then
            if ForceCat() then
			    Control.CastSpell(HK_R)
            end
        end
    end

	if Ready(_W) and myHero.pos:DistanceTo(target.pos) < 800 then 
		local pred = GetGamsteronPrediction(target, W1Data, myHero)
		if self.Menu.ComboMode.UseW:Value() and myHero:GetSpellData(_W).name == "Bushwhack" then
			if pred.Hitchance >= self.Menu.Pred.PredW1:Value() then
				CastSpell(HK_W, pred.CastPosition)
			end
		end
	end

    if Ready(_E) then 
		if self.Menu.ComboMode.UseE:Value() and myHero.health/myHero.maxHealth < .70 and myHero:GetSpellData(_E).name == "PrimalSurge" then
			Control.CastSpell(HK_E, myHero)
		end
	end

    if myHero.pos:DistanceTo(target.pos) < 700 and Ready(_W) then 
		local pred = GetGamsteronPrediction(target, W2Data, myHero)
		if self.Menu.ComboMode.UseWW:Value() and myHero:GetSpellData(_W).name == "Pounce" then
			if pred.Hitchance >= self.Menu.Pred.PredW2:Value() then
				CastSpell(HK_W, pred.CastPosition)
			end
		end
	end

    if Ready(_Q) and myHero.pos:DistanceTo(target.pos) < 275 then 
		if self.Menu.ComboMode.UseQQ:Value() then
            if myHero:GetSpellData(_Q).name == "Takedown" then
				Control.CastSpell(HK_Q)
                Control.Attack(target)
            end
		end
	end

    if myHero.pos:DistanceTo(target.pos) < 350 then 
		if self.Menu.ComboMode.UseEE:Value() and myHero:GetSpellData(_E).name == "Swipe" then
			if Ready(_E) then
				Control.CastSpell(HK_E, target)
			end
		end
	end

    if Ready(_R) and myHero.pos:DistanceTo(target.pos) < 140 then 
        if self.Menu.ComboMode.UseR:Value() and myHero:GetSpellData(_E).name == "Swipe" then
            if not Ready(_Q) and not Ready(_E) and not Ready(_W) then
				if Game.Timer() - LastR > 8 then
			    	Control.CastSpell(HK_R)
				end
            end
        end
    end

    if Ready(_R) then 
        if self.Menu.ComboMode.UseR:Value() and myHero:GetSpellData(_E).name == "Swipe" then
            if myHero.health/myHero.maxHealth < .50 and myHero.pos:DistanceTo(target.pos) > 700 then
			    Control.CastSpell(HK_R)
            end
        end
    end
end
end

function Nidalee:Harass()
local target = GetTarget(1600)
if target == nil then return end
if IsValid(target, 1600) then   
	if Ready(_Q) and myHero.pos:DistanceTo(target.pos) < 1500 then 
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if self.Menu.HarassMode.UseQ:Value() then
            if myHero:GetSpellData(_Q).name == "JavelinToss" and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				CastSpell(HK_Q, pred.CastPosition)
			elseif myHero:GetSpellData(_Q).name == "Takedown" and Ready(_R) then
				Control.CastSpell(HK_R)	
            end
		end
	end
end
end

LastR = Game.Timer()
function Nidalee:Jungle()
for i = 1, Game.MinionCount() do
local minion = Game.Minion(i)
    if minion.team == TEAM_JUNGLE or minion.team == TEAM_ENEMY and IsValid(minion,1600) then
		if Ready(_Q) and myHero.pos:DistanceTo(minion.pos) < 1500 then 
			if self.Menu.ClearMode.UseQ:Value() then
            	if myHero:GetSpellData(_Q).name == "JavelinToss" then
					local newpos = myHero.pos:Extended(minion.pos,math.random(100,300))
					Control.CastSpell(HK_Q, newpos)
            	end
			end
		end
		if myHero.pos:DistanceTo(minion.pos) < 800 then 
			if self.Menu.ClearMode.UseW:Value() and myHero:GetSpellData(_W).name == "Bushwhack" then
				if Ready(_W) then
					Control.CastSpell(HK_W, minion)
				end
			end
		end
		if myHero.pos:DistanceTo(minion.pos) < 800 and Ready(_R) then
        	if self.Menu.ClearMode.UseR:Value() and myHero:GetSpellData(_Q).name == "JavelinToss" then
            	if not Ready(_Q) and not Ready(_W) then
					if Game.Timer() - LastR > 4 then
						Control.CastSpell(HK_R)
					end
            	end
        	end
    	end
		if Ready(_E) then 
			if self.Menu.ClearMode.UseE:Value() and myHero.health/myHero.maxHealth < .70 and myHero:GetSpellData(_E).name == "PrimalSurge" then
				Control.CastSpell(HK_E, myHero)
			end
		end

    	if myHero.pos:DistanceTo(minion.pos) < 700 then
			if self.Menu.ClearMode.UseWW:Value() and myHero:GetSpellData(_W).name == "Pounce" then
				if Ready(_W) then
					Control.CastSpell(HK_W, minion)
				end
			end
		end

    	if Ready(_Q) and myHero.pos:DistanceTo(minion.pos) < 275 then 
			if self.Menu.ClearMode.UseQQ:Value() then
            	if myHero:GetSpellData(_Q).name == "Takedown" then
					Control.CastSpell(HK_Q)
                	Control.Attack(minion)
            	end
			end
		end

    	if myHero.pos:DistanceTo(minion.pos) < 350 then 
			if self.Menu.ClearMode.UseEE:Value() and myHero:GetSpellData(_E).name == "Swipe" then
				if Ready(_E) then
					Control.CastSpell(HK_E, minion)
				end
			end
		end

    	if Ready(_R) then 
        	if self.Menu.ClearMode.UseR:Value() and myHero:GetSpellData(_E).name == "Swipe" then
            	if not Ready(_Q) and not Ready(_E) and not Ready(_W) then
					if Game.Timer() - LastR > 8 then
			    		Control.CastSpell(HK_R)
					end
            	end
        	end
    	end

    	if Ready(_R) and myHero.pos:DistanceTo(minion.pos) > 700 then 
        	if self.Menu.ClearMode.UseR:Value() and myHero:GetSpellData(_E).name == "Swipe" then
            	if myHero.health/myHero.maxHealth < .30 then
			    	Control.CastSpell(HK_R)
            	end
        	end
    	end

	end
end
end

function Nidalee:KillSteal()
local target = GetTarget(1600)
if target == nil then return end
	if IsValid(target,1600) and myHero.pos:DistanceTo(target.pos) <= 1500 then 
		
		if self.Menu.KS.UseQ:Value() and Ready(_Q) and self:Qdmg(target) >= target.health then
            local pred = GetGamsteronPrediction(target, QData, myHero)
			if myHero:GetSpellData(_Q).name == "JavelinToss" and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				CastSpell(HK_Q, pred.CastPosition)
            elseif myHero:GetSpellData(_Q).name == "Takedown" and Ready(_R) then
				Control.CastSpell(HK_R)
			end
		end
	end	
end



-----------------------------------------------------------------------------------------------------------------------------------------------------------

class "Rakan"
--require('GamsteronPrediction')



local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 100, Range = 900, Speed = 1500, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION,_G.COLLISION_YASUOWALL}
}

local WData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.25, Radius = 250, Range = 600, Speed = 2050, Collision = false
}

function Rakan:__init()

  if menu ~= 1 then return end
  menu = 2   	
  self:LoadMenu()                                            
  Callback.Add("Tick", function() self:Tick() end)
  Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function Rakan:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Rakan", name = "洛"})

	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", leftIcon = Icons["AutoE"]})
	self.Menu.AutoE:MenuElement({id = "ally", name = "自动E不动的盟友",value = true})
	self.Menu.AutoE:MenuElement({id = "E", name = "自动按E键", key = 84, toggle = true})
	self.Menu.AutoE:MenuElement({id = "HP", name = "最小盟友HP", value = 30, min = 0, max = 100, identifier = "%"})
	self.Menu.AutoE:MenuElement({id = "Targets", name = "盟友设置", type = MENU})
	for i, Hero in pairs(GetAllyHeroes()) do
		self.Menu.AutoE.Targets:MenuElement({id = Hero.charName, name = Hero.charName, value = true})		
		
	end	


	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]", value = true})		
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W]", value = true})
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]", value = true})			
	self.Menu.Combo:MenuElement({id = "UseR", name = "[R]", value = true})
	self.Menu.Combo:MenuElement({id = "UseRE", name = "使用[R]最小目标", value = 2, min = 1, max = 5})	
	

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.Clear:MenuElement({id = "UseW", name = "[W]", value = true})
	self.Menu.Clear:MenuElement({id = "UseWM", name = "使用[W]最小值", value = 2, min = 1, max = 6})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
	
	--JungleClear Menu
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})	
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.JClear:MenuElement({id = "UseW", name = "[W]", value = true})	
	self.Menu.JClear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})	
    
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.ks:MenuElement({id = "UseW", name = "[W]", value = true})			
	self.Menu.ks:MenuElement({id = "UseR", name = "[R]", value = true})	
	
	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredW", name = "机会[W]", value = 2, drop = {"Normal", "High", "Immobile"}})	

 
	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawEX", name = "画 霞[E]范围", value = true})	
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画出[W]范围", value = true})

end

function Rakan:Tick()
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()

		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JClear()
		elseif Mode == "Flee" then
		
		end	

	self:KillSteal()
	self:AutoE()
	self:AutoCCE()

	
	end
end 

function Rakan:Draw()
  if myHero.dead then return end
	if(self.Menu.Drawing.DrawR:Value()) and Ready(_R) then
    Draw.Circle(myHero, 150, 1, Draw.Color(255, 225, 255, 10)) 
	end                                                 
	if(self.Menu.Drawing.DrawQ:Value()) and Ready(_Q) then
    Draw.Circle(myHero, 900, 1, Draw.Color(225, 225, 0, 10))
	end
	if(self.Menu.Drawing.DrawE:Value()) and Ready(_E) then
    Draw.Circle(myHero, 700, 1, Draw.Color(225, 225, 125, 10))
	end
	if(self.Menu.Drawing.DrawW:Value()) and Ready(_W) then
    Draw.Circle(myHero, 600, 1, Draw.Color(225, 225, 125, 10))
	end
	if(self.Menu.Drawing.DrawEX:Value()) and Ready(_E) then
		for i = 1, Game.HeroCount() do
		local ally = Game.Hero(i)
			if ally.isAlly and ally.charName == "Xayah" then
				Draw.Circle(myHero, 1000, 1, Draw.Color(225, 225, 125, 10))
			end
		end
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
	if self.Menu.AutoE.E:Value() then 
		Draw.Text("Auto E ON", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 000, 255, 000))
	else
		Draw.Text("Auto E OFF", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 220, 050, 000)) 
	end
			
end	

function Rakan:AutoCCE()
	for i = 1, Game.HeroCount() do
	local ally = Game.Hero(i)
		if ally.isAlly and ally ~= myHero then
			if IsValid(ally, 800) and myHero.pos:DistanceTo(ally.pos) <= 700 then 
				if self.Menu.AutoE.ally:Value() and Ready(_E) and IsImmobileTarget(ally) then
					Control.CastSpell(HK_E, ally.pos)
				end
			end
		end
	end
end


function Rakan:AutoE()
	for i = 1, Game.HeroCount() do
	local ally = Game.Hero(i)
		if ally.isAlly and ally ~= myHero then
			if IsValid(ally, 1100) and myHero.pos:DistanceTo(ally.pos) <= 1000 and GotBuff(ally, "RakanEShield") == 0 then 
				if self.Menu.AutoE.E:Value() and self.Menu.AutoE.Targets[ally.charName] and self.Menu.AutoE.Targets[ally.charName]:Value() and Ready(_E) and ally.health/ally.maxHealth < self.Menu.AutoE.HP:Value()/100 then
					if ally.charName == "Xayah" and myHero.pos:DistanceTo(ally.pos) <= 1000 then
						Control.CastSpell(HK_E, ally.pos)
					elseif ally.charName ~= "Xayah" and myHero.pos:DistanceTo(ally.pos) <= 700 then
						Control.CastSpell(HK_E, ally.pos)	
					end
				end
			end
		end
	end
end

function Rakan:KillSteal()	
	local target = GetTarget(1000)     	
	if target == nil then return end

	if IsValid(target,1000) then	
		
		if myHero.pos:DistanceTo(target.pos) <= 900 and self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= target.health and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end

		if myHero.pos:DistanceTo(target.pos) <= 600 and self.Menu.ks.UseW:Value() and Ready(_W) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
			local WDmg = getdmg("W", target, myHero)
			if WDmg >= target.health and pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
				Control.CastSpell(HK_W, pred.CastPosition)
	
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 150 and self.Menu.ks.UseR:Value() and Ready(_R) then
			local RDmg = getdmg("R", target, myHero)
			if RDmg >= target.health then
				Control.CastSpell(HK_R)
	
			end
		end
	end
end	

function Rakan:Combo()
local target = GetTarget(1200)
if target == nil then return end
	
	if IsValid(target,1200) then
		for i = 1, Game.HeroCount() do
		local ally = Game.Hero(i)
			if ally.isAlly and ally ~= myHero and target.pos:DistanceTo(ally.pos) <= 600 and self.Menu.Combo.UseE:Value() and Ready(_E) and GotBuff(ally, "RakanEShield") == 0 then
				if ally.charName == "Xayah" and myHero.pos:DistanceTo(ally.pos) <= 1000 then			
					Control.CastSpell(HK_E, ally)
				elseif ally.charName ~= "Xayah" and myHero.pos:DistanceTo(ally.pos) <= 700 then			
					Control.CastSpell(HK_E, ally)	
				end
			end
		
		
			if myHero.pos:DistanceTo(target.pos) <= 600 and self.Menu.Combo.UseW:Value() and Ready(_W) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then 
					Control.CastSpell(HK_W, pred.CastPosition) 
				end
			end			
		
			if Ready(_R) and self.Menu.Combo.UseR:Value() then
				local count = GetEnemyCount(400, myHero)
				if  count >= self.Menu.Combo.UseRE:Value() then
					Control.CastSpell(HK_R)
				end
			end	
				
		
			if myHero.pos:DistanceTo(target.pos) <= 900 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
				local pred = GetGamsteronPrediction(target, QData, myHero)
				if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end	
			end
		
			if ally.isAlly and ally ~= myHero and target.pos:DistanceTo(ally.pos) <= 600 and self.Menu.Combo.UseE:Value() and Ready(_E) and GotBuff(ally, "RakanEShield") then
				if ally.charName == "Xayah" and myHero.pos:DistanceTo(ally.pos) <= 1000 then			
					Control.CastSpell(HK_E, ally)
				elseif ally.charName ~= "Xayah" and myHero.pos:DistanceTo(ally.pos) <= 700 then			
					Control.CastSpell(HK_E, ally)	
				end
			end
		end
	end
end

function Rakan:Harass()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) <= 900 and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if self.Menu.Harass.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
	end
end	

function Rakan:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
		if IsValid(minion, 1000) and minion.team == TEAM_ENEMY and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 then					
			if myHero.pos:DistanceTo(minion.pos) <= 900 and Ready(_Q) and self.Menu.Clear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end	 
		
			if myHero.pos:DistanceTo(minion.pos) <= 600 and self.Menu.Clear.UseW:Value() and Ready(_W) then
				local count = GetMinionCount(250, minion)
				if count >= self.Menu.Clear.UseWM:Value() then	
					Control.CastSpell(HK_W, minion.pos)
				end
			end
		end			
	end
end

function Rakan:JClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
		if IsValid(minion, 1000) and minion.team == TEAM_JUNGLE and myHero.pos:DistanceTo(minion.pos) <= 900 and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then					
			if myHero.pos:DistanceTo(minion.pos) <= 900 and Ready(_Q) and self.Menu.JClear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end	
			if myHero.pos:DistanceTo(minion.pos) <= 600 and self.Menu.JClear.UseW:Value() and Ready(_W) then
				Control.CastSpell(HK_W, minion.pos) 
			
			end				
		end
	end
end


----------------------------------------------------------------------------------------------------------------------------------------------------------

class "Ryze"
--require('GamsteronPrediction')


local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 50, Range = 1000, Speed = 1700, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION,_G.COLLISION_YASUOWALL}
}

function Ryze:__init()

	if menu ~= 1 then return end
	menu = 2
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4
	end
end

function Ryze:LoadMenu()
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Ryze", name = "瑞兹"})
	--ComboMenu
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W]", value = true})
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]", value = true})
	self.Menu.Combo:MenuElement({id = "Type", name = "走砍逻辑", value = 2,drop = {"Mark E then Q,W", "Mark E then W,Q"}})	

	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
	
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[E]+ Q]杀死小兵", value = true})
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
	
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
	
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "KillSteal", leftIcon = Icons["ks"]})
	self.Menu.KillSteal:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.KillSteal:MenuElement({id = "UseW", name = "[W]", value = true})
	self.Menu.KillSteal:MenuElement({id = "UseE", name = "[E]", value = true})
	
	--AutoSpell on CC
	self.Menu:MenuElement({id = "CC", leftIcon = Icons["AutoEW"], type = MENU})
	self.Menu.CC:MenuElement({id = "UseEW", name = "自动E+W 团控", value = true})
	
	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	

	--Drawing
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "绘制[Q]", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "绘制[W]", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "绘制[E]", value = true})	
	
end

function Ryze:Tick()
	if MyHeroReady() then
	self:KS()
	self:CC()

	local Mode = GetMode()
		if Mode == "Combo" then
			self:Combo()
		elseif Mode == "Harass" then
			self:Harass()
		elseif Mode == "Clear" then
			self:Clear()
			self:JungleClear()
		elseif Mode == "Flee" then
		end
	end
end
	

function Ryze:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 1000, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 615, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 615, 1, Draw.Color(225, 225, 0, 10))
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
end	

function Ryze:Combo()
	
	if self.Menu.Combo.Type:Value() == 1 then
		self:ComboEQW()
	end	
	
	if self.Menu.Combo.Type:Value() == 2 then
		self:ComboEWQ()
	end
	
	if not Ready(_E) then
		self:ComboQ()
		self:ComboW()
	end	
	
end

function Ryze:ComboEQW()
local target = GetTarget(1200)
if target == nil then return end
if IsValid(target, 1200) and myHero.pos:DistanceTo(target.pos) <= 615 then    
	if self.Menu.Combo.UseE:Value() and Ready(_E) then
		Control.CastSpell(HK_E,target)
		self:ComboQ()
		self:ComboW()
		
    end
end
end	

function Ryze:ComboEWQ()
local target = GetTarget(1200)
if target == nil then return end
if IsValid(target, 1200) and myHero.pos:DistanceTo(target.pos) <= 615 then    
	if self.Menu.Combo.UseE:Value() and Ready(_E) then
		Control.CastSpell(HK_E,target)
		self:ComboW()
		self:ComboQ()		
		
    end
end
end	
	
function Ryze:ComboQ()	
local target = GetTarget(1200)
if target == nil then return end
if IsValid(target, 1200) and myHero.pos:DistanceTo(target.pos) <= 1000 then    
local pred = GetGamsteronPrediction(target, QData, myHero)	
	if self.Menu.Combo.UseQ:Value() and Ready(_Q) then
		if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			if GotBuff(target, "RyzeE") then
				Control.CastSpell(HK_Q,pred.CastPosition)
			end	
			if not Ready(_E) then
				Control.CastSpell(HK_Q,pred.CastPosition)
			end
		end
	end
end
end	

	
function Ryze:ComboW()	
local target = GetTarget(700)
if target == nil then return end
if IsValid(target, 700) and myHero.pos:DistanceTo(target.pos) <= 615 then 	
	if self.Menu.Combo.UseW:Value() and Ready(_W) then
		Control.CastSpell(HK_W,target)
            
	end
end
end

function Ryze:Harass()
local target = GetTarget(1200)
if target == nil then return end
if IsValid(target, 1100) and myHero.pos:DistanceTo(target.pos) <= 1000 and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value()/100 then
	if self.Menu.Harass.UseQ:Value() and Ready(_Q) then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			Control.CastSpell(HK_Q,pred.CastPosition)
		    
	    end
    end
end
end

function Ryze:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
	
		if minion.team == TEAM_ENEMY and IsValid(minion,1100) and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 then
			if myHero.pos:DistanceTo(minion.pos) <= 615 and self.Menu.Clear.UseQ:Value() and Ready(_E) then
				Control.CastSpell(HK_E,minion)
			end			
			
			if myHero.pos:DistanceTo(minion.pos) <= 1000 and self.Menu.Clear.UseQ:Value() and Ready(_Q) then
				local Qdmg = getdmg("Q", minion, myHero)
				if Qdmg >= minion.health then
					Control.CastSpell(HK_Q,minion)
				end
			end
		end
	end
end

function Ryze:JungleClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
		if minion.team == TEAM_JUNGLE and IsValid(minion,1100) and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then
			if myHero.pos:DistanceTo(minion.pos) <= 1000 and self.Menu.JClear.UseQ:Value() and Ready(_Q) then
				Control.CastSpell(HK_Q,minion)
				
			end
		end
	end
end	

function Ryze:KS()
local target = GetTarget(1200)
if target == nil then return end

if IsValid(target, 1200) and myHero.pos:DistanceTo(target.pos) <= 1000 then    
	if self.Menu.KillSteal.UseQ:Value() and Ready(_Q) then
	    local Qdmg = getdmg("Q", target, myHero)
		if Qdmg >= target.health then
		    local pred = GetGamsteronPrediction(target, QData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
			    Control.CastSpell(HK_Q,pred.CastPosition)
		    end
	    end
    end

	if myHero.pos:DistanceTo(target.pos) <= 615 and self.Menu.KillSteal.UseW:Value() and Ready(_W) then
		local Wdmg = getdmg("W", target, myHero)
		if Wdmg >= target.health then
			Control.CastSpell(HK_W,target)
           
		end
	end
 
    if myHero.pos:DistanceTo(target.pos) <= 615 and self.Menu.KillSteal.UseE:Value() and Ready(_E) then
		local Edmg = getdmg("E", target, myHero)
		if Edmg >= target.health then
			Control.CastSpell(HK_E,target)
		   
	    end
    end
end
end

function Ryze:CC()
local target = GetTarget(800)
if target == nil then return end
if IsValid(target, 800) and myHero.pos:DistanceTo(target.pos) <= 615 then	
	local Immobile = IsImmobileTarget(target)	
	if self.Menu.CC.UseEW:Value() and Ready(_E) then
		if Immobile then
			Control.CastSpell(HK_E,target)
		end
	end
	
	if self.Menu.CC.UseEW:Value() and Ready(_W) then
		if Immobile then
			Control.CastSpell(HK_W,target)
		end
	end	
end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

class "Soraka"
--require('GamsteronPrediction')




function Soraka:__init()

	if menu ~= 1 then return end
	menu = 2
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4
	end
end
--[[
function Soraka:QdelayCheck(target)
	local Delay = 0
	local Range = myHero.pos:DistanceTo(target.pos) 
	if Range < 100 then
	Delay = 0.25 end 
	if Range < 150 and Range > 100 then
	Delay = 0.3 end 	
	if Range < 200 and Range > 150 then
	Delay = 0.35 end 
	if Range < 250 and Range > 200 then
	Delay = 0.4 end 
	if Range < 300 and Range > 250 then
	Delay = 0.45 end 
	if Range < 350 and Range > 300 then
	Delay = 0.5 end 
	if Range < 400 and Range > 350 then
	Delay = 0.55 end 
	if Range < 450 and Range > 400 then
	Delay = 0.6 end 
	if Range < 500 and Range > 450 then
	Delay = 0.65 end 
	if Range < 550 and Range > 500 then
	Delay = 0.7 end 
	if Range < 600 and Range > 550 then
	Delay = 0.75 end 
	if Range < 650 and Range > 600 then
	Delay = 0.8 end 
	if Range < 700 and Range > 650 then
	Delay = 0.85 end 
	if Range < 750 and Range > 700 then
	Delay = 0.9 end 
	if Range < 800 and Range > 750 then
	Delay = 0.95 end 
	if Range > 800 then
	Delay = 1.0 end 
	return Delay
end]]

local QData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.5, Radius = 235, Range = 800, Speed = 1750, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_YASUOWALL}
}

local EData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.5, Radius = 250, Range = 925, Speed = 1750, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_YASUOWALL}
}

function Soraka:LoadMenu()
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Soraka", name = "索拉卡"})
	
	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", leftIcon = Icons["AutoE"]})
	self.Menu.AutoE:MenuElement({id = "UseE", name = "自动[E]固定目标", value = true})

	--AutoW
	self.Menu:MenuElement({type = MENU, id = "AutoW", leftIcon = Icons["AutoW"]})
	self.Menu.AutoW:MenuElement({id = "UseW", name = "自动治疗盟友", value = true})
	self.Menu.AutoW:MenuElement({id = "UseWE", name = "最低健康盟友", value = 30, min = 0, max = 100, identifier = "%"})
	self.Menu.AutoW:MenuElement({id = "Mana", name = "最小法力", value = 20, min = 0, max = 100, identifier = "%"})	

	--AutoR
	self.Menu:MenuElement({type = MENU, id = "AutoR", leftIcon = Icons["AutoR"]})
	self.Menu.AutoR:MenuElement({id = "UseR", name = "", value = true})
	self.Menu.AutoR:MenuElement({id = "UseRE", name = "", value = 2, min = 1, max = 5})
	self.Menu.AutoR:MenuElement({type = MENU, id = "AutoR2", name = "自动安全优先盟友"})
	self.Menu.AutoR.AutoR2:MenuElement({id = "UseRE", name = "最低健康优先级盟友", value = 40, min = 0, max = 100, identifier = "%"})	
	for i, Hero in pairs(GetAllyHeroes()) do
		self.Menu.AutoR.AutoR2:MenuElement({id = Hero.charName, name = Hero.charName, value = false})		
	end	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]", value = true})		
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]", value = true})			
		
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E]", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]", value = true})		  	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]", value = true})         	
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E]", value = true})	


	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredE", name = "机会[E]", value = 2, drop = {"Normal", "High", "Immobile"}})	


	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})

	
	
end

function Soraka:Tick()
if MyHeroReady() then
local Mode = GetMode()
	if Mode == "Combo" then
		self:Combo()
	elseif Mode == "Harass" then
		self:Harass()
	elseif Mode == "Clear" then
		self:Clear()
		self:JungleClear()
	elseif Mode == "Flee" then
		
	end	
	self:KillSteal()
	self:AutoW()
	self:AutoR()
	self:AutoR2()
	self:ImmoE()	
	
end
end 

function Soraka:RCount()
	local count = 0
	for i = 1, Game.HeroCount() do
		local hero = Game.Hero(i)
		if hero and hero.isAlly and IsValid(hero) and hero.health/hero.maxHealth  * 100 < 40 then
			count = count + 1
		
		end
	end	
	return count
end

function Soraka:ImmoE()
local target = GetTarget(1000)     	
if target == nil then return end		
	
	if IsValid(target,1000) and myHero.pos:DistanceTo(target.pos) <= 925 and Ready(_E) and self.Menu.AutoE.UseE:Value() then
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if IsImmobileTarget(target) and pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then   
			Control.CastSpell(HK_E, pred.CastPosition) 
			
		end	
	end
end


function Soraka:AutoR()
for i, ally in pairs(GetAllyHeroes()) do     	
if ally == nil then return end	
	if self.Menu.AutoR.UseR:Value() and Ready(_R) then
		if self:RCount() >= self.Menu.AutoR.UseRE:Value() then
			Control.CastSpell(HK_R)
		end	
	end
end	
end

function Soraka:AutoR2()
for i, ally in pairs(GetAllyHeroes()) do     	
if ally == nil then return end	
	if IsValid(ally) and Ready(_R) then 
		if self.Menu.AutoR.AutoR2[ally.charName] and self.Menu.AutoR.AutoR2[ally.charName]:Value() and ally.health/ally.maxHealth <= self.Menu.AutoR.UseRE:Value()/100 then
			Control.CastSpell(HK_R)
		end	
	end	
end
end	


function Soraka:AutoW()
for i, ally in pairs(GetAllyHeroes()) do     	
if ally == nil then return end	
	if IsValid(ally, 700) and myHero.pos:DistanceTo(ally.pos) <= 550 and Ready(_W) and BaseCheck(myHero) == false then 
		if self.Menu.AutoW.UseW:Value() then
			if ally.health/ally.maxHealth <= self.Menu.AutoW.UseWE:Value()/100 and myHero.mana/myHero.maxMana >= self.Menu.AutoW.Mana:Value()/100 then
				Control.CastSpell(HK_W, ally)
			end	
		end	
	end
end
end

			
function Soraka:Draw()
  if myHero.dead then return end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 800, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 925, 1, Draw.Color(225, 225, 125, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 550, 1, Draw.Color(225, 225, 125, 10))
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
end
       
function Soraka:KillSteal()	
	local target = GetTarget(1000)     	
	if target == nil then return end	
	if IsValid(target,1000) then	
		
		if myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= target.health and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 925 and self.Menu.ks.UseE:Value() and Ready(_E) then
			local EDmg = getdmg("E", target, myHero)
			local pred = GetGamsteronPrediction(target, EData, myHero)
			if EDmg >= target.health and pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then			
				Control.CastSpell(HK_E, pred.CastPosition)
	
			end
		end
	end
end	

function Soraka:Combo()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target,1000) then		
		
		if myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 925 and self.Menu.Combo.UseE:Value() and Ready(_E) then
			local pred = GetGamsteronPrediction(target, EData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then			
				Control.CastSpell(HK_E, pred.CastPosition)
	
			end
		end
	end
end	

function Soraka:Harass()
local target = GetTarget(1000)
if target == nil then return end
	if IsValid(target,1000) and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.Harass.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 925 and self.Menu.Harass.UseE:Value() and Ready(_E) then
			local pred = GetGamsteronPrediction(target, EData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then			
				Control.CastSpell(HK_E, pred.CastPosition)
	
			end
		end
	end
end	

function Soraka:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
		if minion.team == TEAM_ENEMY and IsValid(minion, 1200) and myHero.pos:DistanceTo(minion.pos) <= 800 and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 then					
			if Ready(_Q) and self.Menu.Clear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end	  
		end
	end
end

function Soraka:JungleClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)	

		if minion.team == TEAM_JUNGLE and IsValid(minion, 1200) and myHero.pos:DistanceTo(minion.pos) <= 800 and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then	
			if Ready(_Q) and self.Menu.JClear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end 
		end
	end
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------






class "Sona"
--require('GamsteronPrediction')


local QData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.25, Radius = 235, Range = 825, Speed = 1000, Collision = false
}


function Sona:__init()
	
	Q = {ready = false, range = 825, radius = 235, speed = 1000, delay = 0.25, type = "circular"}
	W = {ready = false, range = 1000,}
	E = {ready = false, range = 925, radius = 310, speed = math.huge, delay = 1.75, type = "circular"}
	R = {ready = false, range = 900,}
	self.SpellCast = {state = 1, mouse = mousePos}
	self.Enemies = {}
	self.Allies = {}
	for i = 1,Game.HeroCount() do
		local hero = Game.Hero(i)
		if hero.isAlly  then
			self.Allies[hero.handle] = hero
		else
			self.Enemies[hero.handle] = hero
		end	
	end	
	self.lastTick = 0
	self.SelectedTarget = nil
	self:LoadMenu()
	
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
	
	Callback.Add("Tick",function() self:Tick() end)
	Callback.Add("Draw",function() self:Draw() end)

end


function Sona:LoadMenu()
	self.Menu = MenuElement( {id = "Sona", name = "娑娜", type = MENU})
	self.Menu:MenuElement({id = "Key", leftIcon = Icons["KeySet"], type = MENU})
	self.Menu.Key:MenuElement({id = "Combo",name = "Combo", key = 32})
	self.Menu.Key:MenuElement({id = "Harass",name = "Harass", key = string.byte("C")})

	self.Menu:MenuElement({type = MENU, id = "Qset", leftIcon = Icons["QSet"]})
	self.Menu.Qset:MenuElement({id = "Combo",name = "Use in Combo", value = true })
	self.Menu.Qset:MenuElement({id = "Harass", name = "在骚扰中使用", value = true})
	
	self.Menu:MenuElement({id = "Wset", leftIcon = Icons["WSet"], type = MENU})
	self.Menu.Wset:MenuElement({id = "AutoW", name = "启用自动运行治疗",value = true})
	self.Menu.Wset:MenuElement({id = "MyHp", name = "治愈我的HP百分比",value = 30, min = 1, max = 100,step = 1})
	self.Menu.Wset:MenuElement({id = "AllyHp", name = "治愈盟友HP百分比",value = 50, min = 1, max = 100,step = 1})
	
	self.Menu:MenuElement({id = "Rset", leftIcon = Icons["RSet"],type = MENU})
	self.Menu.Rset:MenuElement({id = "AutoR", name = "启用自动R",value = true})
	self.Menu.Rset:MenuElement({id = "RHit", name = "最小的敌人击中",value = 3, min = 1, max = 5,step = 1})
	self.Menu.Rset:MenuElement({id = "AllyHp", name = "如果盟友HP百分比低于使用大招",value = 30, min = 1, max = 100,step = 1})	
	
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	

	self.Menu:MenuElement({type = MENU, id = "Draw", leftIcon = Icons["Drawings"]})
	self.Menu.Draw:MenuElement({id = "Q", name = "绘制Q范围", value = true})
	self.Menu.Draw:MenuElement({id = "W", name = "绘制W范围", value = true})
	self.Menu.Draw:MenuElement({id = "E", name = "绘制E范围", value = true})

end


function Sona:Tick()
	if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			if self.Menu.Key.Combo:Value() then
				self:Combo()
			end
		elseif Mode == "Harass" then
			if self.Menu.Key.Harass:Value() then
				self:Harass()
			end
		elseif Mode == "Clear" then

		elseif Mode == "Flee" then
		
		end
		if Ready(_R) then
			self:AutoR()
			self:AutoR2()
		end
		if Ready(_W) then
			self:AutoW()
			self:AutoW2()
		end
	end
end

local function isValidTarget(obj,range)
	range = range or math.huge
	return obj ~= nil and obj.valid and obj.visible and not obj.dead and obj.isTargetable and obj.distance <= range
end


function Sona:Combo()
	local target = GetTarget(1000)     	
	if target == nil then return end
	if IsValid(target, 1000) and myHero.pos:DistanceTo(target.pos) <= 825 then	

		if Ready(_Q) and self.Menu.Qset.Combo:Value() then
			self:CastQ(target)
		end
	end
end

function Sona:Harass()
	local target = GetTarget(1000)     	
	if target == nil then return end
	if IsValid(target, 1000) then	
	
		if Ready(_Q) and self.Menu.Qset.Harass:Value() then
			self:CastQ(target)
		end
	end
end

function Sona:AutoW()
	if (not Ready(_W) or not self.Menu.Wset.AutoW:Value())then return end
	for i, ally in pairs(GetAllyHeroes()) do
		if isValidTarget(ally,W.range) and myHero.pos:DistanceTo(ally.pos) <= W.range then
			if ally.health/ally.maxHealth  < self.Menu.Wset.AllyHp:Value()/100 then
				Control.CastSpell(HK_W,ally.pos)
				return
			
			end			
		end
	end
end

function Sona:AutoW2()
	if (not Ready(_W) or not self.Menu.Wset.AutoW:Value())then return end

	if (myHero.health/myHero.maxHealth  < self.Menu.Wset.MyHp:Value()/100) then
		Control.CastSpell(HK_W,myHero.pos)
		return
	end
end

function Sona:AutoR()
if (not Ready(_R) or not self.Menu.Rset.AutoR:Value())then return end
local target = GetTarget(1000)     	
if target == nil then return end
	if IsValid(target, 1000) and myHero.pos:DistanceTo(target.pos) <= 900 then		
		for i, ally in pairs(GetAllyHeroes()) do
			if (ally.health/ally.maxHealth  < self.Menu.Rset.AllyHp:Value()/100) and (CountEnemiesNear(ally, 500) > 0) then
				Control.CastSpell(HK_R,target.pos)
				return
			end	
		end
	end
end	

function Sona:AutoR2()
	if (not Ready(_R) or not self.Menu.Rset.AutoR:Value())then return end
	local target = GetTarget(1000)     	
	if target == nil then return end
	if IsValid(target, 1000) and myHero.pos:DistanceTo(target.pos) <= 900 then	
		if CountEnemiesNear(target, 500) >= self.Menu.Rset.RHit:Value() then
			Control.CastSpell(HK_R,target.pos)
			return
		end	
	end
end

function Sona:CastQ(unit)
	if not unit then return end
	local pred = GetGamsteronPrediction(unit, QData, myHero)
	if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
		CastSpell(HK_Q,pred.CastPosition)
	end
end

function Sona:Draw()
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
	if myHero.dead then return end

	if self.Menu.Draw.Q:Value() then
		local qcolor = Ready(_Q) and  Draw.Color(189, 183, 107, 255) or Draw.Color(240,255,0,0)
		Draw.Circle(Vector(myHero.pos),Q.range,1,qcolor)
	end
	if self.Menu.Draw.W:Value() then
		local wcolor = Ready(_W) and  Draw.Color(240,30,144,255) or Draw.Color(240,255,0,0)
		Draw.Circle(Vector(myHero.pos),W.range,1,wcolor)
	end
	if self.Menu.Draw.E:Value() then
		local ecolor = Ready(_E) and  Draw.Color(233, 150, 122, 255) or Draw.Color(240,255,0,0)
		Draw.Circle(Vector(myHero.pos),E.range,1,ecolor)
	end
	--R
end






-------------------------------------------------------------------------------------------------------------------------------------------------------------


class "Sylas"



function Sylas:__init()

	if menu ~= 1 then return end
	menu = 2
	self:LoadSpells()   	
	self:LoadMenu()                                            
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end) 
 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function Sylas:LoadSpells()
	
	Q = {range = 775, radius = 70, delay = 0.25, speed = 1800, collision = false}    
	W = {range = 400, radius = 70, delay = 0.25, speed = 20, collision = false}      
	E = {range = 800, radius = 60, delay = 0.25, speed = 1800, collision = true}   
	R = {range = 800}  

end


local UltSpells = {
	["LuxMaliceCannon"] = {charName = "Lux"},
	["EnchantedCrystalArrow"] = {charName = "Ashe"},
	["DravenRCast"] = {charName = "Draven"},
	["EzrealR"] = {charName = "Ezreal"},	
	["JinxR"] = {charName = "Jinx"},
	["LucianR"] = {charName = "Lucian"},
	["NeekoR"] = {charName = "Neeko"},
	["RivenFengShuiEngine"] = {charName = "Riven"},	
	["SonaR"] = {charName = "Sona"},
	["ThreshRPenta"] = {charName = "Thresh"},
	["YasuoR"] = {charName = "Yasuo"},
}



function Sylas:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Sylas", name = "塞拉斯"})

	
	--AutoW
	self.Menu:MenuElement({type = MENU, id = "AutoW", leftIcon = Icons["AutoW"]})	
	self.Menu.AutoW:MenuElement({id = "UseW", name = "安全生命", value = true})
	self.Menu.AutoW:MenuElement({id = "hp", name = "自身Hp", value = 40, min = 1, max = 40, identifier = "%"})	

	--AutoR
	self.Menu:MenuElement({type = MENU, id = "AutoR", leftIcon = Icons["AutoR"]})	
	self.Menu.AutoR:MenuElement({id = "UseR", name = "自动偷取大招", value = true})
	self.Menu.AutoR:MenuElement({type = MENU, id = "Target", name = "目标设置"})
	for i, hero in pairs(GetEnemyHeroes()) do
		self.Menu.AutoR.Target:MenuElement({id = "ult"..hero.charName, name = "偷大招："..hero.charName, value = true})
		
	end	
	

		
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q] 锁链鞭击", value = true})		
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E] 潜掠/强掳", value = true})
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W] 弑君突刺", value = true})
	
	---------------------------------------------------------------------------------------------------------------------------------
	--UltSettings
	self.Menu.Combo:MenuElement({type = MENU, id = "Set", name = "相应的设置"})
	--SkillShot+E Ults
	self.Menu.Combo.Set:MenuElement({id = "UltE", name = "自动 E + E2 + 大招", key = string.byte("T")})	
	self.Menu.Combo.Set:MenuElement({id = "BlockList", name = "E+E2+大招列表", type = MENU})
	DelayAction(function()
		for i, spell in pairs(UltSpells) do
			if not UltSpells[i] then return end
			for j, k in pairs(GetEnemyHeroes()) do
				if spell.charName == k.charName and not self.Menu.Combo.Set.BlockList[i] then
					if not self.Menu.Combo.Set.BlockList[i] then self.Menu.Combo.Set.BlockList:MenuElement({id = "Ult"..i, name = ""..spell.charName.."", value = true}) end
				end
			end
		end
	end, 0.01)
	
	--Heal+Shield Ults
	self.Menu.Combo.Set:MenuElement({id = "Heal", name = "使用治疗+护盾大招", value = true})   								
	self.Menu.Combo.Set:MenuElement({id = "HP", name = "最小HP治疗+护盾", value = 30, min = 0, max = 100, identifier = "%"})	
	--AOE Ults
	self.Menu.Combo.Set:MenuElement({id = "AOE", name = "使用范围大招", value = true})	   										
	self.Menu.Combo.Set:MenuElement({id = "Hit", name = "最小目标范围大招", value = 2, min = 1, max = 5})	
	--KS Ults
	self.Menu.Combo.Set:MenuElement({id = "LastHit", name = "使用大招杀死敌人", value = true})						
	---------------------------------------------------------------------------------------------------------------------------------
	
	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu.Harass:MenuElement({type = MENU, id = "LH", name = "最后一击"})	
	self.Menu.Harass.LH:MenuElement({id = "UseQL", name = "最后一击[Q]小兵", value = true, tooltip = "There is no Enemy nearby"})
	self.Menu.Harass.LH:MenuElement({id = "UseQLM", name = "最后一击[Q]最低小兵", value = 2, min = 1, max = 6})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q] 锁链鞭击", value = true})
	self.Menu.Harass:MenuElement({id = "UseW", name = "[W] 弑君突刺", value = true})	
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E] 潜掠/强掳", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQL", name = "[Q] 锁链鞭击", value = true})	
	self.Menu.Clear:MenuElement({id = "UseQLM", name = "[Q]最小值", value = 2, min = 1, max = 6})	
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E] 潜掠/强掳", value = true})  
	self.Menu.Clear:MenuElement({id = "UseEM", name = "使用[E]最小值", value = 3, min = 1, max = 6})	
	self.Menu.Clear:MenuElement({id = "UseW", name = "[W] 弑君突刺", value = true})	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q] 锁链鞭击", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E] 潜掠/强掳", value = true})
	self.Menu.JClear:MenuElement({id = "UseW", name = "[W] 弑君突刺", value = true})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q] 锁链鞭击", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E] 潜掠/强掳", value = true})		
	self.Menu.ks:MenuElement({id = "UseW", name = "[W] 弑君突刺", value = true})

	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "Kill", name = "画出可杀死的目标", value = true})
end

function Sylas:Tick()
if MyHeroReady() then
	local Mode = GetMode()
	if Mode == "Combo" then
		self:Combo()
		if myHero:GetSpellData(_R).name ~= "SylasR" then	
		self:HealShieldUlt()
		self:AoeUlt()
		self:KsUlt()
		
		end
									--131 champs added  
	elseif Mode == "Harass" then
		self:Harass()
		for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
		local target = GetTarget(1000)
			if target == nil then	
				if minion.team == TEAM_ENEMY and IsValid(minion,1000) and myHero.pos:DistanceTo(minion.pos) <= 800 and (myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 ) then	
					local count = GetMinionCount(225, minion)			
					local hp = minion.health
					local QDmg = getdmg("Q", minion, myHero)
					if Ready(_Q) and self.Menu.Harass.LH.UseQL:Value() and count >= self.Menu.Harass.LH.UseQLM:Value() and hp <= QDmg then
						Control.CastSpell(HK_Q, minion)
					end	 
				end
			end
		end
		
		
	elseif Mode == "Clear" then
		self:Clear()
		self:JungleClear()
	elseif Mode == "Flee" then
		
	end	
	if self.Menu.Combo.Set.UltE:Value() then
	self:EUlt()
	end
	self:KillSteal()	

	   				
	local target = GetTarget(1200)  
	if target == nil then return end
	if IsValid(target,1200) and myHero.pos:DistanceTo(target.pos) <= 1050 and self.Menu.AutoR.UseR:Value() and self.Menu.AutoR.Target["ult"..target.charName]:Value() and Ready(_R) then		
		if myHero:GetSpellData(_R).name == "SylasR" and GotBuff(target, "SylasR") == 0 then                     
				Control.CastSpell(HK_R, target)
		end
	end	
 
	if IsValid(target,600) and myHero.pos:DistanceTo(target.pos) <= 400 and self.Menu.AutoW.UseW:Value() and Ready(_W) then
		if myHero.health/myHero.maxHealth <= self.Menu.AutoW.hp:Value()/100 then
			Control.CastSpell(HK_W, target)
		end
	end	



end 
end

	
	
	
 
function Sylas:EUlt()
local target = GetTarget(3500)
if target == nil then return end
	if IsValid(target,3500) then
	local Ult = {"LuxMaliceCannon","EnchantedCrystalArrow","DravenRCast","EzrealR","JinxR","LucianR","NeekoR","RivenFengShuiEngine","SonaR","ThreshRPenta","YasuoR"}	
	if not table.contains(Ult, myHero:GetSpellData(_R).name) then return end	
		
		if myHero.pos:DistanceTo(target.pos) <= 800 and myHero:GetSpellData(_E).name == "SylasE2" then	
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.radius, E.collision)
			if hitRate and hitRate >= 1 then
				Control.CastSpell(HK_E, aimPosition)
			end
		
		elseif myHero.pos:DistanceTo(target.pos) < 1300 and myHero:GetSpellData(_E).name == "SylasE" and Ready(_E) then			
			Control.CastSpell(HK_E, target.pos)
		end
		
		
		if myHero:GetSpellData(_E).name == "SylasE2" then		
			Control.CastSpell(HK_R, target.pos) 		
		end
	end
end	

function Sylas:Draw()
local textPos = myHero.pos:To2D()


if myHero.dead then return end
	if(self.Menu.Drawing.DrawR:Value()) and Ready(_R) then
    Draw.Circle(myHero, 1050, 1, Draw.Color(255, 225, 255, 10)) --1050
	end                                                 
	if(self.Menu.Drawing.DrawQ:Value()) and Ready(_Q) then
    Draw.Circle(myHero, 755, 1, Draw.Color(225, 225, 0, 10))
	end
	if(self.Menu.Drawing.DrawE:Value()) and Ready(_E) then
    Draw.Circle(myHero, 800, 1, Draw.Color(225, 225, 125, 10))
	end
	if(self.Menu.Drawing.DrawW:Value()) and Ready(_W) then
    Draw.Circle(myHero, 400, 1, Draw.Color(225, 225, 125, 10))
	end
	local target = GetTarget(20000)
	if target == nil then return end	
	if target and self.Menu.Drawing.Kill:Value() and not target.dead then
	local hp = target.health
	local fullDmg = (getdmg("Q", target, myHero) + getdmg("E", target, myHero) + getdmg("W", target, myHero))	
		if Ready(_Q) and getdmg("Q", target, myHero) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))
		end	
		if Ready(_E) and getdmg("E", target, myHero) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))		
		end	
		if Ready(_W) and getdmg("W", target, myHero) > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))	
		end
		if Ready(_W) and Ready(_E) and Ready(_Q) and fullDmg > hp then
			Draw.Text("Killable", 24, target.pos2D.x, target.pos2D.y,Draw.Color(0xFF00FF00))
			Draw.Text("Killable", 13, target.posMM.x - 15, target.posMM.y - 15,Draw.Color(0xFF00FF00))	
		end		
	end	
	local Ult = {"LuxMaliceCannon","EnchantedCrystalArrow","DravenRCast","EzrealR","JinxR","LucianR","NeekoR","RivenFengShuiEngine","SonaR","ThreshRPenta","YasuoR"}	
	if table.contains(Ult, myHero:GetSpellData(_R).name) then 
		Draw.Text("E+E2+Ult[Press Key]", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 000, 255, 000))
	end	
		
end
       




function Sylas:GetPykeDamage()
	local total = 0
	local Lvl = myHero.levelData.lvl
	if Lvl > 5 then
		local raw = ({ 250, 250, 250, 250, 250, 250, 290, 330, 370, 400, 430, 450, 470, 490, 510, 530, 540, 550 })[Lvl]
		local m = 1.5 * myHero.armorPen
		local Dmg = m + raw + (0.4 * myHero.ap)
		total = Dmg   
	end
	return total
end	


function Sylas:IsKnockedUp(unit)
		if unit == nil then return false end
		for i = 0, unit.buffCount do
			local buff = unit:GetBuff(i)
			if buff and (buff.type == 29 or buff.type == 30 or buff.type == 39) and buff.count > 0 then
				return true
			end
		end
		return false	
	end
	
function Sylas:CountKnockedUpEnemies(range)
		local count = 0
		local rangeSqr = range * range
		for i = 1, Game.HeroCount()do
		local hero = Game.Hero(i)
			if hero.isEnemy and hero.alive and GetDistanceSqr(myHero.pos, hero.pos) <= rangeSqr then
			if Sylas:IsKnockedUp(hero)then
			count = count + 1
    end
  end
end
return count
end



--------------------------KS Ults---------------------------------------------------
function Sylas:KsUlt()

local target = GetTarget(25000)     	
if target == nil then return end
	if IsValid(target,25000) and self.Menu.Combo.Set.LastHit:Value() and Ready(_R) then
	local hp = target.health		
		if (myHero:GetSpellData(_R).name == "AatroxR") then										--Aatrox 
			Control.CastSpell(HK_R, target)
			
		end
	





		if (myHero:GetSpellData(_R).name == "AhriTumble") and myHero.pos:DistanceTo(target.pos) <= 450 then		--Ahri 
			if getdmg("R", target, myHero, 70) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "AkaliR") and myHero.pos:DistanceTo(target.pos) <= 600 then		--Akali 
			if getdmg("R", target, myHero, 20) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "AkaliRb") and myHero.pos:DistanceTo(target.pos) <= 750 then		--Akalib
			if getdmg("R", target, myHero, 21) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "FerociousHowl") then										--Alistar
			Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "CurseoftheSadMummy") and myHero.pos:DistanceTo(target.pos) <= 550 then		--Amumu 
			if getdmg("R", target, myHero, 22) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "GlacialStorm") and myHero.pos:DistanceTo(target.pos) <= 750 then		--Anivia
			if getdmg("R", target, myHero, 13) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "AnnieR") and myHero.pos:DistanceTo(target.pos) <= 600 then		--Annie   	 
			if getdmg("R", target, myHero, 23) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "EnchantedCrystalArrow") and myHero.pos:DistanceTo(target.pos) <= 25000 then		--Ashe 
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 25000, 0.25, 1600, 130, false)
			if getdmg("R", target, myHero, 3) > hp and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end
			end
		end
	



		if (myHero:GetSpellData(_R).name == "AurelionSolR") and myHero.pos:DistanceTo(target.pos) <= 1500 then		--AurelionSol
			if getdmg("R", target, myHero, 14) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "AzirR") and myHero.pos:DistanceTo(target.pos) <= 250 then		--Azir
			if getdmg("R", target, myHero, 24) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "BlitzcrankR") and myHero.pos:DistanceTo(target.pos) <= 600 then	
			if getdmg("R", target, myHero, 26) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "BrandR") and myHero.pos:DistanceTo(target.pos) <= 750 then		--brand
			if getdmg("R", target, myHero, 48) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "BraumRWrapper") and myHero.pos:DistanceTo(target.pos) <= 1250 then		--Braum  
			if getdmg("R", target, myHero, 15) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	



		if (myHero:GetSpellData(_R).name == "CaitlynAceintheHole") and myHero.pos:DistanceTo(target.pos) <= 3500 then		--Caitlyn 
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 3500, 3.0, 3200, 50, true)
			if getdmg("R", target, myHero, 64) > hp and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end	
			end
		end
	



		if (myHero:GetSpellData(_R).name == "CamilleR") and myHero.pos:DistanceTo(target.pos) <= 475 then		--Camille
			Control.CastSpell(HK_R, target)
		end





		if (myHero:GetSpellData(_R).name == "CassiopeiaR") and myHero.pos:DistanceTo(target.pos) <= 825 then		--Cassiopeia
			if getdmg("R", target, myHero, 10) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "Feast") and myHero.pos:DistanceTo(target.pos) <= 200 then		--Cho'gath
			if getdmg("R", target, myHero, 2) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "MissileBarrageMissile") and myHero.pos:DistanceTo(target.pos) <= 1225 then		--Corki
			if getdmg("R", target, myHero, 30) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "DariusExecute") and myHero.pos:DistanceTo(target.pos) <= 460 then		--Darius
			if getdmg("R", target, myHero, 71) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "DianaTeleport") and myHero.pos:DistanceTo(target.pos) <= 825 then		--Diana
			if getdmg("R", target, myHero, 34) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	





		if (myHero:GetSpellData(_R).name == "DravenRCast") and myHero.pos:DistanceTo(target.pos) <= 25000 then		--Draven   
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 25000, 0.25, 2000, 160, false)
			if getdmg("R", target, myHero, 27) > hp and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end	
			end
		end
	




		if (myHero:GetSpellData(_R).name == "EkkoR") and myHero.pos:DistanceTo(target.pos) <= 375 then		--Ekko
			if getdmg("R", target, myHero, 72) > hp then
				Control.CastSpell(HK_R)
			end
		end
	


--function Sylas:UltElise()



		if (myHero:GetSpellData(_R).name == "EvelynnR") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Evelynn      
			local damage = getdmg("R", target, myHero, 25)*2
			if target.health/target.maxHealth <= 30/100 and damage > hp then
				Control.CastSpell(HK_R, target)
			elseif getdmg("R", target, myHero, 25) > hp then
				Control.CastSpell(HK_R, target)	
			end
		end
	





		if (myHero:GetSpellData(_R).name == "EzrealR") and myHero.pos:DistanceTo(target.pos) <= 25000 then		--ezreal
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 25000, 1.0, 2000, 160, false)
			if getdmg("R", target, myHero, 6) > hp and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end	
			end
		end
	



		if (myHero:GetSpellData(_R).name == "Crowstorm") and myHero.pos:DistanceTo(target.pos) <= 600 then		--Fiddlesticks
			if getdmg("R", target, myHero, 54) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	





		if (myHero:GetSpellData(_R).name == "FizzR") and myHero.pos:DistanceTo(target.pos) <= 1300 then		--Fizz   
			if getdmg("R", target, myHero, 28) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		local level = myHero:GetSpellData(_R).level
		local range = ({4000, 4750, 5500})[level]
		local count = GetEnemyCount(1000, myHero)

		if (myHero:GetSpellData(_R).name == "GalioR") and myHero.pos:DistanceTo(target.pos) <= range and count == 0 then		--Galio   
			if getdmg("R", target, myHero, 73) > hp then
				if target.pos:To2D().onScreen then						
					Control.CastSpell(HK_R, target.pos) 
				
				elseif not target.pos:To2D().onScreen then			
					CastSpellMM(HK_R, target.pos, range, 250)		
				end
			end
		end
	



		if (myHero:GetSpellData(_R).name == "GangplankR") and myHero.pos:DistanceTo(target.pos) <= 20000 then		--Gankplank   
			if getdmg("R", target, myHero, 55) > hp then
				if target.pos:To2D().onScreen then						-----------check ist target in sichtweite
					Control.CastSpell(HK_R, target.pos) 
				
				elseif not target.pos:To2D().onScreen then			-----------ist target auserhalb sichtweite
					CastSpellMM(HK_R, target.pos, 20000, 500)		-----------CastSpellMM(HK_R, target.pos, range, delay)
				end
			end
		end
	




		local missingHP = (target.maxHealth - target.health)/100 * 0.286
		local missingHP2 = (target.maxHealth - target.health)/100 * 0.333
		local missingHP3 = (target.maxHealth - target.health)/100 * 0.4
		local damage = getdmg("R", target, myHero, 49) + missingHP
		local damage2 = getdmg("R", target, myHero, 49) + missingHP2
		local damage3 = getdmg("R", target, myHero, 49) + missingHP3

		if (myHero:GetSpellData(_R).name == "GarenR") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--Garen
			if damage3  > hp then
				Control.CastSpell(HK_R, target)
			elseif damage2  > hp then
				Control.CastSpell(HK_R, target)
			elseif damage  > hp then
				Control.CastSpell(HK_R, target)	
			end
		end
	



		if (myHero:GetSpellData(_R).name == "GnarR") and myHero.pos:DistanceTo(target.pos) <= 475 then		--Gnar     
			if getdmg("R", target, myHero, 29) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "GragasR") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--Gragas   
			if getdmg("R", target, myHero, 30) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	



		if (myHero:GetSpellData(_R).name == "GravesChargeShot") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--Graves  
			if getdmg("R", target, myHero, 31) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "HecarimUlt") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--Hecarim  
			if getdmg("R", target, myHero, 32) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "HeimerdingerR") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Heimerdinger
				Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "IllaoiR") and myHero.pos:DistanceTo(target.pos) <= 450 then		--Illaoi
			if getdmg("R", target, myHero, 56) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "IreliaR") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--Irelia
			if getdmg("R", target, myHero, 16) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "IvernR") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Ivern
			Control.CastSpell(HK_R, target)
			
		end
	




		if (myHero:GetSpellData(_R).name == "JarvanIVCataclysm") and myHero.pos:DistanceTo(target.pos) <= 650 then		--jarvan
			if getdmg("R", target, myHero, 57) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




--function Sylas:UltJayyce()      


--		if (myHero:GetSpellData(_R).name == "JhinRShot") and myHero.pos:DistanceTo(target.pos) <= 525 then		--Jhin   orbwalker block f眉r die ulti
--			if getdmg("R", target, myHero, 33) > hp then
--				Control.CastSpell(HK_R, target)
--			end
--		end

	



		if (myHero:GetSpellData(_R).name == "JinxR") and myHero.pos:DistanceTo(target.pos) <= 25000 then		--jinx
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 25000, 0.6, 1700, 140, false)
			if getdmg("R", target, myHero, 7) > hp and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end
			end
		end



     

--function Sylas:UltKallista()


		if (myHero:GetSpellData(_R).name == "KarmaMantra") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Karma
			Control.CastSpell(HK_R)
			
		end
	



		if (myHero:GetSpellData(_R).name == "KarthusFallenOne") and myHero.pos:DistanceTo(target.pos) <= 20000 then		--karthus
			if getdmg("R", target, myHero, 8) > hp then
				Control.CastSpell(HK_R)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "RiftWalk") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Kassadin
			if getdmg("R", target, myHero, 58) > hp then
				Control.CastSpell(HK_R, target)
			end
		end





		if (myHero:GetSpellData(_R).name == "KatarinaR") and myHero.pos:DistanceTo(target.pos) <= 550 then		
			if getdmg("R", target, myHero, 35) > hp then
				Control.CastSpell(HK_R, target)
			if myHero.activeSpell.isChanneling == true then	
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
			elseif myHero.activeSpell.isChanneling == false then	
				_G.SDK.Orbwalker:SetMovement(true)
				_G.SDK.Orbwalker:SetAttack(true)
			end
			end
		end
	



		if (myHero:GetSpellData(_R).name == "KaisaR") and myHero.pos:DistanceTo(target.pos) <= 1500 then		--Kaisa  
			Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "KaynR") and myHero.pos:DistanceTo(target.pos) <= 550 then		--Kayn 
			Control.CastSpell(HK_R, target)
			Control.CastSpell(HK_R, target)
			Control.CastSpell(HK_R, target)
		end
	




		if (myHero:GetSpellData(_R).name == "KennenShurikenStorm") and myHero.pos:DistanceTo(target.pos) <= 550 then		--Kennen  
			if getdmg("R", target, myHero, 36) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "KledR") and myHero.pos:DistanceTo(target.pos) <= 700 then		--Kled   
			Control.CastSpell(HK_R, target)
			
		end
	




		if (myHero:GetSpellData(_R).name == "KogMawLivingArtillery") and myHero.pos:DistanceTo(target.pos) <= 1300 then		--Kogmaw   
			if getdmg("R", target, myHero, 59) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "LeblancSlideM") and myHero.pos:DistanceTo(target.pos) <= 600 then		--Leblanc   
			if getdmg("R", target, myHero, 60) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "BlindMonkRKick") and myHero.pos:DistanceTo(target.pos) <= 375 then		--LeeSin   
			if getdmg("R", target, myHero, 74) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "LeonaSolarFlare") and myHero.pos:DistanceTo(target.pos) <= 1200 then		--leona   
			if getdmg("R", target, myHero, 5) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "LissandraR") and myHero.pos:DistanceTo(target.pos) <= 550 then		--Lissandra      
			if getdmg("R", target, myHero, 18) > hp then
				Control.CastSpell(HK_R, target)
			end
		end

	


		if (myHero:GetSpellData(_R).name == "LucianR") and myHero.pos:DistanceTo(target.pos) <= 1200 then		--Lucian
			if getdmg("R", target, myHero, 61) > hp then
				Control.CastSpell(HK_R, target)
			end
		end

	


 
		if (myHero:GetSpellData(_R).name == "LuxMaliceCannon") and myHero.pos:DistanceTo(target.pos) <= 3500 then		
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 3500, 1, math.huge, 120, false)
			if getdmg("R", target, myHero, 11) > hp and hitRate and hitRate >= 1 then
				

				
				if aimPosition:To2D().onScreen then 		
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)    
					Control.CastSpell(HK_R, castPos)
				end	
			end
		end
	



		if (myHero:GetSpellData(_R).name == "UFSlash") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--malphite 
			if getdmg("R", target, myHero, 50) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "MalzaharR") and myHero.pos:DistanceTo(target.pos) <= 700 then		
			if getdmg("R", target, myHero, 19) > hp then
				Control.CastSpell(HK_R, target)
			if myHero.activeSpell.isChanneling == true then	
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
			elseif myHero.activeSpell.isChanneling == false then	
				_G.SDK.Orbwalker:SetMovement(true)
				_G.SDK.Orbwalker:SetAttack(true)
			end
			end
		end
	



		if (myHero:GetSpellData(_R).name == "MaokaiR") and myHero.pos:DistanceTo(target.pos) <= 3000 then		--Maokai 
			if getdmg("R", target, myHero, 37) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "Highlander") and myHero.pos:DistanceTo(target.pos) <= 500 then		--MasterYi
			Control.CastSpell(HK_R, target)
			
		end






		if (myHero:GetSpellData(_R).name == "MissFortuneBulletTime") and myHero.pos:DistanceTo(target.pos) <= 1400 then		
			if getdmg("R", target, myHero, 38) > hp then
				Control.CastSpell(HK_R, target)
			if myHero.activeSpell.isChanneling == true then	
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
			elseif myHero.activeSpell.isChanneling == false then	
				_G.SDK.Orbwalker:SetMovement(true)
				_G.SDK.Orbwalker:SetAttack(true)
			end				
			end
		end
	

  

		if (myHero:GetSpellData(_R).name == "MordekaiserChildrenOfTheGrave") and myHero.pos:DistanceTo(target.pos) <= 650 then		--Mordekaiser  
			Control.CastSpell(HK_R, target)
			
		end
	




		if (myHero:GetSpellData(_R).name == "SoulShackles") and myHero.pos:DistanceTo(target.pos) <= 625 then		--morgana   
			if getdmg("R", target, myHero, 52) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	





		if (myHero:GetSpellData(_R).name == "NamiR") and myHero.pos:DistanceTo(target.pos) <= 2750 then		--Nami 
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 2750, 0.5, 850, 250, false)
			if getdmg("R", target, myHero, 39) > hp and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end
			end
		end
	





		if (myHero:GetSpellData(_R).name == "NautilusR") and myHero.pos:DistanceTo(target.pos) <= 825 then		--Nautilus  
			if getdmg("R", target, myHero, 40) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "NeekoR") and myHero.pos:DistanceTo(target.pos) <= 600 then		--Neeko
			if getdmg("R", target, myHero, 65) > hp then
				Control.CastSpell(HK_R, target)
			end
		end

	

--function Sylas:UltNiedalee()


		local level = myHero:GetSpellData(_R).level
		local range = ({2500, 3250, 4000})[level]
		if (myHero:GetSpellData(_R).name == "NocturneParanoia") and myHero.pos:DistanceTo(target.pos) <= range then		--Nocturne   
			if getdmg("R", target, myHero, 75) > hp then
				if target.pos:To2D().onScreen then						
					Control.CastSpell(HK_R, target.pos) 
				
				elseif not target.pos:To2D().onScreen then			
					CastSpellMM(HK_R, target.pos, range, 250)		
				end
			end
		end
	




		if (myHero:GetSpellData(_R).name == "NunuR") and myHero.pos:DistanceTo(target.pos) <= 650 then		
			if getdmg("R", target, myHero, 17) > hp then
				Control.CastSpell(HK_R, target)
			if myHero.activeSpell.isChanneling == true then	
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
			elseif myHero.activeSpell.isChanneling == false then	
				_G.SDK.Orbwalker:SetMovement(true)
				_G.SDK.Orbwalker:SetAttack(true)
			end					
			end
		end
	



		if (myHero:GetSpellData(_R).name == "OlafRagnarok") and myHero.pos:DistanceTo(target.pos) <= 1200 then		--Olaf  
			if IsImmobileTarget(myHero) then
				Control.CastSpell(HK_R)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "OrianaDetonateCommand-") and myHero.pos:DistanceTo(target.pos) <= 325 then		--Orianna  
			if getdmg("R", target, myHero, 66) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "OrnnR") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Ornn
			Control.CastSpell(HK_R, target)
			
		end
	




		local count = GetEnemyCount(1000, myHero)
		if (myHero:GetSpellData(_R).name == "PantheonRJump") and myHero.pos:DistanceTo(target.pos) <= 5500 and count == 0 then		--Phantheon   
			if getdmg("R", target, myHero, 76) > hp then
				if target.pos:To2D().onScreen then						
					Control.CastSpell(HK_R, target.pos) 
				
				elseif not target.pos:To2D().onScreen then			
					CastSpellMM(HK_R, target.pos, 5500, 2000)		
				end
			end
		end



		if (myHero:GetSpellData(_R).name == "PoppyRSpell") and myHero.pos:DistanceTo(target.pos) <= 475 then		--Poppy  
			if getdmg("R", target, myHero, 77) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		local dmg = self:GetPykeDamage()
		if (myHero:GetSpellData(_R).name == "PykeR") and myHero.pos:DistanceTo(target.pos) <= 750 and dmg >= hp then	 
			Control.CastSpell(HK_R, target)
		end
	



		if (myHero:GetSpellData(_R).name == "QuinnR") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--Quinn   
			Control.CastSpell(HK_R, target)
			
		end
	




		if (myHero:GetSpellData(_R).name == "RakanR") and myHero.pos:DistanceTo(target.pos) <= 300 then		--Rakan  
			if getdmg("R", target, myHero, 78) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	
  
  

		if (myHero:GetSpellData(_R).name == "Tremors2") and myHero.pos:DistanceTo(target.pos) <= 300 then		--Rammus   
			if getdmg("R", target, myHero, 62) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "RekSaiR") and myHero.pos:DistanceTo(target.pos) <= 1500 then		--RekSai   
			if getdmg("R", target, myHero, 79) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "RengarR") and myHero.pos:DistanceTo(target.pos) <= 800 then		--Rengar  
			Control.CastSpell(HK_R, target)
		
		end
	
	


		if (myHero:GetSpellData(_R).name == "RivenFengShuiEngine") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Riven   
			Control.CastSpell(HK_R)
		
		end
	




		if (myHero:GetSpellData(_R).name == "RumbleCarpetBombDummy") and myHero.pos:DistanceTo(target.pos) <= 1700 then		--Rumble   
			if getdmg("R", target, myHero, 41) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "SejuaniR") and myHero.pos:DistanceTo(target.pos) <= 1300 then		--Sejuani   
			if getdmg("R", target, myHero, 42) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "HallucinateFull") and myHero.pos:DistanceTo(target.pos) <= 500 then --Shaco 
			if getdmg("R", target, myHero, 80) > hp then
				Control.CastSpell(HK_R)
				Control.CastSpell(HK_R, target)
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "ShyvanaTransformCast") and myHero.pos:DistanceTo(target.pos) <= 1000 then --shyvana 
			if getdmg("R", target, myHero, 51) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	

   

		if (myHero:GetSpellData(_R).name == "SkarnerImpale") and myHero.pos:DistanceTo(target.pos) <= 350 then		--Skarner    
			Control.CastSpell(HK_R, target)
			
		end
	




		if (myHero:GetSpellData(_R).name == "SonaR") and myHero.pos:DistanceTo(target.pos) <= 900 then		--Sona    
			if getdmg("R", target, myHero, 43) > hp then
				Control.CastSpell(HK_R, target)
			end
		end






		if (myHero:GetSpellData(_R).name == "SwainMetamorphism") and myHero.pos:DistanceTo(target.pos) <= 650 then		--Swain    
			if getdmg("R", target, myHero, 67) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	



		if (myHero:GetSpellData(_R).name == "SyndraR") and myHero.pos:DistanceTo(target.pos) <= 675 then		--Syndra    
			Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "TaliyahR") and myHero.pos:DistanceTo(target.pos) <= 1000 then		--Taliyah   
			Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "TalonShadowAssault") and myHero.pos:DistanceTo(target.pos) <= 550 then		--Talon   
			if getdmg("R", target, myHero, 81) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "ThreshRPenta") and myHero.pos:DistanceTo(target.pos) <= 450 then		--Tresh   
			if getdmg("R", target, myHero, 68) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		local level = myHero:GetSpellData(_R).level
		local range = ({400, 650, 900})[level]
		if (myHero:GetSpellData(_R).name == "TeemoR") and myHero.pos:DistanceTo(target.pos) <= range then		--Teemo   
			Control.CastSpell(HK_R, target.pos)
		
		end
	



		local range = 517 + (8 * myHero.levelData.lvl)
		local hp = target.health
		if (myHero:GetSpellData(_R).name == "TristanaR") and myHero.pos:DistanceTo(target.pos) <= range then		--Tristana  	
			if getdmg("R", target, myHero, 12) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "TrundlePain") and myHero.pos:DistanceTo(target.pos) <= 650 then		--Trundle     
			Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "TwitchFullAutomatic") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Twitch    
			Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "UdyrPhoenixStance") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Udyr    
			Control.CastSpell(HK_R, target)
			
		end
	



		if (myHero:GetSpellData(_R).name == "UrgotR") and myHero.pos:DistanceTo(target.pos) <= 1600 then		--Urgot      
			if getdmg("R", target, myHero, 44) > hp then
				Control.CastSpell(HK_R, target)
			end	
			if target.health/target.maxHealth < 25/100 then
				Control.CastSpell(HK_R, target)	
			end
		end
	
	


		if (myHero:GetSpellData(_R).name == "VarusR") and myHero.pos:DistanceTo(target.pos) <= 1075 then		--Varus     
			if getdmg("R", target, myHero, 45) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "VayneInquisition") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Vayne     
			Control.CastSpell(HK_R)
			
		end
	




		if (myHero:GetSpellData(_R).name == "VeigarR") and myHero.pos:DistanceTo(target.pos) <= 650 then		--Vaiger
			if getdmg("R", target, myHero, 4) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	

--function Sylas:KillUltVel'koz()


		if (myHero:GetSpellData(_R).name == "ViR") and myHero.pos:DistanceTo(target.pos) <= 800 then		--Vi
			if getdmg("R", target, myHero, 82) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "ViktorChaosStorm") and myHero.pos:DistanceTo(target.pos) <= 700 then		--Viktor
			if getdmg("R", target, myHero, 83) > hp then
				Control.CastSpell(HK_R, target.pos)
				Control.CastSpell(HK_R, target.pos)
				Control.CastSpell(HK_R, target.pos)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "VladimirHemoplague") and myHero.pos:DistanceTo(target.pos) <= 700 then		--Vladimir
			if getdmg("R", target, myHero, 63) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		if (myHero:GetSpellData(_R).name == "VolibearR") and myHero.pos:DistanceTo(target.pos) <= 500 then		--Volibear
			if getdmg("R", target, myHero, 69) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	




		local range = 2.5 * myHero.ms
		if (myHero:GetSpellData(_R).name == "WarwickR") and myHero.pos:DistanceTo(target.pos) <= range then		--Warwick	
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, range, 0.1, 1800, 55, false)
			if getdmg("R", target, myHero, 47) > hp and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end
			end
		end
	



		if (myHero:GetSpellData(_R).name == "WukongR") and myHero.pos:DistanceTo(target.pos) <= 200 then		--Wukong
			Control.CastSpell(HK_R)
		
		end
	




		if (myHero:GetSpellData(_R).name == "XayahR") and myHero.pos:DistanceTo(target.pos) <= 1100 then		--Xayah
			if getdmg("R", target, myHero, 84) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	
	

--[[

		local level = myHero:GetSpellData(_R).level
		local range = ({3520, 4840, 6160})[level]
		local count = GetEnemyCount(1000, myHero)
		if (myHero:GetSpellData(_R).name == "XerathLocusOfPower2") and myHero.pos:DistanceTo(target.pos) <= range and count == 0 then		--Xerath   
			if getdmg("R", target, myHero, 73) > hp then
				Control.CastSpell(HK_R)
				Control.SetCursorPos(target.pos)
				aim = TargetSelector:GetTarget(NEAR_MOUSE)
				if GetDistance(mousePos, aim) < 200 then						
					Control.CastSpell(HK_R) 
				end
			return end
		end
	
]]





		if (myHero:GetSpellData(_R).name == "YasuoR") and myHero.pos:DistanceTo(target.pos) <= 1400 then		--Yasou
			if getdmg("R", target, myHero, 85) > hp and self:IsKnockedUp(target) then
				Control.CastSpell(HK_R)
			end
		end
	



		if (myHero:GetSpellData(_R).name == "YorickReviveAlly") and myHero.pos:DistanceTo(target.pos) <= 600 then		--Yorick
			Control.CastSpell(HK_R, target)
		
		end
	



		local level = myHero:GetSpellData(_R).level
		local range = ({700, 850, 1000})[level]
		if (myHero:GetSpellData(_R).name == "ZacR") and myHero.pos:DistanceTo(target.pos) <= range then		--Zac  						
			Control.CastSpell(HK_R, target.pos) 
			Control.CastSpell(HK_R, target.pos)
			Control.CastSpell(HK_R, target.pos)
				
		end
	



		if (myHero:GetSpellData(_R).name == "ZedR") and myHero.pos:DistanceTo(target.pos) <= 625 then		--Zed
			Control.CastSpell(HK_R, target)
			Control.CastSpell(HK_R)
			Control.CastSpell(HK_R)
			
		end
	




		if (myHero:GetSpellData(_R).name == "ZiggsR") and myHero.pos:DistanceTo(target.pos) <= 5300 then		--ziggs
			if getdmg("R", target, myHero, 9) > hp then
				if target.pos:To2D().onScreen then						
					Control.CastSpell(HK_R, target.pos) 
				
				elseif not target.pos:To2D().onScreen then			
					CastSpellMM(HK_R, target.pos, 5300, 375)		
				end
			end	
		end
	
	


		if (myHero:GetSpellData(_R).name == "ZoeR") and myHero.pos:DistanceTo(target.pos) <= 575 then		--Zoe
			Control.CastSpell(HK_R, target)
		
		end
	



		if (myHero:GetSpellData(_R).name == "ZyraR") and myHero.pos:DistanceTo(target.pos) <= 700 then		--Zyra    
			if getdmg("R", target, myHero, 46) > hp then
				Control.CastSpell(HK_R, target)
			end
		end
	end
end	






----------------AOE Ults------------------------------------------------------------------------------------------------------------

--Amumu
function Sylas:AoeUlt()
local target = GetTarget(20000)     	
if target == nil then return end

	if IsValid(target,20000) and self.Menu.Combo.Set.AOE:Value() and Ready(_R) then
		
		if (myHero:GetSpellData(_R).name == "CurseoftheSadMummy") then		
			local count = GetEnemyCount(550, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Bard



		if (myHero:GetSpellData(_R).name == "BardR") then
			local count = GetEnemyCount(350, target)
			if myHero.pos:DistanceTo(target.pos) <= 3400 and count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Braum

		if (myHero:GetSpellData(_R).name == "BraumRWrapper") and myHero.pos:DistanceTo(target.pos) <= 1250 then		
			local count = GetEnemyCount(115, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Brand

		if (myHero:GetSpellData(_R).name == "BrandR") and myHero.pos:DistanceTo(target.pos) <= 750 then		
			local count = GetEnemyCount(600, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Cassiopeia

		if (myHero:GetSpellData(_R).name == "CassiopeiaR") and myHero.pos:DistanceTo(target.pos) <= 825 then		
			local count = GetEnemyCount(825, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Fiddlesticks

		if (myHero:GetSpellData(_R).name == "Crowstorm") and myHero.pos:DistanceTo(target.pos) <= 600 then		
			local count = GetEnemyCount(600, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	





--Gankplank

		if (myHero:GetSpellData(_R).name == "GangplankR") and myHero.pos:DistanceTo(target.pos) <= 20000 then		
			local count = GetEnemyCount(600, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				
				if target.pos:To2D().onScreen then						
					Control.CastSpell(HK_R, target.pos) 
				
				elseif not target.pos:To2D().onScreen then			
					CastSpellMM(HK_R, target.pos, 20000, 500)		
				end
			end
		end
	
    

--Gragas
		if (myHero:GetSpellData(_R).name == "GragasR") then		
			local count = GetEnemyCount(400, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	



--Ilaoi
		if (myHero:GetSpellData(_R).name == "IllaoiR") then		
			local count = GetEnemyCount(450, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Janna
		if (myHero:GetSpellData(_R).name == "ReapTheWhirlwind") then		
			local count = GetEnemyCount(725, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Jarvan
		if (myHero:GetSpellData(_R).name == "JarvanIVCataclysm") and myHero.pos:DistanceTo(target.pos) <= 650 then		
			local count = GetEnemyCount(325, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	



--Katarina
		if (myHero:GetSpellData(_R).name == "KatarinaR") then		
			local count = GetEnemyCount(250, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			if myHero.activeSpell.isChanneling == true then	
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
			elseif myHero.activeSpell.isChanneling == false then	
				_G.SDK.Orbwalker:SetMovement(true)
				_G.SDK.Orbwalker:SetAttack(true)
			end
			end
		end
	


--Leona 
		if (myHero:GetSpellData(_R).name == "LeonaSolarFlare") and myHero.pos:DistanceTo(target.pos) <= 1200 then		 
			local count = GetEnemyCount(250, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target,pos)
			end
		end
	

	


--Maokai
		if (myHero:GetSpellData(_R).name == "MaokaiR") and myHero.pos:DistanceTo(target.pos) <= 3000 then
			local count = GetEnemyCount(900, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Malzahar
		local count = GetEnemyCount(500, target)
		if (myHero:GetSpellData(_R).name == "MalzaharR") and myHero.pos:DistanceTo(target.pos) <= 700 and count >= self.Menu.Combo.Set.Hit:Value() then		
				Control.CastSpell(HK_R, target.pos)
			if myHero.activeSpell.isChanneling == true then	
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
			elseif myHero.activeSpell.isChanneling == false then	
				_G.SDK.Orbwalker:SetMovement(true)
				_G.SDK.Orbwalker:SetAttack(true)
			end
		end
	


--Malphite
		if (myHero:GetSpellData(_R).name == "UFSlash") and myHero.pos:DistanceTo(target.pos) <= 1000 then
			local count = GetEnemyCount(300, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Morgana
		if (myHero:GetSpellData(_R).name == "SoulShackles") then
			local count = GetEnemyCount(625, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R)
			end
		end
	


--Nautilus
		if (myHero:GetSpellData(_R).name == "NautilusR") and myHero.pos:DistanceTo(target.pos) <= 825 then
			local count = GetEnemyCount(300, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R)
			end
		end
	


--Neeko
		if (myHero:GetSpellData(_R).name == "NeekoR") then
			local count = GetEnemyCount(600, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R)
			end
		end
	


--Nami
		if (myHero:GetSpellData(_R).name == "NamiR") and myHero.pos:DistanceTo(target.pos) <= 2750 then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, 2750, 0.5, 850, 250, false)
			local count = GetEnemyCount(250, aimPosition)
			if count >= self.Menu.Combo.Set.Hit:Value() and hitRate and hitRate >= 1 then
				if aimPosition:To2D().onScreen then 	
					Control.CastSpell(HK_R, aimPosition) 
				
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition, 1000)   
					Control.CastSpell(HK_R, castPos)
				end
			end
		end
	


--Orianna
		if (myHero:GetSpellData(_R).name == "OrianaDetonateCommand-") then
			local count = GetEnemyCount(325, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R)
			end
		end
	


--Rammus
		if (myHero:GetSpellData(_R).name == "Tremors2") then
			local count = GetEnemyCount(300, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Sona
		if (myHero:GetSpellData(_R).name == "SonaR") and myHero.pos:DistanceTo(target.pos) <= 900 then
			local count = GetEnemyCount(140, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Swain
		if (myHero:GetSpellData(_R).name == "SwainMetamorphism") then
			local count = GetEnemyCount(650, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Sejuani
		if (myHero:GetSpellData(_R).name == "SejuaniR") and myHero.pos:DistanceTo(target.pos) <= 1300 then
			local count = GetEnemyCount(120, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Talon
		if (myHero:GetSpellData(_R).name == "TalonShadowAssault") then
			local count = GetEnemyCount(550, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R)
			end
		end
	


--Thresh
		if (myHero:GetSpellData(_R).name == "ThreshRPenta") then
			local count = GetEnemyCount(450, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, myHero.pos)
			end
		end
	



--Vladimir
		if (myHero:GetSpellData(_R).name == "VladimirHemoplague") and myHero.pos:DistanceTo(target.pos) <= 700 then
			local count = GetEnemyCount(325, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Varus
		if (myHero:GetSpellData(_R).name == "VarusR") and myHero.pos:DistanceTo(target.pos) <= 1075 then
			local count = GetEnemyCount(550, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Volibear
		if (myHero:GetSpellData(_R).name == "VolibearR") then
			local count = GetEnemyCount(500, myHero)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Yasuo

		if (myHero:GetSpellData(_R).name == "YasuoR") and myHero.pos:DistanceTo(target.pos) <= 1400 then
			local count = self:CountKnockedUpEnemies(1400)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R)
			end
		end
	



--Ziggs
		if (myHero:GetSpellData(_R).name == "ZiggsR") and myHero.pos:DistanceTo(target.pos) <= 5300 then
			local count = GetEnemyCount(550, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				if target.pos:To2D().onScreen then						
					Control.CastSpell(HK_R, target.pos) 
				
				elseif not target.pos:To2D().onScreen then			
					CastSpellMM(HK_R, target.pos, 5300, 375)		
				end
			end
		end
	


--Zyra
		if (myHero:GetSpellData(_R).name == "ZyraR") and myHero.pos:DistanceTo(target.pos) <= 700 then
			local count = GetEnemyCount(500, target)
			if count >= self.Menu.Combo.Set.Hit:Value() then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	end
end







--------------------Heal/Shield Ults----------------------------------

function Sylas:HealShieldUlt()
local target = GetTarget(1500)     	
if target == nil then return end	
	if IsValid(target,1500) and self.Menu.Combo.Set.Heal:Value() and Ready(_R) then
		
--Alistar		
		if (myHero:GetSpellData(_R).name == "FerociousHowl") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, myHero)
			end
		end
	


--Dr.Mundo
		if (myHero:GetSpellData(_R).name == "Sadism") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, myHero)
			end
		end
	


--Ekko

		if (myHero:GetSpellData(_R).name == "EkkoR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	



--Fiora

		if (myHero:GetSpellData(_R).name == "FioraR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, target)
			end
		end
	


--Janna

		if (myHero:GetSpellData(_R).name == "ReapTheWhirlwind") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, target)
			end
		end
	


--Jax

		if (myHero:GetSpellData(_R).name == "JaxRelentlessAssault") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	


--Kayle

		if (myHero:GetSpellData(_R).name == "JudicatorIntervention") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, myHero)
			end
		end
	


--Khazix

		if (myHero:GetSpellData(_R).name == "KhazixR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	


--Kindred

		if (myHero:GetSpellData(_R).name == "KindredR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	


--Lulu

		if (myHero:GetSpellData(_R).name == "LuluR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, myHero)
			end
		end
	



--Nasus

		if (myHero:GetSpellData(_R).name == "NasusR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, target)
			end
		end
	


--Renekton

		if (myHero:GetSpellData(_R).name == "RenektonReignOfTheTyrant") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, target)
			end
		end
	


--Singed

		if (myHero:GetSpellData(_R).name == "InsanityPotion") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	



--Sivir

		if (myHero:GetSpellData(_R).name == "SivirR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, myHero)
			end
		end
	


--Soraka

		if (myHero:GetSpellData(_R).name == "SorakaR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	


--Swain

		if (myHero:GetSpellData(_R).name == "SwainMetamorphism") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--Taric

		if (myHero:GetSpellData(_R).name == "TaricR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	


--Tryndamere

		if (myHero:GetSpellData(_R).name == "UndyingRage") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	



--Vladimir

		if (myHero:GetSpellData(_R).name == "VladimirHemoplague") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, target.pos)
			end
		end
	


--XinZhao

		if (myHero:GetSpellData(_R).name == "XenZhaoParry") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R)
			end
		end
	


--Zilean

		if (myHero:GetSpellData(_R).name == "ZileanR") then		 
			if myHero.health/myHero.maxHealth <= self.Menu.Combo.Set.HP:Value()/100 then
				Control.CastSpell(HK_R, myHero)
			end
		end
	end
end	



--------------Tranformation Ults-----------------------------








-------------------------------------------------------------






function Sylas:KillSteal()
if myHero.dead then return end	
	local target = GetTarget(2000)     	
	if target == nil then return end
	
	if IsValid(target,1300) and myHero.pos:DistanceTo(target.pos) <= 1300 then
		local EDmg = getdmg("E", target, myHero)
		if myHero.pos:DistanceTo(target.pos) <= 1200 and myHero.pos:DistanceTo(target.pos) > 400 and EDmg >= target.health and self.Menu.ks.UseE:Value() and Ready(_E) then			
			local EPos = target.pos:Shortened((myHero.pos:DistanceTo(target.pos) - 400))
			Control.SetCursorPos(EPos)
			Control.KeyDown(HK_E)
			Control.KeyUp(HK_E)
			if myHero.pos:DistanceTo(target.pos) <= 800 then	
				local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.radius, E.collision)
				if hitRate and hitRate >= 2 then
					Control.CastSpell(HK_E, aimPosition)
				end	
			end
	
		elseif myHero.pos:DistanceTo(target.pos) <= 400 and EDmg >= target.health and self.Menu.ks.UseE:Value() and Ready(_E) then
			Control.CastSpell(HK_E, target)
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.radius, E.collision)
			if hitRate and hitRate >= 2 then
				Control.CastSpell(HK_E, aimPosition)
			end	
		end			
		
		if myHero.pos:DistanceTo(target.pos) <= 775 and self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= target.health and hitRate and hitRate >= 2 then
				Control.CastSpell(HK_Q, aimPosition)
			end
		elseif myHero.pos:DistanceTo(target.pos) > 775 and myHero.pos:DistanceTo(target.pos) <= 1175 and self.Menu.ks.UseQ:Value() and Ready(_Q) and Ready(_E) then
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= target.health then
				local EPos = target.pos:Shortened((myHero.pos:DistanceTo(target.pos) - 400))
				Control.SetCursorPos(EPos)
				Control.KeyDown(HK_E)
				Control.KeyUp(HK_E)
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)	
			if myHero.pos:DistanceTo(target.pos) <= 775 and hitRate and hitRate >= 2 then	
				Control.CastSpell(HK_Q, aimPosition)
			end
			end
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 400 and self.Menu.ks.UseW:Value() and Ready(_W) then
			local WDmg = getdmg("W", target, myHero)
			if WDmg >= target.health then
				Control.CastSpell(HK_W, target)		
			end
		elseif myHero.pos:DistanceTo(target.pos) > 400 and myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.ks.UseW:Value() and Ready(_W) and Ready(_E) then
			local WDmg = getdmg("W", target, myHero)
			if WDmg >= target.health then
				local EPos = target.pos:Shortened((myHero.pos:DistanceTo(target.pos) - 400))
				Control.SetCursorPos(EPos)
				Control.KeyDown(HK_E)
				Control.KeyUp(HK_E)
			if myHero.pos:DistanceTo(target.pos) <= 400 then	
				Control.CastSpell(HK_W, target)
			end		
			end			
		end					
	end
end	





function Sylas:Combo()
local target = GetTarget(1300)
if target == nil then return end
	
	if IsValid(target,1300) then
		if myHero.pos:DistanceTo(target.pos) <= 800 and myHero:GetSpellData(_E).name == "SylasE2" then	
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.radius, E.collision)
			if hitRate and hitRate >= 1 then
				Control.CastSpell(HK_E, aimPosition)
			end	
		end
		
		if myHero.pos:DistanceTo(target.pos) < 1300 and self.Menu.Combo.UseE:Value() and Ready(_E) then			
			if myHero:GetSpellData(_E).name == "SylasE" then
				Control.CastSpell(HK_E, target.pos)
			end
		end
		local passiveBuff = GetBuffData(myHero,"SylasPassiveAttack")
		if myHero.pos:DistanceTo(target.pos) < 400 and passiveBuff.count == 1 then return end
		if myHero.pos:DistanceTo(target.pos) <= 775 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then 	
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
			if hitRate and hitRate >= 2 then
				Control.CastSpell(HK_Q, aimPosition)
			end	
		end
		if myHero.pos:DistanceTo(target.pos) <= 400 and self.Menu.Combo.UseW:Value() and Ready(_W) then
			Control.CastSpell(HK_W, target)
		end
	end
end

	
  		

function Sylas:Harass()	
local target = GetTarget(1300)
if target == nil then return end

	
	if IsValid(target,1300) and myHero.pos:DistanceTo(target.pos) < 1300 and (myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 ) then
		
		if myHero.pos:DistanceTo(target.pos) <= 800 and myHero:GetSpellData(_E).name == "SylasE2" then	
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.radius, E.collision)
			if hitRate and hitRate >= 1 then
				Control.CastSpell(HK_E, aimPosition)
			end	
		end	 	
		
		if myHero.pos:DistanceTo(target.pos) < 1300 and self.Menu.Harass.UseE:Value() and Ready(_E) then			
			if myHero:GetSpellData(_E).name == "SylasE" then
				Control.CastSpell(HK_E, target.pos)
			end
		end
		local passiveBuff = GetBuffData(myHero,"SylasPassiveAttack")
		if passiveBuff.count == 1 and myHero.pos:DistanceTo(target.pos) < 400 then return end	
		if myHero.pos:DistanceTo(target.pos) <= 775 and self.Menu.Harass.UseQ:Value() and Ready(_Q) then 	
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
			if hitRate and hitRate >= 2 then
				Control.CastSpell(HK_Q, aimPosition)
			end	
		end
		if myHero.pos:DistanceTo(target.pos) <= 400 and self.Menu.Harass.UseW:Value() and Ready(_W) then
			Control.CastSpell(HK_W, target)
		end
	end
end



function Sylas:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)
	local passiveBuff = GetBuffData(myHero,"SylasPassiveAttack")
		
		if minion.team == TEAM_ENEMY and IsValid(minion,1300) and (myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 ) then			
			if myHero.pos:DistanceTo(minion.pos) <= 800 and myHero:GetSpellData(_E).name == "SylasE2" then	
				local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, minion, E.range, E.delay, E.speed, E.radius, false)
				if hitRate and hitRate >= 0 then
					Control.CastSpell(HK_E, aimPosition)
				end	
			end			
			
						
			if myHero.pos:DistanceTo(minion.pos) < 1300 and Ready(_E) and self.Menu.Clear.UseE:Value() and myHero:GetSpellData(_E).name == "SylasE" then
				Control.CastSpell(HK_E, minion)
			end
					
 			if passiveBuff.count == 1 and myHero.pos:DistanceTo(minion.pos) < 400 then return end 
			if myHero.pos:DistanceTo(minion.pos) <= 755 and Ready(_Q) and self.Menu.Clear.UseQL:Value() and GetMinionCount(225, minion) >= self.Menu.Clear.UseQLM:Value() then
				Control.CastSpell(HK_Q, minion)
			end	

			if myHero.pos:DistanceTo(minion.pos) <= 400 and Ready(_W) and self.Menu.Clear.UseW:Value() then
				Control.CastSpell(HK_W, minion)
			end  
		end
	end
end

function Sylas:JungleClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)	
	
 	
		if minion.team == TEAM_JUNGLE and IsValid(minion,1300) and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then	
			
			if myHero.pos:DistanceTo(minion.pos) <= 800 and myHero:GetSpellData(_E).name == "SylasE2" then	
				local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, minion, E.range, E.delay, E.speed, E.radius, false)
				if hitRate and hitRate >= 0 then
					Control.CastSpell(HK_E, aimPosition)
				end	
			end			
						
			if myHero.pos:DistanceTo(minion.pos) < 1300 and Ready(_E) and self.Menu.JClear.UseE:Value() and myHero:GetSpellData(_E).name == "SylasE" then
				Control.CastSpell(HK_E, minion)
			end			
			local passiveBuff = GetBuffData(myHero,"SylasPassiveAttack")
			if passiveBuff.count == 1 and myHero.pos:DistanceTo(minion.pos) < 400 then return end
			if myHero.pos:DistanceTo(minion.pos) <= 775 and Ready(_Q) and self.Menu.JClear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion)
			end

			if myHero.pos:DistanceTo(minion.pos) <= 400 and Ready(_W) and self.Menu.JClear.UseW:Value() then
				Control.CastSpell(HK_W, minion)
			end 
		end
	end
end




-------------------------------------------------------------------------------------------------------------------------------------------------------------



class "Tristana"




function Tristana:CheckSpell(range)
    local target
	for i = 1,Game.HeroCount() do
		local hero = Game.Hero(i)
        if hero.team ~= myHero.team then
			if hero.activeSpell.name == "RocketGrab" then 
				casterPos = hero.pos
				grabTime = hero.activeSpell.startTime * 100
				return true
			end
        end
    end
    return false
end

function Tristana:HpPred(unit, delay)
	if _G.GOS then
	hp =  GOS:HP_Pred(unit,delay)
	else
	hp = unit.health
	end
	return hp
end

function Tristana:IsReady(spell)
	return Game.CanUseSpell(spell) == 0
end

function Tristana:CheckMana(spellSlot)
	return myHero:GetSpellData(spellSlot).mana < myHero.mana
end

function Tristana:CanCast(spellSlot)
	return self:IsReady(spellSlot) and self:CheckMana(spellSlot)
end

function Tristana:__init()
	
	self:LoadSpells()
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end



function Tristana:LoadSpells()

	W = {Range = 900, Width = 250, Delay = 0.25, Speed = 1100, Collision = false, aoe = true, Type = "circle"}
	E = {Range = 517 + (8 * myHero.levelData.lvl), Width = 75, Delay = 0.25, Speed = 2400, Collision = false, aoe = false, Type = "line"}
	R = {Range = 517 + (8 * myHero.levelData.lvl), Width = 0, Delay = 0.25, Speed = 1000, Collision = false, aoe = false, Type = "line"}

end



function Tristana:LoadMenu()
	self.Menu = MenuElement({type = MENU, id = "Tristana", name = "崔丝塔娜"})
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "自动Q爆炸装药时", value = true})
	self.Menu.Combo:MenuElement({id = "UseE", name = "E", value = true})
	self.Menu.Combo:MenuElement({id = "UseR", name = "(R)毁灭射击", tooltip = "is(R)Dmg+(E)Dmg+(E)StackDmg > TargetHP than Ult", value = true})
	self.Menu.Combo:MenuElement({type = MENU, id = "R", name = "R"})
	for i, hero in pairs(GetEnemyHeroes()) do
	self.Menu.Combo.R:MenuElement({id = "RR"..hero.charName, name = "斩杀 R："..hero.charName, value = true})
	end	self.Menu.Combo:MenuElement({id = "comboActive", name = "走砍键", key = string.byte(" ")})
	
	self.Menu:MenuElement({type = MENU, id = "gap", leftIcon = Icons["Gapclose"]})
	self.Menu.gap:MenuElement({id = "UseR", name = "终极Gapclose", value = true})
	self.Menu.gap:MenuElement({id = "gapkey", name = "Gapclose键", key = string.byte("T")})
	

	
	self.Menu:MenuElement({type = MENU, id = "Blitz", leftIcon = Icons["Escape"]})
	self.Menu.Blitz:MenuElement({id = "UseW", name = "自动W", value = true})
	
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu.Harass:MenuElement({id = "UseQ", name = "自动Q爆炸装药时", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "E", value = true})
	self.Menu.Harass:MenuElement({id = "harassActive", name = "骚扰键", key = string.byte("C")})

	
	
	self.Menu:MenuElement({type = MENU, id = "Drawings", leftIcon = Icons["Drawings"]})
	
	--W
	self.Menu.Drawings:MenuElement({type = MENU, id = "W", name = "绘制W范围"})
    self.Menu.Drawings.W:MenuElement({id = "Enabled", name = "启用", value = true})       
    self.Menu.Drawings.W:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
    self.Menu.Drawings.W:MenuElement({id = "Color", name = "颜色", color = Draw.Color(200, 255, 255, 255)})
	--E
	self.Menu.Drawings:MenuElement({type = MENU, id = "E", name = "绘制E范围"})
    self.Menu.Drawings.E:MenuElement({id = "Enabled", name = "启用", value = false})       
    self.Menu.Drawings.E:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
    self.Menu.Drawings.E:MenuElement({id = "Color", name = "颜色", color = Draw.Color(200, 255, 255, 255)})	
	--R
	self.Menu.Drawings:MenuElement({type = MENU, id = "R", name = "绘制R范围"})
    self.Menu.Drawings.R:MenuElement({id = "Enabled", name = "启用", value = true})
    self.Menu.Drawings.R:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
    self.Menu.Drawings.R:MenuElement({id = "Color", name = "颜色", color = Draw.Color(200, 255, 255, 255)})
	

	self.Menu.Drawings:MenuElement({id = "DrawR", name = "绘制大招可杀距离", value = true})


	
	self.Menu:MenuElement({id = "CustomSpellCast", name = "使用自定义拼写", tooltip = "Can fix some casting problems with wrong directions and so", value = true})
	self.Menu:MenuElement({id = "delay", name = "自定义施法延迟", value = 50, min = 0, max = 200, step = 5,tooltip = "", identifier = ""})
	

end

function Tristana:Tick()
if MyHeroReady() then
local Mode = GetMode()
	if Mode == "Combo" then
		if self.Menu.Combo.comboActive:Value() then
			self:Combo()
			self:ComboE()
			self:ComboRKS()
			self:Finisher()
		end	
		if self.Menu.gap.gapkey:Value() then
			self:GapcloseR()
			self:AutoR()

		end
	elseif Mode == "Harass" then
		if self.Menu.Harass.harassActive:Value() then
			self:HarassQ()
			self:HarassE()
		end
	elseif Mode == "Clear" then
	
	elseif Mode == "Flee" then
		
	end

	if self.Menu.Blitz.UseW:Value() then
		self:AntiBlitz()
	end

end
end

function Tristana:Draw()
	if self:CanCast(_W) and self.Menu.Drawings.W.Enabled:Value() then Draw.Circle(myHero, 900, self.Menu.Drawings.W.Width:Value(), self.Menu.Drawings.W.Color:Value()) end
	if self:CanCast(_E) and self.Menu.Drawings.E.Enabled:Value() then Draw.Circle(myHero, GetERange(), self.Menu.Drawings.E.Width:Value(), self.Menu.Drawings.E.Color:Value()) end
	if self:CanCast(_R) and self.Menu.Drawings.R.Enabled:Value() then Draw.Circle(myHero, GetRRange(), self.Menu.Drawings.R.Width:Value(), self.Menu.Drawings.R.Color:Value()) end
	local target = GetTarget(GetRWRange())
	if target == nil then return end
	local textPos = myHero.pos:To2D()	
	if self.Menu.Drawings.DrawR:Value() and IsValid(target, 1500) then 
		if myHero.pos:DistanceTo(target.pos) > R.Range and EnemyInRange(GetRWRange()) then
		local Rdamage = self:RDMG(target)		
		local totalDMG = CalcMagicalDamage(target, Rdamage)
			if totalDMG > self:HpPred(target,1) + target.hpRegen * 1 and not target.dead and self:IsReady(_R) and self:IsReady(_W) then
			Draw.Text("GapcloseKill PressKey", 25, textPos.x - 33, textPos.y + 60, Draw.Color(255, 255, 0, 0))
			end
		end
	end
end	
local timer = {state = false, tick = GetTickCount(), mouse = mousePos, done = false, delayer = GetTickCount()}
function Tristana:AntiBlitz()	
	if GetTickCount() - timer.tick > 300 and GetTickCount() - timer.tick < 700 then 
		timer.state = false
		_G.SDK.Orbwalker:SetMovement(true)
		_G.SDK.Orbwalker:SetAttack(true)
	end

	local ctc = Game.Timer() * 100
	
	local target = GetTarget(900)
	if self.Menu.Blitz.UseW:Value() and self:CheckSpell(900) and grabTime ~= nil and self:CanCast(_W) then 
		if myHero.pos:DistanceTo(target.pos) > 350 then
			if ctc - grabTime >= 28 then
				local jump = myHero.pos:Shortened(target.pos, 700)
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
				Control.SetCursorPos(jump)
				Control.KeyDown(HK_W)
				Control.KeyUp(HK_W)
			end
		else
			if ctc - grabTime >= 12 then
				local jump = myHero.pos:Shortened(target.pos, 700)
				_G.SDK.Orbwalker:SetMovement(false)
				_G.SDK.Orbwalker:SetAttack(false)
				Control.SetCursorPos(jump)
				Control.KeyDown(HK_W)
				Control.KeyUp(HK_W)
			end
		end
	end
end	


function Tristana:Combo()
		local target = GetTarget(GetAARange())
		if target == nil then return end
		for i = 1, target.buffCount do
		local buff = target:GetBuff(i)
			if buff and buff.name == "tristanaechargesound" then
				if IsValid(target,GetAARange()) and EnemyInRange(GetAARange()) and self.Menu.Combo.UseQ:Value() and self:CanCast(_Q) then
					Control.CastSpell(HK_Q)
				end
			end
		end	
	end
	
		


function Tristana:ComboE()
    local target = GetTarget(GetERange())
    if target == nil then return end
	if IsValid(target,GetERange()) and EnemyInRange(GetERange()) then	
		if self.Menu.Combo.UseE:Value() and self:CanCast(_E) then
			Control.CastSpell(HK_E, target)
		end
	end
end
		
function Tristana:ComboRKS()
	local hero = GetTarget(GetRRange())
    if hero == nil then return end
 	if IsValid(hero,GetRRange()) and EnemyInRange(GetRRange()) then
		if self.Menu.Combo.R["RR"..hero.charName]:Value() and self:CanCast(_R) then
		local Rdamage = self:RDMG(hero)   
		local totalDMG = CalcMagicalDamage(hero, Rdamage)
			if totalDMG >= self:HpPred(hero,1) + hero.hpRegen * 1 then
				Control.CastSpell(HK_R, hero)
			end
        end
    end
end

function Tristana:Finisher()
	local hero = GetTarget(GetRRange())
    if hero == nil then return end
	if IsValid(hero,GetRRange()) and EnemyInRange(GetRRange()) then	
		if self.Menu.Combo.UseR:Value() and self:CanCast(_R) then
			Edmg = self:EDMG(hero)
			Rdmg = self:RDMG(hero)	
			calcEdmg = CalcPhysicalDamage(hero, Edmg)
			calcRdmg = CalcMagicalDamage(hero, Rdmg)
			totalDMG = calcEdmg + calcRdmg
			if totalDMG >= self:HpPred(hero,1) + hero.hpRegen * 1 then
			Control.CastSpell(HK_R, hero)
			end
		end
	end
end	

function Tristana:GapcloseR()
	local hero = GetTarget(GetRWRange())
    if hero == nil then return end
		
	if IsValid(hero,GetRWRange()) and EnemyInRange(GetRWRange()) and self.Menu.gap.UseR:Value() and self:CanCast(_R) and self:CanCast(_W) then
		if myHero.pos:DistanceTo(hero.pos) > R.Range then
			local Rdamage = self:RDMG(hero)		
			local totalDMG = CalcMagicalDamage(hero, Rdamage)
			if totalDMG >= self:HpPred(hero,1) + hero.hpRegen * 1 then
				Control.CastSpell(HK_W, hero.pos) 
				self:AutoR()
			end
		end
	end
end	
		
function Tristana:AutoR()
	local hero = GetTarget(GetRRange())
    if hero == nil then return end
	if IsValid(hero,GetRRange()) and EnemyInRange(GetRRange()) and self:CanCast(_R) then
		local Rdamage = self:RDMG(hero)
		local totalDMG = CalcMagicalDamage(hero, Rdamage)
		if  totalDMG > self:HpPred(hero,1) + hero.hpRegen * 1 then
			Control.CastSpell(HK_R, hero)
		
		end
	end
end

function Tristana:HarassQ()
		local target = GetTarget(GetAARange())
		if target == nil then return end
		for i = 1, target.buffCount do
		local buff = target:GetBuff(i)	
			if buff and buff.name == "tristanaechargesound" then
				if IsValid(target,GetAARange()) and EnemyInRange(GetAARange()) and self.Menu.Harass.UseQ:Value() and self:CanCast(_Q) then
					Control.CastSpell(HK_Q)
				end
			end
		end	
	end

function Tristana:HarassE()
    local target = GetTarget(GetERange())
    if target == nil then return end
    if IsValid(target,GetERange()) and EnemyInRange(GetERange()) and self.Menu.Harass.UseE:Value() and self:CanCast(_E) then
		Control.CastSpell(HK_E, target)
		   
	    end
	end
 

-------------------------
-- DMG
---------------------
function Tristana:HasEbuff(unit)
	for i = 1, Game.HeroCount() do
	local hero = Game.Hero(i)
	for i = 1, hero.buffCount do
		local buff = hero:GetBuff(i)
		if HasBuff(hero, "tristanaechargesound") then
		if buff then
			return true
		end
	end
	return false
end
end
end

function Tristana:GetEstacks(unit)

	local stacks = 0
	if self:HasEbuff(unit) then
		for i = 1, unit.buffCount do
			local buff = unit:GetBuff(i)
			if buff and buff.count > 0 and buff.name:lower() == "tristanaecharge" then
				stacks = buff.count
			end
		end
	end
	return stacks
end



function Tristana:RDMG(unit)
    total = 0
	local rLvl = myHero:GetSpellData(_R).level
    if rLvl > 0 then
	local rdamage = (({300,400,500})[rLvl] + myHero.ap) 
	total = rdamage 
	end
	return total
end

function Tristana:AADMG(unit)
    total = 0
	local AALvl = myHero.levelData.lvl

	local AAdamage = 58 + ( 2 * AALvl)
	total = AAdamage 
	return total
end

function Tristana:GetStackDmg(unit)

	local total = 0
	local eLvl = myHero:GetSpellData(_E).level
	if eLvl > 0 then
		local raw = ({ 21, 24, 27, 30, 33 })[eLvl]
		local m = ({ 0.15, 0.21, 0.27, 0.33, 0.39 })[eLvl]
		local bonusDmg = (m * myHero.bonusDamage) + (0.15 * myHero.ap)
		total = (raw + bonusDmg) * self:GetEstacks(unit)
	end
	return total
end

function Tristana:EDMG(unit)
	local total = 0
	local eLvl = myHero:GetSpellData(_E).level
	if eLvl > 0 then
		local raw = ({ 70, 80, 90, 100, 110 })[eLvl]
		local m = ({ 0.5, 0.7, 0.9, 1.1, 1.3 })[eLvl]
		local bonusDmg = (m * myHero.bonusDamage) + (0.5 * myHero.ap)
		total = raw + bonusDmg
		total = total + self:GetStackDmg(unit)  
	end
	return total
end	

function GetRRange()
	local level = myHero.levelData.lvl
	local range = 517 + ( 8 * level)
	return range
end

function GetRWRange()
	local rrange = GetRRange()
	local wrange = W.Range
	local range = rrange + wrange
	return range
end

function GetERange()
	local level = myHero.levelData.lvl
	local range = 517 + ( 8 * level)
	return range
end

function GetAARange()
	local level = myHero.levelData.lvl
	local range = 517 + ( 8 * level)
	return range
end




-------------------------------------------------------------------------------------------------------------------------------------------------------------



class "Veigar"





function Veigar:__init()
	
	self:LoadSpells()
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)

	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end	
end

function GetPercentMP(unit)
	return (unit.mana / unit.maxMana) * 100
end

function Veigar:IsReady(spell)
	return Game.CanUseSpell(spell) == 0
end

function Veigar:CheckMana(spellSlot)
	return myHero:GetSpellData(spellSlot).mana < myHero.mana
end

function Veigar:CanCast(spellSlot)
	return self:IsReady(spellSlot) and self:CheckMana(spellSlot)
end

function Veigar:HpPred(unit, delay)
	if _G.GOS then
	hp =  GOS:HP_Pred(unit,delay)
	else
	hp = unit.health
	end
	return hp
end

function Veigar:LoadSpells()

	Q = {Range = 950, Width = 70, Delay = 0.25, Speed = 2000, Collision = false, aoe = false, Type = "line"}
	W = {Range = 900, Width = 225, Delay = 1.35, Speed = 1000, Collision = false, aoe = true, Type = "circular"}
	E = {Range = 700, Width = 375, Delay = 0.5, Speed = 1000, Collision = false, aoe = true, Type = "circular"}
	R = {Range = 650, Width = 50, Delay = 0.25, Speed = 1400, Collision = false, aoe = false, Type = "line"}

end

function Veigar:QDMG()
    local level = myHero:GetSpellData(_Q).level
    local qdamage = (({70,110,150,190,230})[level] + 0.60 * myHero.ap)
	return qdamage
end

function Veigar:WDMG()
    local level = myHero:GetSpellData(_W).level
    local wdamage = (({100,150,200,250,300})[level] + myHero.ap)
	return wdamage
end

function Veigar:RDMG()
    local level = myHero:GetSpellData(_R).level
    local rdamage = GetPercentHP(target) > 33.3 and ({175, 250, 325})[level] + 0.75 * myHero.ap or ({350, 500, 650})[level] + 1.5 * myHero.ap; return rdamage +((0.015 * rdamage) * (100 - ((target.health / target.maxHealth) * 100)))

end

local qData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 100, Range = 950, Speed = 2000, Collision = true ,MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION,_G.COLLISION_YASUOWALL}
}

local WData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 1.25, Radius = 112, Range = 900, Speed = 1000, Collision = false
}

local EData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.5, Radius = 375, Range = 700, Speed = 1000, Collision = false
}


function Veigar:LoadMenu()
	self.Menu = MenuElement({type = MENU, id = "Veigar", name = "维迦"})
	self.Menu:MenuElement({id = "Combo", leftIcon = Icons["Combo"], type = MENU})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "Q", value = true})
	self.Menu.Combo:MenuElement({id = "UseW", name = "W", value = true})
	self.Menu.Combo:MenuElement({id = "UseE", name = "E", value = true})
	self.Menu.Combo:MenuElement({id = "WWait", name = "惊呆了时才W", value = true})
	self.Menu.Combo:MenuElement({id = "EMode", name = "E模式", drop = {"Edge", "Middle"}})
	self.Menu.Combo:MenuElement({id = "comboActive", name = "走砍键", key = string.byte(" ")})
		
	self.Menu:MenuElement({id = "Harass", leftIcon = Icons["Harass"], type = MENU})
	self.Menu.Harass:MenuElement({id = "UseQ", name = "Q", value = true})
	self.Menu.Harass:MenuElement({id = "AutoQ", name = "自动Q开关", value = false, toggle = true, key = string.byte("U")})
	self.Menu.Harass:MenuElement({id = "UseW", name = "W", value = true})
	self.Menu.Harass:MenuElement({id = "harassActive", name = "骚扰键", key = string.byte("C")})
	
	self.Menu:MenuElement({id = "Lasthit", leftIcon = Icons["Lasthit"], type = MENU})
	self.Menu.Lasthit:MenuElement({id = "UseQ", name = "Q", value = true})
	self.Menu.Lasthit:MenuElement({id = "AutoQFarm", name = "自动Q小兵", value = false, toggle = true, key = string.byte("Z")})
	self.Menu.Lasthit:MenuElement({id = "lasthitActive", name = "最后一击键", key = string.byte("X")})
	
	self.Menu:MenuElement({id = "Clear", leftIcon = Icons["Clear"], type = MENU})
	self.Menu.Clear:MenuElement({id = "UseW", name = "W", value = true})
	self.Menu.Clear:MenuElement({id = "WHit", name = "W击中X小兵", value = 3,min = 1, max = 6, step = 1})
	self.Menu.Clear:MenuElement({id = "clearActive", name = "清线键", key = string.byte("V")})
	
	self.Menu:MenuElement({id = "Mana", leftIcon = Icons["Mana"], type = MENU})
	self.Menu.Mana:MenuElement({id = "QMana", name = "使用Q的最小法力", value = 35, min = 0, max = 100, step = 1})
	self.Menu.Mana:MenuElement({id = "WMana", name = "使用W的最小法力值", value = 40, min = 0, max = 100, step = 1})
	
	self.Menu:MenuElement({id = "Killsteal", leftIcon = Icons["ks"], type = MENU})
	self.Menu.Killsteal:MenuElement({id = "UseQ", name = "Q", value = true})
	self.Menu.Killsteal:MenuElement({id = "UseW", name = "W", value = false})
	self.Menu.Killsteal:MenuElement({id = "RR", name = "R", value = true})

	self.Menu:MenuElement({id = "isCC", leftIcon = Icons["AutoUseCC"], type = MENU})
	self.Menu.isCC:MenuElement({id = "UseQ", name = "Q", value = true})
	self.Menu.isCC:MenuElement({id = "UseW", name = "W", value = true})
	self.Menu.isCC:MenuElement({id = "UseE", name = "E", value = false})
	self.Menu.isCC:MenuElement({id = "EMode", name = "E模式", drop = {"Edge", "Middle"}})

	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredW", name = "机会[W]", value = 2, drop = {"Normal", "High", "Immobile"}})
	self.Menu.Pred:MenuElement({id = "PredE", name = "机会[E]", value = 2, drop = {"Normal", "High", "Immobile"}})	



end

function Veigar:Tick()
if MyHeroReady() then
local Mode = GetMode()
	if Mode == "Combo" then
		if self.Menu.Combo.comboActive:Value() then
			self:Combo()
		end
	elseif Mode == "Harass" then
		if self.Menu.Harass.harassActive:Value() then
			self:Harass()
		end
	elseif Mode == "Clear" then
		if self.Menu.Clear.clearActive:Value() then
			self:Clear()
		end	
	end

	if self.Menu.Lasthit.lasthitActive:Value() then
		self:Lasthit()
	end

	self:KS()
	self:SpellonCC()
	self:AutoQ()
	self:AutoQFarm()
end
end



function Veigar:Clear()
	for i = 1, Game.MinionCount() do
	local minion = Game.Minion(i)
		if IsValid(minion,1000) and myHero.pos:DistanceTo(minion.pos) <= 900 and self.Menu.Clear.UseW:Value() then
			if minion.team == TEAM_ENEMY then
				
				local count = GetMinionCount(120, minion)
				if count >= self.Menu.Clear.WHit:Value() and self:CanCast(_W) and (myHero.mana/myHero.maxMana >= self.Menu.Mana.WMana:Value() / 100 ) then
					Control.CastSpell(HK_W,minion.pos)
				end
			end
			if minion.team == TEAM_JUNGLE then
				if self:CanCast(_W) and (myHero.mana/myHero.maxMana >= self.Menu.Mana.WMana:Value() / 100 ) then
					Control.CastSpell(HK_W,minion.pos)
				end	
			end
		end
	end	
end

function Veigar:Combo()
local target = GetTarget(1000)
if target == nil then return end
if IsValid(target,1000) then	
	if EnemyInRange(Q.Range) then	
		if self.Menu.Combo.UseQ:Value() and self:CanCast(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
		    end
	    end
    end
	

	if EnemyInRange(E.Range) then	
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if self.Menu.Combo.UseE:Value() and self:CanCast(_E) and pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			if self.Menu.Combo.EMode:Value() == 1 then
				Control.CastSpell(HK_E, Vector(target:GetPrediction(math.huge,0.25))-Vector(Vector(target:GetPrediction(math.huge,0.25))-Vector(myHero.pos)):Normalized()*350) 
			elseif self.Menu.Combo.EMode:Value() == 2 then
				Control.CastSpell(HK_E,pred.CastPosition)
			end
		end	
	end
	

	if EnemyInRange(W.Range) then	
		if self.Menu.Combo.UseW:Value() and self:CanCast(_W) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
		    local ImmobileEnemy = IsImmobileTarget(target)
			if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
				if self.Menu.Combo.WWait:Value() and ImmobileEnemy then 
					Control.CastSpell(HK_W, pred.CastPosition)
				elseif self.Menu.Combo.WWait:Value() == false then 
					Control.CastSpell(HK_W, pred.CastPosition)	
				end
			end
		end
    end
end
end	

function Veigar:Harass()
local target = GetTarget(1000)
if target == nil then return end
if IsValid(target,1000) then    
	
	if EnemyInRange(Q.Range) then
		if self.Menu.Harass.UseQ:Value() and self:CanCast(_Q) and (myHero.mana/myHero.maxMana >= self.Menu.Mana.QMana:Value() / 100 ) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
		    end
	    end
    end
 

	if EnemyInRange(W.Range) then	
		if self.Menu.Harass.UseW:Value() and self:CanCast(_W) and (myHero.mana/myHero.maxMana >= self.Menu.Mana.WMana:Value() / 100 ) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
		    if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
				Control.CastSpell(HK_W, pred.CastPosition)
		    end
	    end
    end
end
end

function Veigar:AutoQ()
	local target = GetTarget(Q.Range)
	if target == nil then return end
	
	if IsValid(target,1000) and EnemyInRange(Q.Range) then 
		if self.Menu.Harass.AutoQ:Value() and self:CanCast(_Q) and (myHero.mana/myHero.maxMana >= self.Menu.Mana.QMana:Value() / 100 ) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 and self:CanCast(_Q) then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
	end
end
	
function Veigar:AutoQFarm()
	for i = 1, Game.MinionCount() do
	local minion = Game.Minion(i)
			
		if minion.team == TEAM_ENEMY and IsValid(minion,1000) and myHero.pos:DistanceTo(minion.pos) < Q.Range then
			local Qdamage = self:QDMG()
			if self:CanCast(_Q) and self.Menu.Lasthit.AutoQFarm:Value() and Qdamage >= minion.health and (myHero.mana/myHero.maxMana >= self.Menu.Mana.QMana:Value() / 100 ) then	
				Control.CastSpell(HK_Q,minion.pos)
			
			end
		end
	end
end

function Veigar:Lasthit()
	for i = 1, Game.MinionCount() do
	local minion = Game.Minion(i)
			
		if minion.team == TEAM_ENEMY and IsValid(minion,1000) and myHero.pos:DistanceTo(minion.pos) < Q.Range then
			if self.Menu.Lasthit.UseQ:Value() and self:CanCast(_Q) then
				local Qdamage = self:QDMG()
				if Qdamage >= self:HpPred(minion,1) then
				Control.CastSpell(HK_Q,minion.pos)
				end
			end
		end
	end
end
	
	
function Veigar:KS()
local target = GetTarget(950)
if target == nil then return end
	
	if IsValid(target,Q.Range) and EnemyInRange(Q.Range) then 	
		if self.Menu.Killsteal.UseQ:Value() and self:CanCast(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
		   	local Qdamage = Veigar:QDMG()
			if Qdamage >= self:HpPred(target,1) + target.hpRegen * 1 and not target.dead then
				if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end
			end
		end
	end
	if IsValid(target,W.Range) and EnemyInRange(W.Range) then	
		if self.Menu.Killsteal.UseW:Value() and self:CanCast(_W) then 
			local pred = GetGamsteronPrediction(target, WData, myHero)
		   	local Wdamage = self:WDMG()
			if Wdamage >= self:HpPred(target,1) + target.hpRegen * 1 and not target.dead then
				if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 then
					Control.CastSpell(HK_W, pred.CastPosition)
				end
			end
		end
	end	
	if IsValid(target,R.Range) and EnemyInRange(R.Range) and self.Menu.Killsteal.RR:Value() and self:CanCast(_R) then   
		local level = myHero:GetSpellData(_R).level	
		local dmg = GetPercentHP(target) > 33.3 and ({175, 250, 325})[level] + 0.75 * myHero.ap or ({350, 500, 650})[level] + 1.50 * myHero.ap
		local Rdamage = dmg +((0.015 * dmg) * (100 - ((target.health / target.maxHealth) * 100)))

		if Rdamage >= self:HpPred(target,1) * 1.2 + target.hpRegen * 2 then
			Control.CastSpell(HK_R, target)
		end
	end	
end




function Veigar:SpellonCC()
local target = GetTarget(950)
if target == nil then return end
		
	if IsValid(target,Q.Range) and EnemyInRange(Q.Range) then	
		if self.Menu.isCC.UseQ:Value() and self:CanCast(_Q) then
			local ImmobileEnemy = IsImmobileTarget(target)
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if ImmobileEnemy then
				if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
					Control.CastSpell(HK_Q, pred.CastPosition)
				end
			end
		end
	end
	if IsValid(target,E.Range) and EnemyInRange(E.Range) then	
		local ImmobileEnemy = IsImmobileTarget(target)
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if self.Menu.isCC.UseE:Value() and self:CanCast(_E) and ImmobileEnemy and pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			if self.Menu.Combo.EMode:Value() == 1 then
				Control.CastSpell(HK_E, Vector(target:GetPrediction(math.huge,0.25))-Vector(Vector(target:GetPrediction(math.huge,0.25))-Vector(myHero.pos)):Normalized()*350) 
			elseif self.Menu.Combo.EMode:Value() == 2 then
				Control.CastSpell(HK_E,pred.CastPosition)
			end
		end	
	end	
	if IsValid(target,W.Range) and EnemyInRange(W.Range) then 	
		if self.Menu.isCC.UseW:Value() and self:CanCast(_W) then
			local ImmobileEnemy = IsImmobileTarget(target)
			local pred = GetGamsteronPrediction(target, WData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredW:Value() + 1 and ImmobileEnemy then
				Control.CastSpell(HK_W, pred.CastPosition)
			end
		end
	end	
end






-------------------------------------------------------------------------------------------------------------------------------------------------------------



class "Warwick"


function Warwick:__init()
	
	self:LoadSpells()
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end


local barHeight = 8
local barWidth = 103
local barXOffset = 0
local barYOffset = 0



		
function Warwick:IsReady(spell)
	return Game.CanUseSpell(spell) == 0
end

function Warwick:CheckMana(spellSlot)
	return myHero:GetSpellData(spellSlot).mana < myHero.mana
end

function Warwick:CanCast(spellSlot)
	return self:IsReady(spellSlot) and self:CheckMana(spellSlot)
end

function Warwick:QDmg()
	total = 0
	local qLvl = myHero:GetSpellData(_Q).level
    if qLvl > 0 then
	local qdamage = 1.2 * myHero.totalDamage + 0.9 * myHero.ap + (({6, 6.5, 7, 7.5, 8})[qLvl] / 100  * target.maxHealth)
	total = qdamage
	end
	return total

end

function Warwick:RDmg()
	total = 0
	local rLvl = myHero:GetSpellData(_R).level
    if rLvl > 0 then
	local rdamage = (({175,350,525})[rLvl] + 1.67 * myHero.totalDamage)
	total = rdamage
	end
	return total

end

function Warwick:HpPred(unit, delay)
	if _G.GOS then
	hp =  GOS:HP_Pred(unit,delay)
	else
	hp = unit.health
	end
	return hp
end

function Warwick:LoadSpells()
	Q = { range = myHero:GetSpellData(_Q).range, delay = myHero:GetSpellData(_Q).delay, speed = myHero:GetSpellData(_Q).speed, width = myHero:GetSpellData(_Q).width }
	W = { range = myHero:GetSpellData(_W).range, delay = myHero:GetSpellData(_W).delay, speed = myHero:GetSpellData(_W).speed, width = myHero:GetSpellData(_W).width }
	E = { range = myHero:GetSpellData(_E).range, delay = myHero:GetSpellData(_E).delay, speed = myHero:GetSpellData(_E).speed, width = myHero:GetSpellData(_E).width }
	R = { range = myHero:GetSpellData(_R).range, delay = myHero:GetSpellData(_R).delay, speed = myHero:GetSpellData(_R).speed, width = myHero:GetSpellData(_R).width }

end

function Warwick:LoadMenu()
	self.Menu = MenuElement({type = MENU, id = "PussyWarwick", name = "沃里克"})
	self.Menu:MenuElement({id = "ComboMode", leftIcon = Icons["Combo"], type = MENU})
	self.Menu.ComboMode:MenuElement({id = "UseQ", name = "Q:野兽之口", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseW", name = "W：鲜血追猎", value = true})
	self.Menu.ComboMode:MenuElement({id = "UseE", name = "E：远祖嗥叫", value = true})
	self.Menu.ComboMode:MenuElement({id = "Key", name = "触发:E延迟键", key = string.byte("T"), toggle = true})
	self.Menu.ComboMode:MenuElement({id = "UseR", name = "R：无尽束缚", value = true})
	self.Menu.ComboMode:MenuElement({id = "comboActive", name = "走砍键", key = string.byte(" ")})
	self.Menu.ComboMode:MenuElement({id = "UseHYDRA", name = "使用九头蛇", value = true})
	self.Menu.ComboMode:MenuElement({id = "DrawDamage", name = "画出可杀死", value = true})
	self.Menu.ComboMode:MenuElement({id = "DrawRange", name = "绘制R范围", value = true})	
		
	self.Menu:MenuElement({id = "HarassMode", leftIcon = Icons["Harass"], type = MENU})
	self.Menu.HarassMode:MenuElement({id = "UseQ", name = "Q:野兽之口", value = true})
	self.Menu.HarassMode:MenuElement({id = "UseW", name = "W：鲜血追猎", value = true})
	self.Menu.HarassMode:MenuElement({id = "UseE", name = "E：远祖嗥叫", value = true})
	self.Menu.HarassMode:MenuElement({id = "harassActive", name = "骚扰键", key = string.byte("C")})

	self.Menu:MenuElement({id = "ClearMode", leftIcon = Icons["Clear"], type = MENU})
	self.Menu.ClearMode:MenuElement({id = "UseQ", name = "Q:野兽之口", value = true})
	self.Menu.ClearMode:MenuElement({id = "UseW", name = "W：鲜血追猎", value = true})
	self.Menu.ClearMode:MenuElement({id = "UseE", name = "E：远祖嗥叫", value = true})
	self.Menu.ClearMode:MenuElement({id = "clearActive", name = "清线键", key = string.byte("V")})
		
	
	self.Menu:MenuElement({id = "CustomSpellCast", name = "使用自定义拼写", tooltip = "Can fix some casting problems with wrong directions and so", value = true})
	self.Menu:MenuElement({id = "delay", name = "自定义施法延迟", value = 100, min = 0, max = 200, step = 5,tooltip = "increase this one if spells is going completely wrong direction", identifier = ""})
	
end

function Warwick:Tick()
if MyHeroReady() then
	local Mode = GetMode()
		if Mode == "Combo" then
			if self.Menu.ComboMode.comboActive:Value() then
				self:Combo()
			end

		elseif Mode == "Harass" then
			if self.Menu.HarassMode.harassActive:Value() then
				self:Harass()
			end
		elseif Mode == "Clear" then
			if self.Menu.ClearMode.clearActive:Value() then
				self:Jungle()
			end
		elseif Mode == "Flee" then
		
		end

	if self.Menu.ComboMode.DrawDamage:Value() then
	self:Draw()
	end
end	
end	

function Warwick:Draw()
local textPos = myHero.pos:To2D()
  
	if self.Menu.ComboMode.DrawRange:Value() and self:CanCast(_R) then Draw.Circle(myHero.pos, (2.5 * myHero.ms), Draw.Color(255, 000, 222, 255)) end
	if self.Menu.ComboMode.DrawDamage:Value() then
		for i, hero in pairs(GetEnemyHeroes()) do
			local barPos = hero.hpBar
			if not hero.dead and hero.pos2D.onScreen and barPos.onScreen and hero.visible then
				local QDamage = (self:CanCast(_Q) and self:QDmg() or 0)
				local RDamage = (self:CanCast(_R) and self:RDmg() or 0)
				local damage = QDamage + RDamage
				if damage > self:HpPred(hero,1) + hero.hpRegen * 1 then
					Draw.Text("killable", 24, hero.pos2D.x, hero.pos2D.y,Draw.Color(0xFF00FF00))
					
				else
					local percentHealthAfterDamage = math.max(0, hero.health - damage) / hero.maxHealth
					local xPosEnd = barPos.x + barXOffset + barWidth * hero.health/hero.maxHealth
					local xPosStart = barPos.x + barXOffset + percentHealthAfterDamage * 100
					Draw.Line(xPosStart, barPos.y + barYOffset, xPosEnd, barPos.y + barYOffset, 10, Draw.Color(0xFF00FF00))
				end
			end
		end	
	end
	if self.Menu.ComboMode.Key:Value() then
		Draw.Text("Insta E: On", 20, textPos.x - 33, textPos.y + 50, Draw.Color(255, 000, 255, 000)) 
	else
		Draw.Text("Insta E: Off", 20, textPos.x - 33, textPos.y + 50, Draw.Color(255, 225, 000, 000)) 
	end
end

function UseHydra()
	local HTarget = GetTarget(300)
	if HTarget then 
		local hydraitem = GetInventorySlotItem(3748) or GetInventorySlotItem(3077) or GetInventorySlotItem(3074)
		if hydraitem and myHero.attackData.state == STATE_WINDDOWN then
			Control.CastSpell(keybindings[hydraitem],HTarget.pos)
            Control.Attack(HTarget)
		end
	end
end
   
function UseHydraminion()
    for i = 1, Game.MinionCount() do
	local minion = Game.Minion(i)
        if minion and minion.team == 300 or minion.team ~= myHero.team then 
			local hydraitem = GetInventorySlotItem(3748) or GetInventorySlotItem(3077) or GetInventorySlotItem(3074)
			if hydraitem and myHero.attackData.state == STATE_WINDDOWN then
				Control.CastSpell(keybindings[hydraitem])
                Control.Attack(minion)
			end
		end
    end
end

function Warwick:Combo()
    if self.Menu.ComboMode.UseHYDRA:Value() and HasBuff(myHero, "Blood Hunt") and EnemyInRange(300) then
        if myHero.attackData.state == STATE_WINDDOWN then
            UseHydra()
        end
    end

    if self:CanCast(_E) then 
		local ETarget = GetTarget(375)
		if self.Menu.ComboMode.UseE:Value() and self.Menu.ComboMode.Key:Value() == false and ETarget and HasBuff(myHero, "Primal Howl") then
			if EnemyInRange(375) and myHero.pos:DistanceTo(ETarget.pos) < 375 then
				Control.CastSpell(HK_E)
			end
		end
        if self.Menu.ComboMode.UseE:Value() and self.Menu.ComboMode.Key:Value() == true and ETarget and not HasBuff(myHero, "Primal Howl") then
			if EnemyInRange(375) and self:CanCast(_E) and myHero.pos:DistanceTo(ETarget.pos) < 375 then
				Control.CastSpell(HK_E)
			end
		end
	end

	if self:CanCast(_Q) and EnemyInRange(350) then 
		local QTarget = GetTarget(350)
		if self.Menu.ComboMode.UseQ:Value() and QTarget then
            if EnemyInRange(350) and myHero.pos:DistanceTo(QTarget.pos) < 350 and myHero.pos:DistanceTo(QTarget.pos) > 125 then
				Control.CastSpell(HK_Q, QTarget)
            end
		end
	end

    if self:CanCast(_R) then 
        local rRange = 2.5 * myHero.ms
		local target = GetTarget(rRange)
		if target == nil then return end
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, rRange, 0.1, 1800, 55, false)
        if self.Menu.ComboMode.UseR:Value() then
			if myHero.pos:DistanceTo(target.pos) < rRange and hitRate and hitRate >= 1 then
			if EnemiesAround(target, 500) >= 2 then self:CastER(target) return end	
				if aimPosition:To2D().onScreen then
					Control.CastSpell(HK_R, aimPosition)
					
				elseif not aimPosition:To2D().onScreen then	
				local castPos = myHero.pos:Extended(aimPosition.pos, 1000)
					Control.CastSpell(HK_R, castPos)
				end	
			end	
        end
    end
	

    if EnemyInRange(600) and not self:CanCast(_Q) then 
        local BTarget = GetTarget(600)
        if BTarget then
            if myHero.pos:DistanceTo(BTarget.pos) < 600 then
			    UseHydra()
            end
        end
    end
end

function Warwick:CastER(target)
local rRange = 2.5 * myHero.ms  
	if HasBuff(myHero, "Primal Howl") then
		if myHero.pos:DistanceTo(target) < 150 then
			Control.CastSpell(HK_E)
		end
	end	
	
	if self:CanCast(_E) then 
		if not HasBuff(myHero, "Primal Howl") then
			Control.CastSpell(HK_E)
		end
	end
	
	
	local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, rRange, 0.1, 1800, 55, false)
	if hitRate and hitRate >= 1 then	
		if aimPosition:To2D().onScreen then
			Control.CastSpell(HK_R, aimPosition)
					
		elseif not aimPosition:To2D().onScreen then	
		local castPos = myHero.pos:Extended(aimPosition.pos, 1000)
			Control.CastSpell(HK_R, castPos)
		end
	end
	if HasBuff(myHero, "Primal Howl") then
		if myHero.pos:DistanceTo(target) < 150 then
			Control.CastSpell(HK_E)
		end
	end	
end


function Warwick:Harass()
    if self.Menu.ComboMode.UseHYDRA:Value() and HasBuff(myHero, "Blood Hunt") and EnemyInRange(300) then
        if myHero.attackData.state == STATE_WINDDOWN then
            UseHydra()
        end
    end
    if self:CanCast(_E) then 
		local ETarget = GetTarget(375)
		if self.Menu.HarassMode.UseE:Value() and self.Menu.ComboMode.Key:Value() == false and ETarget and HasBuff(myHero, "Primal Howl") then
			if EnemyInRange(375) and myHero.pos:DistanceTo(ETarget.pos) < 375 then
				Control.CastSpell(HK_E)
			end
		end
        if self.Menu.HarassMode.UseE:Value() and self.Menu.ComboMode.Key:Value() == true and ETarget and not HasBuff(myHero, "Primal Howl") then
			if EnemyInRange(375) and self:CanCast(_E) and myHero.pos:DistanceTo(ETarget.pos) < 375 then
				Control.CastSpell(HK_E)
			end
		end
	end

	if self:CanCast(_Q) then 
		local QTarget = GetTarget(350)
		if self.Menu.HarassMode.UseQ:Value() and QTarget then
            if EnemyInRange(350) and myHero.pos:DistanceTo(QTarget.pos) < 350 and myHero.pos:DistanceTo(QTarget.pos) > 125 then
				Control.CastSpell(HK_Q, QTarget)
            end
		end
	end

	if self:CanCast(_W) then 
		local WTarget = GetTarget(125)
		if self.Menu.HarassMode.UseW:Value() and WTarget then
			if EnemyInRange(125) and myHero.attackData.state == STATE_WINDDOWN then
				Control.CastSpell(HK_W)
                Control.Attack(WTarget)
			end
		end
	end
end

function Warwick:Jungle()
	for i = 1, Game.MinionCount() do
	local minion = Game.Minion(i)
    if minion.team == TEAM_ENEMY or minion.team == TEAM_JUNGLE and myHero.pos:DistanceTo(minion.pos) < 375 then
		if self:CanCast(_E) and minion then 
			if self.Menu.ClearMode.UseE:Value() and self.Menu.ComboMode.Key:Value()  == false and HasBuff(myHero, "Primal Howl") then
				if myHero.pos:DistanceTo(minion.pos) < 375 then
					Control.CastSpell(HK_E)
				end
			end
			if self.Menu.ClearMode.UseE:Value() and self.Menu.ComboMode.Key:Value()  == true and not HasBuff(myHero, "Primal Howl") then
				if myHero.pos:DistanceTo(minion.pos) < 375 and self:CanCast(_E) then
					Control.CastSpell(HK_E)
				end
			end
		end	

		if self.Menu.ComboMode.UseHYDRA:Value() and not HasBuff(myHero, "Blood Hunt") and minion then
			if myHero.attackData.state == STATE_WINDDOWN and not self:CanCast(_W) and myHero.pos:DistanceTo(minion.pos) < 300 then
				UseHydraminion()
			end
		end
		if self:CanCast(_Q) and minion then 
			if self.Menu.ClearMode.UseQ:Value() and IsValid(minion, 350) then
				if myHero.pos:DistanceTo(minion.pos) < 350 and myHero.pos:DistanceTo(minion.pos) > 125 then
				Control.CastSpell(HK_Q, minion)
				end
			end
		end

		if self:CanCast(_W) and minion then 
			if self.Menu.ClearMode.UseW:Value() and IsValid(minion, 175) then
				if myHero.pos:DistanceTo(minion.pos) < 175 and myHero.attackData.state == STATE_WINDDOWN then
					Control.CastSpell(HK_W)
					Control.Attack(minion)
				end
			end
		end
	end
	end
end




--------------------------------------------------------------------------------------------------------------------------------------------------------------

class "Xerath"
--require('GamsteronPrediction')


local QData =
{
Type = _G.SPELLTYPE_LINE, Collision = false, Delay = 0.35 + Game.Latency()/1000, Radius = 145, Range = 1400, Speed = math.huge
}

local WData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.5, Radius = 200, Range = 1100, Speed = math.huge, Collision = false
}

local EData =
{
Type = _G.SPELLTYPE_LINE, Collision = true, Delay = 0.25, Radius = 30, Range = 1050, Speed = 2300, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION, _G.COLLISION_YASUOWALL}
}

local RData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 1.0, Radius = 200, Range = 2200 + 1320*myHero:GetSpellData(_R).level, Speed = math.huge, Collision = false
}



function Xerath:__init()
	
	
	print("Xerath loaded!")

	self:LoadMenu()	
	self:LoadSpells()
	self.AA = { delay = 0.25, speed = 2000, width = 0, range = 525 }
	self.Q = { delay = 0.35, speed = math.huge, width = 145, range = 750 }
	self.W = { delay = 0.5, speed = math.huge, width = 200, range = 1100 }
	self.E = { delay = 0.25, speed = 2300, width = 30, range = 1050 }
	self.R = { delay = 0.5, speed = math.huge, width = 200, range = 3520 }
	self.range = 525
	self.chargeQ = false
	self.qTick = GetTickCount()
	self.chargeR = false
	self.chargeRTick = GetTickCount()
	self.R_target = nil
	self.R_target_tick = GetTickCount()
	self.firstRCast = true
	self.R_Stacks = 0
	self.lastRtick = GetTickCount()
	self.CanUseR = true
	self.lastTarget = nil
	self.lastTarget_tick = GetTickCount()
	self.lastMinion = nil
	self.lastMinion_tick = GetTickCount()	
	
	
	function OnTick() self:Tick() end
 	function OnDraw() self:Draw() end
end


local _EnemyHeroes
function Xerath:GetEnemyHeroes()
  if _EnemyHeroes then return _EnemyHeroes end
  for i = 1, Game.HeroCount() do
    local unit = Game.Hero(i)
    if unit.isEnemy then
	  if _EnemyHeroes == nil then _EnemyHeroes = {} end
      table.insert(_EnemyHeroes, unit)
    end
  end
  return {}
end

function Xerath:IsImmobileTarget(unit)
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i)
		if buff and (buff.type == 5 or buff.type == 11 or buff.type == 29 or buff.type == 24 or buff.name == "recall") and buff.count > 0 then
			return true
		end
	end
	return false	
end

local function CanUseSpell(spell)
	return myHero:GetSpellData(spell).currentCd == 0 and myHero:GetSpellData(spell).level > 0 and myHero:GetSpellData(spell).mana <= myHero.mana
end

local function GetPercentHP(unit)
  if type(unit) ~= "userdata" then error("{GetPercentHP}: bad argument #1 (userdata expected, got "..type(unit)..")") end
  return 100*unit.health/unit.maxHealth
end

local function GetPercentMP(unit)
  if type(unit) ~= "userdata" then error("{GetPercentMP}: bad argument #1 (userdata expected, got "..type(unit)..")") end
  return 100*unit.mana/unit.maxMana
end

local function GetBuffs(unit)
  local t = {}
  for i = 0, unit.buffCount do
    local buff = unit:GetBuff(i)
    if buff.count > 0 then
      table.insert(t, buff)
    end
  end
  return t
end


function IsImmune(unit)
  if type(unit) ~= "userdata" then error("{IsImmune}: bad argument #1 (userdata expected, got "..type(unit)..")") end
  for i, buff in pairs(GetBuffs(unit)) do
    if (buff.name == "KindredRNoDeathBuff" or buff.name == "UndyingRage") and GetPercentHP(unit) <= 10 then
      return true
    end
    if buff.name == "VladimirSanguinePool" or buff.name == "JudicatorIntervention" then 
      return true
    end
  end
  return false
end 

function IsValidTarget(unit, range, checkTeam, from)
  local range = range == nil and math.huge or range
  if type(range) ~= "number" then error("{IsValidTarget}: bad argument #2 (number expected, got "..type(range)..")") end
  if type(checkTeam) ~= "nil" and type(checkTeam) ~= "boolean" then error("{IsValidTarget}: bad argument #3 (boolean or nil expected, got "..type(checkTeam)..")") end
  if type(from) ~= "nil" and type(from) ~= "userdata" then error("{IsValidTarget}: bad argument #4 (vector or nil expected, got "..type(from)..")") end
  if unit == nil or not unit.valid or not unit.visible or unit.dead or not unit.isTargetable or IsImmune(unit) or (checkTeam and unit.isAlly) then 
    return false 
  end 
  return unit.pos:DistanceTo(from.pos and from.pos or myHero.pos) < range 
end

function CountAlliesInRange(point, range)
  if type(point) ~= "userdata" then error("{CountAlliesInRange}: bad argument #1 (vector expected, got "..type(point)..")") end
  local range = range == nil and math.huge or range 
  if type(range) ~= "number" then error("{CountAlliesInRange}: bad argument #2 (number expected, got "..type(range)..")") end
  local n = 0
  for i = 1, Game.HeroCount() do
    local unit = Game.Hero(i)
    if unit.isAlly and not unit.isMe and IsValidTarget(unit, range, false, point) then
      n = n + 1
    end
  end
  return n
end

local function CountEnemiesInRange(point, range)
  if type(point) ~= "userdata" then error("{CountEnemiesInRange}: bad argument #1 (vector expected, got "..type(point)..")") end
  local range = range == nil and math.huge or range 
  if type(range) ~= "number" then error("{CountEnemiesInRange}: bad argument #2 (number expected, got "..type(range)..")") end
  local n = 0
  for i = 1, Game.HeroCount() do
    local unit = Game.Hero(i)
    if IsValidTarget(unit, range, true, point) then
      n = n + 1
    end
  end
  return n
end

function CalcuPhysicalDamage(source, target, amount)
  local ArmorPenPercent = source.armorPenPercent
  local ArmorPenFlat = (0.4 + target.levelData.lvl / 30) * source.armorPen
  local BonusArmorPen = source.bonusArmorPenPercent

  if source.type == Obj_AI_Minion then
    ArmorPenPercent = 1
    ArmorPenFlat = 0
    BonusArmorPen = 1
  elseif source.type == Obj_AI_Turret then
    ArmorPenFlat = 0
    BonusArmorPen = 1
    if source.charName:find("3") or source.charName:find("4") then
      ArmorPenPercent = 0.25
    else
      ArmorPenPercent = 0.7
    end
  end

  if source.type == Obj_AI_Turret then
    if target.type == Obj_AI_Minion then
      amount = amount * 1.25
      if string.ends(target.charName, "MinionSiege") then
        amount = amount * 0.7
      end
      return amount
    end
  end

  local armor = target.armor
  local bonusArmor = target.bonusArmor
  local value = 100 / (100 + (armor * ArmorPenPercent) - (bonusArmor * (1 - BonusArmorPen)) - ArmorPenFlat)

  if armor < 0 then
    value = 2 - 100 / (100 - armor)
  elseif (armor * ArmorPenPercent) - (bonusArmor * (1 - BonusArmorPen)) - ArmorPenFlat < 0 then
    value = 1
  end
  return math.max(0, math.floor(DamageReductionMod(source, target, PassivePercentMod(source, target, value) * amount, 1)))
end

function CalcuMagicalDamage(source, target, amount)
  local mr = target.magicResist
  local value = 100 / (100 + (mr * source.magicPenPercent) - source.magicPen)

  if mr < 0 then
    value = 2 - 100 / (100 - mr)
  elseif (mr * source.magicPenPercent) - source.magicPen < 0 then
    value = 1
  end
  return math.max(0, math.floor(DamageReductionMod(source, target, PassivePercentMod(source, target, value) * amount, 2)))
end



local DamageReductionTable = {
  ["Braum"] = {buff = "BraumShieldRaise", amount = function(target) return 1 - ({0.3, 0.325, 0.35, 0.375, 0.4})[target:GetSpellData(_E).level] end},
  ["Urgot"] = {buff = "urgotswapdef", amount = function(target) return 1 - ({0.3, 0.4, 0.5})[target:GetSpellData(_R).level] end},
  ["Alistar"] = {buff = "Ferocious Howl", amount = function(target) return ({0.5, 0.4, 0.3})[target:GetSpellData(_R).level] end},
  -- ["Amumu"] = {buff = "Tantrum", amount = function(target) return ({2, 4, 6, 8, 10})[target:GetSpellData(_E).level] end, damageType = 1},
  ["Galio"] = {buff = "GalioIdolOfDurand", amount = function(target) return 0.5 end},
  ["Garen"] = {buff = "GarenW", amount = function(target) return 0.7 end},
  ["Gragas"] = {buff = "GragasWSelf", amount = function(target) return ({0.1, 0.12, 0.14, 0.16, 0.18})[target:GetSpellData(_W).level] end},
  ["Annie"] = {buff = "MoltenShield", amount = function(target) return 1 - ({0.16,0.22,0.28,0.34,0.4})[target:GetSpellData(_E).level] end},
  ["Malzahar"] = {buff = "malzaharpassiveshield", amount = function(target) return 0.1 end}
}



local function DamageReductionMod(source,target,amount,DamageType)
  if source.type == Obj_AI_Hero then
    if GotBuff(source, "Exhaust") > 0 then
      amount = amount * 0.6
    end
  end

  if target.type == Obj_AI_Hero then

    for i = 0, target.buffCount do
      if target:GetBuff(i).count > 0 then
        local buff = target:GetBuff(i)
        if buff.name == "MasteryWardenOfTheDawn" then
          amount = amount * (1 - (0.06 * buff.count))
        end
    
        if DamageReductionTable[target.charName] then
          if buff.name == DamageReductionTable[target.charName].buff and (not DamageReductionTable[target.charName].damagetype or DamageReductionTable[target.charName].damagetype == DamageType) then
            amount = amount * DamageReductionTable[target.charName].amount(target)
          end
        end

        if target.charName == "Maokai" and source.type ~= Obj_AI_Turret then
          if buff.name == "MaokaiDrainDefense" then
            amount = amount * 0.8
          end
        end

        if target.charName == "MasterYi" then
          if buff.name == "Meditate" then
            amount = amount - amount * ({0.5, 0.55, 0.6, 0.65, 0.7})[target:GetSpellData(_W).level] / (source.type == Obj_AI_Turret and 2 or 1)
          end
        end
      end
    end

    if GetItemSlot(target, 1054) > 0 then
      amount = amount - 8
    end

    if target.charName == "Kassadin" and DamageType == 2 then
      amount = amount * 0.85
    end
  end

  return amount
end

local function PassivePercentMod(source, target, amount, damageType)
  local SiegeMinionList = {"Redmath.minion_MechCannon", "Bluemath.minion_MechCannon"}
  local NormalMinionList = {"Redmath.minion_Wizard", "Bluemath.minion_Wizard", "Redmath.minion_Basic", "Bluemath.minion_Basic"}

  if source.type == Obj_AI_Turret then
    if table.contains(SiegeMinionList, target.charName) then
      amount = amount * 0.7
    elseif table.contains(NormalMinionList, target.charName) then
      amount = amount * 1.14285714285714
    end
  end
  if source.type == Obj_AI_Hero then 
    if target.type == Obj_AI_Hero then
      if (GetItemSlot(source, 3036) > 0 or GetItemSlot(source, 3034) > 0) and source.maxHealth < target.maxHealth and damageType == 1 then
        amount = amount * (1 + math.min(target.maxHealth - source.maxHealth, 500) / 50 * (GetItemSlot(source, 3036) > 0 and 0.015 or 0.01))
      end
    end
  end
  return amount
end

local function Priority(charName)
  local p1 = {"Alistar", "Amumu", "Blitzcrank", "Braum", "Cho'Gath", "Dr. Mundo", "Garen", "Gnar", "Maokai", "Hecarim", "Jarvan IV", "Leona", "Lulu", "Malphite", "Nasus", "Nautilus", "Nunu", "Olaf", "Rammus", "Renekton", "Sejuani", "Shen", "Shyvana", "Singed", "Sion", "Skarner", "Taric", "TahmKench", "Thresh", "Volibear", "Warwick", "MonkeyKing", "Yorick", "Zac", "Poppy"}
  local p2 = {"Aatrox", "Darius", "Elise", "Evelynn", "Galio", "Gragas", "Irelia", "Jax", "Lee Sin", "Morgana", "Janna", "Nocturne", "Pantheon", "Rengar", "Rumble", "Swain", "Trundle", "Tryndamere", "Udyr", "Urgot", "Vi", "XinZhao", "RekSai", "Bard", "Nami", "Sona", "Camille"}
  local p3 = {"Akali", "Diana", "Ekko", "FiddleSticks", "Fiora", "Gangplank", "Fizz", "Heimerdinger", "Jayce", "Kassadin", "Kayle", "Kha'Zix", "Lissandra", "Mordekaiser", "Nidalee", "Riven", "Shaco", "Vladimir", "Yasuo", "Zilean", "Zyra", "Ryze"}
  local p4 = {"Ahri", "Anivia", "Annie", "Ashe", "Azir", "Brand", "Caitlyn", "Cassiopeia", "Corki", "Draven", "Ezreal", "Graves", "Jinx", "Kalista", "Karma", "Karthus", "Katarina", "Kennen", "KogMaw", "Kindred", "Leblanc", "Lucian", "Lux", "Malzahar", "MasterYi", "MissFortune", "Orianna", "Quinn", "Sivir", "Syndra", "Talon", "Teemo", "Tristana", "TwistedFate", "Twitch", "Varus", "Vayne", "Veigar", "Velkoz", "Viktor", "Xerath", "Zed", "Ziggs", "Jhin", "Soraka"}
  if table.contains(p1, charName) then return 1 end
  if table.contains(p2, charName) then return 1.25 end
  if table.contains(p3, charName) then return 1.75 end
  return table.contains(p4, charName) and 2.25 or 1
end

function Xerath:GetTarget(range,t,pos)
local t = t or "AD"
local pos = pos or myHero.pos
local target = {}
	for i = 1, Game.HeroCount() do
		local hero = Game.Hero(i)
		if hero.isEnemy and not hero.dead then
			OnVision(hero)
		end
		if hero.isEnemy and hero.valid and not hero.dead and (OnVision(hero).state == true or (OnVision(hero).state == false and GetTickCount() - OnVision(hero).tick < 650)) and hero.isTargetable then
			local heroPos = hero.pos
			if OnVision(hero).state == false then heroPos = hero.pos + Vector(hero.pos,hero.posTo):Normalized() * ((GetTickCount() - OnVision(hero).tick)/1000 * hero.ms) end
			if GetDistance(pos,heroPos) <= range then
				if t == "AD" then
					target[(CalcuPhysicalDamage(myHero,hero,100) / hero.health)*Priority(hero.charName)] = hero
				elseif t == "AP" then
					target[(CalcuMagicalDamage(myHero,hero,100) / hero.health)*Priority(hero.charName)] = hero
				elseif t == "HYB" then
					target[((CalcuMagicalDamage(myHero,hero,50) + CalcuPhysicalDamage(myHero,hero,50))/ hero.health)*Priority(hero.charName)] = hero
				end
			end
		end
	end
	local bT = 0
	for d,v in pairs(target) do
		if d > bT then
			bT = d
		end
	end
	if bT ~= 0 then return target[bT] end
end
 
local castSpell = {state = 0, tick = GetTickCount(), casting = GetTickCount() - 1000, mouse = mousePos}
local function CastSpell(spell,pos,range,delay)
local range = range or math.huge
local delay = delay or 250
local ticker = GetTickCount()

	if castSpell.state == 0 and GetDistance(myHero.pos,pos) < range and ticker - castSpell.casting > delay + Game.Latency() and pos:ToScreen().onScreen then
		castSpell.state = 1
		castSpell.mouse = mousePos
		castSpell.tick = ticker
	end
	if castSpell.state == 1 then
		if ticker - castSpell.tick < Game.Latency() then
			Control.SetCursorPos(pos)
			Control.KeyDown(spell)
			Control.KeyUp(spell)
			castSpell.casting = ticker + delay
			DelayAction(function()
				if castSpell.state == 1 then
					Control.SetCursorPos(castSpell.mouse)
					castSpell.state = 0
				end
			end,Game.Latency()/1000)
		end
		if ticker - castSpell.casting > Game.Latency() then
			Control.SetCursorPos(castSpell.mouse)
			castSpell.state = 0
		end
	end
end

local function CastSpellMM(spell,pos,range,delay)
local range = range or math.huge
local delay = delay or 250
local ticker = GetTickCount()
	if castSpell.state == 0 and GetDistance(myHero.pos,pos) < range and ticker - castSpell.casting > delay + Game.Latency() then
		castSpell.state = 1
		castSpell.mouse = mousePos
		castSpell.tick = ticker
	end
	if castSpell.state == 1 then
		if ticker - castSpell.tick < Game.Latency() then
			local castPosMM = pos:ToMM()
			Control.SetCursorPos(castPosMM.x,castPosMM.y)
			Control.KeyDown(spell)
			Control.KeyUp(spell)
			castSpell.casting = ticker + delay
			DelayAction(function()
				if castSpell.state == 1 then
					Control.SetCursorPos(castSpell.mouse)
					castSpell.state = 0
				end
			end,Game.Latency()/1000)
		end
		if ticker - castSpell.casting > Game.Latency() then
			Control.SetCursorPos(castSpell.mouse)
			castSpell.state = 0
		end
	end
end

-- local castSpell = {state = 0, tick = GetTickCount(), casting = GetTickCount() - 1000, mouse = mousePos}
local function ReleaseSpell(spell,pos,range,delay)
local delay = delay or 250
local ticker = GetTickCount()
	if castSpell.state == 0 and GetDistance(myHero.pos,pos) < range and ticker - castSpell.casting > delay + Game.Latency() then
		castSpell.state = 1
		castSpell.mouse = mousePos
		castSpell.tick = ticker
	end
	if castSpell.state == 1 then
		if ticker - castSpell.tick < Game.Latency() then
			if not pos:ToScreen().onScreen then
				pos = myHero.pos + Vector(myHero.pos,pos):Normalized() * math.random(530,760)
				Control.SetCursorPos(pos)
				Control.KeyUp(spell)
			else
				Control.SetCursorPos(pos)
				Control.KeyUp(spell)
			end
			castSpell.casting = ticker + delay
			DelayAction(function()
				if castSpell.state == 1 then
					Control.SetCursorPos(castSpell.mouse)
					castSpell.state = 0
				end
			end,Game.Latency()/1000)
		end
		if ticker - castSpell.casting > Game.Latency() then
			Control.SetCursorPos(castSpell.mouse)
			castSpell.state = 0
		end
	end
end

local castAttack = {state = 0, tick = GetTickCount(), casting = GetTickCount() - 1000, mouse = mousePos}
local function CastAttack(pos,range,delay)
local delay = delay or myHero.attackData.windUpTime*1000/2

local ticker = GetTickCount()
	if castAttack.state == 0 and GetDistance(myHero.pos,pos.pos) < range and ticker - castAttack.casting > delay + Game.Latency() and aa.state == 1 and not pos.dead and pos.isTargetable then
		castAttack.state = 1
		castAttack.mouse = mousePos
		castAttack.tick = ticker
		lastTick = GetTickCount()
	end
	if castAttack.state == 1 then
		if ticker - castAttack.tick < Game.Latency() and aa.state == 1 then
				Control.SetCursorPos(pos.pos)
				Control.mouse_event(MOUSEEVENTF_RIGHTDOWN)
				Control.mouse_event(MOUSEEVENTF_RIGHTUP)
				castAttack.casting = ticker + delay
			DelayAction(function()
				if castAttack.state == 1 then
					Control.SetCursorPos(castAttack.mouse)
					castAttack.state = 0
				end
			end,Game.Latency()/1000)
		end
		if ticker - castAttack.casting > Game.Latency() and castAttack.state == 1 then
			Control.SetCursorPos(castAttack.mouse)
			castAttack.state = 0
		end
	end
end

local castMove = {state = 0, tick = GetTickCount(), mouse = mousePos}
local function CastMove(pos)
local movePos = pos or mousePos
Control.KeyDown(HK_TCO)
Control.mouse_event(MOUSEEVENTF_RIGHTDOWN)
Control.mouse_event(MOUSEEVENTF_RIGHTUP)
Control.KeyUp(HK_TCO)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local aa = {state = 1, tick = GetTickCount(), tick2 = GetTickCount(), downTime = GetTickCount(), target = myHero}
local lastTick = 0
local lastMove = 0
local aaTicker = Callback.Add("Tick", function() Xerath:aaTick() end)
function Xerath:aaTick()
	if myHero.charName ~= "Xerath" then return end
	if aa.state == 1 and myHero.attackData.state == 2 then
		lastTick = GetTickCount()
		aa.state = 2
		aa.target = myHero.attackData.target
	end
	if aa.state == 2 then
		if myHero.attackData.state == 1 then
			aa.state = 1
		end
		if Game.Timer() + Game.Latency()/2000 - myHero.attackData.castFrame/200 > myHero.attackData.endTime - myHero.attackData.windDownTime and aa.state == 2 then
			-- print("OnAttackComp WindUP:"..myHero.attackData.endTime)
			aa.state = 3
			aa.tick2 = GetTickCount()
			aa.downTime = myHero.attackData.windDownTime*1000 - (myHero.attackData.windUpTime*1000)
			if self.Menu.fastOrb ~= nil and self.Menu.fastOrb:Value() then
				if self:GetMode() ~= "" and myHero.attackData.state == 2 then
					Control.Move()
				end
			end
		end
	end
	if aa.state == 3 then
		if GetTickCount() - aa.tick2 - Game.Latency() - myHero.attackData.castFrame > myHero.attackData.windDownTime*1000 - (myHero.attackData.windUpTime*1000)/2 then
			aa.state = 1
		end
		if myHero.attackData.state == 1 then
			aa.state = 1
		end
		if GetTickCount() - aa.tick2 > aa.downTime then
			aa.state = 1
		end
	end
end



function Xerath:LoadSpells()
	
	Q = {range = 750, radius = 145, delay = 0.35 + Game.Latency()/1000, speed = math.huge, collision = false}    
	W = {range = 1100, radius = 200, delay = 0.5, speed = math.huge, collision = false}      
	E = {range = 1050, radius = 30, delay = 0.25, speed = 2300, collision = true}   
end

local spellIcons = {
Q = "http://vignette3.wikia.nocookie.net/leagueoflegends/images/5/57/Arcanopulse.png",
W = "http://vignette1.wikia.nocookie.net/leagueoflegends/images/2/20/Eye_of_Destruction.png",
E = "http://vignette2.wikia.nocookie.net/leagueoflegends/images/6/6f/Shocking_Orb.png",
R = "http://vignette1.wikia.nocookie.net/leagueoflegends/images/3/37/Rite_of_the_Arcane.png"
}


function Xerath:LoadMenu()
	Xerath.Menu = MenuElement({type = MENU, id = "Xerath", name = "泽拉斯"})
	Xerath.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu:MenuElement({type = MENU, id = "Killsteal", leftIcon = Icons["ks"]})
	self.Menu:MenuElement({type = MENU, id = "Misc", leftIcon = Icons["Misc"]})
	self.Menu:MenuElement({type = MENU, id = "Key", leftIcon = Icons["KeySet"]})
	self.Menu.Key:MenuElement({id = "Combo", name = "走砍", key = string.byte(" ")})
	self.Menu.Key:MenuElement({id = "Harass", name = "骚扰|混合", key = string.byte("C")})
	self.Menu.Key:MenuElement({id = "Clear", name = "清线|清野", key = string.byte("V")})
	self.Menu.Key:MenuElement({id = "LastHit", name = "最后一击", key = string.byte("X")})
	self.Menu:MenuElement({id = "fastOrb", name = "让Orbwalker再次快速", value = true})	
	
	self.Menu.Combo:MenuElement({id = "useQ", name = "使用Q", value = true})
	self.Menu.Combo:MenuElement({id = "legitQ", name = "合法Q滑块", value = 0.075, min = 0, max = 0.15, step = 0.01})
	self.Menu.Combo:MenuElement({id = "useW", name = "使用W", value = true})
	self.Menu.Combo:MenuElement({id = "useE", name = "使用E", value = true})
	self.Menu.Combo:MenuElement({id = "useR", name = "使用R", value = true})
	self.Menu.Combo:MenuElement({type = MENU, id = "R", name = "终极设置"})
	self.Menu.Combo.R:MenuElement({id = "useRself", name = "手动启动R", value = false})
	self.Menu.Combo.R:MenuElement({type = MENU, id = "BlackList", name = "自动R黑名单"})
	self.Menu.Combo.R:MenuElement({id = "safeR", name = "安全R", value = 1, min = 0, max = 2, step = 1})
	self.Menu.Combo.R:MenuElement({id = "targetChangeDelay", name = "目标开关之间的延迟", value = 100, min = 0, max = 2000, step = 10})
	self.Menu.Combo.R:MenuElement({id = "castDelay", name = "两次浇注之间的延迟", value = 150, min = 0, max = 500, step = 1})
	self.Menu.Combo.R:MenuElement({id = "useBlue", name = "使用远距改变", value = true})
	self.Menu.Combo.R:MenuElement({id = "useRkey", name = "按键时（靠近鼠标）", key = string.byte("Z")})
	
	self.Menu.Harass:MenuElement({id = "useQ", name = "使用Q", value = true})
	self.Menu.Harass:MenuElement({id = "manaQ", name = "[Q]法力管理器", value = 40, min = 0, max = 100, step = 1})
	self.Menu.Harass:MenuElement({id = "useW", name = "使用W", value = true})
	self.Menu.Harass:MenuElement({id = "manaW", name = "[W]法力管理器", value = 60, min = 0, max = 100, step = 1})
	self.Menu.Harass:MenuElement({id = "useE", name = "使用E", value = false})
	self.Menu.Harass:MenuElement({id = "manaE", name = "[E]法力管理器", value = 80, min = 0, max = 100, step = 1})

	self.Menu.Clear:MenuElement({id = "useQ", name = "使用Q", value = true})
	self.Menu.Clear:MenuElement({id = "manaQ", name = "[Q]法力管理器", value = 40, min = 0, max = 100, step = 1})
	self.Menu.Clear:MenuElement({id = "hitQ", name = "最低小兵使用Q", value = 2, min = 1, max = 6, step = 1})	
	self.Menu.Clear:MenuElement({id = "useW", name = "使用W", value = true})
	self.Menu.Clear:MenuElement({id = "manaW", name = "[W]法力管理器", value = 60, min = 0, max = 100, step = 1})	
	self.Menu.Clear:MenuElement({id = "hitW", name = "最低小兵使用W", value = 2, min = 1, max = 6, step = 1})	
	
	self.Menu.Killsteal:MenuElement({id = "useQ", name = "使用Q来杀死", value = true})
	self.Menu.Killsteal:MenuElement({id = "useW", name = "用W来杀死", value = true})
	self.Menu.Killsteal:MenuElement({id = "full", name = "自动使用Q，W，R,如果可以杀死", key = 84, toggle = true})	
	
	self.Menu.Misc:MenuElement({id = "Pred", name = "预测设置", drop = {"LazyXerath Prediction", "Gamsteron Prediction", "HPred"}, value = 1})	
	self.Menu.Misc:MenuElement({id = "gapE", name = "在间隙闭合器上使用E", value = true})
	self.Menu.Misc:MenuElement({id = "drawRrange", name = "在迷你地图上绘制R范围", value = true})
	
	self.Menu:MenuElement({id = "TargetSwitchDelay", name = "目标开关之间的延迟", value = 350, min = 0, max = 750, step = 1})
	self:TargetMenu()
	self.Menu:MenuElement({id = "space", name = "更改你的奥宝行者中的键[组合键]！", type = SPACE, onclick = function() self.Menu.space:Hide() end})
end




function Xerath:IsQCharging()
	return myHero.activeSpell and myHero.activeSpell.valid and myHero.activeSpell.name == "XerathArcanopulseChargeUp"
end

function Xerath:IsRCharging()
	return myHero.activeSpell and myHero.activeSpell.valid and myHero.activeSpell.name == "XerathLocusOfPower2"
end

local create_menu_tick
function Xerath:TargetMenu()
	create_menu_tick = Callback.Add("Tick",function() 
		for i,v in pairs(self:GetEnemyHeroes()) do
			self:MenuRTarget(v,create_menu_tick)
		end
	end)
end

function Xerath:MenuRTarget(v,t)
	if self.Menu.Combo.R.BlackList[v.charName] ~= nil then
		-- Callback.Del("Tick",create_menu_tick)
	else
		self.Menu.Combo.R.BlackList:MenuElement({id = v.charName, name = "黑名单："..v.charName, value = false})
	end
end

function Xerath:Tick()
	if castSpell.state == 1 and GetTickCount() - castSpell.casting > Game.Latency() then
            Control.SetCursorPos(castSpell.mouse)
            castSpell.state = 0
    end
	if MyHeroReady() then

	
	if Xerath:GetMode() == "Combo" then   
		if aa.state ~= 2 then
			self:Combo()
		end
		self:ComboOrb()
	elseif Xerath:GetMode() == "Harass" then
		if aa.state ~= 2 then
			self:Harass()
		end
	
	elseif Xerath:GetMode() == "Clear" then
		if aa.state ~= 2 then
			self:Clear()
		end
	end	
	self:EnemyLoop()
	self:castingQ()
	self:castingR()
	self:useRonKey()
	self:EnemyLoop()
	self:KSFull()
	self:Auto()
	end
end

function Xerath:GetMode()
	if self.Menu.Key.Combo:Value() then return "Combo" end
	if self.Menu.Key.Harass:Value() then return "Harass" end
	if self.Menu.Key.Clear:Value() then return "Clear" end
	if self.Menu.Key.LastHit:Value() then return "LastHit" end
    return ""
end

function Xerath:Draw()
local textPos = myHero.pos:To2D()	
if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
	Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
end
if self.Menu.Killsteal.full:Value() then 
	Draw.Text("KS[Q,W,R]ON", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 000, 255, 000))
else
	Draw.Text("KS[Q,W,R]OFF", 20, textPos.x - 80, textPos.y + 40, Draw.Color(255, 220, 050, 000)) 
end

if myHero.dead then return end
	if self.Menu.Combo.R.useRkey:Value() then
		Draw.Circle(mousePos,500)
	end
	if self.Menu.Misc.drawRrange:Value() and self.chargeR == false then
		if Game.CanUseSpell(_R) == 0 then
			Draw.CircleMinimap(myHero.pos,2000 + 1220*myHero:GetSpellData(_R).level,1.5,Draw.Color(200,50,180,230))
		end
	end
end

function Xerath:ComboOrb()
	if self.chargeR == false and castSpell.state == 0 then
		local target = GetTarget(610)
		local tick = GetTickCount()
		if target then
			if aa.state == 1 and self.chargeQ == false and GetDistance(myHero.pos,target.pos) < 575 and ((Game.CanUseSpell(_Q) ~= 0 and Game.CanUseSpell(_W) ~= 0 and Game.CanUseSpell(_E) ~= 0) or GotBuff(myHero,"xerathascended2onhit") > 0 ) then
				CastAttack(target,575)
			elseif aa.state ~= 2 and tick - lastMove > 120 then
				Control.Move()
				lastMove = tick
			end
		else
			if aa.state ~= 2 and tick - lastMove > 120 then
				Control.Move()
				lastMove = tick
			end
		end
	end
end

function Xerath:castingQ()
	if self.chargeQ == true then
		self.Q.range = 750 + 500*(GetTickCount()-self.qTick)/1000
		if self.Q.range > 1500 then self.Q.range = 1500 end
	end
	local qBuff = GetBuffData(myHero,"XerathArcanopulseChargeUp")
	if self.chargeQ == false and qBuff.count > 0 then
		self.qTick = GetTickCount()
		self.chargeQ = true
	end
	if self.chargeQ == true and qBuff.count == 0 then
		self.chargeQ = false
		self.Q.range = 750
		if Control.IsKeyDown(HK_Q) == true then
			Control.KeyUp(HK_Q)
		end
	end
	if Control.IsKeyDown(HK_Q) == true and self.chargeQ == false then
		DelayAction(function()
			if Control.IsKeyDown(HK_Q) == true and self.chargeQ == false then
				Control.KeyUp(HK_Q)
			end
		end,0.3)
	end
	if Control.IsKeyDown(HK_Q) == true and Game.CanUseSpell(_Q) ~= 0 then
		DelayAction(function()
			if Control.IsKeyDown(HK_Q) == true then
				self.Q.range = 750
				Control.KeyUp(HK_Q)
			end
		end,0.01)
	end
end



function Xerath:castingR()
	local rBuff = GetBuffData(myHero,"XerathLocusOfPower2")
	if self.chargeR == false and rBuff.count > 0 then
		self.chargeR = true
		self.chargeRTick = GetTickCount()
		self.firstRCast = true
	end
	if self.chargeR == true and rBuff.count == 0 then
		self.chargeR = false
		self.R_target = nil
	end
	if self.chargeR == true then
		if self.CanUseR == true and Game.CanUseSpell(_R) ~= 0 and GetTickCount() - self.chargeRTick > 600 then
			self.CanUseR = false
			self.R_Stacks = self.R_Stacks - 1
			self.firstRCast = false
			self.lastRtick = GetTickCount()
		end
		if self.CanUseR == false and Game.CanUseSpell(_R) == 0 then
			self.CanUseR = true
		end
	end
	if self.chargeR == false then
		if Game.CanUseSpell(_R) == 0 then
			self.R_Stacks = 2+myHero:GetSpellData(_R).level
		end
	end
end

function Xerath:KSFull()
local target = self:GetRTarget(1100,2200 + 1220*myHero:GetSpellData(_R).level)
if target == nil then return end
local hp = target.health + target.shieldAP + target.shieldAD
local rRange = 2200 + 1220*myHero:GetSpellData(_R).level
local Qdmg = CalcuMagicalDamage(myHero,target,40 + 40*myHero:GetSpellData(_Q).level + 0.75*myHero.ap)	
local Wdmg = CalcuMagicalDamage(myHero,target,45 + 45*myHero:GetSpellData(_W).level + 0.9*myHero.ap)
local stackdmg = 2 + myHero:GetSpellData(_R).level
local Rdmg = CalcuMagicalDamage(myHero,target,160 + 40 * myHero:GetSpellData(_R).level + myHero.ap * 0.43) * stackdmg
local Fdmg = (Qdmg + Wdmg + Rdmg)	
	if self.Menu.Killsteal.full:Value() then
		if self.chargeR == false and hp <= Fdmg then
			if self.Menu.Misc.Pred:Value() == 1 then
				self:useQ()
				self:useW()

			elseif self.Menu.Misc.Pred:Value() == 2 then
				self:useQGSO()
				self:useWGSO()

			elseif self.Menu.Misc.Pred:Value() == 3 then
				self:useQHPred()			
				self:useWHPred()
				
			end
		end	
		if hp <= Rdmg and self.chargeR == false and Game.CanUseSpell(_R) == 0 and IsValid(target) and GetDistanceSqr(myHero.pos,target.pos) > 1000 and GetDistanceSqr(myHero.pos,target.pos) <= rRange then
			self:startR(target)
		end
		
	self:AutoR()
	end
end

function Xerath:Auto()
if myHero.dead then return end
local target = self:GetRTarget(1100,2200 + 1220*myHero:GetSpellData(_R).level)
if target == nil then return end	
local blue = GetInventorySlotItem(3363)   	
	if self.chargeR == true and not target.visible then		
		if blue and GetDistanceSqr(myHero.pos,target.pos) < 3800 then
        local bluePred = GetPred(target,math.huge,0.25)
			CastSpellMM(ItemHotKey[blue],bluePred,4000,50)
        
		end	
	end
end	

function Xerath:Combo()
	if self.chargeR == false then
		if self.Menu.Misc.Pred:Value() == 1 then
			if self.Menu.Combo.useW:Value() then
				self:useW()
			end
			if self.Menu.Combo.useE:Value() then
				self:useE()
			end
			if self.Menu.Combo.useQ:Value() then
				self:useQ()
			end
		elseif self.Menu.Misc.Pred:Value() == 2 then
			if self.Menu.Combo.useW:Value() then
				self:useWGSO()
			end
			if self.Menu.Combo.useE:Value() then
				self:useEGSO()
			end
			if self.Menu.Combo.useQ:Value() then
				self:useQGSO()
			end	
		elseif self.Menu.Misc.Pred:Value() == 3 then
			if self.Menu.Combo.useW:Value() then
				self:useWHPred()
			end
			if self.Menu.Combo.useE:Value() then
				self:useEHPred()
			end
			if self.Menu.Combo.useQ:Value() then
				self:useQHPred()
			end				
		end	
	end
	self:useR()
end

function Xerath:Harass()
	if self.chargeR == false then
	local mp = GetPercentMP(myHero)
		if self.Menu.Misc.Pred:Value() == 1 then			
			if self.Menu.Harass.useW:Value() and mp > self.Menu.Harass.manaW:Value() then
				self:useW()
			end
			if self.Menu.Harass.useE:Value() and mp > self.Menu.Harass.manaE:Value() then
				self:useE()
			end
			if self.Menu.Harass.useQ:Value() and (mp > self.Menu.Harass.manaQ:Value() or self.chargeQ == true) then	
				self:useQ()
			end
		elseif self.Menu.Misc.Pred:Value() == 2 then			
			if self.Menu.Harass.useW:Value() and mp > self.Menu.Harass.manaW:Value() then
				self:useWGSO()
			end
			if self.Menu.Harass.useE:Value() and mp > self.Menu.Harass.manaE:Value() then
				self:useEGSO()
			end
			if self.Menu.Harass.useQ:Value() and (mp > self.Menu.Harass.manaQ:Value() or self.chargeQ == true) then	
				self:useQGSO()
			end	
		elseif self.Menu.Misc.Pred:Value() == 3 then			
			if self.Menu.Harass.useW:Value() and mp > self.Menu.Harass.manaW:Value() then
				self:useWHPred()
			end
			if self.Menu.Harass.useE:Value() and mp > self.Menu.Harass.manaE:Value() then
				self:useEHPred()
			end
			if self.Menu.Harass.useQ:Value() and (mp > self.Menu.Harass.manaQ:Value() or self.chargeQ == true) then	
				self:useQHPred()
			end			
		end	
	end
end

function Xerath:Clear()
	if self.chargeR == false then
		local mp = GetPercentMP(myHero)
		if self.Menu.Clear.useW:Value() and mp > self.Menu.Clear.manaW:Value() then
			self:clearW()
		end
		if self.Menu.Clear.useQ:Value() and (mp > self.Menu.Clear.manaQ:Value() or self.chargeQ == true) then	
			self:clearQ()
		end
	end
end

function Xerath:clearQ()
	if Game.CanUseSpell(_Q) == 0 and castSpell.state == 0 then
		for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
		local qPred = GetPred(minion,math.huge,0.35 + Game.Latency()/1000)
		local qPred2 = GetPred(minion,math.huge,1.0)
		local count = GetMinionCount(150, minion)		
			if minion.team == TEAM_ENEMY and qPred and qPred2 then
				if GetDistance(myHero.pos,qPred2) < 1400 and count >= self.Menu.Clear.hitQ:Value() then
					self:startQ(minion)
				end
				if self.chargeQ == true then
					self:useQonMinion(minion,qPred)
				end
			end
			if minion.team == TEAM_JUNGLE and qPred and qPred2 then
				if GetDistance(myHero.pos,qPred2) < 1400 then
					self:startQ(minion)
				end
				if self.chargeQ == true then
					self:useQonMinion(minion,qPred)
				end
			end			
		end
	end
end

function Xerath:useQ()
	if Game.CanUseSpell(_Q) == 0 and castSpell.state == 0 then
		local target = self:GetTarget(1500,"AP")
		if target then
			local qPred = GetPred(target,math.huge,0.35 + Game.Latency()/1000)
			local qPred2 = GetPred(target,math.huge,1.0)
			if qPred and qPred2 then
				if GetDistance(myHero.pos,qPred2) < 1400 then
					self:startQ(target)
				end
				if self.chargeQ == true then
					self:useQclose(target,qPred)
					self:useQCC(target)
					self:useQonTarget(target,qPred)
				end
			end
		end
	end
end

function Xerath:useQGSO()
	if Game.CanUseSpell(_Q) == 0 and castSpell.state == 0 then
		local target = self:GetTarget(1500,"AP")
		if target then
			local qPred2 = GetPred(target,math.huge,1.0)
			if qPred2 then
				if GetDistance(myHero.pos,qPred2) < 1400 then
					self:startQ(target)
				end
				if self.chargeQ == true then
					self:useQcloseGSO(target)
					self:useQCC(target)
					self:useQonTargetGSO(target)
				end
			end
		end
	end
end

function Xerath:useQHPred()
	if Game.CanUseSpell(_Q) == 0 and castSpell.state == 0 then
		local target = self:GetTarget(1500,"AP")
		if target then
			local qPred2 = GetPred(target,math.huge,1.0)
			if qPred2 then
				if GetDistance(myHero.pos,qPred2) < 1400 then
					self:startQ(target)
				end
				if self.chargeQ == true then
					self:useQcloseHPred(target)
					self:useQCC(target)
					self:useQonTargetHPred(target)
				end
			end
		end
	end
end

function Xerath:clearW()
	if Game.CanUseSpell(_W) == 0 and self.chargeQ == false and castSpell.state == 0 then
		for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
		local count = GetMinionCount(250, minion)	
				if self.lastMinion == nil then self.lastMinion = minion end
				if minion.team == TEAM_ENEMY and minion and (minion == self.lastMinion or (GetDistance(minion.pos,self.lastMinion.pos) > 400 and GetTickCount() - self.lastMinion_tick > self.Menu.TargetSwitchDelay:Value())) then

						if count >= self.Menu.Clear.hitW:Value() then
							Control.CastSpell(HK_W,minion.pos)
						end	
				elseif minion.team == TEAM_JUNGLE then
					Control.CastSpell(HK_W, minion.pos)
				end	
			end	
		end
	end


function Xerath:useW()
	if Game.CanUseSpell(_W) == 0 and self.chargeQ == false and castSpell.state == 0 then
		local target = self:GetTarget(self.W.range,"AP")
		if self.lastTarget == nil then self.lastTarget = target end
		if target and (target == self.lastTarget or (GetDistance(target.pos,self.lastTarget.pos) > 400 and GetTickCount() - self.lastTarget_tick > self.Menu.TargetSwitchDelay:Value())) then
			local wPred = GetPred(target,math.huge,0.5)
			if wPred then
				self:useWdash(target)
				self:useWCC(target)
				self:useWkill(target,wPred)
				self:useWhighHit(target,wPred)
			end
		end
	end
end

function Xerath:useWGSO()
	if Game.CanUseSpell(_W) == 0 and self.chargeQ == false and castSpell.state == 0 then
		local target = self:GetTarget(self.W.range,"AP")
		if self.lastTarget == nil then self.lastTarget = target end
		if target and (target == self.lastTarget or (GetDistance(target.pos,self.lastTarget.pos) > 400 and GetTickCount() - self.lastTarget_tick > self.Menu.TargetSwitchDelay:Value())) then
			self:useWdashGSO(target)
			self:useWCC(target)
			self:useWkillGSO(target)
			self:useWhighHitGSO(target)
		end
	end
end

function Xerath:useWHPred()
	if Game.CanUseSpell(_W) == 0 and self.chargeQ == false and castSpell.state == 0 then
		local target = self:GetTarget(self.W.range,"AP")
		if self.lastTarget == nil then self.lastTarget = target end
		if target and (target == self.lastTarget or (GetDistance(target.pos,self.lastTarget.pos) > 400 and GetTickCount() - self.lastTarget_tick > self.Menu.TargetSwitchDelay:Value())) then
			self:useWdashHPred(target)
			self:useWCC(target)
			self:useWkillHPred(target)
			self:useWhighHitHPred(target)
		end
	end
end


function Xerath:useE()
	if Game.CanUseSpell(_E) == 0 and self.chargeQ == false and castSpell.state == 0 then
		self:useECC()
		local target = self:GetTarget(self.E.range,"AP")
		if self.lastTarget == nil then self.lastTarget = target end
		if target and (target == self.lastTarget or (GetDistance(target.pos,self.lastTarget.pos) > 400 and GetTickCount() - self.lastTarget_tick > self.Menu.TargetSwitchDelay:Value())) then
			local ePred = GetPred(target,self.E.speed,self.E.delay)
			if ePred and target:GetCollision(self.E.width,self.E.speed,self.E.delay) == 0 then
				self:useEdash(target)
				self:useEbrainAFK(target,ePred)
			end
		end
	end
end

function Xerath:useEGSO()
	if Game.CanUseSpell(_E) == 0 and self.chargeQ == false and castSpell.state == 0 then
		self:useECC()
		local target = self:GetTarget(self.E.range,"AP")
		if self.lastTarget == nil then self.lastTarget = target end
		if target and (target == self.lastTarget or (GetDistance(target.pos,self.lastTarget.pos) > 400 and GetTickCount() - self.lastTarget_tick > self.Menu.TargetSwitchDelay:Value())) then
			if target:GetCollision(self.E.width,self.E.speed,self.E.delay) == 0 then
				self:useEdashGSO(target)
				self:useEbrainAFKGSO(target)
			end
		end
	end
end

function Xerath:useEHPred()
	if Game.CanUseSpell(_E) == 0 and self.chargeQ == false and castSpell.state == 0 then
		self:useECC()
		local target = self:GetTarget(self.E.range,"AP")
		if self.lastTarget == nil then self.lastTarget = target end
		if target and (target == self.lastTarget or (GetDistance(target.pos,self.lastTarget.pos) > 400 and GetTickCount() - self.lastTarget_tick > self.Menu.TargetSwitchDelay:Value())) then
			if target:GetCollision(self.E.width,self.E.speed,self.E.delay) == 0 then
				self:useEdashHPred(target)
				self:useEbrainAFKHPred(target)
			end
		end
	end
end

function Xerath:useR()
	if Game.CanUseSpell(_R) == 0 and self.chargeQ == false and castSpell.state == 0 then
		local target = self:GetRTarget(1100,2200 + 1220*myHero:GetSpellData(_R).level)
		if target then
			self:useRkill(target)
			if ((self.firstRCast == true or self.chargeR ~= true) or (GetTickCount() - self.lastRtick > 500 + self.Menu.Combo.R.targetChangeDelay:Value() and GetDistance(target.pos,self.R_target.pos) > 750) or (GetDistance(target.pos,self.R_target.pos) <= 850)) and target ~= self.R_target then
				self.R_target = target
			end
			-- if target == self.R_target or (target ~= self.R_target and GetDistance(target.pos,self.R_target.pos) > 600 and GetTickCount() - self.lastRtick > 800 + self.Menu.Combo.R.targetChangeDelay:Value()) then
			if target == self.R_target then
				if self.chargeR == true and GetTickCount() - self.lastRtick >= 800 + self.Menu.Combo.R.castDelay:Value() then
					if target and not IsImmune(target) and (Game.Timer() - OnWaypoint(target).time > 0.05 and (Game.Timer() - OnWaypoint(target).time < 0.20 or Game.Timer() - OnWaypoint(target).time > 1.25) or self:IsImmobileTarget(target) == true or (self.firstRCast == true and OnVision(target).state == false) ) then
						local rPred = GetPred(target,math.huge,0.45)
						if rPred:ToScreen().onScreen then
							CastSpell(HK_R,rPred,2200 + 1320*myHero:GetSpellData(_R).level,100)
							self.R_target = target
						else 
							CastSpellMM(HK_R,rPred,2200 + 1320*myHero:GetSpellData(_R).level,100)
							self.R_target = target
						end
					end
				end
			end
		end
	end
end

function Xerath:EnemyLoop()
	if aa.state ~= 2 and castSpell.state == 0 then
		for i,target in pairs(self:GetEnemyHeroes()) do
			if not target.dead and target.isTargetable and target.valid and (OnVision(target).state == true or (OnVision(target).state == false and GetTickCount() - OnVision(target).tick < 500)) then
				if self.Menu.Killsteal.useQ:Value() then
					if Game.CanUseSpell(_Q) == 0 and GetDistance(myHero.pos,target.pos) < 1400 then
						local hp = target.health + target.shieldAP + target.shieldAD
						local dmg = CalcuMagicalDamage(myHero,target,40 + 40*myHero:GetSpellData(_Q).level + (0.75*myHero.ap))
						if hp < dmg then
							if self.chargeQ == false then
								local qPred2 = GetPred(target,math.huge,1.25)
								if GetDistance(qPred2,myHero.pos) < 1400 then
									Control.KeyDown(HK_Q)
								end
							else
								local qPred = GetPred(target,math.huge,0.35 + Game.Latency()/1000)
								self:useQonTarget(target,qPred)
							end
						end
					end
				end
						
					
				
				if self.Menu.Killsteal.useW:Value() then
					if Game.CanUseSpell(_W) == 0 and GetDistance(myHero.pos,target.pos) < self.W.range then
						local wPred = GetPred(target,math.huge,0.55)
						self:useWkill(target,wPred)
					end
				end
				if self.Menu.Misc.gapE:Value() then
					if GetDistance(target.pos,myHero.pos) < 500 then
						self:useEdash(target)
					end
				end
			end
		end
	end
end

function Xerath:startQ(target)
	local start = true
	if self.Menu.Combo.useE:Value() and Game.CanUseSpell(_E) == 0 and GetDistance(target.pos,myHero.pos) < 650 and target:GetCollision(self.E.width,self.E.speed,self.E.delay) == 0 then start = false end
	if Game.CanUseSpell(_Q) == 0 and self.chargeQ == false  and start == true then
		Control.KeyDown(HK_Q)
	end
end

function Xerath:startQ(minion)
	if Game.CanUseSpell(_Q) == 0 and self.chargeQ == false then
		Control.KeyDown(HK_Q)
	end
end

function Xerath:useQCC(target)
	if GetDistance(myHero.pos,target.pos) < self.Q.range - 20 then
		if self:IsImmobileTarget(target) == true then
			ReleaseSpell(HK_Q,target.pos,self.Q.range,100)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:useQonTarget(target,qPred)
	if  Game.Timer() - OnWaypoint(target).time > 0.05 + self.Menu.Combo.legitQ:Value() and (((Game.Timer() - OnWaypoint(target).time < 0.15 + self.Menu.Combo.legitQ:Value() or Game.Timer() - OnWaypoint(target).time > 1.0) and OnVision(target).state == true) or (OnVision(target).state == false)) and GetDistance(myHero.pos,qPred) < self.Q.range - target.boundingRadius then
		ReleaseSpell(HK_Q,qPred,self.Q.range,100)
		self.lastTarget = target
		self.lastTarget_tick = GetTickCount() + 200
	end
end

function Xerath:useQonTargetGSO(target)
	if  Game.Timer() - OnWaypoint(target).time > 0.05 + self.Menu.Combo.legitQ:Value() and (((Game.Timer() - OnWaypoint(target).time < 0.15 + self.Menu.Combo.legitQ:Value() or Game.Timer() - OnWaypoint(target).time > 1.0) and OnVision(target).state == true) or (OnVision(target).state == false)) and GetDistance(myHero.pos,target.pos) < self.Q.range - target.boundingRadius then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if pred.Hitchance >= _G.HITCHANCE_NORMAL then
			ReleaseSpell(HK_Q,pred.CastPosition,self.Q.range,100)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end	
	end
end

function Xerath:useQonTargetHPred(target)
	if  Game.Timer() - OnWaypoint(target).time > 0.05 + self.Menu.Combo.legitQ:Value() and (((Game.Timer() - OnWaypoint(target).time < 0.15 + self.Menu.Combo.legitQ:Value() or Game.Timer() - OnWaypoint(target).time > 1.0) and OnVision(target).state == true) or (OnVision(target).state == false)) and GetDistance(myHero.pos,target.pos) < self.Q.range - target.boundingRadius then
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
		if hitRate and hitRate >= 1 then
			ReleaseSpell(HK_Q,aimPosition,self.Q.range,100)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end	
	end
end

function Xerath:useQclose(target,qPred)
	if GetDistance(myHero.pos,qPred) < 750 and Game.Timer() - OnWaypoint(target).time > 0.05 then
		ReleaseSpell(HK_Q,qPred,self.Q.range,75)
		self.lastTarget = target
		self.lastTarget_tick = GetTickCount() + 200
	end
end

function Xerath:useQcloseGSO(target)
	if GetDistance(myHero.pos,target.pos) < 750 and Game.Timer() - OnWaypoint(target).time > 0.05 then
		local pred = GetGamsteronPrediction(target, QData, myHero)
		if pred.Hitchance >= _G.HITCHANCE_NORMAL then
			ReleaseSpell(HK_Q,pred.CastPosition,self.Q.range,75)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end	
	end
end

function Xerath:useQcloseHPred(target)
	if GetDistance(myHero.pos,target.pos) < 750 and Game.Timer() - OnWaypoint(target).time > 0.05 then
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, Q.range, Q.delay, Q.speed, Q.radius, Q.collision)
		if hitRate and hitRate >= 1 then
			ReleaseSpell(HK_Q,aimPosition,self.Q.range,75)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end	
	end
end

function Xerath:useQonMinion(minion,qPred)
	if Game.Timer() - OnWaypoint(minion).time > 0.05 + self.Menu.Combo.legitQ:Value() and (((Game.Timer() - OnWaypoint(minion).time < 0.15 + self.Menu.Combo.legitQ:Value() or Game.Timer() - OnWaypoint(minion).time > 1.0) and OnVision(minion).state == true) or (OnVision(minion).state == false)) and GetDistance(myHero.pos,qPred) < self.Q.range - minion.boundingRadius then
		ReleaseSpell(HK_Q,qPred,self.Q.range,100)
		self.lastMinion = minion
		self.lastMinion_tick = GetTickCount() + 200
	end
end

function Xerath:useWCC(target)
	if GetDistance(myHero.pos,target.pos) < self.W.range - 50 then
		if self:IsImmobileTarget(target) == true then
			CastSpell(HK_W,target.pos,self.W.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:useWhighHit(target,wPred)
	local afterE = false
	if Game.CanUseSpell(_E) == 0 and myHero:GetSpellData(_W).mana + myHero:GetSpellData(_E).mana <= myHero.mana and GetDistance(myHero.pos,target.pos) <= 750 then
		if target:GetCollision(self.E.width,self.E.speed,self.E.delay) == 0 then
			afterE = true
		end
	end
	if Game.Timer() - OnWaypoint(target).time > 0.05 and (Game.Timer() - OnWaypoint(target).time < 0.20 or Game.Timer() - OnWaypoint(target).time > 1.25) and GetDistance(myHero.pos,wPred) < self.W.range - 50 and afterE == false then
		CastSpell(HK_W,wPred,self.W.range)
		self.lastTarget = target
		self.lastTarget_tick = GetTickCount() + 200
	end
end

function Xerath:useWhighHitGSO(target)
	local afterE = false
	if Game.CanUseSpell(_E) == 0 and myHero:GetSpellData(_W).mana + myHero:GetSpellData(_E).mana <= myHero.mana and GetDistance(myHero.pos,target.pos) <= 750 then
		if target:GetCollision(self.E.width,self.E.speed,self.E.delay) == 0 then
			afterE = true
		end
	end
	if Game.Timer() - OnWaypoint(target).time > 0.05 and (Game.Timer() - OnWaypoint(target).time < 0.20 or Game.Timer() - OnWaypoint(target).time > 1.25) and GetDistance(myHero.pos,target.pos) < self.W.range - 50 and afterE == false then
		local pred = GetGamsteronPrediction(target, WData, myHero)
		if pred.Hitchance >= _G.HITCHANCE_NORMAL then
			CastSpell(HK_W,pred.CastPosition,self.W.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end	
	end
end

function Xerath:useWhighHitHPred(target)
	local afterE = false
	if Game.CanUseSpell(_E) == 0 and myHero:GetSpellData(_W).mana + myHero:GetSpellData(_E).mana <= myHero.mana and GetDistance(myHero.pos,target.pos) <= 750 then
		if target:GetCollision(self.E.width,self.E.speed,self.E.delay) == 0 then
			afterE = true
		end
	end
	if Game.Timer() - OnWaypoint(target).time > 0.05 and (Game.Timer() - OnWaypoint(target).time < 0.20 or Game.Timer() - OnWaypoint(target).time > 1.25) and GetDistance(myHero.pos,target.pos) < self.W.range - 50 and afterE == false then
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, W.range, W.delay, W.speed, W.radius, W.collision)
		if hitRate and hitRate >= 1 then
			CastSpell(HK_W,aimPosition,self.W.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end	
	end
end

function Xerath:useWdash(target)
	if OnWaypoint(target).speed > target.ms then
		local wPred = GetPred(target,math.huge,0.5)
		if GetDistance(myHero.pos,wPred) < self.W.range then
			CastSpell(HK_W,wPred,self.W.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:useWdashGSO(target)
	if OnWaypoint(target).speed > target.ms then
		local pred = GetGamsteronPrediction(target, WData, myHero)
		if GetDistance(myHero.pos,target.pos) < self.W.range and pred.Hitchance >= _G.HITCHANCE_NORMAL then
			CastSpell(HK_W,pred.CastPosition,self.W.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:useWdashHPred(target)
	if OnWaypoint(target).speed > target.ms then
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, W.range, W.delay, W.speed, W.radius, W.collision)
		if GetDistance(myHero.pos,target.pos) < self.W.range and hitRate and hitRate >= 1 then
			CastSpell(HK_W,aimPosition,self.W.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:useWkill(target,wPred)
	if Game.Timer() - OnWaypoint(target).time > 0.05 and GetDistance(myHero.pos,wPred) < self.W.range then
		if target.health + target.shieldAP + target.shieldAD < CalcuMagicalDamage(myHero,target,30 + 30*myHero:GetSpellData(_W).level + (0.6*myHero.ap)) then
			CastSpell(HK_W,wPred,self.W.range)
		end
	end
end

function Xerath:useWkillGSO(target)
	if Game.Timer() - OnWaypoint(target).time > 0.05 and GetDistance(myHero.pos,target.pos) < self.W.range then
		if target.health + target.shieldAP + target.shieldAD < CalcuMagicalDamage(myHero,target,30 + 30*myHero:GetSpellData(_W).level + (0.6*myHero.ap)) then
			local pred = GetGamsteronPrediction(target, WData, myHero)
			if pred.Hitchance >= _G.HITCHANCE_NORMAL then
				CastSpell(HK_W,pred.CastPosition,self.W.range)
			end	
		end
	end
end

function Xerath:useWkillHPred(target)
	if Game.Timer() - OnWaypoint(target).time > 0.05 and GetDistance(myHero.pos,target.pos) < self.W.range then
		if target.health + target.shieldAP + target.shieldAD < CalcuMagicalDamage(myHero,target,30 + 30*myHero:GetSpellData(_W).level + (0.6*myHero.ap)) then
			local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, W.range, W.delay, W.speed, W.radius, W.collision)
			if hitRate and hitRate >= 1 then
				CastSpell(HK_W,aimPosition,self.W.range)
			end	
		end
	end
end

function Xerath:useECC()
	local target = GetTarget(self.E.range,"AP")
	if target then
		if GetDistance(myHero.pos,target.pos) < self.E.range - 20 then
			if self:IsImmobileTarget(target) == true and target:GetCollision(self.E.width,self.E.speed,0.25) == 0 then
				CastSpell(HK_E,target.pos,5000)
				self.lastTarget = target
				self.lastTarget_tick = GetTickCount() + 200
			end
		end
	end
end

function Xerath:useEbrainAFK(target,ePred)
	if Game.Timer() - OnWaypoint(target).time > 0.05 and (Game.Timer() - OnWaypoint(target).time < 0.125 or Game.Timer() - OnWaypoint(target).time > 1.25) and GetDistance(myHero.pos,ePred) < self.E.range then
		if GetDistance(myHero.pos,ePred) <= 800 then
			CastSpell(HK_E,ePred,self.E.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		else
			if target.ms < 340 then
				CastSpell(HK_E,ePred,self.E.range)
				self.lastTarget = target
				self.lastTarget_tick = GetTickCount() + 200
			end
		end
	end
end

function Xerath:useEbrainAFKGSO(target)
	if Game.Timer() - OnWaypoint(target).time > 0.05 and (Game.Timer() - OnWaypoint(target).time < 0.125 or Game.Timer() - OnWaypoint(target).time > 1.25) and GetDistance(myHero.pos,target.pos) < self.E.range then
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if GetDistance(myHero.pos,target.pos) <= 800 and pred.Hitchance >= _G.HITCHANCE_NORMAL then
			CastSpell(HK_E,pred.CastPosition,self.E.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		else
			if target.ms < 340 then
				CastSpell(HK_E,pred.CastPosition,self.E.range)
				self.lastTarget = target
				self.lastTarget_tick = GetTickCount() + 200
			end
		end
	end
end

function Xerath:useEbrainAFKHPred(target)
	if Game.Timer() - OnWaypoint(target).time > 0.05 and (Game.Timer() - OnWaypoint(target).time < 0.125 or Game.Timer() - OnWaypoint(target).time > 1.25) and GetDistance(myHero.pos,target.pos) < self.E.range then
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.radius, E.collision)
		if GetDistance(myHero.pos,target.pos) <= 800 and hitRate and hitRate >= 1 then
			CastSpell(HK_E,aimPosition,self.E.range)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		else
			if target.ms < 340 then
				CastSpell(HK_E,aimPosition,self.E.range)
				self.lastTarget = target
				self.lastTarget_tick = GetTickCount() + 200
			end
		end
	end
end

function Xerath:useEdash(target)
	if OnWaypoint(target).speed > target.ms then
		local ePred = GetPred(target,math.huge,0.5)
		if GetDistance(myHero.pos,ePred) < self.E.range and target:GetCollision(self.E.width,self.E.speed,1) == 0 then
			CastSpell(HK_E,ePred,5000)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:useEdashGSO(target)
	if OnWaypoint(target).speed > target.ms then
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if GetDistance(myHero.pos,target.pos) < self.E.range and pred.Hitchance >= _G.HITCHANCE_NORMAL then
			CastSpell(HK_E,pred.CastPosition,5000)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:useEdashHPred(target)
	if OnWaypoint(target).speed > target.ms then
		local hitRate, aimPosition = HPred:GetHitchance(myHero.pos, target, E.range, E.delay, E.speed, E.radius, E.collision)
		if GetDistance(myHero.pos,target.pos) < self.E.range and hitRate and hitRate >= 1 then
			CastSpell(HK_E,aimPosition,5000)
			self.lastTarget = target
			self.lastTarget_tick = GetTickCount() + 200
		end
	end
end

function Xerath:startR(target)
	local eAallowed = 0
	if GetDistance(myHero.pos,target.pos) < 1200 + 250*myHero:GetSpellData(_R).level and target.visible then
		eAallowed = 1
	end
	if self.chargeR == false and CountEnemiesInRange(myHero.pos,2500) <= eAallowed and GetDistance(myHero.pos,target.pos) > 1300 and not (GetDistance(myHero.pos,target.pos) < 1500 and Game.CanUseSpell(_Q) == 0) and (OnVision(target).state == true or (OnVision(target).state == false and GetTickCount() - OnVision(target).tick < 50)) then
		if self.Menu.Combo.R.useBlue:Value() then
			local blue = GetItemSlot(myHero,3363)
			if blue > 0 and CanUseSpell(blue) and OnVision(target).state == false and GetDistance(myHero.pos,target.pos) < 3800 then
				local bluePred = GetPred(target,math.huge,0.25)
				CastSpellMM(HK_ITEM_7,bluePred,4000,50)
			else
				CastSpell(HK_R,myHero.pos + Vector(myHero.pos,target.pos):Normalized() * math.random(500,800),2200 + 1320*myHero:GetSpellData(_R).level,50)
			end
		else
			CastSpell(HK_R,myHero.pos + Vector(myHero.pos,target.pos):Normalized() * math.random(500,800),2200 + 1320*myHero:GetSpellData(_R).level,50)
		end
		self.R_target = target
		self.firstRCast = true
	end
end

function Xerath:useRkill(target)
	if self.chargeR == false and self.Menu.Combo.R.BlackList[target.charName] ~= nil and not self.Menu.Combo.R.useRself:Value() and self.Menu.Combo.R.BlackList[target.charName]:Value() == false then
		local rDMG = CalcuMagicalDamage(myHero,target,160+40*myHero:GetSpellData(_R).level + (myHero.ap*0.43))*(2+myHero:GetSpellData(_R).level - self.Menu.Combo.R.safeR:Value())
		if target.health + target.shieldAP + target.shieldAD < rDMG then
			local delay =  math.floor((target.health + target.shieldAP + target.shieldAD)/(rDMG/(2+myHero:GetSpellData(_R).level))) * 0.8
			if GetDistance(myHero.pos,target.pos) + target.ms*delay <= 2200 + 1320*myHero:GetSpellData(_R).level and not IsImmune(target) then
				self:startR(target)
			end
		end
	end
end

function Xerath:useRonKey()
	if self.Menu.Combo.R.useRkey:Value() then
		if self.chargeR == true and Game.CanUseSpell(_R) == 0 then
			local target = self:GetTarget(500,"AP",mousePos)
			if not target then target = self:GetTarget(2200 + 1320*myHero:GetSpellData(_R).level,"AP") end
			if target and not IsImmune(target) then
				
				local rPred = GetPred(target,math.huge,0.45)
				if rPred:ToScreen().onScreen then
					CastSpell(HK_R,rPred,2200 + 1320*myHero:GetSpellData(_R).level,100)
					self.R_target = target
					self.R_target_tick = GetTickCount()
				else
					CastSpellMM(HK_R,rPred,2200 + 1320*myHero:GetSpellData(_R).level,100)
					self.R_target = target
					self.R_target_tick = GetTickCount()
				end
			end
		end
	end
end

function Xerath:AutoR()

	if self.chargeR == true and Game.CanUseSpell(_R) == 0 then
		
		if not target then target = self:GetTarget(2200 + 1320*myHero:GetSpellData(_R).level,"AP") end
		if target and not IsImmune(target) then
				
			local rPred = GetPred(target,math.huge,0.45)
			if rPred:ToScreen().onScreen then
				CastSpell(HK_R,rPred,2200 + 1320*myHero:GetSpellData(_R).level,100)
				self.R_target = target
				self.R_target_tick = GetTickCount()
			else
				CastSpellMM(HK_R,rPred,2200 + 1320*myHero:GetSpellData(_R).level,100)
				self.R_target = target
				self.R_target_tick = GetTickCount()
				
			end
		end
	end
end

local _targetSelect
local _targetSelectTick = GetTickCount()
function Xerath:GetRTarget(closeRange,maxRange)
local tick = GetTickCount()
if tick - _targetSelectTick > 200 then
	_targetSelectTick = tick
	local killable = {}
		for i,hero in pairs(self:GetEnemyHeroes()) do
			if hero.isEnemy and hero.valid and not hero.dead and hero.isTargetable and (OnVision(hero).state == true or (OnVision(hero).state == false and GetTickCount() - OnVision(hero).tick < 50)) and hero.isTargetable and GetDistance(myHero.pos,hero.pos) < maxRange then
				local stacks = self.R_Stacks
				local rDMG = CalcuMagicalDamage(myHero,hero,160+40*myHero:GetSpellData(_R).level + (myHero.ap*0.43))*stacks
				if hero.health + hero.shieldAP + hero.shieldAD < rDMG then
					killable[hero.networkID] = hero
				end
			end
		end
		local target
		local p = 0
		local oneshot = false
		for i,kill in pairs(killable) do
			if (CalcuMagicalDamage(myHero,kill,160+40*myHero:GetSpellData(_R).level + (myHero.ap*0.43)) > kill.health + kill.shieldAP + kill.shieldAD) then
				if p < Priority(kill.charName) then
					p = Priority(kill.charName)
					target = kill
					oneshot = true
				end
			else
				if p < Priority(kill.charName) and oneshot == false then
					p = Priority(kill.charName)
					target = kill
				end
			end
		end
		if target then
			_targetSelect = target
			return _targetSelect
		end
	if CountEnemiesInRange(myHero.pos,closeRange) >= 2 then
		local t = GetTarget(closeRange,"AP")
		_targetSelect = t
		return _targetSelect
	else
		local t = GetTarget(maxRange,"AP")
		_targetSelect = t
		return _targetSelect
	end
end

if _targetSelect and not _targetSelect.dead then
	return _targetSelect
else
	_targetSelect = GetTarget(maxRange,"AP")
	return _targetSelect
end

end




--------------------------------------------------------------------------------------------------------------------------------------------------------------





class "XinZhao"







function XinZhao:GetValidEnemy(range)
    for i = 1,Game.HeroCount() do
        local enemy = Game.Hero(i)
        if  enemy.team ~= myHero.team and enemy.valid and enemy.pos:DistanceTo(myHero.pos) < E.range then
            return true
        end
    end
    return false
end

function XinZhao:GetValidMinion(range)
    for i = 1,Game.MinionCount() do
        local minion = Game.Minion(i)
        if  minion.team ~= myHero.team and minion.valid and minion.pos:DistanceTo(myHero.pos) < E.range then
            return true
        end
    end
    return false
end

function XinZhao:isReady(spell)
return Game.CanUseSpell(spell) == 0 and myHero:GetSpellData(spell).level > 0 and myHero:GetSpellData(spellSlot).mana < myHero.mana
end

function XinZhao:EDMG(unit)
	total = 0
	local eLvl = myHero:GetSpellData(_E).level
    if eLvl > 0 then
	local edamage = (({50,75,100,125,150})[eLvl] + 0.6 * myHero.ap)
	total = edamage
	end
	return total
end

function XinZhao:HpPred(unit, delay)
	if _G.GOS then
		hp =  GOS:HP_Pred(unit,delay)
	else
		hp = unit.health
	end
	return hp
end

function XinZhao:__init()
	self:LoadSpells()
	self:LoadMenu()
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end)
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end	
end

function XinZhao:LoadSpells()
	Q = {range = 375}
	W = {range = 900, Delay = 0.30, Width = 70, Speed = 1600, Collision = false, aoe = false}
	E = {range = 650}
	R = {range = 500}
end



function XinZhao:LoadMenu()
	--Main Menu
	self.Menu = MenuElement({type = MENU, id = "Menu", name = "赵信"})
	
	--Main Menu-- PussyXinZhao
	self.Menu:MenuElement({type = MENU, id = "Mode", name = "赵信"})
	--Main Menu-- PussyXinZhao -- Combo
	self.Menu.Mode:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Mode.Combo:MenuElement({id = "Q", name = "使用Q", value = true})
	self.Menu.Mode.Combo:MenuElement({id = "W", name = "目标逃跑时使用W", value = true})
	self.Menu.Mode.Combo:MenuElement({id = "E", name = "使用E", value = true})
	self.Menu.Mode.Combo:MenuElement({id = "R", name = "使用R", value = true})
	self.Menu.Mode.Combo:MenuElement({id = "RHP", name = "", value = 20, min = 0, max = 100, step = 1})
	self.Menu.Mode.Combo:MenuElement({id = "myRHP", name = "", value = 30, min = 0, max = 100, step = 1})
	
	--Main Menu-- PussyXinZhao -- Harass
	self.Menu.Mode:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})
	self.Menu.Mode.Harass:MenuElement({id = "W", name = "使用W", value = true})
	self.Menu.Mode.Harass:MenuElement({type = MENU, id = "MM", name = "法力管理"})
	self.Menu.Mode.Harass.MM:MenuElement({id = "WMana", name = "", value = 40, min = 0, max = 100, step = 1})
	--Main Menu-- PussyXinZhao -- LaneClear
	self.Menu.Mode:MenuElement({type = MENU, id = "LaneClear", leftIcon = Icons["Clear"]})
	self.Menu.Mode.LaneClear:MenuElement({id = "W", name = "使用W", value = true})
	self.Menu.Mode.LaneClear:MenuElement({id = "WMinion", name = "当X小兵使用W", value = 3,min = 1, max = 4, step = 1})
	self.Menu.Mode.LaneClear:MenuElement({id = "Q", name = "使用Q", value = true})
	self.Menu.Mode.LaneClear:MenuElement({id = "E", name = "使用E", value = true})
	--Main Menu-- PussyXinZhao -- JungleClear
	self.Menu.Mode:MenuElement({type = MENU, id = "JungleClear", leftIcon = Icons["JClear"]})
	self.Menu.Mode.JungleClear:MenuElement({id = "Q", name = "使用Q", value = true})
	self.Menu.Mode.JungleClear:MenuElement({id = "W", name = "使用W", value = true})
	self.Menu.Mode.JungleClear:MenuElement({id = "E", name = "使用E", value = true})
	
	--Main Menu-- PussyXinZhao -- KillSteal
	self.Menu.Mode:MenuElement({type = MENU, id = "KS", leftIcon = Icons["ks"]})
	self.Menu.Mode.KS:MenuElement({id = "E", name = "使用E斩杀", value = true})	
	
	--Main Menu-- PussyXinZhao -- Spell Range 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "E", name = "绘制E范围", value = true})
	self.Menu.Drawing:MenuElement({id = "Width", name = "宽度", value = 1, min = 1, max = 5, step = 1})
	self.Menu.Drawing:MenuElement({id = "Color", name = "颜色", color = Draw.Color(255, 255, 255, 255)})
end

function XinZhao:Tick()
if MyHeroReady() then
local Mode = GetMode()
	if Mode == "Combo" then
		self:Combo()
	elseif Mode == "Harass" then
		self:Harass()
	elseif Mode == "Clear" then
		self:Clear()
	elseif Mode == "Flee" then
		
	end	
		
	self:KS()
end
end

function XinZhao:KS()
	local target =  (_G.SDK and _G.SDK.TargetSelector:GetTarget(800, _G.SDK.DAMAGE_TYPE_PHYSICAL)) or (_G.GOS and _G.GOS:GetTarget(800,"AD")) or ( _G.EOWLoaded and EOW:GetTarget())
	
	if IsValid(target,650) and myHero.pos:DistanceTo(target.pos) <= 650 then
		local edamage = self:EDMG(target)
		if self.Menu.Mode.KS.E:Value() and self:isReady(_E) and not myHero.isChanneling and edamage > self:HpPred(target,1) + target.hpRegen * 1  then
			Control.CastSpell(HK_E,target)
		end
	end			
end

function XinZhao:Combo()

	if self:GetValidEnemy(800) == false then return end
	
	if (not _G.SDK and not _G.GOS and not _G.EOWLoaded) then return end
	
	local target =  (_G.SDK and _G.SDK.TargetSelector:GetTarget(800, _G.SDK.DAMAGE_TYPE_PHYSICAL)) or (_G.GOS and _G.GOS:GetTarget(800,"AD")) or ( _G.EOWLoaded and EOW:GetTarget())
		
			if IsValid(target,650) and myHero.pos:DistanceTo(target.pos) <= 650 and self.Menu.Mode.Combo.E:Value() and self:isReady(_E) and not myHero.isChanneling  then
			Control.CastSpell(HK_E,target)
	    	if IsValid(target,900) and myHero.pos:DistanceTo(target.pos) > 400 and self.Menu.Mode.Combo.W:Value() and self:isReady(_W) and not myHero.isChanneling  then
			Control.CastSpell(HK_W,target)
	    	end
	    	if IsValid(target,375) and self.Menu.Mode.Combo.Q:Value() and self:isReady(_Q) and myHero.attackData.state == STATE_WINDUP  then
			Control.CastSpell(HK_Q)
	    	end 
	    	if IsValid(target,500) and self.Menu.Mode.Combo.R:Value() and self:isReady(_R) and target.health/target.maxHealth <= self.Menu.Mode.Combo.RHP:Value()/100 and not myHero.isChanneling  then
			Control.CastSpell(HK_R)
	    	end
	    end		
		if IsValid(target,900) and myHero.pos:DistanceTo(target.pos) > 400 and self.Menu.Mode.Combo.W:Value() and self:isReady(_W) and not myHero.isChanneling  then
		Control.CastSpell(HK_W,target)
	    	if IsValid(target,375) and self.Menu.Mode.Combo.Q:Value() and self:isReady(_Q) and myHero.attackData.state == STATE_WINDUP  then
		Control.CastSpell(HK_Q)
	    	end
	    	if IsValid(target,500) and self.Menu.Mode.Combo.R:Value() and self:isReady(_R) and target.health/target.maxHealth <= self.Menu.Mode.Combo.RHP:Value()/100 and not myHero.isChanneling  then
		Control.CastSpell(HK_R)
	    	end
	    end	
	    if IsValid(target,375) and self.Menu.Mode.Combo.Q:Value() and self:isReady(_Q) and myHero.attackData.state == STATE_WINDUP  then
		Control.CastSpell(HK_Q)
	    	if IsValid(target,500) and self.Menu.Mode.Combo.R:Value() and self:isReady(_R) and target.health/target.maxHealth <= self.Menu.Mode.Combo.RHP:Value()/100 and not myHero.isChanneling  then
		Control.CastSpell(HK_R)
	    	end
	    end   
		if IsValid(target,R.range) and self.Menu.Mode.Combo.R:Value() and self:isReady(_R) and target.health/target.maxHealth <= self.Menu.Mode.Combo.RHP:Value()/100 and not myHero.isChanneling  then
		Control.CastSpell(HK_R)
	    end
		if IsValid(target,500) and self.Menu.Mode.Combo.R:Value() and self:isReady(_R) and not myHero.isChanneling and
		myHero.health/myHero.maxHealth <= self.Menu.Mode.Combo.myRHP:Value()/100 then
		Control.CastSpell(HK_R)
		end
		

end	


function XinZhao:Harass()

	if self:GetValidEnemy(800) == false then return end
	
	if (not _G.SDK and not _G.GOS and not _G.EOWLoaded) then return end
	
	local target =  (_G.SDK and _G.SDK.TargetSelector:GetTarget(800, _G.SDK.DAMAGE_TYPE_PHYSICAL)) or (_G.GOS and _G.GOS:GetTarget(800,"AD")) or ( _G.EOWLoaded and EOW:GetTarget())
		
	if target.pos:DistanceTo(myHero.pos) <= W.range and (myHero.mana/myHero.maxMana >= self.Menu.Mode.Harass.MM.WMana:Value() / 100) and self.Menu.Mode.Harass.W:Value() and self:isReady(_W) and not myHero.isChanneling  then
		Control.CastSpell(HK_W,target)
	end
end



function XinZhao:Clear()

	if self:GetValidMinion(600) == false then return end
	for i = 1, Game.MinionCount() do
	local minion = Game.Minion(i)
			if minion.team == TEAM_ENEMY then
				if minion.pos:DistanceTo(myHero.pos) <= E.range and self.Menu.Mode.LaneClear.E:Value() and self:isReady(_E) then
					Control.CastSpell(HK_E,minion)
					break
				end	
				if IsValid(minion,W.range) and self.Menu.Mode.LaneClear.W:Value() and self:isReady(_W) then
					if GetMinionCount(W.range, minion) >= self.Menu.Mode.LaneClear.WMinion:Value() then
						Control.CastSpell(HK_W,minion)
						break
					end	
				end
				if IsValid(minion,Q.range) and self.Menu.Mode.LaneClear.Q:Value() and self:isReady(_Q) then
					Control.CastSpell(HK_Q)
					break
				end
			end
			if minion.team == TEAM_JUNGLE then
				if  minion.pos:DistanceTo(myHero.pos) <= E.range and self.Menu.Mode.JungleClear.E:Value() and self:isReady(_E) then
					Control.CastSpell(HK_E,minion)
					break
				end
				if IsValid(minion,Q.range) and self.Menu.Mode.JungleClear.Q:Value() and self:isReady(_Q) then
				Control.CastSpell(HK_Q)
				break
				end 
				if IsValid(minion,W.range) and self.Menu.Mode.JungleClear.W:Value() and self:isReady(_W) then
					Control.CastSpell(HK_W,minion)
					break
				end	
			end
		end
	end

	
function XinZhao:Draw()
if myHero.dead then return end
	if self.Menu.Drawing.E:Value() then 
		Draw.Circle(myHero.pos, 650, self.Menu.Drawing.Width:Value(), self.Menu.Drawing.Color:Value())	
	end	
end	


--------------------------------------------------------------------------------------------------------------------------------------------------------------

class "Yuumi"




    
--require('GamsteronPrediction')



local QData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.5, Radius = 65, Range = 1150, Speed = 100, Collision = true, MaxCollision = 0, CollisionTypes = {_G.COLLISION_MINION, _G.COLLISION_YASUOWALL}
}


function Yuumi:__init()
	self.DetectedMissiles = {}; self.DetectedSpells = {}; self.Target = nil; self.Timer = 0
	if menu ~= 1 then return end
	menu = 2   	
	self:LoadMenu()                                            
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end


function Yuumi:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Yuumi", name = "悠米"})

	--AutoW
	self.Menu:MenuElement({type = MENU, id = "AutoW", name = "自动[W]"})
	self.Menu.AutoW:MenuElement({id = "UseW", name = "[W]自我的安全[自动搜索坦克是盟友]", value = true})
	self.Menu.AutoW:MenuElement({id = "myHP", name = "最小HP盟友寻找", value = 30, min = 0, max = 100, identifier = "%"})
	self.Menu.AutoW:MenuElement({id = "SwitchW", name = "[W]自动使用给盟友", value = true})
	self.Menu.AutoW:MenuElement({id = "AllyHP", name = "最小HP盟友使用", value = 10, min = 0, max = 100, identifier = "%"})



	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", name = "自动[E]"})
	self.Menu.AutoE:MenuElement({id = "UseEself", name = "[E]自动自我治疗", value = true})
	self.Menu.AutoE:MenuElement({id = "myHP", name = "最小HP自我治疗", value = 30, min = 0, max = 100, identifier = "%"})
	self.Menu.AutoE:MenuElement({id = "UseEally", name = "[W]+[E]自动治疗盟军", value = true})
	self.Menu.AutoE:MenuElement({id = "AllyHP", name = "最小HP治疗盟军", value = 70, min = 0, max = 100, identifier = "%"})	
	
	--AutoR on Immobile
	self.Menu:MenuElement({type = MENU, id = "AutoR", name = "自动R固定"})
	self.Menu.AutoR:MenuElement({id = "UseR", name = "[R]", value = true})
	self.Menu.AutoR:MenuElement({id = "UseRE", name = "使用[R]最小固定目标", value = 2, min = 1, max = 5})	
	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", name = "走砍"})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]如果不是盟友", value = true})	
	self.Menu.Combo:MenuElement({id = "UseQAlly", name = "[Q]如果有盟友[使用]", value = false})	
	self.Menu.Combo:MenuElement({id = "UseR", name = "[R]", value = true})
	self.Menu.Combo:MenuElement({id = "UseRE", name = "使用[R]最小目标", value = 3, min = 1, max = 5})	
	

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", name = "骚扰"})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]如果不是盟友", value = true})
	self.Menu.Harass:MenuElement({id = "UseQAlly", name = "[Q]如果有盟友[使用]", value = false})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", name = "清线"})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]如果不是盟友", value = true})		  	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", name = "JClear"})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]如果不是盟友", value = true})         	
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", name = "ks"})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]如果不是盟友", value = true})	
	self.Menu.ks:MenuElement({id = "UseQAlly", name = "[Q]如果有盟友[使用]", value = true})	
	self.Menu.ks:MenuElement({id = "UseR", name = "[R]如果不是有界盟友", value = true})	
	self.Menu.ks:MenuElement({id = "UseRAlly", name = "[R]如果有界盟友", value = true})
	self.Menu.ks:MenuElement({id = "UseWR", name = "[W]+[R]如果盟军范围内有可杀死的敌人", value = true})	

	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", name = "图纸"})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})
	
	
end

function Yuumi:Tick()
if MyHeroReady() then
local Mode = GetMode()
	if Mode == "Combo" then
		self:Combo()
	elseif Mode == "Harass" then
		self:Harass()
	elseif Mode == "Clear" then
		self:Clear()
		self:JungleClear()
	elseif Mode == "Flee" then
		
	end	
	self:KillSteal()
	self:AutoE()
	self:AutoW()
	self:AutoR()
	

end
end 



function Yuumi:GetTankAlly(pos, range)
local Allys = GetAllyHeroes()
local bestAlly, highest = nil, 0
local pos = pos.pos
local Range = range * range

for i = 1, #Allys do
    local ally = Allys[i]
    local amount = ally.armor + ally.magicResist + ally.health
	if GetDistanceSqr(pos, ally.pos) < Range then
		if amount > highest then
			highest = amount
			bestAlly = ally
		end	
    end
end

return bestAlly
end

function Yuumi:AutoR()
local target = GetTarget(1200)     	
if target == nil then return end	
		
	if IsValid(target,1200) and myHero.pos:DistanceTo(target.pos) <= 1100 and GetImmobileCount(300, target) >= self.Menu.AutoR.UseRE:Value() then	
		if self.Menu.AutoR.UseR:Value() and Ready(_R) then 
			if GotBuff(Ally, "YuumiWAlly") == 0 then   
				Control.CastSpell(HK_R, target.pos)
			end
			if GotBuff(Ally, "YuumiWAlly") > 0 then   
				Control.CastSpell(HK_R, target.pos)
			end
		end
	end
end
	

function Yuumi:AutoE()
	for i, Ally in pairs(GetAllyHeroes()) do	
		if self.Menu.AutoE.UseEself:Value() and Ready(_E) and GotBuff(Ally, "YuumiWAlly") == 0 then
			if myHero.health/myHero.maxHealth <= self.Menu.AutoE.myHP:Value() / 100 then
				Control.CastSpell(HK_E)
			end
		end
		if IsValid(Ally,1000) and myHero.pos:DistanceTo(Ally.pos) <= 700 then	
			if self.Menu.AutoE.UseEally:Value() and Ready(_E) then
				if Ally.health/Ally.maxHealth <= self.Menu.AutoE.AllyHP:Value() / 100 then
					if Ready(_W) and GotBuff(Ally, "YuumiWAlly") == 0 then   
						Control.CastSpell(HK_W, Ally)	
					end
				end
				if GotBuff(Ally, "YuumiWAlly") > 0 and Ally.health/Ally.maxHealth <= self.Menu.AutoE.AllyHP:Value() / 100 then 	
					Control.CastSpell(HK_E)
				end
			end
		end
	end
end



function Yuumi:AutoW()
	for i, Ally in pairs(GetAllyHeroes()) do
		
		if IsValid(Ally,1000) then	
			local BoundAlly = GotBuff(Ally, "YuumiWAlly")	
			local bestAlly = self:GetTankAlly(myHero, 700)
			if self.Menu.AutoW.UseW:Value() and Ready(_W) and GotBuff(Ally, "YuumiWAlly") == 0 then
				if myHero.health/myHero.maxHealth <= self.Menu.AutoW.myHP:Value() / 100 then
					if bestAlly then 
						Control.CastSpell(HK_W, bestAlly)
					end
				end
			end	
			if self.Menu.AutoW.SwitchW:Value() and Ready(_W) and GotBuff(Ally, "YuumiWAlly") > 0 then  
				if BoundAlly and Ally.health/Ally.maxHealth <= self.Menu.AutoW.AllyHP:Value() / 100 then
					if bestAlly	then 
						Control.CastSpell(HK_W, bestAlly)
					end
				end
			end			
		end	
	end
end	

			
function Yuumi:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 1100, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 1150, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 700, 1, Draw.Color(225, 225, 125, 10))
	end
end
       
function Yuumi:KillSteal()	
	local target = GetTarget(1300)     	
	if target == nil then return end
	for i, Ally in pairs(GetAllyHeroes()) do
	if IsValid(target,1300) then	
		local hp = target.health	
		if myHero.pos:DistanceTo(target.pos) <= 1150 and self.Menu.ks.UseQ:Value() and Ready(_Q) and GotBuff(Ally, "YuumiWAlly") == 0 then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= hp and pred.Hitchance >= _G.HITCHANCE_NORMAL then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 1100 and self.Menu.ks.UseR:Value() and Ready(_R) and GotBuff(Ally, "YuumiWAlly") == 0 then
			local RDmg = getdmg("R", target, myHero)
			if RDmg >= hp then			
				Control.CastSpell(HK_R, target.pos)
	
			end
		end
		if IsValid(Ally,1000) and myHero.pos:DistanceTo(target.pos) <= 1100 then
		if self.Menu.ks.UseRAlly:Value() and Ready(_R) and GotBuff(Ally, "YuumiWAlly") > 0 then 
			local RDmg = getdmg("R", target, myHero)
			if RDmg >= hp then			
				Control.CastSpell(HK_R, target.pos)
	
			end
		end	
		if self.Menu.ks.UseWR:Value() and getdmg("R", target, myHero) >= hp then 
			if myHero.pos:DistanceTo(Ally.pos) <= 700 and myHero.pos:DistanceTo(Ally.pos) <= myHero.pos:DistanceTo(target.pos) then			
				if Ally.pos:DistanceTo(target.pos) <= 1100 and Ready(_W) and Ready(_R) then
					Control.CastSpell(HK_W, Ally)
				end
			end
			if myHero.pos:DistanceTo(target.pos) <= 1100 and Ready(_R) and GotBuff(Ally, "YuumiWAlly") > 0 then 
				Control.CastSpell(HK_R, target.pos)
			end
		end
		end
	end
	end
end	

function Yuumi:Combo()
local target = GetTarget(1200)
if target == nil then return end
for i, Ally in pairs(GetAllyHeroes()) do	
	if IsValid(target,1200) then		
		
		if myHero.pos:DistanceTo(target.pos) <= 1150 and self.Menu.Combo.UseQ:Value() and Ready(_Q) and GotBuff(Ally, "YuumiWAlly") == 0 then 
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= _G.HITCHANCE_NORMAL then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 1100 and self.Menu.Combo.UseR:Value() and Ready(_R) then 
			if GetEnemyCount(300, target) >= self.Menu.Combo.UseRE:Value() then
				if GotBuff(Ally, "YuumiWAlly") == 0 then   
					Control.CastSpell(HK_R, target.pos)
				end
				if GotBuff(Ally, "YuumiWAlly") > 0 then   
					Control.CastSpell(HK_R, target.pos)
				end
			end
		end
	end
end
end	

function Yuumi:Harass()
local target = GetTarget(1200)
if target == nil then return end
for i, Ally in pairs(GetAllyHeroes()) do	
	if IsValid(target,1200) and myHero.pos:DistanceTo(target.pos) <= 1150 and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if self.Menu.Harass.UseQ:Value() and Ready(_Q) and GotBuff(Ally, "YuumiWAlly") == 0 then 
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= _G.HITCHANCE_NORMAL then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
	end
end
end	

function Yuumi:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)

		if minion.team == TEAM_ENEMY and IsValid(minion, 1200) and myHero.pos:DistanceTo(minion.pos) <= 1150 and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 then					
			
			if Ready(_Q) and self.Menu.Clear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end	  
		end
	end
end

function Yuumi:JungleClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)	

		if minion.team == TEAM_JUNGLE and IsValid(minion, 1200) and myHero.pos:DistanceTo(minion.pos) <= 1150 and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then	
			if Ready(_Q) and self.Menu.JClear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end 
		end
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------



class "Zyra"





local EData =
{
Type = _G.SPELLTYPE_LINE, Delay = 0.25, Radius = 70, Range = 1100, Speed = 1150, 
Collision = true, MaxCollision = 0, CollisionTypes = { _G.COLLISION_YASUOWALL }
}

local QData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 0.85, Radius = 140, Range = 800, Speed = math.huge, Collision = false
}

local RData =
{
Type = _G.SPELLTYPE_CIRCLE, Delay = 2.0, Radius = 500, Range = 700, Speed = math.huge, Collision = false
}

function Zyra:__init()

if menu ~= 1 then return end
	menu = 2   	
	self:LoadMenu()                                            
	Callback.Add("Tick", function() self:Tick() end)
	Callback.Add("Draw", function() self:Draw() end) 
	if _G.EOWLoaded then
		Orb = 1
	elseif _G.SDK and _G.SDK.Orbwalker then
		Orb = 2
	elseif _G.gsoSDK then
		Orb = 4			
	end
end

function Zyra:LoadMenu()                     
	--MainMenu
	self.Menu = MenuElement({type = MENU, id = "Zyra", name = "婕拉"})

	--AutoE
	self.Menu:MenuElement({type = MENU, id = "AutoE", leftIcon = Icons["AutoE"]})
	self.Menu.AutoE:MenuElement({id = "UseE", name = "自动[E]在静止状态下", value = true})	
	
	--ComboMenu  
	self.Menu:MenuElement({type = MENU, id = "Combo", leftIcon = Icons["Combo"]})
	self.Menu.Combo:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})		
	self.Menu.Combo:MenuElement({id = "UseW", name = "[W] 狂野生长", value = true})
	self.Menu.Combo:MenuElement({id = "UseE", name = "[E]抓住", value = true})			
	
	--UltSettings
	self.Menu.Combo:MenuElement({type = MENU, id = "Ult", name = "终极设置"})
	self.Menu.Combo.Ult:MenuElement({id = "UseR", name = "[R] 绞杀之藤", value = true})
	self.Menu.Combo.Ult:MenuElement({id = "UseRE", name = "使用[R]最小目标", value = 2, min = 1, max = 6})
	self.Menu.Combo.Ult:MenuElement({id = "killR", name = "使用[R]可杀死目标", value = false})
	self.Menu.Combo.Ult:MenuElement({id = "Immo", name = "使用[R]固定目标>2", value = true})	

	--HarassMenu
	self.Menu:MenuElement({type = MENU, id = "Harass", leftIcon = Icons["Harass"]})	
	self.Menu.Harass:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})
	self.Menu.Harass:MenuElement({id = "UseE", name = "[E]抓住", value = true})
	self.Menu.Harass:MenuElement({id = "UseW", name = "[W] 狂野生长", value = true})	
	self.Menu.Harass:MenuElement({id = "Mana", name = "最小法力骚扰", value = 40, min = 0, max = 100, identifier = "%"})
  
	--LaneClear Menu
	self.Menu:MenuElement({type = MENU, id = "Clear", leftIcon = Icons["Clear"]})	
	self.Menu.Clear:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})		
	self.Menu.Clear:MenuElement({id = "UseE", name = "[E]抓住", value = true})  	
	self.Menu.Clear:MenuElement({id = "Mana", name = "最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})
  
	--JungleClear
	self.Menu:MenuElement({type = MENU, id = "JClear", leftIcon = Icons["JClear"]})
	self.Menu.JClear:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})         	
	self.Menu.JClear:MenuElement({id = "UseE", name = "[E]抓住", value = true})
	self.Menu.JClear:MenuElement({id = "Mana", name = "野区最小法力清除", value = 40, min = 0, max = 100, identifier = "%"})  
 
	--KillSteal
	self.Menu:MenuElement({type = MENU, id = "ks", leftIcon = Icons["ks"]})
	self.Menu.ks:MenuElement({id = "UseQ", name = "[Q]致命的刺", value = true})	
	self.Menu.ks:MenuElement({id = "UseE", name = "[E]抓住", value = true})	
	self.Menu.ks:MenuElement({id = "UseEQ", name = "[E] + [问]", value = true})

	--Prediction
	self.Menu:MenuElement({type = MENU, id = "Pred", leftIcon = Icons["Pred"]})
	self.Menu.Pred:MenuElement({id = "PredQ", name = "机会[Q]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredE", name = "机会[E]", value = 2, drop = {"Normal", "High", "Immobile"}})	
	self.Menu.Pred:MenuElement({id = "PredR", name = "命中率[R]", value = 2, drop = {"Normal", "High", "Immobile"}})

	--Drawing 
	self.Menu:MenuElement({type = MENU, id = "Drawing", leftIcon = Icons["Drawings"]})
	self.Menu.Drawing:MenuElement({id = "DrawQ", name = "画[Q]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawR", name = "画[R]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawE", name = "画[E]范围", value = true})
	self.Menu.Drawing:MenuElement({id = "DrawW", name = "画[W]范围", value = true})

	
	
end

function Zyra:Tick()
if MyHeroReady() then
local Mode = GetMode()
	if Mode == "Combo" then
		self:Combo()
	elseif Mode == "Harass" then
		self:Harass()
	elseif Mode == "Clear" then
		self:Clear()
		self:JungleClear()
	elseif Mode == "Flee" then
		
	end	
	self:KillSteal()
	self:AutoE()
	self:AutoR()
	self:ImmoR()	
	self:UseW()
end
end 

function Zyra:UseW()
local target = GetTarget(1200)     	
if target == nil then return end		
	if IsValid(target,1200) and myHero.pos:DistanceTo(target.pos) <= 850 and Ready(_W) then
		if IsImmobileTarget(target) then   
			DelayAction(function() 
			Control.CastSpell(HK_W, target.pos) 
			Control.CastSpell(HK_W, target.pos)
		
			end, 0.05)
		end	
	end
end

function Zyra:AutoE()
local target = GetTarget(1200)     	
if target == nil then return end	
	
	if IsValid(target,1200) and myHero.pos:DistanceTo(target.pos) <= 1000 and self.Menu.AutoE.UseE:Value() and Ready(_E) then
		local pred = GetGamsteronPrediction(target, EData, myHero)
		if IsImmobileTarget(target) and pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
			
			Control.CastSpell(HK_E, pred.CastPosition)
		end	
	end
end

function Zyra:AutoR()
local target = GetTarget(800)     	
if target == nil then return end
	
	if IsValid(target,800) and myHero.pos:DistanceTo(target.pos) <= 700 and self.Menu.Combo.Ult.killR:Value() and Ready(_R) then
		local hp = target.health
		local RDmg = getdmg("R", target, myHero)
		local QDmg = getdmg("Q", target, myHero)
		local EDmg = getdmg("E", target, myHero)
		local damage = RDmg + QDmg + EDmg + 300
		local pred = GetGamsteronPrediction(target, RData, myHero)
		if damage >= hp and pred.Hitchance >= self.Menu.Pred.PredR:Value() + 1 then
			Control.CastSpell(HK_R, pred.CastPosition)
		end	
	end
end	

function Zyra:ImmoR()
local target = GetTarget(800)     	
if target == nil then return end
	
	if IsValid(target,800) and myHero.pos:DistanceTo(target.pos) <= 700 and self.Menu.Combo.Ult.Immo:Value() and Ready(_R) then
		local count = GetImmobileCount(500, target)
		local pred = GetGamsteronPrediction(target, RData, myHero)
		if count >= 2 and pred.Hitchance >= self.Menu.Pred.PredR:Value() + 1 then
			Control.CastSpell(HK_R, pred.CastPosition)
		end	
	end
end

			
function Zyra:Draw()
  if myHero.dead then return end
	if self.Menu.Drawing.DrawR:Value() and Ready(_R) then
    Draw.Circle(myHero, 700, 1, Draw.Color(255, 225, 255, 10))
	end                                                 
	if self.Menu.Drawing.DrawQ:Value() and Ready(_Q) then
    Draw.Circle(myHero, 800, 1, Draw.Color(225, 225, 0, 10))
	end
	if self.Menu.Drawing.DrawE:Value() and Ready(_E) then
    Draw.Circle(myHero, 1100, 1, Draw.Color(225, 225, 125, 10))
	end
	if self.Menu.Drawing.DrawW:Value() and Ready(_W) then
    Draw.Circle(myHero, 850, 1, Draw.Color(225, 225, 125, 10))
	end
	local textPos = myHero.pos:To2D()	
	if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
		Draw.Text("GsoPred. installed Press 2x F6", 50, textPos.x + 100, textPos.y - 250, Draw.Color(255, 255, 0, 0))
	end	
end
       
function Zyra:KillSteal()	
	local target = GetTarget(1200)     	
	if target == nil then return end
	
	
	if IsValid(target,1200) then	
		local hp = target.health
		if myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.ks.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			local QDmg = getdmg("Q", target, myHero)
			if QDmg >= hp and pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 1000 and self.Menu.ks.UseE:Value() and Ready(_E) then
			local pred = GetGamsteronPrediction(target, EData, myHero)
			local EDmg = getdmg("E", target, myHero)
			if EDmg >= hp and pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then			
				
				Control.CastSpell(HK_E, pred.CastPosition)
	
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.ks.UseEQ:Value() and Ready(_E) and Ready(_Q) then
			local Epred = GetGamsteronPrediction(target, EData, myHero)
			local Qpred = GetGamsteronPrediction(target, QData, myHero)
			local QDmg = getdmg("Q", target, myHero)
			local EDmg = getdmg("E", target, myHero)
			local EQDmg = QDmg + EDmg
			if EQDmg >= hp then
				
				if Epred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then
					Control.CastSpell(HK_E, Epred.CastPosition)
				end	
				if Qpred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then	
					Control.CastSpell(HK_Q, Qpred.CastPosition)
				end
			end
		end
	end
end	

function Zyra:Combo()
local target = GetTarget(1200)
if target == nil then return end
	if IsValid(target,1200) then

		if myHero.pos:DistanceTo(target.pos) <= 850 and self.Menu.Combo.UseW:Value() and Ready(_W) then
			Control.CastSpell(HK_W, target.pos)
			DelayAction(function() 
			Control.CastSpell(HK_W, target.pos) 
			end, 0.05)
		end			
		
		if myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.Combo.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				Control.CastSpell(HK_Q, pred.CastPosition)
			end	
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 1000 and self.Menu.Combo.UseE:Value() and Ready(_E) then
			local pred = GetGamsteronPrediction(target, EData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then			
				Control.CastSpell(HK_E, pred.CastPosition)
	
			end
		end
		
		if myHero.pos:DistanceTo(target.pos) <= 700 and Ready(_R) and self.Menu.Combo.Ult.UseR:Value() then
			local pred = GetGamsteronPrediction(target, RData, myHero)
			local count = GetEnemyCount(500, target)
			if count >= self.Menu.Combo.Ult.UseRE:Value() and pred.Hitchance >= self.Menu.Pred.PredR:Value() + 1 then
				Control.CastSpell(HK_R, pred.CastPosition)
			end
		end
	end
end	

function Zyra:Harass()
local target = GetTarget(1200)
if target == nil then return end
	if IsValid(target,1200) and myHero.mana/myHero.maxMana >= self.Menu.Harass.Mana:Value() / 100 then
		
		if myHero.pos:DistanceTo(target.pos) <= 800 and self.Menu.Harass.UseQ:Value() and Ready(_Q) then
			local pred = GetGamsteronPrediction(target, QData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredQ:Value() + 1 then
				
				Control.CastSpell(HK_Q, pred.CastPosition)
			end
		end
		if myHero.pos:DistanceTo(target.pos) <= 1000 and self.Menu.Harass.UseE:Value() and Ready(_E) then
			local pred = GetGamsteronPrediction(target, EData, myHero)
			if pred.Hitchance >= self.Menu.Pred.PredE:Value() + 1 then			
				
				Control.CastSpell(HK_E, pred.CastPosition)
	
			end
		end
	end
end	

function Zyra:Clear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)

		if minion.team == TEAM_ENEMY and IsValid(minion, 1200) and myHero.mana/myHero.maxMana >= self.Menu.Clear.Mana:Value() / 100 then					
			
			if myHero.pos:DistanceTo(minion.pos) <= 800 and Ready(_Q) and self.Menu.Clear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end	

			if myHero.pos:DistanceTo(minion.pos) <= 1100 and Ready(_E) and self.Menu.Clear.UseE:Value() then
				Control.CastSpell(HK_E, minion.pos)
			end  
		end
	end
end

function Zyra:JungleClear()
	for i = 1, Game.MinionCount() do
    local minion = Game.Minion(i)	

		if minion.team == TEAM_JUNGLE and IsValid(minion, 1200) and myHero.mana/myHero.maxMana >= self.Menu.JClear.Mana:Value() / 100 then	
			if myHero.pos:DistanceTo(minion.pos) <= 800 and Ready(_Q) and self.Menu.JClear.UseQ:Value() then
				Control.CastSpell(HK_Q, minion.pos)
			end

			if myHero.pos:DistanceTo(minion.pos) <= 1100 and Ready(_E) and self.Menu.JClear.UseE:Value() then
				Control.CastSpell(HK_E, minion.pos)
			end  
		end
	end
end







-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Dmg Lib


function GetBaseHealth(unit)
    if unit.charName == "Sylas" then
        return 504.73 + 80.27 * myHero.levelData.lvl
    end
end



local DamageReductionTable = {
  ["Braum"] = {buff = "BraumShieldRaise", amount = function(target) return 1 - ({0.3, 0.325, 0.35, 0.375, 0.4})[target:GetSpellData(_E).level] end},
  ["Urgot"] = {buff = "urgotswapdef", amount = function(target) return 1 - ({0.3, 0.4, 0.5})[target:GetSpellData(_R).level] end},
  ["Alistar"] = {buff = "Ferocious Howl", amount = function(target) return ({0.5, 0.4, 0.3})[target:GetSpellData(_R).level] end},
  ["Amumu"] = {buff = "Tantrum", amount = function(target) return ({2, 4, 6, 8, 10})[target:GetSpellData(_E).level] end, damageType = 1},
  ["Galio"] = {buff = "GalioIdolOfDurand", amount = function(target) return 0.5 end},
  ["Garen"] = {buff = "GarenW", amount = function(target) return 0.7 end},
  ["Gragas"] = {buff = "GragasWSelf", amount = function(target) return ({0.1, 0.12, 0.14, 0.16, 0.18})[target:GetSpellData(_W).level] end},
  ["Annie"] = {buff = "MoltenShield", amount = function(target) return 1 - ({0.16,0.22,0.28,0.34,0.4})[target:GetSpellData(_E).level] end},
  ["Kayle"] = {buff = "Kaylepassiveshield", amount = function(target) return 0.1 end}
}

function GetPercentHP(unit)
  return 100 * unit.health / unit.maxHealth
end

function string.ends(String,End)
  return End == "" or string.sub(String,-string.len(End)) == End
end

function DamageReductionMod(source,target,amount,DamageType)
  if source.type == Obj_AI_Hero then
    if GotBuff(source, "Exhaust") > 0 then
      amount = amount * 0.6
    end
  end

  if target.type == Obj_AI_Hero then

    for i = 0, target.buffCount do
      if target:GetBuff(i).count > 0 then
        local buff = target:GetBuff(i)
        if buff.name == "MasteryWardenOfTheDawn" then
          amount = amount * (1 - (0.06 * buff.count))
        end
    
        if DamageReductionTable[target.charName] then
          if buff.name == DamageReductionTable[target.charName].buff and (not DamageReductionTable[target.charName].damagetype or DamageReductionTable[target.charName].damagetype == DamageType) then
            amount = amount * DamageReductionTable[target.charName].amount(target)
          end
        end

        if target.charName == "Maokai" and source.type ~= Obj_AI_Turret then
          if buff.name == "MaokaiDrainDefense" then
            amount = amount * 0.8
          end
        end

        if target.charName == "MasterYi" then
          if buff.name == "Meditate" then
            amount = amount - amount * ({0.5, 0.55, 0.6, 0.65, 0.7})[target:GetSpellData(_W).level] / (source.type == Obj_AI_Turret and 2 or 1)
          end
        end
      end
    end

    if GetItemSlot(target, 1054) > 0 then
      amount = amount - 8
    end

    if target.charName == "Kassadin" and DamageType == 2 then
      amount = amount * 0.85
    end
  end

  return amount
end

function PassivePercentMod(source, target, amount, damageType)
  local SiegeMinionList = {"Redmath.minion_MechCannon", "Bluemath.minion_MechCannon"}
  local NormalMinionList = {"Redmath.minion_Wizard", "Bluemath.minion_Wizard", "Redmath.minion_Basic", "Bluemath.minion_Basic"}

  if source.type == Obj_AI_Turret then
    if table.contains(SiegeMinionList, target.charName) then
      amount = amount * 0.7
    elseif table.contains(NormalMinionList, target.charName) then
      amount = amount * 1.14285714285714
    end
  end
  if source.type == Obj_AI_Hero then 
    if target.type == Obj_AI_Hero then
      if (GetItemSlot(source, 3036) > 0 or GetItemSlot(source, 3034) > 0) and source.maxHealth < target.maxHealth and damageType == 1 then
        amount = amount * (1 + math.min(target.maxHealth - source.maxHealth, 500) / 50 * (GetItemSlot(source, 3036) > 0 and 0.015 or 0.01))
      end
    end
  end
  return amount
end

function MordeQDMG()
    total = 0
	local level = myHero.levelData.lvl
    if level > 0 then
	local damage = ({5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 51, 61, 71, 81, 91, 107, 123, 139})[level] 
	total = damage 
	end
	return total
end

function WLvLDMG()
    total = 0
	local Lvl = myHero.levelData.lvl
    if Lvl > 0 then
	local damage = (1.5) + (3.5 * Lvl) 
	total = damage 
	end
	return total
end

local QLvL = WLvLDMG()

local DamageLibTable = {

	["Ahri"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({40, 65, 90, 115, 140})[level] + 0.35 * source.ap end},
    {Slot = "Q", Stage = 2, DamageType = 3, Damage = function(source, target, level) return ({40, 65, 90, 115, 140})[level] + 0.35 * source.ap end},
    {Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({40, 65, 90, 115, 140})[level] + 0.3 * source.ap end},
    {Slot = "W", Stage = 2, DamageType = 2, Damage = function(source, target, level) return ({12, 19.5, 27, 34.5, 42})[level] + 0.09 * source.ap end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 90, 120, 150, 180})[level] + 0.40 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 90, 120})[level] + 0.35 * source.ap end},
  },
  
	["Cassiopeia"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({75, 110, 145, 2180, 215})[level] + 0.9 * source.ap end},
    {Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({100, 125, 150, 175, 200})[level] + 0.75 * source.ap end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return 48 + 4 * source.levelData.lvl + 0.1 * source.ap + (target.isPoisoned and ({10, 30, 50, 70, 90})[level] + 0.6 * source.ap or 0) end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({150, 250, 350})[level] + 0.5 * source.ap end},
  },  

	["Ekko"] = {  
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({100, 140, 180, 220, 260})[level] + 0.9 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({150, 300, 450})[level] + 1.5 * source.ap end}

  },	
	["Kayle"] = {  
	{Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 115, 160, 205, 250})[level] + 0.5 * source.ap + 0.6 * source.bonusDamage end},
	{Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({10, 15, 20, 25, 30})[level] + 0.2 * source.ap + 0.1 * source.totalDamage + source.totalDamage + ({10, 12, 15, 17, 20})[level] / 100 * (target.maxHealth - target.health) end},   
	{Slot = "E", Stage = 2, DamageType = 2, Damage = function(source, target, level) return (({10, 15, 20, 25, 30})[level] + 0.2 * source.ap + 0.1 * source.totalDamage + source.totalDamage +({10, 12, 15, 17, 20})[level] / 100 * (target.maxHealth - target.health)) + ({10, 15, 20, 25, 30})[level] + 0.2 * source.ap + 0.1 * source.totalDamage  end},	
	{Slot = "E", Stage = 3, DamageType = 3, Damage = function(source, target, level) return ({10, 15, 20, 25, 30})[level] + 0.2 * source.ap + 0.1 * source.totalDamage end},	
	{Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({200, 350, 500})[level] + 0.8 * source.ap + source.bonusDamage  end},

  },
    ["Kassadin"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({65, 95, 125, 155, 185})[level] + 0.7 * source.ap end},
    {Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({40, 65, 90, 115, 140})[level] + 0.8 * source.ap end},
    {Slot = "W", Stage = 2, DamageType = 2, Damage = function(source, target, level) return 20 + 0.1 * source.ap end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 105, 130, 155, 180})[level] + 0.8 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 100, 120})[level] + (0.4 * source.ap) + (0.02 * source.maxMana) end},
    {Slot = "R", Stage = 2, DamageType = 2, Damage = function(source, target, level) return ({40, 50, 60})[level] + (0.1 * source.ap) + (0.01 * source.maxMana) end},
  },
	["LeeSin"] = {
    {Slot = "Q", Stage = 1, DamageType = 1, Damage = function(source, target, level) return ({100, 150, 200, 250, 300})[level] + 2.0 * source.bonusDamage + 0.01 * (target.maxHealth - target.health) end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 120, 160, 200, 240})[level] + source.bonusDamage end},
    {Slot = "R", Stage = 1, DamageType = 1, Damage = function(source, target, level) return ({150, 375, 600})[level] + 2 * source.bonusDamage end},
  },  
  
	["Lux"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 115, 160, 205, 250})[level] + 0.7 * source.ap end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 105, 150, 195, 240})[level] + 0.6 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({300, 400, 500})[level] + 0.75 * source.ap end},	
  },
  
	["Malzahar"] = {  
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 105, 140, 175, 210})[level] + 0.65 * source.ap end},
    {Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({12, 14, 16, 18, 20})[level] + 0.4 * source.bonusDamage + 0.2 * source.ap + QLvL end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 115, 150, 185, 220})[level] + 0.8 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({125, 200, 275})[level] + 0.8 * source.ap end},
	{Slot = "R", Stage = 2, DamageType = 2, Damage = function(source, target, level) return 2.5 * (({6, 8, 10})[level] / 100 + 0.015 * source.ap / 100) * target.maxHealth end},	

  },
	["Morgana"] = {  
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 135, 190, 245, 300})[level] + 0.9 * source.ap end},
	{Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({8, 16, 24, 24, 40})[level] + 0.11 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({150, 225, 300})[level] + 0.7 * source.ap end},

  },
	["Mordekaiser"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({75, 95, 115, 135, 155})[level] + 0.6 * source.ap + MordeQDMG() end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 95, 110, 125, 140})[level] + 0.6 * source.ap end},
	
  },  
	["Neeko"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 115, 160, 205, 250})[level] + 0.5 * source.ap end},
    {Slot = "Q", Stage = 2, DamageType = 2, Damage = function(source, target, level) return ({140, 225, 310, 395, 480})[level] + 0.9 * source.ap end},
	{Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 115, 150, 185, 220})[level] + 0.4 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({200, 425, 650})[level] + 1.3 * source.ap end},
  }, 
  
	["Rakan"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 115, 160, 205, 250})[level] + 0.6 * source.ap end},
    {Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 120, 170, 220, 270})[level] + 0.7 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({100, 200, 300})[level] + 0.5 * source.ap end},
  },  
  
	["Ryze"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return (({60, 85, 110, 135, 160, 185})[level] + 0.45 * source.ap + 0.03 * source.maxMana) * (1 + (GotBuff(target, "RyzeE") > 0 and ({40, 55, 70, 85, 100, 100})[level] / 100 or 0)) end},
    {Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({80, 100, 120, 140, 160})[level] + 0.6 * source.ap + 0.01 * source.maxMana end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 90, 110, 130, 150})[level] + 0.3 * source.ap + 0.02 * source.maxMana end},
  },

	["Soraka"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 95, 130, 165, 200})[level] + 0.35 * source.ap end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 95, 120, 145, 170})[level] + 0.4 * source.ap end},
  },  

	["Sylas"] = {
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({45, 70, 95, 120, 145})[level] + 0.6 * source.ap end},
    {Slot = "W", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 90, 120, 150, 180})[level] + 0.65 * source.ap end},																										
	{Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({70, 85, 100, 115, 130})[level] + 0.2 * source.ap end},
	{Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 65, 80, 95, 180})[level] + 0.4 * source.ap end},     
	{Slot = "R", Stage = 2, DamageType = 3, Damage = function(source, target, level) return ({300, 475, 650})[level] + 0.5 * source.ap + 0.1 * (myHero.maxHealth - GetBaseHealth(myHero)) end}, --cho'garh  
	{Slot = "R", Stage = 3, DamageType = 2, Damage = function(source, target, level) return (({200, 400, 600})[level] + source.ap) end}, --ashe
	{Slot = "R", Stage = 4, DamageType = 2, Damage = function(source, target, level) return (({175, 250, 325})[level] + 0.75 * source.ap) end}, --vaiger
	{Slot = "R", Stage = 5, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.8 * source.ap) end}, --leona
	{Slot = "R", Stage = 6, DamageType = 2, Damage = function(source, target, level) return (({350, 500, 650})[level] + 0.9 * source.ap + 0.45 * source.ap) end}, --ezreal
 	{Slot = "R", Stage = 7, DamageType = 2, Damage = function(source, target, level) return ({25, 35, 45})[level]/ 100 * 0.7 + (({0.25, 0.30, 0.35})[level] * (target.maxHealth - target.health)) + 0.15 * source.bonusDamage/100 * 0.5 end}, --jinx 
 	{Slot = "R", Stage = 8, DamageType = 2, Damage = function(source, target, level) return (({250, 400, 550})[level] + 0.75 * source.ap) end}, --kartus
 	{Slot = "R", Stage = 9, DamageType = 2, Damage = function(source, target, level) return (({200, 300, 400})[level] + 0.733 * source.ap) end}, --ziggs
 	{Slot = "R", Stage = 10, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.5 * source.ap) end}, --cassio
 	{Slot = "R", Stage = 11, DamageType = 2, Damage = function(source, target, level) return (({300, 400, 500})[level] + 0.75 * source.ap) end}, --lux
  	{Slot = "R", Stage = 12, DamageType = 2, Damage = function(source, target, level) return (({300, 400, 500})[level] + source.ap) end}, --tristana
    {Slot = "R", Stage = 13, DamageType = 2, Damage = function(source, target, level) return ({40, 60, 80})[level] + 0.125 * source.ap end},--Anivia
    {Slot = "R", Stage = 14, DamageType = 2, Damage = function(source, target, level) return ({150, 250, 350})[level] + 0.7 * source.ap end},--AurelionSol
  	{Slot = "R", Stage = 15, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.6 * source.ap) end}, --Braum
  	{Slot = "R", Stage = 16, DamageType = 2, Damage = function(source, target, level) return (({125, 225, 325})[level] + 0.7 * source.ap) end}, --Irelia 
  	{Slot = "R", Stage = 17, DamageType = 2, Damage = function(source, target, level) return (({625, 950, 1275})[level] + 2.5 * source.ap) end}, --Nunu
  	{Slot = "R", Stage = 18, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.6 * source.ap) end}, -- Lissandra	
  	{Slot = "R", Stage = 19, DamageType = 2, Damage = function(source, target, level) return (({125, 200, 275})[level] + 0.8 * source.ap) end}, --Malzahar
  	{Slot = "R", Stage = 20, DamageType = 2, Damage = function(source, target, level) return (({85, 150, 215})[level]/100 * 0.7 + 0.25 * source.ap) end}, --Akali
  	{Slot = "R", Stage = 21, DamageType = 2, Damage = function(source, target, level) return (({85, 150, 215})[level] + 0.3 * source.ap) end}, --Akalib
   	{Slot = "R", Stage = 22, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.8 * source.ap) end}, --Amumu
  	{Slot = "R", Stage = 23, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 450})[level] + 0.6 * source.ap) end}, --azir
   	{Slot = "R", Stage = 24, DamageType = 2, Damage = function(source, target, level) return (({125, 250, 375})[level] + 0.75 * source.ap) end}, --evelynn 
   	{Slot = "R", Stage = 25, DamageType = 2, Damage = function(source, target, level) return (({250, 375, 500})[level] + 1.0 * source.ap) end}, --blitzgrank
  	{Slot = "R", Stage = 26, DamageType = 2, Damage = function(source, target, level) return (({175, 275, 375})[level]/100 * 0.7 + 0.55 * source.ap) end}, -- draven
   	{Slot = "R", Stage = 27, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.6 * source.ap) end}, --fizz        
  	{Slot = "R", Stage = 28, DamageType = 2, Damage = function(source, target, level) return (({200, 300, 400})[level]/100 * 0.7 + 0.1 * source.ap + 0.5 * source.ap) end}, -- gnar
  	{Slot = "R", Stage = 29, DamageType = 2, Damage = function(source, target, level) return (({200, 300, 400})[level] + 0.70 * source.ap) end}, -- gragas
   	{Slot = "R", Stage = 30, DamageType = 2, Damage = function(source, target, level) return (({90, 115, 140})[level] + (({0.075, 0.225, 0.375})[level]* source.ap) + 0.2 * source.ap) end}, --Corki
  	{Slot = "R", Stage = 31, DamageType = 2, Damage = function(source, target, level) return (({250, 400, 550})[level]/100*0.7 + 0.75 * source.ap) end}, -- graves
   	{Slot = "R", Stage = 32, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 1.0 * source.ap) end}, --hecarim
  	{Slot = "R", Stage = 33, DamageType = 2, Damage = function(source, target, level) return (({122, 306, 490})[level] + 0.35 * source.ap) end}, --Jhin
  	{Slot = "R", Stage = 34, DamageType = 2, Damage = function(source, target, level) return ({100, 160, 220})[level] + 0.6 * source.ap end}, -- Diana	
  	{Slot = "R", Stage = 35, DamageType = 2, Damage = function(source, target, level) return (({375, 562, 750})[level] + 1.65 * source.ap + 2.85 * source.ap) end}, --katarina
  	{Slot = "R", Stage = 36, DamageType = 2, Damage = function(source, target, level) return (({40, 75, 110})[level] + 0.2 * source.ap) end}, --Kennen    
  	{Slot = "R", Stage = 37, DamageType = 2, Damage = function(source, target, level) return (({150, 225, 300})[level] + 0.75 * source.ap) end}, --Maokai
  	{Slot = "R", Stage = 38, DamageType = 2, Damage = function(source, target, level) return (({250, 400, 500})[level] + 1.0 * source.ap) end}, --Missfortune  
   	{Slot = "R", Stage = 39, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.6 * source.ap) end}, --Nami
   	{Slot = "R", Stage = 40, DamageType = 2, Damage = function(source, target, level) return (({200, 325, 450})[level] + 0.8 * source.ap) end}, --Nautilus
   	{Slot = "R", Stage = 41, DamageType = 2, Damage = function(source, target, level) return (({130, 185, 240})[level] + 0.3 * source.ap) end}, --rumble   
  	{Slot = "R", Stage = 42, DamageType = 2, Damage = function(source, target, level) return (({100, 125, 150})[level] + 0.4 * source.ap) end}, --Sejuani 
   	{Slot = "R", Stage = 43, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + 0.5 * source.ap) end}, --sona
  	{Slot = "R", Stage = 44, DamageType = 2, Damage = function(source, target, level) return (({50, 175, 300})[level]/100*0.7 + 0.25 * source.ap) end}, --urgot  
  	{Slot = "R", Stage = 45, DamageType = 2, Damage = function(source, target, level) return (({150, 200, 250})[level] + 1.0 * source.ap) end}, --varus
   	{Slot = "R", Stage = 46, DamageType = 2, Damage = function(source, target, level) return (({180, 265, 350})[level] + 0.7 * source.ap) end}, --Zyra
  	{Slot = "R", Stage = 47, DamageType = 2, Damage = function(source, target, level) return (({175, 350, 525})[level]/100*0.7 + 0.835 * source.ap) end}, --Warwick
  	{Slot = "R", Stage = 48, DamageType = 2, Damage = function(source, target, level) return (({100, 200, 300})[level] + 0.3 * source.ap) end}, --brand
  	{Slot = "R", Stage = 49, DamageType = 2, Damage = function(source, target, level) return (({175, 350, 525})[level]) end}, --Geran  
  	{Slot = "R", Stage = 50, DamageType = 2, Damage = function(source, target, level) return (({200, 300, 400})[level] + 1.0 * source.ap) end}, --malphite
  	{Slot = "R", Stage = 51, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level] + source.ap) end}, --shyvana
  	{Slot = "R", Stage = 52, DamageType = 2, Damage = function(source, target, level) return (({150, 225, 300})[level] + 0.7 * source.ap) end}, --morgana
  	{Slot = "R", Stage = 53, DamageType = 2, Damage = function(source, target, level) return (({20, 110, 200})[level]/100*0.7 + 0.55 * source.ap) end},	--wukong
	{Slot = "R", Stage = 54, DamageType = 2, Damage = function(source, target, level) return ({125, 225, 325})[level] + 0.45 * source.ap end}, --Fiddlesticks
	{Slot = "R", Stage = 55, DamageType = 2, Damage = function(source, target, level) return ({105, 180, 255})[level] + 0.3 * source.ap end}, --Gangplank
	{Slot = "R", Stage = 56, DamageType = 2, Damage = function(source, target, level) return (({150, 250, 350})[level]/100*0.7 + 0.55 * source.ap) end}, --Illaoi
	{Slot = "R", Stage = 57, DamageType = 2, Damage = function(source, target, level) return ({200, 325, 450})[level]/100*0.7 + 0.75 * source.ap end}, --Jarvan
	{Slot = "R", Stage = 58, DamageType = 2, Damage = function(source, target, level) return ({80, 100, 120})[level]+ 0.4 * source.ap + 0.02 * source.maxMana end}, --Kassadin
	{Slot = "R", Stage = 59, DamageType = 2, Damage = function(source, target, level) return (({100, 140, 180})[level] + 0.325 * source.ap + 0.25 * source.ap) * (GetPercentHP(target) < 25 and 3 or (GetPercentHP(target) < 50 and 2 or 1)) end}, --Kogmaw
	{Slot = "R", Stage = 60, DamageType = 2, Damage = function(source, target, level) return (({70, 140, 210})[level] + 0.4 * source.ap) end},-- Leblanc
	{Slot = "R", Stage = 61, DamageType = 2, Damage = function(source, target, level) return ({20, 35, 50})[level]/100*0.7 + 0.1 * source.ap + 0.25 * source.totalDamage/100 * 0.7 end}, --Lucian
	{Slot = "R", Stage = 62, DamageType = 2, Damage = function(source, target, level) return ({40, 80, 120})[level] + 0.2 * source.ap end},--Rammus
	{Slot = "R", Stage = 63, DamageType = 2, Damage = function(source, target, level) return ({150, 250, 350})[level] + 0.7 * source.ap end},--Vladimir
	{Slot = "R", Stage = 64, DamageType = 2, Damage = function(source, target, level) return ({250, 475, 700})[level]/100*0.7 + source.ap end},--Caitlyn
	{Slot = "R", Stage = 65, DamageType = 2, Damage = function(source, target, level) return (({200, 425, 650})[level] + 1.3 * source.ap) end},--Neeko
	{Slot = "R", Stage = 66, DamageType = 2, Damage = function(source, target, level) return ({150, 225, 300})[level] + 0.7 * source.ap end},--Orianna
	{Slot = "R", Stage = 67, DamageType = 2, Damage = function(source, target, level) return ({50, 70, 90})[level] + 0.2 * source.ap end},--Swain
	{Slot = "R", Stage = 68, DamageType = 2, Damage = function(source, target, level) return ({250, 400, 550})[level] + source.ap end}, --Thresh
	{Slot = "R", Stage = 69, DamageType = 2, Damage = function(source, target, level) return ({75, 115, 155})[level] + 0.4 * source.ap end},--Volibear
	{Slot = "R", Stage = 70, DamageType = 2, Damage = function(source, target, level) return ({180, 270, 360})[level] + 1.05 * source.ap end},--Ahri
	{Slot = "R", Stage = 71, DamageType = 3, Damage = function(source, target, level) return ({100, 200, 300})[level] + 0.375 * source.ap end},--Darius
	{Slot = "R", Stage = 72, DamageType = 2, Damage = function(source, target, level) return ({150, 300, 450})[level] + 1.5 * source.ap end},--Ekko
	{Slot = "R", Stage = 73, DamageType = 2, Damage = function(source, target, level) return ({150, 250, 350})[level] + 0.7 * source.ap end},--Galio
	{Slot = "R", Stage = 74, DamageType = 2, Damage = function(source, target, level) return ({105, 262, 420})[level] + source.ap end},--LeeSin
	{Slot = "R", Stage = 75, DamageType = 2, Damage = function(source, target, level) return ({105, 192, 280})[level] + 0.6 * source.ap end},--Nocturne
	{Slot = "R", Stage = 76, DamageType = 2, Damage = function(source, target, level) return ({200, 350, 500})[level] + 0.5 * source.ap end},--Pantheon
	{Slot = "R", Stage = 77, DamageType = 2, Damage = function(source, target, level) return ({140, 210, 280})[level] + 0.45 * source.ap end},--Poppy
	{Slot = "R", Stage = 78, DamageType = 2, Damage = function(source, target, level) return ({100, 200, 300})[level] + 0.5 * source.ap end},--Rakan
	{Slot = "R", Stage = 79, DamageType = 2, Damage = function(source, target, level) return ({70, 175, 280})[level] + source.ap + (({0.20, 0.25, 0.30})[level] * (target.maxHealth - target.health)) end},--RekSai
	{Slot = "R", Stage = 80, DamageType = 2, Damage = function(source, target, level) return ({200, 300, 400})[level] + source.ap end},--Shaco
	{Slot = "R", Stage = 81, DamageType = 2, Damage = function(source, target, level) return ({63, 94, 126})[level] + 0.5 * source.ap end},--Talon
	{Slot = "R", Stage = 82, DamageType = 2, Damage = function(source, target, level) return ({105, 210, 315})[level] + 0.7 * source.ap end},--Vi
	{Slot = "R", Stage = 83, DamageType = 2, Damage = function(source, target, level) return ({150, 250, 350})[level] + 0.6 * source.ap end},--Viktor
	{Slot = "R", Stage = 84, DamageType = 2, Damage = function(source, target, level) return ({70, 105, 140})[level] + 0.5 * source.ap end},--Xayah
	{Slot = "R", Stage = 85, DamageType = 2, Damage = function(source, target, level) return ({140, 210, 280})[level] + 0.75 * source.ap end},--Yasuo
  },
	["Zyra"] = {  
    {Slot = "Q", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 95, 130, 165, 200})[level] + 0.6 * source.ap end},
    {Slot = "E", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({60, 105, 150, 195, 240})[level] + 0.5 * source.ap end},
    {Slot = "R", Stage = 1, DamageType = 2, Damage = function(source, target, level) return ({180, 265, 350})[level] + 0.7 * source.ap end},

  } 
}


function getdmg(spell,target,source,stage,level)
  local source = source or myHero
  local stage = stage or 1
  local swagtable = {}
  local k = 0
  if stage > 4 then stage = 4 end
  if spell == "Q" or spell == "W" or spell == "E" or spell == "R" or spell == "QM" or spell == "WM" or spell == "EM" then
    local level = level or source:GetSpellData(({["Q"] = _Q, ["QM"] = _Q, ["W"] = _W, ["WM"] = _W, ["E"] = _E, ["EM"] = _E, ["R"] = _R})[spell]).level
    if level <= 0 then return 0 end
    if level > 5 then level = 5 end
    if DamageLibTable[source.charName] then
      for i, spells in pairs(DamageLibTable[source.charName]) do
        if spells.Slot == spell then
          table.insert(swagtable, spells)
        end
      end
      if stage > #swagtable then stage = #swagtable end
      for v = #swagtable, 1, -1 do
        local spells = swagtable[v]
        if spells.Stage == stage then
          if spells.DamageType == 1 then
            return CalPhysicalDamage(source, target, spells.Damage(source, target, level))
          elseif spells.DamageType == 2 then
            return CalMagicalDamage(source, target, spells.Damage(source, target, level))
          elseif spells.DamageType == 3 then
            return spells.Damage(source, target, level)
          end
        end
      end
    end
  end
  if spell == "AA" then
    return CalPhysicalDamage(source, target, source.totalDamage)
  end
  if spell == "IGNITE" then
    return 50+20*source.levelData.lvl - (target.hpRegen*3)
  end
  if spell == "SMITE" then
    if Smite then
      if target.type == Obj_AI_Hero then
        if source:GetSpellData(Smite).name == "s5_summonersmiteplayerganker" then
          return 20+8*source.levelData.lvl
        end
        if source:GetSpellData(Smite).name == "s5_summonersmiteduel" then
          return 54+6*source.levelData.lvl
        end
      end
      return ({390, 410, 430, 450, 480, 510, 540, 570, 600, 640, 680, 720, 760, 800, 850, 900, 950, 1000})[source.levelData.lvl]
    end
  end
  if spell == "BILGEWATER" then
    return CalMagicalDamage(source, target, 100)
  end
  if spell == "BOTRK" then
    return CalPhysicalDamage(source, target, target.maxHealth*0.1)
  end
  if spell == "HEXTECH" then
    return CalMagicalDamage(source, target, 150+0.4*source.ap)
  end
  return 0
end

function CalPhysicalDamage(source, target, amount)
  local ArmorPenPercent = source.armorPenPercent
  local ArmorPenFlat = (0.4 + target.levelData.lvl / 30) * source.armorPen
  local BonusArmorPen = source.bonusArmorPenPercent

  if source.type == Obj_AI_Minion then
    ArmorPenPercent = 1
    ArmorPenFlat = 0
    BonusArmorPen = 1
  elseif source.type == Obj_AI_Turret then
    ArmorPenFlat = 0
    BonusArmorPen = 1
    if source.charName:find("3") or source.charName:find("4") then
      ArmorPenPercent = 0.25
    else
      ArmorPenPercent = 0.7
    end
  end

  if source.type == Obj_AI_Turret then
    if target.type == Obj_AI_Minion then
      amount = amount * 1.25
      if string.ends(target.charName, "MinionSiege") then
        amount = amount * 0.7
      end
      return amount
    end
  end

  local armor = target.armor
  local bonusArmor = target.bonusArmor
  local value = 100 / (100 + (armor * ArmorPenPercent) - (bonusArmor * (1 - BonusArmorPen)) - ArmorPenFlat)

  if armor < 0 then
    value = 2 - 100 / (100 - armor)
  elseif (armor * ArmorPenPercent) - (bonusArmor * (1 - BonusArmorPen)) - ArmorPenFlat < 0 then
    value = 1
  end
  return math.max(0, math.floor(DamageReductionMod(source, target, PassivePercentMod(source, target, value) * amount, 1)))
end

function CalMagicalDamage(source, target, amount)
  local mr = target.magicResist
  local value = 100 / (100 + (mr * source.magicPenPercent) - source.magicPen)

  if mr < 0 then
    value = 2 - 100 / (100 - mr)
  elseif (mr * source.magicPenPercent) - source.magicPen < 0 then
    value = 1
  end
  return math.max(0, math.floor(DamageReductionMod(source, target, PassivePercentMod(source, target, value) * amount, 2)))
end

class "HPred"


	
local _tickFrequency = .2
local _nextTick = Game.Timer()
local _reviveLookupTable = 
	{ 
		["LifeAura.troy"] = 4, 
		["ZileanBase_R_Buf.troy"] = 3,
		["Aatrox_Base_Passive_Death_Activate"] = 3
		
		--TwistedFate_Base_R_Gatemarker_Red
			--String match would be ideal.... could be different in other skins
	}

--Stores a collection of spells that will cause a character to blink
	--Ground targeted spells go towards mouse castPos with a maximum range
	--Hero/Minion targeted spells have a direction type to determine where we will land relative to our target (in front of, behind, etc)
	
--Key = Spell name
--Value = range a spell can travel, OR a targeted end position type, OR a list of particles the spell can teleport to	
local _blinkSpellLookupTable = 
	{ 
		["EzrealArcaneShift"] = 475, 
		["RiftWalk"] = 500,
		
		--Ekko and other similar blinks end up between their start pos and target pos (in front of their target relatively speaking)
		["EkkoEAttack"] = 0,
		["AlphaStrike"] = 0,
		
		--Katarina E ends on the side of her target closest to where her mouse was... 
		["KatarinaE"] = -255,
		
		--Katarina can target a dagger to teleport directly to it: Each skin has a different particle name. This should cover all of them.
		["KatarinaEDagger"] = { "Katarina_Base_Dagger_Ground_Indicator","Katarina_Skin01_Dagger_Ground_Indicator","Katarina_Skin02_Dagger_Ground_Indicator","Katarina_Skin03_Dagger_Ground_Indicator","Katarina_Skin04_Dagger_Ground_Indicator","Katarina_Skin05_Dagger_Ground_Indicator","Katarina_Skin06_Dagger_Ground_Indicator","Katarina_Skin07_Dagger_Ground_Indicator" ,"Katarina_Skin08_Dagger_Ground_Indicator","Katarina_Skin09_Dagger_Ground_Indicator"  }, 
	}

local _blinkLookupTable = 
	{ 
		"global_ss_flash_02.troy",
		"Lissandra_Base_E_Arrival.troy",
		"LeBlanc_Base_W_return_activation.troy"
		--TODO: Check if liss/leblanc have diff skill versions. MOST likely dont but worth checking for completion sake
		
		--Zed uses 'switch shadows'... It will require some special checks to choose the shadow he's going TO not from...
		--Shaco deceive no longer has any particles where you jump to so it cant be tracked (no spell data or particles showing path)
		
	}

local _cachedBlinks = {}
local _cachedRevives = {}
local _cachedTeleports = {}

--Cache of all TARGETED missiles currently running
local _cachedMissiles = {}
local _incomingDamage = {}

--Cache of active enemy windwalls so we can calculate it when dealing with collision checks
local _windwall
local _windwallStartPos
local _windwallWidth

local _OnVision = {}
function HPred:OnVision(unit)
	if unit == nil or type(unit) ~= "userdata" then return end
	if _OnVision[unit.networkID] == nil then _OnVision[unit.networkID] = {visible = unit.visible , tick = GetTickCount(), pos = unit.pos } end
	if _OnVision[unit.networkID].visible == true and not unit.visible then _OnVision[unit.networkID].visible = false _OnVision[unit.networkID].tick = GetTickCount() end
	if _OnVision[unit.networkID].visible == false and unit.visible then _OnVision[unit.networkID].visible = true _OnVision[unit.networkID].tick = GetTickCount() _OnVision[unit.networkID].pos = unit.pos end
	return _OnVision[unit.networkID]
end

--This must be called manually - It's not on by default because we've tracked down most of the freeze issues to this.
function HPred:Tick()
	
	
	--Update missile cache
	--DISABLED UNTIL LATER.
	--self:CacheMissiles()
	
	--Limit how often tick logic runs
	if _nextTick > Game.Timer() then return end
	_nextTick = Game.Timer() + _tickFrequency
	
	--Update hero movement history	
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)
		if t then
			if t.isEnemy then
				HPred:OnVision(t)
			end
		end
	end
	
	--Do not run rest of logic until freeze issues are fully tracked down
	if true then return end
	
	
	--Remove old cached teleports	
	for _, teleport in pairs(_cachedTeleports) do
		if teleport and Game.Timer() > teleport.expireTime + .5 then
			_cachedTeleports[_] = nil
		end
	end	
	
	--Update teleport cache
	HPred:CacheTeleports()	
	
	
	--Record windwall
	HPred:CacheParticles()
	
	--Remove old cached revives
	for _, revive in pairs(_cachedRevives) do
		if Game.Timer() > revive.expireTime + .5 then
			_cachedRevives[_] = nil
		end
	end
	
	--Remove old cached blinks
	for _, revive in pairs(_cachedRevives) do
		if Game.Timer() > revive.expireTime + .5 then
			_cachedRevives[_] = nil
		end
	end
	
	for i = 1, Game.ParticleCount() do 
		local particle = Game.Particle(i)
		--Record revives
		if particle and not _cachedRevives[particle.networkID] and  _reviveLookupTable[particle.name] then
			_cachedRevives[particle.networkID] = {}
			_cachedRevives[particle.networkID]["expireTime"] = Game.Timer() + _reviveLookupTable[particle.name]			
			local target = HPred:GetHeroByPosition(particle.pos)
			if target.isEnemy then				
				_cachedRevives[particle.networkID]["target"] = target
				_cachedRevives[particle.networkID]["pos"] = target.pos
				_cachedRevives[particle.networkID]["isEnemy"] = target.isEnemy	
			end
		end
		
		--Record blinks
		if particle and not _cachedBlinks[particle.networkID] and  _blinkLookupTable[particle.name] then
			_cachedBlinks[particle.networkID] = {}
			_cachedBlinks[particle.networkID]["expireTime"] = Game.Timer() + _reviveLookupTable[particle.name]			
			local target = HPred:GetHeroByPosition(particle.pos)
			if target.isEnemy then				
				_cachedBlinks[particle.networkID]["target"] = target
				_cachedBlinks[particle.networkID]["pos"] = target.pos
				_cachedBlinks[particle.networkID]["isEnemy"] = target.isEnemy	
			end
		end
	end
	
end

function HPred:GetEnemyNexusPosition()
	--This is slightly wrong. It represents fountain not the nexus. Fix later.
	if myHero.team == 100 then return Vector(14340, 171.977722167969, 14390); else return Vector(396,182.132507324219,462); end
end


function HPred:GetGuarenteedTarget(source, range, delay, speed, radius, timingAccuracy, checkCollision)
	--Get hourglass enemies
	local target, aimPosition =self:GetHourglassTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get reviving target
	local target, aimPosition =self:GetRevivingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end	
	
	--Get teleporting enemies
	local target, aimPosition =self:GetTeleportingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)	
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get stunned enemies
	local target, aimPosition =self:GetImmobileTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
end


function HPred:GetReliableTarget(source, range, delay, speed, radius, timingAccuracy, checkCollision)
	--TODO: Target whitelist. This will target anyone which is definitely not what we want
	--For now we can handle in the champ script. That will cause issues with multiple people in range who are goood targets though.
	
	
	--Get hourglass enemies
	local target, aimPosition =self:GetHourglassTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get reviving target
	local target, aimPosition =self:GetRevivingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get channeling enemies
	--local target, aimPosition =self:GetChannelingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	--	if target and aimPosition then
	--	return target, aimPosition
	--end
	
	--Get teleporting enemies
	local target, aimPosition =self:GetTeleportingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)	
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get instant dash enemies
	local target, aimPosition =self:GetInstantDashTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end	
	
	--Get dashing enemies
	local target, aimPosition =self:GetDashingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius, midDash)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get stunned enemies
	local target, aimPosition =self:GetImmobileTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end
	
	--Get blink targets
	local target, aimPosition =self:GetBlinkTarget(source, range, speed, delay, checkCollision, radius)
	if target and aimPosition then
		return target, aimPosition
	end	
end

--Will return how many allies or enemies will be hit by a linear spell based on current waypoint data.
function HPred:GetLineTargetCount(source, aimPos, delay, speed, width, targetAllies)
	local targetCount = 0
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)
		if t and self:CanTargetALL(t) and ( targetAllies or t.isEnemy) then
			
			local predictedPos = self:PredictUnitPosition(t, delay+ self:GetDistance(source, t.pos) / speed)
			local proj1, pointLine, isOnSegment = self:VectorPointProjectionOnLineSegment(source, aimPos, predictedPos)
			if proj1 and isOnSegment and (self:GetDistanceSqr(predictedPos, proj1) <= (t.boundingRadius + width) * (t.boundingRadius + width)) then
				targetCount = targetCount + 1
			end
		end
	end
	return targetCount
end

--Will return the valid target who has the highest hit chance and meets all conditions (minHitChance, whitelist check, etc)
function HPred:GetUnreliableTarget(source, range, delay, speed, radius, checkCollision, minimumHitChance, whitelist, isLine)
	local _validTargets = {}
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)		
		if t and self:CanTarget(t, true) and (not whitelist or whitelist[t.charName]) then
			local hitChance, aimPosition = self:GetHitchance(source, t, range, delay, speed, radius, checkCollision, isLine)		
			if hitChance >= minimumHitChance then
				table.insert(_validTargets, {aimPosition,hitChance, hitChance * 100 + self:CalculateMagicDamage(t, 400)})
			end
		end
	end	
	table.sort(_validTargets, function( a, b ) return a[3] >b[3] end)	
	if #_validTargets > 0 then	
		return _validTargets[1][2], _validTargets[1][1]
	end
end

function HPred:GetHitchance(source, target, range, delay, speed, radius, checkCollision, isLine)

	if isLine == nil and checkCollision then
		isLine = true
	end
	
	local hitChance = 1
	local aimPosition = self:PredictUnitPosition(target, delay + self:GetDistance(source, target.pos) / speed)	
	local interceptTime = self:GetSpellInterceptTime(source, aimPosition, delay, speed)
	local reactionTime = self:PredictReactionTime(target, .1, isLine)
	
	--Check if they are walking the same path as the line or very close to it
	if isLine then
		local pathVector = aimPosition - target.pos
		local castVector = (aimPosition - myHero.pos):Normalized()
		if pathVector.x + pathVector.z ~= 0 then
			pathVector = pathVector:Normalized()
			if pathVector:DotProduct(castVector) < -.85 or pathVector:DotProduct(castVector) > .85 then
				if speed > 3000 then
					reactionTime = reactionTime + .25
				else
					reactionTime = reactionTime + .15
				end
			end
		end
	end			

	--If they are standing still give a higher accuracy because they have to take actions to react to it
	if not target.pathing or not target.pathing.hasMovePath then
		hitChancevisionData = 2
	end	
	
	
	local origin,movementRadius = self:UnitMovementBounds(target, interceptTime, reactionTime)
	--Our spell is so wide or the target so slow or their reaction time is such that the spell will be nearly impossible to avoid
	if movementRadius - target.boundingRadius <= radius /2 then
		origin,movementRadius = self:UnitMovementBounds(target, interceptTime, 0)
		if movementRadius - target.boundingRadius <= radius /2 then
			hitChance = 4
		else		
			hitChance = 3
		end
	end	
	
	--If they are casting a spell then the accuracy will be fairly high. if the windup is longer than our delay then it's quite likely to hit. 
	--Ideally we would predict where they will go AFTER the spell finishes but that's beyond the scope of this prediction
	if target.activeSpell and target.activeSpell.valid then
		if target.activeSpell.startTime + target.activeSpell.windup - Game.Timer() >= delay then
			hitChance = 5
		else			
			hitChance = 3
		end
	end
	
	local visionData = HPred:OnVision(target)
	if visionData and visionData.visible == false then
		local hiddenTime = visionData.tick -GetTickCount()
		if hiddenTime < -1000 then
			hitChance = -1
		else
			local targetSpeed = self:GetTargetMS(target)
			local unitPos = target.pos + Vector(target.pos,target.posTo):Normalized() * ((GetTickCount() - visionData.tick)/1000 * targetSpeed)
			local aimPosition = unitPos + Vector(target.pos,target.posTo):Normalized() * (targetSpeed * (delay + (self:GetDistance(myHero.pos,unitPos)/speed)))
			if self:GetDistance(target.pos,aimPosition) > self:GetDistance(target.pos,target.posTo) then aimPosition = target.posTo end
			hitChance = math.min(hitChance, 2)
		end
	end
	
	--Check for out of range
	if not self:IsInRange(source, aimPosition, range) then
		hitChance = -1
	end
	
	--Check minion block
	if hitChance > 0 and checkCollision then
		if self:IsWindwallBlocking(source, aimPosition) then
			hitChance = -1		
		elseif self:CheckMinionCollision(source, aimPosition, delay, speed, radius) then
			hitChance = -1
		end
	end
	
	return hitChance, aimPosition
end

function HPred:PredictReactionTime(unit, minimumReactionTime)
	local reactionTime = minimumReactionTime
	
	--If the target is auto attacking increase their reaction time by .15s - If using a skill use the remaining windup time
	if unit.activeSpell and unit.activeSpell.valid then
		local windupRemaining = unit.activeSpell.startTime + unit.activeSpell.windup - Game.Timer()
		if windupRemaining > 0 then
			reactionTime = windupRemaining
		end
	end	
	return reactionTime
end

function HPred:GetDashingTarget(source, range, delay, speed, dashThreshold, checkCollision, radius, midDash)

	local target
	local aimPosition
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)
		if t and t.isEnemy and t.pathing.hasMovePath and t.pathing.isDashing and t.pathing.dashSpeed>500  then
			local dashEndPosition = t:GetPath(1)
			if self:IsInRange(source, dashEndPosition, range) then				
				--The dash ends within range of our skill. We now need to find if our spell can connect with them very close to the time their dash will end
				local dashTimeRemaining = self:GetDistance(t.pos, dashEndPosition) / t.pathing.dashSpeed
				local skillInterceptTime = self:GetSpellInterceptTime(source, dashEndPosition, delay, speed)
				local deltaInterceptTime =skillInterceptTime - dashTimeRemaining
				if deltaInterceptTime > 0 and deltaInterceptTime < dashThreshold and (not checkCollision or not self:CheckMinionCollision(source, dashEndPosition, delay, speed, radius)) then
					target = t
					aimPosition = dashEndPosition
					return target, aimPosition
				end
			end			
		end
	end
end

function HPred:GetHourglassTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)
		if t and t.isEnemy then		
			local success, timeRemaining = self:HasBuff(t, "zhonyasringshield")
			if success then
				local spellInterceptTime = self:GetSpellInterceptTime(source, t.pos, delay, speed)
				local deltaInterceptTime = spellInterceptTime - timeRemaining
				if spellInterceptTime > timeRemaining and deltaInterceptTime < timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, interceptPosition, delay, speed, radius)) then
					target = t
					aimPosition = t.pos
					return target, aimPosition
				end
			end
		end
	end
end

function HPred:GetRevivingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for _, revive in pairs(_cachedRevives) do	
		if revive.isEnemy then
			local interceptTime = self:GetSpellInterceptTime(source, revive.pos, delay, speed)
			if interceptTime > revive.expireTime - Game.Timer() and interceptTime - revive.expireTime - Game.Timer() < timingAccuracy then
				target = revive.target
				aimPosition = revive.pos
				return target, aimPosition
			end
		end
	end	
end

function HPred:GetInstantDashTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)
		if t and t.isEnemy and t.activeSpell and t.activeSpell.valid and _blinkSpellLookupTable[t.activeSpell.name] then
			local windupRemaining = t.activeSpell.startTime + t.activeSpell.windup - Game.Timer()
			if windupRemaining > 0 then
				local endPos
				local blinkRange = _blinkSpellLookupTable[t.activeSpell.name]
				if type(blinkRange) == "table" then
					--Find the nearest matching particle to our mouse
					--local target, distance = self:GetNearestParticleByNames(t.pos, blinkRange)
					--if target and distance < 250 then					
					--	endPos = target.pos		
					--end
				elseif blinkRange > 0 then
					endPos = Vector(t.activeSpell.placementPos.x, t.activeSpell.placementPos.y, t.activeSpell.placementPos.z)					
					endPos = t.activeSpell.startPos + (endPos- t.activeSpell.startPos):Normalized() * math.min(self:GetDistance(t.activeSpell.startPos,endPos), range)
				else
					local blinkTarget = self:GetObjectByHandle(t.activeSpell.target)
					if blinkTarget then				
						local offsetDirection						
						
						--We will land in front of our target relative to our starting position
						if blinkRange == 0 then				

							if t.activeSpell.name ==  "AlphaStrike" then
								windupRemaining = windupRemaining + .75
								--TODO: Boost the windup time by the number of targets alpha will hit. Need to calculate the exact times this is just rough testing right now
							end						
							offsetDirection = (blinkTarget.pos - t.pos):Normalized()
						--We will land behind our target relative to our starting position
						elseif blinkRange == -1 then						
							offsetDirection = (t.pos-blinkTarget.pos):Normalized()
						--They can choose which side of target to come out on , there is no way currently to read this data so we will only use this calculation if the spell radius is large
						elseif blinkRange == -255 then
							if radius > 250 then
								endPos = blinkTarget.pos
							end							
						end
						
						if offsetDirection then
							endPos = blinkTarget.pos - offsetDirection * blinkTarget.boundingRadius
						end
						
					end
				end	
				
				local interceptTime = self:GetSpellInterceptTime(source, endPos, delay,speed)
				local deltaInterceptTime = interceptTime - windupRemaining
				if self:IsInRange(source, endPos, range) and deltaInterceptTime < timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, endPos, delay, speed, radius)) then
					target = t
					aimPosition = endPos
					return target,aimPosition					
				end
			end
		end
	end
end

function HPred:GetBlinkTarget(source, range, speed, delay, checkCollision, radius)
	local target
	local aimPosition
	for _, particle in pairs(_cachedBlinks) do
		if particle  and self:IsInRange(source, particle.pos, range) then
			local t = particle.target
			local pPos = particle.pos
			if t and t.isEnemy and (not checkCollision or not self:CheckMinionCollision(source, pPos, delay, speed, radius)) then
				target = t
				aimPosition = pPos
				return target,aimPosition
			end
		end		
	end
end

function HPred:GetChannelingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)
		if t then
			local interceptTime = self:GetSpellInterceptTime(source, t.pos, delay, speed)
			if self:CanTarget(t) and self:IsInRange(source, t.pos, range) and self:IsChannelling(t, interceptTime) and (not checkCollision or not self:CheckMinionCollision(source, t.pos, delay, speed, radius)) then
				target = t
				aimPosition = t.pos	
				return target, aimPosition
			end
		end
	end
end

function HPred:GetImmobileTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)
	local target
	local aimPosition
	for i = 1, Game.HeroCount() do
		local t = Game.Hero(i)
		if t and self:CanTarget(t) and self:IsInRange(source, t.pos, range) then
			local immobileTime = self:GetImmobileTime(t)
			
			local interceptTime = self:GetSpellInterceptTime(source, t.pos, delay, speed)
			if immobileTime - interceptTime > timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, t.pos, delay, speed, radius)) then
				target = t
				aimPosition = t.pos
				return target, aimPosition
			end
		end
	end
end

function HPred:CacheTeleports()
	--Get enemies who are teleporting to towers
	for i = 1, Game.TurretCount() do
		local turret = Game.Turret(i)
		if turret and turret.isEnemy and not _cachedTeleports[turret.networkID] then
			local hasBuff, expiresAt = self:HasBuff(turret, "teleport_target")
			if hasBuff then
				self:RecordTeleport(turret, self:GetTeleportOffset(turret.pos,223.31),expiresAt)
			end
		end
	end	
	
	--Get enemies who are teleporting to wards	
	for i = 1, Game.WardCount() do
		local ward = Game.Ward(i)
		if ward and ward.isEnemy and not _cachedTeleports[ward.networkID] then
			local hasBuff, expiresAt = self:HasBuff(ward, "teleport_target")
			if hasBuff then
				self:RecordTeleport(ward, self:GetTeleportOffset(ward.pos,100.01),expiresAt)
			end
		end
	end
	
	--Get enemies who are teleporting to minions
	for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
		if minion and minion.isEnemy and not _cachedTeleports[minion.networkID] then
			local hasBuff, expiresAt = self:HasBuff(minion, "teleport_target")
			if hasBuff then
				self:RecordTeleport(minion, self:GetTeleportOffset(minion.pos,143.25),expiresAt)
			end
		end
	end	
end

function HPred:RecordTeleport(target, aimPos, endTime)
	_cachedTeleports[target.networkID] = {}
	_cachedTeleports[target.networkID]["target"] = target
	_cachedTeleports[target.networkID]["aimPos"] = aimPos
	_cachedTeleports[target.networkID]["expireTime"] = endTime + Game.Timer()
end


function HPred:CalculateIncomingDamage()
	_incomingDamage = {}
	local currentTime = Game.Timer()
	for _, missile in pairs(_cachedMissiles) do
		if missile then 
			local dist = self:GetDistance(missile.data.pos, missile.target.pos)			
			if missile.name == "" or currentTime >= missile.timeout or dist < missile.target.boundingRadius then
				_cachedMissiles[_] = nil
			else
				if not _incomingDamage[missile.target.networkID] then
					_incomingDamage[missile.target.networkID] = missile.damage
				else
					_incomingDamage[missile.target.networkID] = _incomingDamage[missile.target.networkID] + missile.damage
				end
			end
		end
	end	
end

function HPred:GetIncomingDamage(target)
	local damage = 0
	if _incomingDamage[target.networkID] then
		damage = _incomingDamage[target.networkID]
	end
	return damage
end




--Right now only used to cache enemy windwalls
function HPred:CacheParticles()	
	if _windwall and _windwall.name == "" then
		_windwall = nil
	end
	
	for i = 1, Game.ParticleCount() do
		local particle = Game.Particle(i)		
		if particle and self:IsInRange(particle.pos, myHero.pos, _maxCacheRange) then			
			if string.find(particle.name, "W_windwall%d") and not _windwall then
				--We don't care about ally windwalls for now
				local owner =  self:GetObjectByHandle(particle.handle)
				if owner and owner.isEnemy then
					_windwall = particle
					_windwallStartPos = Vector(particle.pos.x, particle.pos.y, particle.pos.z)				
					
					local index = string.len(particle.name) - 5
					local spellLevel = string.sub(particle.name, index, index) -1
					--Simple fix
					if type(spellLevel) ~= "number" then
						spellLevel = 1
					end
					_windwallWidth = 150 + spellLevel * 25					
				end
			end
		end
	end
end

function HPred:CacheMissiles()
	local currentTime = Game.Timer()
	for i = 1, Game.MissileCount() do
		local missile = Game.Missile(i)
		if missile and not _cachedMissiles[missile.networkID] and missile.missileData then
			--Handle targeted missiles
			if missile.missileData.target and missile.missileData.owner then
				local missileName = missile.missileData.name
				local owner =  self:GetObjectByHandle(missile.missileData.owner)	
				local target =  self:GetObjectByHandle(missile.missileData.target)		
				if owner and target and string.find(target.type, "Hero") then			
					--The missile is an auto attack of some sort that is targeting a player	
					if (string.find(missileName, "BasicAttack") or string.find(missileName, "CritAttack")) then
						--Cache it all and update the count
						_cachedMissiles[missile.networkID] = {}
						_cachedMissiles[missile.networkID].target = target
						_cachedMissiles[missile.networkID].data = missile
						_cachedMissiles[missile.networkID].danger = 1
						_cachedMissiles[missile.networkID].timeout = currentTime + 1.5
						
						local damage = owner.totalDamage
						if string.find(missileName, "CritAttack") then
							--Leave it rough we're not that concerned
							damage = damage * 1.5
						end						
						_cachedMissiles[missile.networkID].damage = self:CalculatePhysicalDamage(target, damage)
					end
				end
			end
		end
	end
end

function HPred:CalculatePhysicalDamage(target, damage)			
	local targetArmor = target.armor * myHero.armorPenPercent - myHero.armorPen
	local damageReduction = 100 / ( 100 + targetArmor)
	if targetArmor < 0 then
		damageReduction = 2 - (100 / (100 - targetArmor))
	end		
	damage = damage * damageReduction	
	return damage
end

function HPred:CalculateMagicDamage(target, damage)			
	local targetMR = target.magicResist * myHero.magicPenPercent - myHero.magicPen
	local damageReduction = 100 / ( 100 + targetMR)
	if targetMR < 0 then
		damageReduction = 2 - (100 / (100 - targetMR))
	end		
	damage = damage * damageReduction
	
	return damage
end


function HPred:GetTeleportingTarget(source, range, delay, speed, timingAccuracy, checkCollision, radius)

	local target
	local aimPosition
	for _, teleport in pairs(_cachedTeleports) do
		if teleport.expireTime > Game.Timer() and self:IsInRange(source,teleport.aimPos, range) then			
			local spellInterceptTime = self:GetSpellInterceptTime(source, teleport.aimPos, delay, speed)
			local teleportRemaining = teleport.expireTime - Game.Timer()
			if spellInterceptTime > teleportRemaining and spellInterceptTime - teleportRemaining <= timingAccuracy and (not checkCollision or not self:CheckMinionCollision(source, teleport.aimPos, delay, speed, radius)) then								
				target = teleport.target
				aimPosition = teleport.aimPos
				return target, aimPosition
			end
		end
	end		
end

function HPred:GetTargetMS(target)
	local ms = target.pathing.isDashing and target.pathing.dashSpeed or target.ms
	return ms
end

function HPred:Angle(A, B)
	local deltaPos = A - B
	local angle = math.atan2(deltaPos.x, deltaPos.z) *  180 / math.pi	
	if angle < 0 then angle = angle + 360 end
	return angle
end

--Returns where the unit will be when the delay has passed given current pathing information. This assumes the target makes NO CHANGES during the delay.
function HPred:PredictUnitPosition(unit, delay)
	local predictedPosition = unit.pos
	local timeRemaining = delay
	local pathNodes = self:GetPathNodes(unit)
	for i = 1, #pathNodes -1 do
		local nodeDistance = self:GetDistance(pathNodes[i], pathNodes[i +1])
		local nodeTraversalTime = nodeDistance / self:GetTargetMS(unit)
			
		if timeRemaining > nodeTraversalTime then
			--This node of the path will be completed before the delay has finished. Move on to the next node if one remains
			timeRemaining =  timeRemaining - nodeTraversalTime
			predictedPosition = pathNodes[i + 1]
		else
			local directionVector = (pathNodes[i+1] - pathNodes[i]):Normalized()
			predictedPosition = pathNodes[i] + directionVector *  self:GetTargetMS(unit) * timeRemaining
			break;
		end
	end
	return predictedPosition
end

function HPred:IsChannelling(target, interceptTime)
	if target.activeSpell and target.activeSpell.valid and target.activeSpell.isChanneling then
		return true
	end
end

function HPred:HasBuff(target, buffName, minimumDuration)
	local duration = minimumDuration
	if not minimumDuration then
		duration = 0
	end
	local durationRemaining
	for i = 1, target.buffCount do 
		local buff = target:GetBuff(i)
		if buff.duration > duration and buff.name == buffName then
			durationRemaining = buff.duration
			return true, durationRemaining
		end
	end
end

--Moves an origin towards the enemy team nexus by magnitude
function HPred:GetTeleportOffset(origin, magnitude)
	local teleportOffset = origin + (self:GetEnemyNexusPosition()- origin):Normalized() * magnitude
	return teleportOffset
end

function HPred:GetSpellInterceptTime(startPos, endPos, delay, speed)	
	local interceptTime = Game.Latency()/2000 + delay + self:GetDistance(startPos, endPos) / speed
	return interceptTime
end

--Checks if a target can be targeted by abilities or auto attacks currently.
--CanTarget(target)
	--target : gameObject we are trying to hit
function HPred:CanTarget(target, allowInvisible)
	return target.isEnemy and target.alive and target.health > 0  and (allowInvisible or target.visible) and target.isTargetable
end

--Derp: dont want to fuck with the isEnemy checks elsewhere. This will just let us know if the target can actually be hit by something even if its an ally
function HPred:CanTargetALL(target)
	return target.alive and target.health > 0 and target.visible and target.isTargetable
end

--Returns a position and radius in which the target could potentially move before the delay ends. ReactionTime defines how quick we expect the target to be able to change their current path
function HPred:UnitMovementBounds(unit, delay, reactionTime)
	local startPosition = self:PredictUnitPosition(unit, delay)
	
	local radius = 0
	local deltaDelay = delay -reactionTime- self:GetImmobileTime(unit)	
	if (deltaDelay >0) then
		radius = self:GetTargetMS(unit) * deltaDelay	
	end
	return startPosition, radius	
end

--Returns how long (in seconds) the target will be unable to move from their current location
function HPred:GetImmobileTime(unit)
	local duration = 0
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i)
		if buff.count > 0 and buff.duration> duration and (buff.type == 5 or buff.type == 8 or buff.type == 21 or buff.type == 22 or buff.type == 24 or buff.type == 11 or buff.type == 29 or buff.type == 30 or buff.type == 39 ) then
			duration = buff.duration
		end
	end
	return duration		
end

--Returns how long (in seconds) the target will be slowed for
function HPred:GetSlowedTime(unit)
	local duration = 0
	for i = 0, unit.buffCount do
		local buff = unit:GetBuff(i)
		if buff.count > 0 and buff.duration > duration and buff.type == 10 then
			duration = buff.duration			
			return duration
		end
	end
	return duration		
end

--Returns all existing path nodes
function HPred:GetPathNodes(unit)
	local nodes = {}
	table.insert(nodes, unit.pos)
	if unit.pathing.hasMovePath then
		for i = unit.pathing.pathIndex, unit.pathing.pathCount do
			path = unit:GetPath(i)
			table.insert(nodes, path)
		end
	end		
	return nodes
end

--Finds any game object with the correct handle to match (hero, minion, wards on either team)
function HPred:GetObjectByHandle(handle)
	local target
	for i = 1, Game.HeroCount() do
		local enemy = Game.Hero(i)
		if enemy and enemy.handle == handle then
			target = enemy
			return target
		end
	end
	
	for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
		if minion and minion.handle == handle then
			target = minion
			return target
		end
	end
	
	for i = 1, Game.WardCount() do
		local ward = Game.Ward(i)
		if ward and ward.handle == handle then
			target = ward
			return target
		end
	end
	
	for i = 1, Game.TurretCount() do 
		local turret = Game.Turret(i)
		if turret and turret.handle == handle then
			target = turret
			return target
		end
	end
	
	for i = 1, Game.ParticleCount() do 
		local particle = Game.Particle(i)
		if particle and particle.handle == handle then
			target = particle
			return target
		end
	end
end

function HPred:GetHeroByPosition(position)
	local target
	for i = 1, Game.HeroCount() do
		local enemy = Game.Hero(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
end

function HPred:GetObjectByPosition(position)
	local target
	for i = 1, Game.HeroCount() do
		local enemy = Game.Hero(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
	
	for i = 1, Game.MinionCount() do
		local enemy = Game.Minion(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
	
	for i = 1, Game.WardCount() do
		local enemy = Game.Ward(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
	
	for i = 1, Game.ParticleCount() do 
		local enemy = Game.Particle(i)
		if enemy and enemy.pos.x == position.x and enemy.pos.y == position.y and enemy.pos.z == position.z then
			target = enemy
			return target
		end
	end
end

function HPred:GetEnemyHeroByHandle(handle)	
	local target
	for i = 1, Game.HeroCount() do
		local enemy = Game.Hero(i)
		if enemy and enemy.handle == handle then
			target = enemy
			return target
		end
	end
end

--Finds the closest particle to the origin that is contained in the names array
function HPred:GetNearestParticleByNames(origin, names)
	local target
	local distance = 999999
	for i = 1, Game.ParticleCount() do 
		local particle = Game.Particle(i)
		if particle then 
			local d = self:GetDistance(origin, particle.pos)
			if d < distance then
				distance = d
				target = particle
			end
		end
	end
	return target, distance
end

--Returns the total distance of our current path so we can calculate how long it will take to complete
function HPred:GetPathLength(nodes)
	local result = 0
	for i = 1, #nodes -1 do
		result = result + self:GetDistance(nodes[i], nodes[i + 1])
	end
	return result
end


--I know this isn't efficient but it works accurately... Leaving it for now.
function HPred:CheckMinionCollision(origin, endPos, delay, speed, radius, frequency)
		
	if not frequency then
		frequency = radius
	end
	local directionVector = (endPos - origin):Normalized()
	local checkCount = self:GetDistance(origin, endPos) / frequency
	for i = 1, checkCount do
		local checkPosition = origin + directionVector * i * frequency
		local checkDelay = delay + self:GetDistance(origin, checkPosition) / speed
		if self:IsMinionIntersection(checkPosition, radius, checkDelay, radius * 3) then
			return true
		end
	end
	return false
end


function HPred:IsMinionIntersection(location, radius, delay, maxDistance)
	if not maxDistance then
		maxDistance = 500
	end
	for i = 1, Game.MinionCount() do
		local minion = Game.Minion(i)
		if minion and self:CanTarget(minion) and self:IsInRange(minion.pos, location, maxDistance) then
			local predictedPosition = self:PredictUnitPosition(minion, delay)
			if self:IsInRange(location, predictedPosition, radius + minion.boundingRadius) then
				return true
			end
		end
	end
	return false
end

function HPred:VectorPointProjectionOnLineSegment(v1, v2, v)
	assert(v1 and v2 and v, "VectorPointProjectionOnLineSegment: wrong argument types (3 <Vector> expected)")
	local cx, cy, ax, ay, bx, by = v.x, (v.z or v.y), v1.x, (v1.z or v1.y), v2.x, (v2.z or v2.y)
	local rL = ((cx - ax) * (bx - ax) + (cy - ay) * (by - ay)) / ((bx - ax) * (bx - ax) + (by - ay) * (by - ay))
	local pointLine = { x = ax + rL * (bx - ax), y = ay + rL * (by - ay) }
	local rS = rL < 0 and 0 or (rL > 1 and 1 or rL)
	local isOnSegment = rS == rL
	local pointSegment = isOnSegment and pointLine or { x = ax + rS * (bx - ax), y = ay + rS * (by - ay) }
	return pointSegment, pointLine, isOnSegment
end

--Determines if there is a windwall between the source and target pos. 
function HPred:IsWindwallBlocking(source, target)
	if _windwall then
		local windwallFacing = (_windwallStartPos-_windwall.pos):Normalized()
		return self:DoLineSegmentsIntersect(source, target, _windwall.pos + windwallFacing:Perpendicular() * _windwallWidth, _windwall.pos + windwallFacing:Perpendicular2() * _windwallWidth)
	end	
	return false
end
--Returns if two line segments cross eachother. AB is segment 1, CD is segment 2.
function HPred:DoLineSegmentsIntersect(A, B, C, D)

	local o1 = self:GetOrientation(A, B, C)
	local o2 = self:GetOrientation(A, B, D)
	local o3 = self:GetOrientation(C, D, A)
	local o4 = self:GetOrientation(C, D, B)
	
	if o1 ~= o2 and o3 ~= o4 then
		return true
	end
	
	if o1 == 0 and self:IsOnSegment(A, C, B) then return true end
	if o2 == 0 and self:IsOnSegment(A, D, B) then return true end
	if o3 == 0 and self:IsOnSegment(C, A, D) then return true end
	if o4 == 0 and self:IsOnSegment(C, B, D) then return true end
	
	return false
end

--Determines the orientation of ordered triplet
--0 = Colinear
--1 = Clockwise
--2 = CounterClockwise
function HPred:GetOrientation(A,B,C)
	local val = (B.z - A.z) * (C.x - B.x) -
		(B.x - A.x) * (C.z - B.z)
	if val == 0 then
		return 0
	elseif val > 0 then
		return 1
	else
		return 2
	end
	
end

function HPred:IsOnSegment(A, B, C)
	return B.x <= _max(A.x, C.x) and 
		B.x >= math.min(A.x, C.x) and
		B.z <= _max(A.z, C.z) and
		B.z >= math.min(A.z, C.z)
end

--Gets the slope between two vectors. Ignores Y because it is non-needed height data. Its all 2d math.
function HPred:GetSlope(A, B)
	return (B.z - A.z) / (B.x - A.x)
end

function HPred:GetEnemyByName(name)
	local target
	for i = 1, Game.HeroCount() do
		local enemy = Game.Hero(i)
		if enemy and enemy.isEnemy and enemy.charName == name then
			target = enemy
			return target
		end
	end
end

function HPred:IsPointInArc(source, origin, target, angle, range)
	local deltaAngle = math.abs(HPred:Angle(origin, target) - HPred:Angle(source, origin))
	if deltaAngle < angle and self:IsInRange(origin,target,range) then
		return true
	end
end

function HPred:GetDistanceSqr(p1, p2)
	if not p1 or not p2 then
		local dInfo = debug.getinfo(2)
		print("Undefined GetDistanceSqr target. Please report. Method: " .. dInfo.name .. "  Line: " .. dInfo.linedefined)
		return math.huge
	end
	return (p1.x - p2.x) *  (p1.x - p2.x) + ((p1.z or p1.y) - (p2.z or p2.y)) * ((p1.z or p1.y) - (p2.z or p2.y)) 
end

function HPred:IsInRange(p1, p2, range)
	if not p1 or not p2 then
		local dInfo = debug.getinfo(2)
		print("Undefined IsInRange target. Please report. Method: " .. dInfo.name .. "  Line: " .. dInfo.linedefined)
		return false
	end
	return (p1.x - p2.x) *  (p1.x - p2.x) + ((p1.z or p1.y) - (p2.z or p2.y)) * ((p1.z or p1.y) - (p2.z or p2.y)) < range * range 
end

function HPred:GetDistance(p1, p2)
	if not p1 or not p2 then
		local dInfo = debug.getinfo(2)
		print("Undefined GetDistance target. Please report. Method: " .. dInfo.name .. "  Line: " .. dInfo.linedefined)
		return math.huge
	end
	return math.sqrt(self:GetDistanceSqr(p1, p2))
end
