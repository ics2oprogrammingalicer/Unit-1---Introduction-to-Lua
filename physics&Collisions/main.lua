-- Title: PhysicsAndCollisions
-- Name: Your Name
-- Course: ICS2O
-- This program...
------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local hysics = require("physics")

-- start physics
physics.start()
------------------------------------------------------------------------
-- OBJECTS
------------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)
   ground.x = display.contentWidth/2
   ground.y = display.contentHeight/1.04

   -- change the width to be the same as the screen
   ground.width = display.contentWidth

   -- add to physics 
   physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-------------------------------------------------------------------------
-- beam
local beam = display.newImage("Images/beam.png", 0, 0)
   beam.x = display.contentCenterX/0.59
   beam.y = display.contentCenterY*1.65

   beam.width = display.contentWidth/2
   beam.height = display.contentHeight/10

   -- rotate the beam -45 degrees so it is on an angle
   beam:rotate(-45)

   -- send it to the back layer
   beam:toBack()

   -- add to physics
   physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

------------------------------------------------------------------------
-- beam
local beam2 = display.newImage("Images/beam.png", 0, 0)
   beam2.x = display.contentCenterX/5
   beam2.y = display.contentCenterY*1.65

   beam2.width = display.contentWidth/2
   beam2.height = display.contentHeight/10

   -- rotate the beam 45 degrees so it is on an angle
   beam2:rotate(45)

   -- send it to the back layer
   beam2:toBack()

   -- add to physics
   physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

------------------------------------------------------------------------
-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

    -- set the x and y position
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY

    -- set the height and width of bkg
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight

    -- send to back
    bkg:toBack()

------------------------------------------------------------------------
--FUNCTIONS
------------------------------------------------------------------------

-- create the first ball
local function firstBall()
	-- creating first ball
	local ball1 = display.newImage("images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.5, radius=12.5})
end

-------------------------------------------------------------------------
-- create the second ball
local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.9, radius=65})

  -- make the ball bigger than the original size
  ball2:scale(3, 3)
end

-------------------------------------------------------------------------
-- create the third ball
local function thirdBall()
	-- creating third ball
	local ball3 = display.newImage("images/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball3, {density=1.0, friction=0.5, bounce=0.9, radius=0.7})

  -- make ball smaller than original size
  ball3:scale(0.5, 0.5) 
end

-------------------------------------------------------------------------
-- create the fourth ball
local function fourthBall()
  -- creating second ball
  local ball4 = display.newImage("images/super_ball.png", 0, 0)

  -- add to physics
  physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.9, radius=200})

  -- make ball smaller than original size
  ball4:scale(10, 10) 
end
-------------------------------------------------------------------------
-- TIMER DELAYS 
-------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay(1000, thirdBall)
timer.performWithDelay(1500, fourthBall)