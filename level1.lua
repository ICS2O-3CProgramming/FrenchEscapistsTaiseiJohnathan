-----------------------------------------------------------------------------------------
--
-- level1.lua
-- Created by: Johnathan Taisei
-- Date: May 14 2018
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image

--[[
local character

local function ReplaceCharacter()
    character = display.newImageRect("Images/Guard.png")
    character.width = 315
    character.height = 395
    character.x = 500
    character.y = 500
    character.myName = "Guard"

    -- add back runtime listeners
    -- AddRuntimeListeners()
end
]]--

local choice1
local choice2
local choice3

local rightAnswer
local wrongAnswer1
local wrongAnswer2

local character

local platform1
local platform2
local platform3
local basePlatform

local question

local displayQuestion
local rightAnswerDisplay
local wrongAnswerDisplay1
local wrongAnswerDisplay2
local rightAnswerPostition

local lives

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local bkgMusic
local playbkgMusic
local fallSound
local playfallSound
local platformBreakSound
local playplatformBreakSound
local climbSound
local playclimbSound
local bridgeDrawSound
local playbridgeDrawSound
local characterLandSound
local playcharacterLandSound
local characterJumpSound
local playcharacterJumpSound


-----------------------------------------------------------------------------------------
-- FUNCTIONS BEFORE SCENE CREATE
-----------------------------------------------------------------------------------------

local function DisplayWrongAnswer2()
    wrongAnswerDisplay2.text = "" .. wrongAnswer2
    if (rightAnswerPostition == 1) then
        wrongAnswerDisplay2.x = 400
        wrongAnswerDisplay2.y = 620
    elseif (rightAnswerPostition == 2) then
        wrongAnswerDisplay2.x = 200
        wrongAnswerDisplay2.y = 530
    elseif (rightAnswerPostition == 3) then
        wrongAnswerDisplay2.x = 600
        wrongAnswerDisplay2.y = 530
    end
end

local function DisplayWrongAnswer1()
    wrongAnswerDisplay1.text = "" .. wrongAnswer1
    if (rightAnswerPostition == 1) then
        wrongAnswerDisplay1.x = 600
        wrongAnswerDisplay1.y = 530
    elseif (rightAnswerPostition == 2) then
        wrongAnswerDisplay1.x = 400
        wrongAnswerDisplay1.y = 620
    elseif (rightAnswerPostition == 3) then
        wrongAnswerDisplay1.x = 200
        wrongAnswerDisplay1.y = 530
    end
    DisplayWrongAnswer2()
end

local function DisplayRightAnswer()
    rightAnswerDisplay.text = "" .. rightAnswer
    rightAnswerPostition = math.random(1, 3)
    if (rightAnswerPostition == 1) then
        rightAnswerDisplay.x = 200
        rightAnswerDisplay.y = 530
    elseif (rightAnswerPostition == 2) then
        rightAnswerDisplay.x = 600
        rightAnswerDisplay.y = 530
    elseif (rightAnswerPostition == 3) then
        rightAnswerDisplay.x = 400
        rightAnswerDisplay.y = 620
    end
    DisplayWrongAnswer1()
end

local function DisplayQuestion()
    displayQuestion.text = "" .. question
    
    if (choice1 == 3) then
        displayQuestion.size = 50
    elseif (choice1 == 6) then
        displayQuestion.size = 45
    end
    DisplayRightAnswer()
end

local function SetQuestion()
    if (choice1 == 1) then
       question = "Je"
    elseif (choice1 == 2) then
        question = "Tu"
    elseif (choice1 == 3) then
        question = "Il/Elle"
    elseif (choice1 == 4) then
        question = "Nous"
    elseif (choice1 == 5) then
        question = "Vous"
    elseif (choice1 == 6) then
        question = "Ils/Elles"
    end
    DisplayQuestion()
end

local function SetChoices()
    if (choice1 == 1) then
        rightAnswer = "ai"
    elseif (choice1 == 2) then
        rightAnswer = "as"
    elseif (choice1 == 3) then
        rightAnswer = "a"
    elseif (choice1 == 4) then
        rightAnswer = "avons"
    elseif (choice1 == 5) then
        rightAnswer = "avez"
    elseif (choice1 == 6) then
        rightAnswer = "ont"
    end

    if (choice2 == 1) then
        wrongAnswer1 = "ai"
    elseif (choice2 == 2) then
        wrongAnswer1 = "as"
    elseif (choice2 == 3) then
        wrongAnswer1 = "a"
    elseif (choice2 == 4) then
        wrongAnswer1 = "avons"
    elseif (choice2 == 5) then
        wrongAnswer1 = "avez"
    elseif (choice2 == 6) then
        wrongAnswer1 = "ont"
    end

    if (choice3 == 1) then
        wrongAnswer2 = "ai"
    elseif (choice3 == 2) then
        wrongAnswer2 = "as"
    elseif (choice3 == 3) then
        wrongAnswer2 = "a"
    elseif (choice3 == 4) then
        wrongAnswer2 = "avons"
    elseif (choice3 == 5) then
        wrongAnswer2 = "avez"
    elseif (choice3 == 6) then
        wrongAnswer2 = "ont"
    end
    SetQuestion()
end

local function RandomChoices()
    choice1 = math.random (1, 6)
    choice2 = math.random (1, 6)
    choice3 = math.random (1, 6)
    while (choice2 == choice1) do
        choice2 = math.random (1, 6)
    end
    while (choice3 == choice2) or (choice3 == choice1) do
        choice3 = math.random (1, 6)
    end
    SetChoices()
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view


    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/Level1.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    displayQuestion = display.newText("", 400, 840, "Images/vinet.otf", 70)
    displayQuestion:setFillColor(216/255, 119/255, 0/255)

    rightAnswerDisplay = display.newText("", 1, 1, "Images/vinet.otf", 70)
    rightAnswerDisplay:setFillColor(58/255, 81/255, 252/255)

    wrongAnswerDisplay1 = display.newText("", 1, 1, "Images/vinet.otf", 70)
    wrongAnswerDisplay1:setFillColor(58/255, 81/255, 252/255)

    wrongAnswerDisplay2 = display.newText("", 1, 1, "Images/vinet.otf", 70)
    wrongAnswerDisplay2:setFillColor(58/255, 81/255, 252/255)

    platform1 = display.newImageRect("Images/ChoicePlatform.png", 170, 200)
    platform1.x = 200
    platform1.y = 590


    platform2 = display.newImageRect("Images/ChoicePlatform.png", 170, 200)
    platform2.x = 600
    platform2.y = 590


    platform3 = display.newImageRect("Images/ChoicePlatform.png", 170, 200)
    platform3.x = 400
    platform3.y = 690


    basePlatform = display.newImageRect("Images/MainPlatform@2x.png", 280, 250)
    basePlatform.x = 400
    basePlatform.y = 920

    timer.performWithDelay(100, RandomChoices)



----------------------------------------------------------------------------------------

    sceneGroup:insert( platform1 )
    sceneGroup:insert( platform2 )
    sceneGroup:insert( platform3 )
    sceneGroup:insert( basePlatform )
    sceneGroup:insert( displayQuestion )
    sceneGroup:insert( rightAnswerDisplay )
    sceneGroup:insert( wrongAnswerDisplay1 )
    sceneGroup:insert( wrongAnswerDisplay2 )
    --sceneGroup:insert(  )
    --sceneGroup:insert(  )


end -- function scene:create( event )   

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        --RemoveCollisionListeners()
        --RemovePhysicsBodies()

        --physics.stop()
        --RemoveArrowEventListeners()
        --RemoveRuntimeListeners()
        --display.remove(character)

    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
