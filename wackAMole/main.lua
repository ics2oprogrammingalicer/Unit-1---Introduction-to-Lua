-- Title: WhackAMole
-- Name: ALice R
-- Course: ICS2O/3C
-- This program places a random object on the screen. if the user clicks on it in time ,
-- the score increases by 1.

display.setStatusBar(display.HiddenStatusBar)

------------------------------------------------------------------------------
--LOCAL VARIABLES AND OBJECTS
------------------------------------------------------------------------------
-- Creating a Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )

    -- set background Colour
    display.setDefault("background", 153/255, 0/255, 26/255)

    -- setting position
    bkg.anchorX = 0
    bkg.anchorY = 0
    bkg.x = 0
    bkg.y = 0

    bkg.isVisible = true

-- creating Mole
local mole = display.newImage( "Images/mole.png", 0, 0 )

    -- setting position
    mole.x = display.contentCenterX
    mole.y = display.contentCenterY

    --scale the mole to original size
    mole:scale(0.3, 0.3)

    -- make the mole invisible
    mole.isVisible = false

-- create variable to keep track of score
local score = 0
local scoreObject = display.newText("", display.contentWidth/5, display.contentHeight/3, nil, 50)
scoreObject:setTextColor(0/255, 230/255, 38/255)

----------------------------------------------------------------------------
--FUNCTIONS
----------------------------------------------------------------------------
-- this function makes the mole appesr in a random(x,y) position on the screen
-- before calling the hide function
function PopUp( ) 

	-- choose a random position on the screen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )

	-- make the mole visible 
	mole.isVisible = true

	-- call hide after 500 milliseconds
	timer.performWithDelay( 500, Hide )
end

-- this function calls the popUp after 3 sceonds
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end

-- this function makes the  mole invisible and then calls the PopUpDelay function
function Hide()
	-- changing visibility
	mole.isVisible = false
	-- call PopUpDelay function
	PopUpDelay()
end

-- this function starts the game
function GameStart()
	PopUpDelay()
end

-- this function increments the score only if the mole is clicked. it then displays
-- the new Score.
function Whacked(event)

	-- if touch phase just started
	if (event.phase == "began") then
		score = score + 1
		scoreObject.text = "Score" .. " = " .. score
	end

end

------------------------------------------------------------------------
-- EVENT LISTENERS
------------------------------------------------------------------------
-- I add the event listener to the moles so that if the mole is touched 
-- the whacked function is called
mole:addEventListener( "touch", Whacked)

------------------------------------------------------------------------
-- STARTS THE GAME
------------------------------------------------------------------------
GameStart()