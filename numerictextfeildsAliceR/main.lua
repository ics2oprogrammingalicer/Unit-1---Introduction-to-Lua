-- Title: NumericTextFields
-- Name: Alice R
-- Course: ICS2O
-- This program asks the user to answer a random math question.
------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 255/255, 153/255) 

-----------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local numericTextFields
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-----------------------------------------------------------------------
-- LOCALO FUNCTIONS
-----------------------------------------------------------------------

local function AskQuestion()
	-- generate 2  random numbers beetween a max. and a min. number
	randomNumber1 = math.random(0,10)
	randomNumber2 = math.random(0,10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFeildListener( event )

	-- User begins editing "numericFeild"
	if ( event.phase == "began") then 

		--clear the text feild
		event.target.text = ""

	elseif