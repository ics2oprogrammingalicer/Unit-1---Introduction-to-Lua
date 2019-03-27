-- Title: TouchAndDrag
-- Name: Alice R
-- Course: ICS2O/3C
-- This program...
-------------------------------------------------------------------

-- hide status bar
display.setStausBar(display.HiddenStatusBar)

------------------------------------------------------------------
--LOCAL IMAGES
------------------------------------------------------------------
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local yellowGirl = 
local yellowGirlWidth = yellowGirl.Width
local yellowGirlHeight = yellowGirl.Height

local blueGirl = 
local blueGirlWidth = blueGirl.Width
local blueGirlHeight = blueGirl.Height

-- boolean variables
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false

-- set the initial x and y postion
yellowGirl.x = 400
yellowGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

-- Function: BlueGirlListener
-- Input: touch listener
-- output: none
-- Description: when blue girl is touched, move her 
local function BlueGIrlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) then
			alreadyTouchedBlueGirl = true
		end
	end

if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
	blueGirl.x = touch.x
	bluegirl.y = touch.y
end

    if (touch.phase == "ended") then
	   alreadyTouchedBlueGirl = false
	   alreadyTouchedYellowGirl = false
    end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch" BlueGirlListener)

