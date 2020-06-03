# Random console amusements.

## Watch star wars episode IV in ascii
```
telnet towel.blinkenlights.nl
```

## Dancing parrot.
```
curl parrot.live
```

## Matrix numbers.
LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"

