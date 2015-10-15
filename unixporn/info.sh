#!/bin/bash
# info.sh - print information in lemonbar format
# takes arguments for what bar information to display (names of the functions below)

pIcon="#bba2a2a2"
pBG="#ff000000"
pFG="#ffffffff"

icon() {
    echo -n -e "%{F$pIcon}\u$1%{F$pFG}"
}

clock() {
    icon f017
    echo $(date '+%l:%M %p')
}

battery() {
    BATC=/sys/class/power_supply/BAT0/capacity
    BATS=/sys/class/power_supply/BAT0/status
    icon f0e7
    if [ -f $BATC ]; then
        [ "`cat $BATS`" = "Charging" ] && echo -n '+' || echo -n '-'
        echo " "
        cat $BATC
    else
        # no battery info found
        echo '+ERROR'
    fi
}

volume() {
    display="$(icon f028) $(amixer get Master | sed -n 's/^.*\[\([0-9]\+%\).*$/\1/p')"
}

while :; do
    buf="S"

    [ -z "$*" ] && items="clock battery volume" || items="$@"

    for item in $items; do
        buf="${buf}$($item)";
    done

    echo "$buf"
    sleep 2
done
