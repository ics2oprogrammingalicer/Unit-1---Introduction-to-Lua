-- Title: AreaOfRectangleAndCircle
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a coloured rectangle with a border of a different colour. 
-- it also calculates the area and displays it on the screen. 
-- Then i added a the code to draw a circle of a given radius that is coloured and a
-- border of a different colour. i used the radius to calculate the area and displayed
-- this on the iPad.

-- create my local variables
local areaText
local textSize = 55
local myRectangle
local widthOfRectangle = 300
local heightOfRectangle = 250
local AreaOfRectangleAndCircle

-- set the background colour of my screen.Remember thet colours are beetween 0 and 1
display.setDefault("background", 102/255, 102/255, 255/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size
myRectangle = display.newRect(0,0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) positiom
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 15
myRectangle.Y = 15

-- set the width of the border
myRectangle.strokeWidth = 15

-- set the colour of the rectangle
myRectangle:setFillColor(204/255, 0/255, 102/255)

-- set colour of the border
myRectangle:setStrokeColor(102/255, 0/255, 51/255)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. take into consideration the size of the front when positioning it on the screen
areaText = display.newText("the area of this rectangle with the width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 5
areaText.x = 10
areaText.y = display.contentHeight/2

-- set colour of the newText
areaText:setTextColor(1/255, 1/255, 1/255)

-- create local variables 
local areaText
local textSize = 55
local myCircle
local radiusOfCircle = 115
local areaOfCircle 

-- draw the circle that is half the width and half the length of the screen size
myCircle = display.newCircle(0, 0, radiusOfCircle)

-- anchor the circle in the top left corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 700
myCircle.y = 15

-- set width of border
myCircle.strokeWidth = 10

-- set the colour of circle
myCircle:setFillColor(153/255, 0/255, 0/255)

-- set colour of border
myCircle:setStrokeColor(102/255, 0/255, 0/255)

-- calculate the area
areaOfCircle = radiusOfCircle * radiusOfCircle * 3.14

-- write the area on the screen. take into consideration the size of the front when positioning it on the screen
areaText = display.newText("the area of this circle with the radius of \n" ..
	radiusOfCircle .. " is " ..
	areaOfCircle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 10
areaText.y = display.contentHeight/2

-- set colour of the newText
areaText:setTextColor(1, 1, 1)