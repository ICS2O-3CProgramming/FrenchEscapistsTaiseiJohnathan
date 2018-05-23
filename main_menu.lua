-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Johnathan Taisei
-- Date: May 14 2018
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
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
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local controlsButton
local optionsButton
local achievementButton
local Torch1
local Torch2
local TorchFire1
local TorchFire2
local emitterParams

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Levelselect Screen
local function LevelSelectTransition( )
    composer.gotoScene( "level_select", {effect = "zoomInOutFade", time = 1000})
end      

-----------------------------------------------------------------------------------------

-- Creating Transition to Instructions Screen
local function InstructionsTransition( )
    composer.gotoScene( "instruction_screen", {effect = "flipFadeOutIn", time = 500})
end    
-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 

-----------------------------------------------------------------------------------------

-- Creating Transition Function to Options Overlay
local function OptionsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenu.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    emitterParams = {
    startColorAlpha = 1,
    startParticleSizeVariance = 53.47,
    startColorGreen = 0.3031555,
    yCoordFlipped = -1,
    blendFuncSource = 770,
    rotatePerSecondVariance = 153.95,
    particleLifespan = 0.7237,
    tangentialAcceleration = -144.74,
    finishColorBlue = 0.3699196,
    finishColorGreen = 0.5443883,
    blendFuncDestination = 1,
    startParticleSize = 50.95,
    startColorRed = 0.8373094,
    textureFileName = "Images/fire.png",
    startColorVarianceAlpha = 1,
    maxParticles = 150,
    finishParticleSize = 64,
    duration = -1,
    finishColorRed = 1,
    maxRadiusVariance = 72.63,
    finishParticleSizeVariance = 64,
    gravityy = -671.05,
    speedVariance = 90.79,
    tangentialAccelVariance = -92.11,
    angleVariance = -142.62,
    angle = -244.11
    }

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight*5/10,
            width = 200,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressed@2x.png",
            overFile = "Images/PlayButtonPressed@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = LevelSelectTransition       
        } )

    -----------------------------------------------------------------------------------------
  
    -- Creating Options Button
    optionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight*6/10,
            width = 200,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/OptionsButtonUnpressed@2x.png",
            overFile = "Images/OptionsButtonPressed@2x.png",

            -- When the button is released, call the Options transition function
            --onRelease = OptionsTransition
        } ) 
    
    -----------------------------------------------------------------------------------------

    -- Creating Controls Button
    controlsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight*7/10,
            width = 200,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/ControlsButtonUnpressed@2x.png",
            overFile = "Images/ControlsButtonPressed@2x.png",

            -- When the button is released, call the Controls transition function
            --onRelease = ControlsTransition
        } ) 
   
    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight*8/10,
            width = 200,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressed@2x.png",
            overFile = "Images/CreditsButtonPressed@2x.png",

            -- When the button is released, call the Credits transition function
            --onRelease = CreditsTransition
        } ) 

    -----------------------------------------------------------------------------------------

    -- Creating Achievements Button
    achieventButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX,
            y = display.contentHeight*9/10,
            width = 200,
            height = 100,
            -- Insert the images here
            defaultFile = "Images/AchievementButtonUnpressed@2x.png",
            overFile = "Images/AchievementButtonPressed@2x.png",

            -- When the button is released, call the Achievements transition function
            --onRelease = AchievementTransition
        } ) 

    -----------------------------------------------------------------------------------------

    Torch1 = display.newImageRect("Images/Torch.png", 75, 150)
    Torch1.x = 200
    Torch1.y = 650


    Torch2 = display.newImageRect("Images/Torch.png", 75, 150)
    Torch2.x = 600
    Torch2.y = 650


    TorchFire1 = display.newEmitter(emitterParams)
    TorchFire1.x = 200
    TorchFire1.y = 570



    TorchFire2 = display.newEmitter(emitterParams)
    TorchFire2.x = 600
    TorchFire2.y = 570


    -- Associating button widgets with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( controlsButton )
    sceneGroup:insert( optionsButton )
    sceneGroup:insert( achieventButton )
    sceneGroup:insert( Torch1 )
    sceneGroup:insert( Torch2 )
    sceneGroup:insert( TorchFire1 )
    sceneGroup:insert( TorchFire2 )
    
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

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
