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

local level11Button
local level12Button
local level13Button
local level14Button
local level15Button

local level6Button
local level7Button
local level8Button
local level9Button
local level10Button


local path2
local file, errorString
local path
local file2, errorString2


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to MainMenu Screen
local function BackToMainMenu( )
    drumChannel = audio.play(drum)
    composer.gotoScene( "main_menu", {effect = "crossFade", time = 700})
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
    end
    io.close( file2 )

    file2 = nil
    
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

local function Level6Transition( )
    composer.gotoScene( "level6", {effect = "crossFade", time = 700})
    audio.stop()
end  

-- Creating Transition to Level2 Screen
local function Level7Transition( )
    composer.gotoScene( "level7", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level3 Screen
local function Level8Transition( )
    composer.gotoScene( "level8", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level4 Screen
local function Level9Transition( )
    composer.gotoScene( "level9", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level5 Screen
local function Level10Transition( )
    composer.gotoScene( "level10", {effect = "crossFade", time = 700})
end  

local function Level11Transition( )
    composer.gotoScene( "level11", {effect = "crossFade", time = 700})
    audio.stop()
end  

-- Creating Transition to Level2 Screen
local function Level12Transition( )
    composer.gotoScene( "level12", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level3 Screen
local function Level13Transition( )
    composer.gotoScene( "level13", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level4 Screen
local function Level14Transition( )
    composer.gotoScene( "level14", {effect = "crossFade", time = 700})
end  

-- Creating Transition to Level5 Screen
local function Level15Transition( )
    composer.gotoScene( "level15", {effect = "crossFade", time = 700})
end  


local function LevelUnlock()

    if (SaveState == 1) then
        level1Button.isVisible = true
        level2Button.isVisible = false
        level3Button.isVisible = false
        level4Button.isVisible = false
        level5Button.isVisible = false
        level6Button.isVisible = false
        level7Button.isVisible = false
        level8Button.isVisible = false
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 2) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = false
        level4Button.isVisible = false
        level5Button.isVisible = false
        level6Button.isVisible = false
        level7Button.isVisible = false
        level8Button.isVisible = false
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 3) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = false
        level5Button.isVisible = false
        level6Button.isVisible = false
        level7Button.isVisible = false
        level8Button.isVisible = false
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 4) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = false
        level6Button.isVisible = false
        level7Button.isVisible = false
        level8Button.isVisible = false
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 5) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = false
        level7Button.isVisible = false
        level8Button.isVisible = false
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 6) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = false
        level8Button.isVisible = false
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 7) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = false
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 8) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = false
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 9) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = true
        level10Button.isVisible = false
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 10) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = true
        level10Button.isVisible = true
        level11Button.isVisible = false
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 11) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = true
        level10Button.isVisible = true
        level11Button.isVisible = true
        level12Button.isVisible = false
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 12) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = true
        level10Button.isVisible = true
        level11Button.isVisible = true
        level12Button.isVisible = true
        level13Button.isVisible = false
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 13) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = true
        level10Button.isVisible = true
        level11Button.isVisible = true
        level12Button.isVisible = true
        level13Button.isVisible = true
        level14Button.isVisible = false
        level15Button.isVisible = false
    elseif (SaveState == 14) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = true
        level10Button.isVisible = true
        level11Button.isVisible = true
        level12Button.isVisible = true
        level13Button.isVisible = true
        level14Button.isVisible = true
        level15Button.isVisible = false
    elseif (SaveState == 15) then
        level1Button.isVisible = true
        level2Button.isVisible = true
        level3Button.isVisible = true
        level4Button.isVisible = true
        level5Button.isVisible = true
        level6Button.isVisible = true
        level7Button.isVisible = true
        level8Button.isVisible = true
        level9Button.isVisible = true
        level10Button.isVisible = true
        level11Button.isVisible = true
        level12Button.isVisible = true
        level13Button.isVisible = true
        level14Button.isVisible = true
        level15Button.isVisible = true

    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    --print ("***system.DocumentsDirectory = " .. system.DocumentsDirectory)

    -- Path for the file to read
	path = system.pathForFile( "savestate.txt", system.DocumentsDirectory )

    -- Path for the file to read
    path2 = system.pathForFile( "savestate.txt", system.DocumentsDirectory )


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

        -- Creating level Button
    level6Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level6Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level6Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level7Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level7Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level7Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level8Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level8Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level8Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level9Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level9Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level9Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level10Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level10Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level10Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level11Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level11Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level11Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level12Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level12Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level12Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level13Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level13Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level13Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level14Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level14Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level14Transition
        } ) 


    -----------------------------------------------------------------------------------------

        -- Creating level Button
    level15Button = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 671,
            y = 319,
            width = 100,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/Level15Button.png",

            -- When the button is released, call the level transition function
            onRelease = Level15Transition
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
    sceneGroup:insert( level6Button )
    sceneGroup:insert( level7Button )
    sceneGroup:insert( level8Button )
    sceneGroup:insert( level9Button )
    sceneGroup:insert( level10Button )
    sceneGroup:insert( level11Button )
    sceneGroup:insert( level12Button )
    sceneGroup:insert( level13Button )
    sceneGroup:insert( level14Button )
    sceneGroup:insert( level15Button )
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
        audio.setVolume( userVolume/10, { channel=1 } )
        
        -- Open the file handle
        file, errorString = io.open( path, "r" )

        if file then
            -- Read data from file
            SaveState = file:read( "*n" )

            -- Output the file contents
            print( "Contents of " .. path .. "\n" .. SaveState )
            -- Sets SaveState to contents of read file   
            io.close( file )
    
        else

            errorString = print ("File error: " .. errorString)

            file = io.open( path, "w" )

            file:write( "1" )

            io.close( file )

            file = io.open( path, "r")
            
            SaveState = file:read( "*n")

            io.close( file )

            file = nil
        end
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
