import XMonad
import XMonad.Actions.Submap
import XMonad.StackSet
-- import XMonad.Prompt.Window as P
-- import XMonad.Prompt.XMonad

import qualified Data.Map.Strict as M
import System.Exit

main = xmonad def
    { terminal    = "urxvt"
    , modMask     = controlMask
    , borderWidth = 0
    , layoutHook  = Full
    , keys        = myKeys
    , startupHook = boot
    }

boot = pure ()
-- boot = setLayout XMonad.Layout.Full

myKeys conf@(XConfig {XMonad.modMask = modm}) =
    M.fromList $
        [ -- ((modm, xK_n),     spawn "mpc next") -- ROOT level bindings
         ((modm, xK_g), submap . M.fromList $
            [ ((0, xK_n),     windows focusUp)
            , ((0, xK_p),     windows focusDown)
            , ((0, xK_q),     liftIO $ exitWith ExitSuccess)
            ])
        ]

-- , ((0, xK_h),     windowPrompt def Goto P.allWindows)
-- , ((0, xK_h),     xmonadPrompt def)



-- myKeys conf@(XConfig {XMonad.modMask = modm}) =
--     ((controlMask, xK_g), submap . M.fromList $
--         [ ((0, xK_n),     spawn "mpc next")
--         , ((0, xK_p),     spawn "mpc prev")
--         , ((0, xK_z),     spawn "mpc random")
--         , ((0, xK_space), spawn "mpc toggle")
--         ])

