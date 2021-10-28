#!/bin/tcsh

set WIN_HEIGHT=`tmux display -p '#{window_height}'`
set MAIN_PANE_HEIGHT=`expr \( $WIN_HEIGHT / 4 \) \* 3`
tmux set-window-option -g main-pane-height $MAIN_PANE_HEIGHT

unset WIN_HEIGHT MAIN_PANE_HEIGHT

set WIN_WIDTH=`tmux display -p '#{window_width}'`
set MAIN_PANE_WIDTH=`expr \( $WIN_WIDTH / 4 \) \* 3`
tmux set-window-option -g main-pane-width $MAIN_PANE_WIDTH

unset WIN_WIDTH MAIN_PANE_WIDTH
