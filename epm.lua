--[[
	/epm s/l/b/reset (music name at the MusicList)/s/l/b
	s: stealth
	l: loud
	b: both stealth and loud
	reset: reset's music to default
--]]

local gui = game:GetService("Players").LocalPlayer.PlayerGui
local stealthmusic = gui.SpectateGui.Music:FindFirstChild("Stealth")
local loudmusic = gui.SpectateGui.Music:FindFirstChild("Loud")
local prefix = "/" 
-- i still don't know the freelancer's mapid
--[[local StealthMap = {
    ["3200010305"]=1841578568,
    ["2797881676"]=1843470912,
    ["2625195454"]=1841579381,
    ["3590667014"]=1838617097,
    ["2951213182"]=1843471196,
    ["4518266946"]=1838642607,
    ["4661507759"]=1838641186,
    ["4768829954"]=1841164575, -- entered mission
    ["2215221144"]=1841694216,
    ["4134003540"]=1841578846,
    ["3925577908"]=1836764457,
    ["4388762338"]=1841579363,
    ["5071816792"]=1841579249,
    ["5188855685"]=1838628050,
    ["5862433299"]=nil,
    ["7799530284"]=1841579325
}
local LoudMap = {
    ["3200010305"]=1842940253,
    ["2797881676"]=1837853076,
    ["2625195454"]=1839898469,
    ["3590667014"]=1838627720,
    ["2951213182"]=1842940193,
    ["4518266946"]=1842934882, -- horizon not dead
    ["4661507759"]=1842559618,
    ["4768829954"]=1842801942, -- entered mission
    ["2215221144"]=1840083133,
    ["4134003540"]=nil,
    ["3925577908"]=nil,
    ["4388762338"]=nil,
    ["5071816792"]=nil,
    ["5188855685"]=1837807597,
    ["5862433299"]=1842802303, -- first part
    ["7799530284"]=nil
}--]]

function ChangeMusic(musicid, tactic)
	local changedid = "rbxassetid://"..tostring(musicid)
	if tactic == "stealth" then
		stealthmusic.SoundId = changedid
	elseif tactic == "loud" then
		loudmusic.SoundId = changedid
	end
end

local MusicList = { -- you can add music like: ["music name"]=music id
	["heist"]=1836782065, -- mission ready screen
	["solitary-quest-a"]=1841579249, -- the setup stealth
	["tension-mounts"]=1838628050, -- the lockup stealth
	["here-it-comes"]=1837807597, -- the lockup loud
	["pound-for-pound-underscore"]=1842802303, -- the score loud 1st part
	["pound-for-pound"]=1842802203, -- the score loud 2nd part
	["second-thoughts"]=1838621618, -- the freelancer ready screen
	["breakin-away-underscore"]=1837886013, -- the freelancer 1st part
	["forensic-lab"]=1838621337, -- the freelancer 2nd part
	["breathless-suspense-b"]=1841578568, -- the blacksite stealth
	["snapped"]=1842940253, -- the blacksite loud
	["lock-load"]=1843470912, -- the finalcier stealth
	["see-you-in-hell"]=1837853076, -- the financier loud
	["metro-pulse-a"]=1841578846, -- the auction stealth
	["bass-motion"]=1836764457, -- the gala stealth
	["the-final-thrust-b"]=1841579381, -- the deposit stealth
	["high-velocity"]=1839898469, -- the deposit loud
	["under-surveillance-underscore"]=1838617097, -- the lakehouse stealth
	["complete-the-mission"]=1838627720, -- the lakehouse loud
	["aftermath"]=1843471196, -- the withdrawl stealth
	["assault-complex"]=1842940193, -- the withdrawl loud
	["hard-as-iron"]=1841579363, -- the cache stealth
	["looking-for-a-clue-underscore"]=1838642607, -- the scientist stealth
	["lethal-conflict"]=1842934882, -- the scientist loud rivera alive
	["lethal-conflict-underscore"]=1842801894, -- the scientist loud rivera dead
	["unusual-suspect"]=1838641186, -- the scrs stealth
	["hijacked"]=1842559618, -- the scrs loud
	["restless-tension-b"]=1841164610, -- black dusk stealth ready screen
	["restless-tension-a"]=1841164575, -- black dusk stealth
	["full-force-underscore"]=1842802012, -- black dusk loud ready screen
	["full-force"]=1842801942, -- black dusk loud
	["covert-ops-a"]=1841694216, -- the killhouse stealth
	["the-vault-a"]=1840083133, -- the killhouse loud
	["no-more-time-a"]=1847027481, -- the killhouse loud nightmare assault
	["ambience"]=3097850155, -- HH20 ready screen
	["burning-action"]=1838626744, -- HH20 loud
	["the-final-thrust-a"]=1841579325, -- the concept stealth
	-- alt section
	["pushing-me-closer"]=1836789312, -- the lockup loud alternative
	["best-laid-plans-alternative"]=1836808611, -- the score loud 1st part alternative
	["best-laid-plans"]=1837025066, -- the score loud 2nd part alternative
	["suicide-mission"]=1837844069, -- the blacksite loud alternative
	["there-will-be-blood"]=1843513001, -- the financier loud alternative
	["terminal-velocity"]=1842802436, -- the deposit loud alternative(new)
	["fight-or-flight"]=1842940300, -- the lakehouse loud alternative
	["pushing-the-limits"]=1838627011, -- the withdrawl loud alternative
	["phoenix-rising"]=1837798316, -- the scientist loud rivera alive alternative
	["phoenix-rising-drums-and-bass"]=1837798598, -- the scientist loud rivera dead alternative
	["we-go-hard"]=1842940420, -- the scrs loud alternative
	["victory-is-ours"]=1842802498, -- black dusk loud alternative
	["chaos"]=1843497734 -- the killhouse loud alternative
}

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	local loweredString = string.lower(msg)
	local args = string.split(loweredString, " ")
	if args[1] == prefix.."epm" and args[3] ~= nil then
		if args[2] == "s" then -- stealth
			ChangeMusic(MusicList[args[3]], "stealth")
			print(MusicList[args[3]])
		elseif args[2] == "l" then -- loud
			ChangeMusic(MusicList[args[3]], "loud")
			print(MusicList[args[3]])
		elseif args[2] == "b" then -- both
			ChangeMusic(MusicList[args[3]], "stealth")
			ChangeMusic(MusicList[args[3]], "loud")
			print(MusicList[args[3]])
		--[[elseif arg[2] == "reset" then -- default
			if arg[3] == "s" then
				ChangeMusic(StealthMap[tostring(game.PlaceId)], "stealth")
			elseif arg[3] == "l" then
				ChangeMusic(LoudMap[tostring(game.PlaceId)], "loud")
			elseif arg[3] == "b" then -- i don't recommend to use this(cuz there's mission that is not having stealth tactic or loud tactic)
				ChangeMusic(StealthMap[tostring(game.PlaceId)], "stealth")
				ChangeMusic(LoudMap[tostring(game.PlaceId)], "loud")
			end--]]
		else
			print("Not Right Tactic!")
		end
	end
end)