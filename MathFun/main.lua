-- Title: MathFun
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
local incorrectObject
local numericTextFields
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-----------------------------------------------------------------------
-- LOCALO FUNCTIONS
-----------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number beetween 1 and 2.
	randomOperator = math.random(1,2)

	--generate 2 random numbers
	randomNumber1 = math.random(0,4)
	randomNumber2 = math.random(0,4)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
	    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    
    -- 

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericFeild"
	if ( event.phase == "began") then 

		--clear the text feild
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user imput to users answer
		userAnswer = tonumber(event.target.text)
		
		--if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			timer.performWithDelay(2000, HideCorrect)

		else correctObject.isVisible = false
			 incorrectObject.isvisible = true
			 timer.performWithDelay(2000, HideIncorrect)
		end
	end
end

--------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(153/255, 255/255, 255/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(153/255, 255/255, 255/255)
correctObject.isvisible = false

--create the incorrect text object and make it invisible
incorrectObject = display.newText( "incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(153/255, 255/255, 255/255)
incorrectObject.isVisible = false

--create numeric feild
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event listener for the numeric feild 
numericField:addEventListener( "userInput", NumericFieldListener )

----------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------
-- call the function to aske the question
AskQuestion()