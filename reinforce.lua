-- 設定 螢幕
Settings:setCompareDimension(true, 720)
Settings:setScriptDimension(true, 720)
-- 模糊比對
Settings:set("MinSimilarity", 0.6)

function skill1()
	skillReady = Region(27, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(87, 1160), Location(87, 1000))
	end
end

function skill2()
	skillReady = Region(147, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(207, 1160), Location(207, 1000))
	end
end

function skill3()
	skillReady = Region(267, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(327, 1160), Location(327, 1000))
	end
end

function skill4()
	skillReady = Region(407, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(467, 1160), Location(467, 1000))
	end
end

function skill5()
	skillReady = Region(540, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(600, 1160), Location(600, 1000))
	end
end

function result()
	while Region(60, 110, 400, 180):exists("reinforce.png", 1) == nil do
		if Region(0, 0, 400, 120):exists("result.png", 1) ~= nil then
			click(Location(360, 888))
		end
	end
end

function main()
	while Region(85, 1135, 185, 145):exists("story.png", 0.5) == nil do
		click(Location(360, 888))
	end
	--
	while Region(280, 120, 180, 180):exists("string_reinforce.png", 0.5) == nil do
		Region(85, 1135, 185, 145):existsClick("story.png", 1)
	end
	
	while Region(10, 760, 710, 210):exists("reinforceTower.png", 0.5) == nil do
		Region(280, 120, 180, 180):existsClick("string_reinforce.png", 1)
	end

	while Region(60, 110, 400, 180):exists("reinforce.png", 0.5) == nil do
		Region(10, 760, 710, 210):existsClick("reinforceTower.png", 1)
	end
	
	while true do
	--[[
		if os.time()-time1 >= 60*15 then
			print("time: " .. (os.time()-time1))
			dofile(dir .. "weekdays_event.lua")
			break
		end
		]]--
		while Region(500, 115, 220, 55):exists("selectHelper.png", 0.5) == nil do
			Region(550, 805, 130, 130):existsClick("30F.png", 0.5)
		end

		while Region(120, 790, 480, 200):exists("start.png", 0.5) == nil do
			wait(1)
			click(Location(360, 270))
		end

		while Region(410, 50, 310, 150):exists("raramagi.png", 0.5) == nil do
			Region(120, 790, 480, 200):existsClick("start.png", 1)
		end

		local battle1 = Region(210, 255, 160, 100):exists("battle.png", 30)
		if battle1 ~= nil then
			wait(26)
			skill1()
			wait(6)
			skill1()
			if Region(0, 0, 400, 120):exists("result.png", 16) == nil then
				skill2()
				wait(6)
				skill2()
			end
		end

		result()
	end
end
--[[
time1 = os.time()
print("time: " .. time1)
dir = scriptPath()
]]--
main()
