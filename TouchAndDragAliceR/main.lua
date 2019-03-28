-- Title: TouchAndDrag
-- Name: Alice R
-- Course: ICS2O/3C
-- This program...
-------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

------------------------------------------------------------------
--LOCAL IMAGES
------------------------------------------------------------------
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local heartGirl = display.newImageRect("Images/heartGirl.png", 150, 150)
local heartGirlWidth = heartGirl.Width
local heartGirlHeight = heartGirl.Height

local devilGirl = display.newImageRect("Images/devilGirl.png", 150, 150)
local devilGirlWidth = devilGirl.Width
local devilGirlHeight = devilGirl.Height

-- boolean variables
local alreadyTouchedHeartGirl = false
local alreadyTouchedDevilGirl = false

-- set the initial x and y postion
heartGirl.x = 400
heartGirl.y = 500

devilGirl.x = 300
devilGirl.y = 200

-- Function: devilGirlListener
-- Input: touch listener
-- output: none
-- Description: when devil girl is touched, move her 
local function DevilGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedHeartGirl == false) then
			alreadyTouchedDevilGirl = true
		end
	end

if ( (touch.phase == "moved") and (alreadyToucheDevilGirl == true) ) then
	devilGirl.x = touch.x
	devilgirl.y = touch.y
end

    if (touch.phase == "ended") then
	   alreadyTouchedDevilGirl = false
	   alreadyTouchedHeartGirl = false
    end
end

-- add the respective listeners to each object
devilGirl:addEventListener("touch", DevilGirlListener)
