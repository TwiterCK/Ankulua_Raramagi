-- 設定 螢幕
Settings:setCompareDimension(true, 720)
Settings:setScriptDimension(true, 720)
-- 模糊比對
Settings:set("MinSimilarity", 0.6)

function otherEnemy()
	battle1 = Region(210, 255, 160, 100):exists("battle.png", 30)
	if battle1 ~= nil then
		wait(0.5)
		skill3()
	end
	wait(5)
	battle2 = Region(210, 255, 160, 100):exists("battle.png", 30)
	if battle2 ~= nil then
		wait(0.5)
		skill2()
	end
	wait(5)
	battle3 = Region(210, 255, 160, 100):exists("battle.png", 30)
	if battle3 ~= nil then
		wait(1.2)
		skill4()
		wait(6)
		skill1()
	end
end

function skill1()
	local skillReady = Region(27, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(87, 1160), Location(87, 1000))
	end
end

function skill2()
	local skillReady = Region(147, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(207, 1160), Location(207, 1000))
	end
end

function skill3()
	local skillReady = Region(267, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(327, 1160), Location(327, 1000))
	end
end

function skill4()
	local skillReady = Region(407, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(467, 1160), Location(467, 1000))
	end
end

function skill5()
	local skillReady = Region(540, 1100, 100, 30):exists("skillReady.png",30)
	if skillReady ~= nil then
		dragDrop(Location(600, 1160), Location(600, 1000))
	end
end

function result()
	while Region(15, 780, 475, 160):exists("triLevel.png", 1) == nil do
		if Region(0, 0, 400, 120):exists("result.png", 1) ~= nil then
			click(Location(360, 888))
		end
	end
end

-- TODO enter weekdays battle
function main()
	while Region(85, 1135, 185, 145):exists("story.png", 0.5) == nil do
		click(Location(360, 888))
	end
	--
	while Region(280, 120, 180, 180):exists("string_reinforce.png", 0.5) == nil do
		Region(85, 1135, 185, 145):existsClick("story.png", 1)
	end

	local day = os.date("%w")
	if day == "6" or day == "7" then
		while Region(10, 760, 710, 210):exists("weekend.png", 0.5) == nil do
			Region(280, 120, 180, 180):existsClick("string_reinforce.png", 1)
		end
	
		while Region(15, 780, 475, 160):exists("triLevel.png", 0.5) == nil do
			Region(10, 760, 710, 210):existsClick("weekend.png", 1)
		end
	else
		while Region(10, 760, 710, 210):exists("wednesday.png", 0.5) == nil do
			Region(280, 120, 180, 180):existsClick("string_reinforce.png", 1)
		end
	
		while Region(15, 780, 475, 160):exists("triLevel.png", 0.5) == nil do
			Region(10, 760, 710, 210):existsClick("wednesday.png", 1)
		end
	end
	
	while true do
		--if os.time()-time1 >= 60*15 then
			--print("time: " .. (os.time()-time1))
			--dofile(dir .. "reinforce.lua")
			--break
		--end
		--
		i = math.random(0,1)
		if i == 0 then
			-- 中級
			while Region(500, 115, 220, 55):exists("selectHelper.png", 0.5) == nil do
				Region(180, 780, 130, 160):existsClick("mid.png", 1)
			end
			--Region(180, 780, 130, 160):waitClick("mid.png")
		else
			-- 上級
			while Region(500, 115, 220, 55):exists("selectHelper.png", 0.5) == nil do
				Region(320, 780, 130, 160):existsClick("high.png", 1)
			end
			--Region(320, 780, 130, 160):waitClick("high.png")
		end
		
		while Region(120, 790, 480, 200):exists("start.png", 0.5) == nil do
			wait(1)
			click(Location(360, 270))
		end

		while Region(410, 50, 310, 150):exists("raramagi.png", 0.5) == nil do
			Region(120, 790, 480, 200):existsClick("start.png", 1)
		end
		otherEnemy()

		result()
	end
end

--time1 = os.time()
--print("time: " .. time1)
--dir = scriptPath()

main()

if not(pcall(main)) then
	main()
end