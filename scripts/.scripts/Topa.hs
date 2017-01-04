{-# LANGUAGE OverloadedStrings #-}

import Turtle
import System.Environment (getArgs)

main = do
    args <- getArgs
    case args of
        ["halt"] -> shell "sudo poweroff" empty
        _        -> shell "sudo reboot" empty
