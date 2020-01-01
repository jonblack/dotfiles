#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#616161cc'  # default
T='#616161ee'  # text
W='#c29c9cbb'  # wrong
V='#769876bb'  # verifying

i3lock \
    --insidevercolor=$C   \
    --ringvercolor=$V     \
    \
    --insidewrongcolor=$C \
    --ringwrongcolor=$W   \
    \
    --insidecolor=$B      \
    --ringcolor=$D        \
    --linecolor=$B        \
    --separatorcolor=$D   \
    \
    --verifcolor=$T       \
    --wrongcolor=$T       \
    --timecolor=$T        \
    --datecolor=$T        \
    --layoutcolor=$T      \
    --keyhlcolor=$W       \
    --bshlcolor=$W        \
    \
    --screen 1            \
    --blur 8              \
    --clock               \
    --indicator           \
    --timestr="%H:%M"  \
    --datestr="%A, %m %Y" \

    # --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
