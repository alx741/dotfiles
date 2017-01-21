{-# LANGUAGE OverloadedStrings #-}

module Utility where

import Data.Text hiding (empty)
import System.Environment (getArgs)
import Text.Regex.Posix hiding (empty)
import Turtle

amIAtHome :: Shell Bool
amIAtHome = do
    usbKeyboard <- inshell "lsusb | grep -i \"holtek semiconductor\"" empty
    return ((unpack usbKeyboard) =~ ("Holtek" :: String) :: Bool)

isVGAPlugedin :: Shell Bool
isVGAPlugedin = do
    vgaState <- inshell "xrandr | grep -i 'vga'" empty
    return ((unpack vgaState) =~ ("connected" :: String) :: Bool)
