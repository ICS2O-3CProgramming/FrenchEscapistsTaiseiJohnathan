-----------------------------------------------------------------------------------------
--
-- options_overlay.lua
-- Created by: Johnathan Taisei
-- Date: May 15 2018
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
sceneName = "options_overlay"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg
local backButton
local volUpButton
local volDownButton

local MINVOL = 0
local MAXVOL = 10
local userVolume
local displayVolume

local path
local file, errorString




-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function ReturnToMainMenu( )
    composer.hideOverlay( "fade", 100 )    
    
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

function UpdateVolume( )
    displayVolume.text = userVolume
end

function SetVolume( )
    -- Data (string) to write
    local saveData = userVolume

    -- Path for the file to write
    path = system.pathForFile( "volume.txt", system.DocumentsDirectory )
     
    -- Open the file handle
    file, errorString = io.open( path, "w" )
     
    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Write data to file
        file:write( saveData )
        -- Close the file handle
        
    end
    io.close( file )
    file = nil
    print(userVolume)
 
UpdateVolume() 

end

function VolDown( )
    
    if (userVolume == MINVOL) then
        userVolume = MINVOL
    else
        userVolume = userVolume - 1
    end
    SetVolume()
end

function VolUp( )
    if (userVolume == MAXVOL) then
        userVolume = MAXVOL
    else
        userVolume = userVolume + 1
    end
    SetVolume()
end


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Path for the file to read
    path = system.pathForFile( "volume.txt", system.DocumentsDirectory )
 
    -- Open the file handle
    file, errorString = io.open( path, "r" )
 
    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )

        file = io.open( path, "w+" )

        file:write( "6" )
        local contents = file:read( "*n" )
        userVolume = contents
        io.close( file )
    else
        -- Read data from file
        local contents = file:read( "*n" )
        -- Output the file contents
        print( "Contents of " .. path .. "\n" .. contents )
        -- Sets SetVolume to contents of read file
        userVolume = contents
        -- Close the file handle
        io.close( file )
    end
    
    file = nil


    -- Insert the background image and set it to the center of the screen
    bkg = display.newImage("Images/PauseScreen.png")
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = 600
    bkg.height = 600


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )

    -- Send the background image to the back layer so all other objects can be on top
    bkg:toBack()

    displayVolume = display.newText(userVolume, display.contentCenterX, display.contentCenterY, "Images/vinet.otf", 150)

----------------------------------------------------------------------------------------

backButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentCenterY*1.3,
            width = 200,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressed.png",
            overFile = "Images/BackButtonPressed.png",
            -- When the button is released, call the level transition function
            onRelease = ReturnToMainMenu
        } ) 

volDownButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1/2,
            y = display.contentCenterY,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/VolumeDownUnpressed.png",
            --overFile = "Images/BackButtonPressed.png",
            -- When the button is released, call the level transition function
            onRelease = VolDown
        } ) 

volUpButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.5,
            y = display.contentCenterY,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/VolumeUpUnpressed.png",
            --overFile = "Images/BackButtonPressed.png",
            -- When the button is released, call the level transition function
            onRelease = VolUp
        } ) 

sceneGroup:insert( backButton )
sceneGroup:insert( volDownButton )
sceneGroup:insert( volUpButton )
sceneGroup:insert( displayVolume )

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