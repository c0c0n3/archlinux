{-# LANGUAGE NoMonomorphismRestriction #-}

import System.Exit

import XMonad
import XMonad.Actions.GridSelect
import XMonad.Util.EZConfig



myGsconfig = (buildDefaultGSConfig colorizer) 
             { gs_cellheight = 30
             , gs_cellwidth = 350
             , gs_font = fontXft }
    where
    colorizer = colorRangeFromClassName
                      lightgrey        -- lowest inactive bg
                      lightgrey        -- highest inactive bg
                      lightgrey        -- active bg
                      lightblue        -- inactive fg
                      orange           -- active fg        
    lightblue = (0x6E,0xAA,0xF3)
    lightgrey = (0xEE,0xEE,0xEE) 
    orange    = (0xFC,0xA4,0x34)       

    -- can use e.g. Monaco instead of Bahamas; just replace font name below
    fontXft = "xft\
                \:Bahamas\
                \:pixelsize=16\
                \:weight=bold\
                \:width=semicondensed\
                \:dpi=96\
                \:hinting=true\
                \:hintstyle=hintslight\
                \:antialias=true\
                \:rgba=rgb\
                \:lcdfilter=lcdlight"


main = do
       xmonad $ defaultConfig
              { terminal    = "emacs -q -l /home/andrea/.emacs.d/terminal.el -e ansi-term"
              , modMask     = mod4Mask
              , borderWidth = 3
              , normalBorderColor = "#586e75" --"#ffffff"
              , focusedBorderColor = "#cb4b16" --"#33cc33"
              }
              `additionalKeys`
              [-- ((0, 0x1008FF03), spawn "sudo lcd-bl down") -- XF86XK_MonBrightnessDown
              --, ((0, 0x1008FF02), spawn "sudo lcd-bl up")   -- XF86XK_MonBrightnessUp
              --, ((0, 0x1008FF06), spawn "sudo kbd-bl down") -- XF86XK_KbdBrightnessDown
              --, ((0, 0x1008FF05), spawn "sudo kbd-bl up")   -- XF86XK_KbdBrightnessUp
              --, ((0, 0x1008FF12), spawn "amixer -q set Master mute")   -- XF86XK_AudioMute
              --, ((0, 0x1008FF11), spawn "amixer -q set Master 5%- unmute")   -- XF86XK_AudioLowerVolume
              --, ((0, 0x1008FF13), spawn "amixer -q set Master 5%+ unmute")   -- XF86XK_AudioRaiseVolume
              --, ((0, 0x1008FF2C), spawn "sudo eject")       -- XF86XK_Eject
              ]
              `additionalKeysP`                                                -- NB M maps to Super (modMask = mod4Mask)
              [ --("M-x w", spawn "chromium")       -- Super+x then w to launch the browser
                ("M-x e", spawn "emacs")                                       -- Super+x then e to launch the editor
              --, ("M-x f", spawn "pcmanfm")        -- Super+x then f to launch the file manager
              , ("M-<Tab>", goToSelected myGsconfig)                               -- Super+a for Grid Select
              , ("M-<Backspace> q", io (exitWith ExitSuccess))                 -- Super+Backspace then q to quit Xmonad
              , ("M-<Backspace> s", spawn "sudo /usr/bin/systemctl poweroff")  -- Super+Backspace then s to shutdown
              , ("M-<Backspace> r", spawn "sudo /usr/bin/systemctl reboot")    -- Super+Backspace then r to reboot
              ]
