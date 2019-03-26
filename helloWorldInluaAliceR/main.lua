-- Title: HelloWorld
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal
---------------------------------------------------------------------------
-- print "hello, world" to the command terminal
print ("***Hellooooooooooooooooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 51/255, 153/255, 255/255)

-- create local variable
local textObject
local textObjectSigniture

-- displays text on the screenat position x = 500 y = 500 with
-- a default font style and font size of 50
textObject = display.newText("Hello, world!", 500, 300, nil, 150)

-- sets the colour of text
textObject:setTextColor(255/255, 51/255, 255/255)

-- display signiture
textObjectSigniture = display.newText("by:Alice R.", 500, 500, nil, 75)

-- set colour
textObjectSigniture:setTextColor(51/255, 255/255, 51/255)
