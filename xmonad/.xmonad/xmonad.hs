import XMonad

main = xmonad defaultConfig
    { terminal    = "urxvt"
    , modMask     = mod4Mask
    , borderWidth = 3
    }
