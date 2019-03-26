-- Title: MovingObjects
-- Name: Alice R
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.
-- I added another object that moves in another direction as well as a background image.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

-- background music
local creativeminds = audio.loadSound( "Sounds/bensound-creativeminds.mp3" )
local creativemindsSoundChannel
 
creativemindsSoundChannel = audio.play(creativemindsSound)

timer.performWithDelay(2000, HideCorrect)
-----------------------------------------------------------------------------------------



-- function: MoveShip
-- Imput: this function accepts an event listener
-- output: none
-- description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x =beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end 

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)


-- global variables
scrollSpeed = 5

-- character image with width and height
local octopus = display.newImageRect("Images/octopus.png", 200, 200)

-- set the image to be transparent
octopus.alpha = 0

-- set the initial x and y position of beetleship
octopus.x = 0
octopus.y = display.contentHeight/1.7

-- function: MoveShip
-- Imput: this function accepts an event listener
-- output: none
-- description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	octopus.x = octopus.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	octopus.alpha = octopus.alpha + 0.1
end 

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)