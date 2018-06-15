-----------------------------------------------------------------------------------------
-- parler – to speak, to talk
-- level4.lua
-- Created by: Johnathan Taisei
-- Date: May 16 2018
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
sceneName = "level4"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image

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
local platform1BridgeImage
local platform2BridgeImage
local platform3BridgeImage
local platform1Broken
local platform2Broken
local platform3Broken

local question
local score = 0
local showScore

local displayQuestion
local rightAnswerDisplay
local wrongAnswerDisplay1
local wrongAnswerDisplay2
local rightAnswerPosition

local path
local file, errorString

local backButton
local WinText
local VerbText
-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local bkgMusic
local playbkgMusic
local platformBreakSound
local playplatformBreakSound
local bridgeWalkSound
local playbridgeWalkSound
local characterJumpSound
local playcharacterJumpSound

--local square = display.newRect( 0, 0, 100, 100 )
 
--transition.moveTo( square, { x=200, y=400, time=2000 } )
-----------------------------------------------------------------------------------------
-- FUNCTIONS BEFORE SCENE CREATE
-----------------------------------------------------------------------------------------

local function LevelSelect()
    composer.gotoScene( "level_select", {effect = "crossFade", time = 1000})
end

local function UnlockLevel5()
    if (SaveState == 4) then
        SaveState = SaveState + 1
                -- Open the file handle
        file, errorString = io.open( path, "w" )
 
        if not file then
            -- Error occurred; output the cause
            print( "File error: " .. errorString )
        else
            -- Read data from file
            local contents = file:write( 5 )
            -- Close the file handle
            io.close( file )
        end
    end
    LevelSelect()
end

local function HideWin()
    WinText.isVisible = false
end

local function Win()
    WinText.isVisible = true
end

local function LoseScreen()
    composer.gotoScene( "lose", {effect = "crossFade", time = 500})
end

local function HideCharacter()
    character.isVisible = false
end

local function ReplaceCharacter()
    character.x = 400
    character.y = 750
    character.isVisible = true
end

local function DisplayWrongAnswer2()
    wrongAnswerDisplay2.text = "" .. wrongAnswer2
    if (rightAnswerPosition == 1) then
        wrongAnswerDisplay2.x = 400
        wrongAnswerDisplay2.y = 620
    elseif (rightAnswerPosition == 2) then
        wrongAnswerDisplay2.x = 200
        wrongAnswerDisplay2.y = 530
    elseif (rightAnswerPosition == 3) then
        wrongAnswerDisplay2.x = 600
        wrongAnswerDisplay2.y = 530
    end
end

local function DisplayWrongAnswer1()
    wrongAnswerDisplay1.text = "" .. wrongAnswer1
    if (rightAnswerPosition == 1) then
        wrongAnswerDisplay1.x = 600
        wrongAnswerDisplay1.y = 530
    elseif (rightAnswerPosition == 2) then
        wrongAnswerDisplay1.x = 400
        wrongAnswerDisplay1.y = 620
    elseif (rightAnswerPosition == 3) then
        wrongAnswerDisplay1.x = 200
        wrongAnswerDisplay1.y = 530
    end
end

local function DisplayRightAnswer()
    rightAnswerDisplay.text = "" .. rightAnswer
    rightAnswerPosition = math.random(1, 3)

    if (rightAnswerPosition == 1) then
        rightAnswerDisplay.x = 200
        rightAnswerDisplay.y = 530

    elseif (rightAnswerPosition == 2) then
        rightAnswerDisplay.x = 600
        rightAnswerDisplay.y = 530

    elseif (rightAnswerPosition == 3) then
        rightAnswerDisplay.x = 400
        rightAnswerDisplay.y = 620
    end
end

local function DisplayNextQuestion()
    displayQuestion.text = "" .. question
    
    if (choice1 == 3) then
        displayQuestion.size = 50
    elseif (choice1 == 6) then
        displayQuestion.size = 45
    elseif (choice1 == 1) then
        displayQuestion.size = 70
    elseif (choice1 == 2) then
        displayQuestion.size = 70
    elseif (choice1 == 4) then
        displayQuestion.size = 70
    elseif (choice1 == 5) then
        displayQuestion.size = 70
    end
   -- ReplaceCharacter()
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

local function SetChoices()
    if (choice1 == 1) then
        rightAnswer = "parle"
    elseif (choice1 == 2) then
        rightAnswer = "parles"
    elseif (choice1 == 3) then
        rightAnswer = "parle(il)"
    elseif (choice1 == 4) then
        rightAnswer = "parlons"
    elseif (choice1 == 5) then
        rightAnswer = "parlez"
    elseif (choice1 == 6) then
        rightAnswer = "parlent"
    end

    if (choice2 == 1) then
        wrongAnswer1 = "parle"
    elseif (choice2 == 2) then
        wrongAnswer1 = "parles"
    elseif (choice2 == 3) then
        wrongAnswer1 = "parle(il)"
    elseif (choice2 == 4) then
        wrongAnswer1 = "parlons"
    elseif (choice2 == 5) then
        wrongAnswer1 = "parlez"
    elseif (choice2 == 6) then
        wrongAnswer1 = "parlent"
    end

    if (choice3 == 1) then
        wrongAnswer2 = "parle"
    elseif (choice3 == 2) then
        wrongAnswer2 = "parles"
    elseif (choice3 == 3) then
        wrongAnswer2 = "parle(il)"
    elseif (choice3 == 4) then
        wrongAnswer2 = "parlons"
    elseif (choice3 == 5) then
        wrongAnswer2 = "parlez"
    elseif (choice3 == 6) then
        wrongAnswer2 = "parlent"
    end
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
end

local function platform1NextQuestion()
    if (score == 3) then
        Win()
        timer.performWithDelay(1200, UnlockLevel5)
    else
        transition.moveTo ( character, { x=400, y=320, time=1000})
        platform1BridgeImage.isVisible = false
        timer.performWithDelay(1200, RestartLevel4)
    end
end

local function platform2NextQuestion()
    if (score == 3) then
        Win()
        timer.performWithDelay(1200, UnlockLevel5)
    else
        transition.moveTo ( character, { x=400, y=320, time=1000})
        platform2BridgeImage.isVisible = false
        timer.performWithDelay(1200, RestartLevel4)
    end
end

local function platform3NextQuestion()
    if (score == 3) then
        Win()
        timer.performWithDelay(1200, UnlockLevel5)
    else
        platform3BridgeImage.isVisible = false
        RestartLevel4()
    end
end

local function platform1Fade()
    audio.play(platformBreakSound, {channel=2})
    transition.scaleBy(platform1Broken, { xScale=1.2, yScale=1.2, time=800 })
    transition.fadeOut(platform1Broken, { time=800 })
    transition.fadeOut(platform1, { time=400 })
end

local function platform2Fade()
    audio.play(platformBreakSound, {channel=2})
    transition.scaleBy(platform2Broken, { xScale=1.2, yScale=1.2, time=800 })
    transition.fadeOut(platform2Broken, { time=800 })
    transition.fadeOut(platform2, { time=400 })
end

local function platform3Fade()
    audio.play(platformBreakSound, {channel=2})
    transition.scaleBy(platform3Broken, { xScale=1.2, yScale=1.2, time=800 })
    transition.fadeOut(platform3Broken, { time=800 })
    transition.fadeOut(platform3, { time=400 })
end

local function platform1BridgeExtend()
    platform1BridgeImage.isVisible = true
    transition.moveTo( character, { x=200, y=320, time=1000 } )
    timer.performWithDelay(1200, platform1NextQuestion)
end

local function platform2BridgeExtend()
    platform2BridgeImage.isVisible = true
    transition.moveTo( character, { x=600, y=320, time=1000 } )
    timer.performWithDelay(1200, platform2NextQuestion)
end

local function platform3BridgeExtend()
    platform3BridgeImage.isVisible = true
    transition.moveTo( character, { x=400, y=320, time=1000 } )
    timer.performWithDelay(1200, platform3NextQuestion)
end

local function platform1Bridge()
    timer.performWithDelay(1500, platform1BridgeExtend)
    transition.moveTo( character, { x=200, y=470, time=1000 } )
end

local function platform2Bridge()
    timer.performWithDelay(1500, platform2BridgeExtend)
    transition.moveTo( character, { x=600, y=470, time=1000 } )
end

local function platform3Bridge()
    timer.performWithDelay(1500, platform3BridgeExtend)
    transition.moveTo( character, { x=400, y=570, time=1000 } )
end

local function HideAnswers()
    rightAnswerDisplay.isVisible = false
    wrongAnswerDisplay1.isVisible = false
    wrongAnswerDisplay2.isVisible = false
end

local function ShowAnswers()
    rightAnswerDisplay.isVisible = true
    wrongAnswerDisplay1.isVisible = true
    wrongAnswerDisplay2.isVisible = true
end

local function platform1Break()
    timer.performWithDelay(1200, platform1Fade)
    transition.moveTo( character, { x=200, y=450, time=1000 } )
end

local function platform2Break()
    timer.performWithDelay(1200, platform2Fade)
    transition.moveTo( character, { x=600, y=450, time=1000 } )
end

local function platform3Break()    
    timer.performWithDelay(1200, platform3Fade)
    transition.moveTo( character, { x=400, y=570, time=1000 } )
end

local function TouchPlatform3(touch)
    if (touch.phase == "ended") then
        audio.play(characterJumpSound, {channel=2})
        if (rightAnswerPosition == 3) then
            --correct
            platform3Bridge()
            score = score + 1
            HideAnswers()
            RemoveListenersLevel4()
        elseif (rightAnswerPosition == 2) then
            HideAnswers()
            RemoveListenersLevel4()
            platform3Break()            
            score = 0
            timer.performWithDelay (1200, HideCharacter)
            timer.performWithDelay (1500, LoseScreen)
        elseif (rightAnswerPosition == 1) then
            HideAnswers()
            RemoveListenersLevel4()
            platform3Break()            
            score = 0
            timer.performWithDelay (1200, HideCharacter)
            timer.performWithDelay (1500, LoseScreen)
        end
    end
end


local function TouchPlatform2(touch)
    if (touch.phase == "ended") then
        audio.play(characterJumpSound, {channel=2})
        if (rightAnswerPosition == 2) then
            --correct
            platform2Bridge()
            score = score + 1
            HideAnswers()
            RemoveListenersLevel4()
        elseif (rightAnswerPosition == 1) then
            HideAnswers()
            RemoveListenersLevel4()
            platform2Break()            
            score = 0
            timer.performWithDelay (1200, HideCharacter)
            timer.performWithDelay (1500, LoseScreen)
        elseif (rightAnswerPosition == 3) then
            HideAnswers()
            RemoveListenersLevel4()
            platform2Break()           
            score = 0
            timer.performWithDelay (1200, HideCharacter)
            timer.performWithDelay (1500, LoseScreen)
        end
    end
end


local function TouchPlatform1(touch)
    if (touch.phase == "ended") then
        audio.play(characterJumpSound, {channel=2})
        if (rightAnswerPosition == 1) then
            --correct
            platform1Bridge()
            score = score + 1
            HideAnswers()
            RemoveListenersLevel4()
        elseif (rightAnswerPosition == 2) then
            HideAnswers()
            RemoveListenersLevel4()
            platform1Break()            
            score = 0
            timer.performWithDelay (1200, HideCharacter)
            timer.performWithDelay (1500, LoseScreen)
        elseif (rightAnswerPosition == 3) then
            HideAnswers()
            RemoveListenersLevel4()
            platform1Break()          
            score = 0
            timer.performWithDelay (1200, HideCharacter)
            timer.performWithDelay (1500, LoseScreen)
        end
    end
end

local function HideBridge()
    platform1BridgeImage.isVisible = false
    platform2BridgeImage.isVisible = false
    platform3BridgeImage.isVisible = false
end

local function AddListeners()
    platform1:addEventListener("touch", TouchPlatform1)
    platform2:addEventListener("touch", TouchPlatform2)
    platform3:addEventListener("touch", TouchPlatform3)
end

local function ShowPlatforms()
    platform1Broken.alpha = 1
    platform1Broken.xScale = 1
    platform1Broken.yScale = 1
    platform1.alpha = 1
    platform2Broken.alpha = 1
    platform2Broken.xScale = 1
    platform2Broken.yScale = 1
    platform2.alpha = 1
    platform3Broken.alpha = 1
    platform3Broken.xScale = 1
    platform3Broken.yScale = 1
    platform3.alpha = 1

end

-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function RestartLevel4()
    print ("***score = " .. score)
    ReplaceCharacter()
    RandomChoices()
    SetChoices()
    SetQuestion()
    DisplayNextQuestion()
    DisplayRightAnswer()
    DisplayWrongAnswer1()
    DisplayWrongAnswer2()
    ShowPlatforms()
    HideBridge()
    ShowAnswers()
    AddListeners()
    HideWin()
    
end

function RemoveListenersLevel4()
    platform1:removeEventListener("touch", TouchPlatform1)
    platform2:removeEventListener("touch", TouchPlatform2)
    platform3:removeEventListener("touch", TouchPlatform3)
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Path for the file to read
    path = system.pathForFile( "savestate.txt", system.DocumentsDirectory )

 
    file = nil


    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/Level1.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

            -- Creating Back Button
    backButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 100,
            y = 50,
            width = 150,
            height = 75,

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressed.png",
            overFile = "Images/BackButtonPressed.png",

            -- When the button is released, call the level transition function
            onRelease = LevelSelect
        } ) 
    

    displayQuestion = display.newText("", 400, 840, "Images/vinet.otf", 70)
    displayQuestion:setFillColor(216/255, 119/255, 0/255)

    rightAnswerDisplay = display.newText("", 1, 1, "Images/vinet.otf", 70)
    rightAnswerDisplay:setFillColor(58/255, 81/255, 252/255)

    wrongAnswerDisplay1 = display.newText("", 1, 1, "Images/vinet.otf", 70)
    wrongAnswerDisplay1:setFillColor(58/255, 81/255, 252/255)

    wrongAnswerDisplay2 = display.newText("", 1, 1, "Images/vinet.otf", 70)
    wrongAnswerDisplay2:setFillColor(58/255, 81/255, 252/255)

    ---------

    platform1 = display.newImageRect("Images/ChoicePlatform.png", 185, 200)
    platform1.x = 200
    platform1.y = 590

    platform1Broken = display.newImageRect("Images/ChoicePlatformBroken.png", 185, 200)
    platform1Broken.x = 200
    platform1Broken.y = 590
    platform1Broken.alpha = 1

    platform1BridgeImage = display.newImageRect("Images/bridge2.png", 100, 150)
    platform1BridgeImage.x = 200
    platform1BridgeImage.y = 470
    platform1BridgeImage.isVisible = false

    ---------

    platform2 = display.newImageRect("Images/ChoicePlatform.png", 185, 200)
    platform2.x = 600
    platform2.y = 590

    platform2Broken = display.newImageRect("Images/ChoicePlatformBroken.png", 185, 200)
    platform2Broken.x = 600
    platform2Broken.y = 590
    platform2Broken.alpha = 1

    platform2BridgeImage = display.newImageRect("Images/bridge2.png", 100, 150)
    platform2BridgeImage.x = 600
    platform2BridgeImage.y = 470
    platform2BridgeImage.isVisible = false

    ---------

    platform3 = display.newImageRect("Images/ChoicePlatform.png", 185, 200)
    platform3.x = 400
    platform3.y = 690

    platform3Broken = display.newImageRect("Images/ChoicePlatformBroken.png", 185, 200)
    platform3Broken.x = 400
    platform3Broken.y = 690
    platform3Broken.alpha = 1

    platform3BridgeImage = display.newImageRect("Images/bridge.png", 100, 200)
    platform3BridgeImage.x = 400
    platform3BridgeImage.y = 500
    platform3BridgeImage.isVisible = false

    WinText = display.newText("Congratulations", 400, 200, "Images/vinet.otf", 70)
    WinText:setFillColor(1, 1, 0)
    WinText.isVisible = false

    VerbText = display.newText("Parler", 650, 200, "Images/vinet.otf", 40)
    VerbText:setFillColor(1, 1, 1)

    ---------

    --showScore = display.newText ("Score: " .. score)

    basePlatform = display.newImageRect("Images/MainPlatform@2x.png", 280, 250)
    basePlatform.x = 400
    basePlatform.y = 920

    character = display.newImageRect("Images/Guard.png", 150, 150)
    
    bkgMusic = audio.loadStream("Audio/Dungeon Quest.mp3")
    platformBreakSound = audio.loadSound("Audio/Stone Break.mp3")
    bridgeWalkSound = audio.loadSound("Audio/Bridge Walk.mp3")
    characterJumpSound = audio.loadSound("Audio/Jump.mp3")
    
    

----------------------------------------------------------------------------------------
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( platform1BridgeImage )
    sceneGroup:insert( platform2BridgeImage )
    sceneGroup:insert( platform3BridgeImage )
    sceneGroup:insert( platform1Broken )
    sceneGroup:insert( platform1 )
    sceneGroup:insert( platform2Broken )
    sceneGroup:insert( platform2 )
    sceneGroup:insert( platform3Broken )
    sceneGroup:insert( platform3 )
    sceneGroup:insert( basePlatform )
    sceneGroup:insert( displayQuestion )
    sceneGroup:insert( rightAnswerDisplay )
    sceneGroup:insert( wrongAnswerDisplay1 )
    sceneGroup:insert( wrongAnswerDisplay2 )
    sceneGroup:insert( character )
    sceneGroup:insert( backButton )
    sceneGroup:insert( WinText )
    sceneGroup:insert( VerbText )


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
        audio.setVolume( userVolume/10, { channel=1 } )
        audio.setVolume( userVolume/10, { channel=2 } )
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then      
        score = 0 
        RestartLevel4()
        audio.play(bkgMusic, {channel=1, loops=-1})

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
        audio.stop()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        --RemoveCollisionListeners()
        --RemovePhysicsBodies()

        --physics.stop()
        --RemoveArrowEventListeners()
        --RemoveRuntimeListeners()
        --display.remove(character)
        RemoveListenersLevel4()

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
