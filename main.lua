-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Taisei S
-- Date: May. 5th, 2018
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

    -- Path for the file to read
    path = system.pathForFile( "volume.txt", system.DocumentsDirectory )
 
    -- Open the file handle
    file, errorString = io.open( path, "r" )
 
    if not file then
        -- Error occurred; output the cause

        print( "File error: " .. errorString )

        file = io.open( path, "w+" )

        file:write( "5" )
        io.close( file )
        file = io.open( path, "r")
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
    print ("***userVolume= " .. userVolume)
    file = nil


-- Go to the intro screen
composer.gotoScene( "spalsh_screen" )

