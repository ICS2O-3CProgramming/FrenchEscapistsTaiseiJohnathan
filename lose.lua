-----------------------------------------------------------------------------------------
--
-- lose.lua
-- Created by: Johnathan Taisei
-- Date: May 30 2018
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
sceneName = "lose"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg
local backButton
local splashSound
local drum
-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function ReturnToMainMenu( )
    audio.play(drum,{channel=2})
    composer.gotoScene( "level_select", {effect = "crossFade", time = 1000}) 
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Insert the background image and set it to the center of the screen
    bkg = display.newImage("Images/LoseScreen.png")
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = 800
    bkg.height = 1050


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )

    -- Send the background image to the back layer so all other objects can be on top
    bkg:toBack()

----------------------------------------------------------------------------------------

backButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.5,
            y = display.contentCenterY*1.7,
            width = 200,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressed.png",
            overFile = "Images/BackButtonPressed.png",
            -- When the button is released, call the level transition function
            onRelease = ReturnToMainMenu
        } ) 
 

splashSound = audio.loadSound("Audio/Splash.mp3")
drum = audio.loadSound("Audio/Drum.mp3")
sceneGroup:insert( backButton )
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
       audio.play(splashSound, {channel=1})
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
        audio.setVolume( userVolume/10, { channel=1 } )
        audio.setVolume( userVolume/10, { channel=2 } )
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
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