-----------------------------------------------------------------------------------------
--
-- intro_screen.lua
-- Created by: Ms Raffin
-- Date: Nov. 22nd, 2014
-- Description: This is the splash screen of the game. It displays the app letterF and the 
-- company letterF with some sort of animation...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-- Create Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

local inpact = audio.loadSound("Audio/box break.mp3")
local throw = audio.loadSound("Audio/Sword Throw.mp3")
local clash = audio.loadSound("Audio/Sword Clash.mp3")


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local letterF
local earth
local sword
local logoText


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function RotateEarth( event )
    earth:rotate(1)

end

local function RiseText(  )
    if (letterF.y == 650) then
        if (logoText.y <= 950) then
            logoText.y = 950
        else
            logoText.y = logoText.y - 10
        end
    end
end

local function AudioQueue1()
    audio.play(inpact, {channel = 2})
end

local function AudioQueue2()
    audio.play(throw, {channel = 1})
end

local function AudioQueue3()
    audio.play(clash, {channel = 1})
end

local function SwordMove()
    if (letterF.y == 650) then
        if (sword.x <= 220) then
            sword.x = 220

        else
            sword.x = sword.x - 13
            sword:rotate(-10)
        end

    end
    
end
 
local function RiseLetterF( event )
    letterF:toFront()
    if (letterF.y <= 650) then
        letterF.y = 650
    else
        letterF.y = letterF.y - 15
    end
end



local function gotoMainMenu()
    composer.gotoScene( "main_menu", "crossFade", 1000 )
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    --Hide the status bar
    display.setStatusBar(display.HiddenStatusBar)

    -- set the background color
    display.setDefault("background", 0.3, 0.3, 0.3)

    sword = display.newImageRect("Images/sword.png", 200, 200)
    sword.x = display.contentWidth*1.5
    sword.y = display.contentHeight*11/16

    -- letterF image
    letterF = display.newImageRect("Images/F.png", 400, 400)

    -- set the x and y position of the letterF
    letterF.x = display.contentWidth*1/3
    letterF.y = display.contentHeight*2

    earth = display.newImageRect("Images/earth.png", 300, 300)
    --position
    earth.x = display.contentWidth*3/4
    earth.y = display.contentHeight/6

    logoText = display.newImageRect("Images/text.png", 700, 70)
    logoText.x = display.contentCenterX
    logoText.y = display.contentHeight*1.5

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( letterF )
    sceneGroup:insert( earth )
    sceneGroup:insert( sword )
    sceneGroup:insert( logoText )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

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

    elseif ( phase == "did" ) then

    Runtime:addEventListener("enterFrame", RotateEarth)
    Runtime:addEventListener("enterFrame", RiseLetterF)
    Runtime:addEventListener("enterFrame", RiseText)
    Runtime:addEventListener("enterFrame", SwordMove)
    timer.performWithDelay(3500, gotoMainMenu)
    timer.performWithDelay(2500, AudioQueue1)
    timer.performWithDelay(1200, AudioQueue2)
    timer.performWithDelay(2500, AudioQueue3)
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase 

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then

        
    elseif ( phase == "did") then
        Runtime:removeEventListener("enterFrame", RotateEarth)
        Runtime:removeEventListener("enterFrame", RiseLetterF)
        Runtime:removeEventListener("enterFrame", RiseText)
        Runtime:removeEventListener("enterFrame", SwordMove)
        
    end

    -----------------------------------------------------------------------------------------
end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


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