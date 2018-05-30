-----------------------------------------------------------------------------------------
--
-- level-select.lua
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
sceneName = "level_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------

local drum = audio.loadSound("Audio/Drum.mp3")   
local drumChannel 

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local ResetButton
local backButton
local level1Button
local level2Button
local level3Button
local level4Button
local level5Button

local path2
local file, errorString
local path
local file2, errorString2
local SaveState


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to MainMenu Screen
local function BackToMainMenu( )
    drumChannel = audio.play(drum)
    composer.gotoScene( "main_menu", {effect = "crossFade", time = 700})
end

local function ReadState()
    -- Open the file handle
    file, errorString = io.open( path, "r" )
 
    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Read data from file
        local contents = file:read( "*n" )
        -- Output the file contents
        print( "Contents of " .. path .. "\n" .. contents )
        -- Sets SaveState to contents of read file
        SaveState = contents
        -- Close the file handle
        io.close( file )
    end
 
    file = nil
end

local function ResetProgress()

    -- Open the file handle
    file2, errorString2 = io.open( path, "w" )

 
    if not file2 then
        -- Error occurred; output the cause
        print( "File error: " .. errorString2 )
    else
        -- Read data from file
        local contents = file2:write( "1" )
        -- Close the file handle
        io.close( file2 )
    end
    
    BackToMainMenu( )
end

  

-- Creating Transition to Level1 Screen
local function Level1Transition( )
    composer.gotoScene( "level1", {effect = "crossFade", time = 700})
    audio.stop()
end  

-- Creating Transition to Level2 Screen
local function Level2Transition( )
    composer.gotoScene( "level2", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level3 Screen
local function Level3Transition( )
    composer.gotoScene( "level3", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level4 Screen
local function Level4Transition( )
    composer.gotoScene( "level4", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level5 Screen
local function Level5Transition( )
    composer.gotoScene( "level5", {effect = "crossFade", time = 700})
end  

local function LevelUnlock()

    if (SaveState == 1) then
        level1Button.isVisible = true
        level2Button.isVisible = false
        level3Button.isVisible = false
        level4Button.isVisible = false
        level5Button.isVisible = false
    elseif (SaveState == 2) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = false
        level4Button.isVisible = false
        level5Button.isVisible = false
    elseif (SaveState == 3) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = false
        level5Button.isVisible = false
    elseif (SaveState == 4) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = false
    elseif (SaveState == 5) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Path for the file to read
	path = system.pathForFile( "savestate.txt" )

    -- Path for the file to read
    path2 = system.pathForFile( "savestate.txt" )


    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/LevelSelect.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Creating Back Button
    backButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/6,
            y = display.contentHeight*9/10,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressed.png",
            overFile = "Images/BackButtonPressed.png",

            -- When the button is released, call the level transition function
            onRelease = BackToMainMenu
        } ) 

----------------------------------------------------------------------------------------

-- Creating Reset Button
    ResetButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth * 5/6,
            y = display.contentHeight*9/10,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/ResetButton.png",

            -- When the button is released, call the level transition function
            onRelease = ResetProgress
        } ) 

----------------------------------------------------------------------------------------
    -- Creating level1 Button
 	level1Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/8,
            y = display.contentHeight*2.5/8,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level1Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level1Transition
        } ) 

    -----------------------------------------------------------------------------------------

    -- Creating level Button
    level2Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 240,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level2Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level2Transition
        } ) 

    
    -----------------------------------------------------------------------------------------

    -- Creating level Button
    level3Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 384,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level3Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level3Transition
        } ) 

    -----------------------------------------------------------------------------------------

    -- Creating level Button
    level4Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 527,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level4Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level4Transition
        } ) 


    -----------------------------------------------------------------------------------------

    -- Creating level Button
    level5Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level5Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level5Transition
        } ) 


    -----------------------------------------------------------------------------------------

    

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( backButton )
	sceneGroup:insert( level1Button )
	sceneGroup:insert( level2Button )
	sceneGroup:insert( level3Button )
	sceneGroup:insert( level4Button )
	sceneGroup:insert( level5Button )
    sceneGroup:insert( ResetButton )



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
        ReadState()
        LevelUnlock()
       
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
