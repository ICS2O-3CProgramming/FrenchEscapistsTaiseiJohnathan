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
local lives
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

local function RandomChoices()
    choice1 = math.random (1, 6)
    choice2 = math.random (1, 6)
    if (choice2 == choice1) then
        choice2 = math.random (1, 6)
    end
    choice3 = math.random (1, 6)
    if (choice3 == choice2) or (choice3 == choice1) then
        choice3 = math.random (1, 6)
    end
end

local function SetChoices()
    if (choice1 == 1) then
        rightAnswer = ai
    elseif (choice1 == 2) then
        rightAnswer = as
    elseif (choice1 == 3) then
        rightAnswer = a
    elseif (choice1 == 4) then
        rightAnswer = avons
    elseif (choice1 == 5) then
        rightAnswer = avez
    elseif (choice1 == 6) then
        rightAnswer = ont
    end
    if (choice2 == 1) then
        wrongAnswer1 = ai
    elseif (choice2 == 2) then
        wrongAnswer1 = as
    elseif (choice2 == 3) then
        wrongAnswer1 = a
    elseif (choice2 == 4) then
        wrongAnswer1 = avons
    elseif (choice2 == 5) then
        wrongAnswer1 = avez
    elseif (choice2 == 6) then
        wrongAnswer1 = ont
    end
    if (choice3 == 1) then
        wrongAnswer2 = ai
    elseif (choice3 == 2) then
        wrongAnswer2 = as
    elseif (choice3 == 3) then
        wrongAnswer2 = a
    elseif (choice3 == 4) then
        wrongAnswer2 = avons
    elseif (choice3 == 5) then
        wrongAnswer2 = avez
    elseif (choice3 == 6) then
        wrongAnswer2 = ont
    end
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
    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()


    local function DisplayQuestion()
        displayQuestion = display.newText("" .. question, 400, 800, "Images/vinet.otf", 70)
        displayQuestion:setFillColor(0, 1, 1)
    end


    timer.performWithDelay (100, RandomChoices)
    timer.performWithDelay (200, SetChoices)
    timer.performWithDelay (300, SetQuestion)
    timer.performWithDelay (1000, DisplayQuestion)










----------------------------------------------------------------------------------------

    --sceneGroup:insert( displayQuestion )
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()
    --sceneGroup:insert()


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
