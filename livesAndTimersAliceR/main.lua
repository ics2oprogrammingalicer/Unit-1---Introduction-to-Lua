-- Title: MathFun
-- Name: Alice R
-- Course: ICS2O
-- This program asks the user to answer a random math question.
------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 0/255, 255/255, 0/255) 

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
local randomOperator
local userAnswer
local correctAnswer
local pointsObject
local points

--variables for the timer
local totalSeconds = 15
local secondsLeft = 15
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3



-----------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------

-- correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3")
local correctSoundChannel

local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3")
local wrongSoundChannel
-----------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then 
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		-- ***IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE
		-- AND CANCEL THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE
		if (lives == 3)then
			heart3.isvisible = false
		elseif (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end

		-- *** CALL THE FUNCTION TO ASK A NEW QUESTION

	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end
-----------------------------------------------------------------------
local function AskQuestion()
	-- generate a random number beetween 1 and 2.
	randomOperator = math.random(1,4)

	--generate 2 random numbers
	randomNumber1 = math.random(1,10)
	randomNumber2 = math.random(1,10)

	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object
	    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

    -- if the random operator is 2, then do subtraction
	elseif (randomOperator == 2) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
	    questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "


	-- if the random operator is 3, then do multlipication
	elseif (randomOperator == 3) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object
	    questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "

    -- if the random operator is 4, then do devision
	elseif (randomOperator == 4) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2

		-- create question in text object
	    questionObject.text = randomNumber1 .. " ÷ " .. randomNumber2 .. " = "
    end

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
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
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2000, HideCorrect)

		else correctObject.isVisible = false
			 incorrectObject.isvisible = true
			 wrongSoundChannel = audio.play(wrongSound)
			 timer.performWithDelay(2000, HideIncorrect)
		end
	end
end

--------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

clockText = display.newText("", display.contentWidth/10, display.contentHeight/7, nil, 150)
clockText:setTextColor(255/255, 0/255, 8/255)

-- displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(255/255, 0/255, 8/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(255/255, 0/255, 8/255)
correctObject.isvisible = false

--create the incorrect text object and make it invisible
incorrectObject = display.newText( "incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(255/255, 0/255, 8/255)
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