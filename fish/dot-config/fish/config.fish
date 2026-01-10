if status is-interactive
    # Commands to run in interactive sessions can go here

    # Prompt
    starship init fish | source
end

# Remove greeting
set fish_greeting

# Set editor
set -x EDITOR nvim

# Aliases
alias l='ls -alh'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias pacrmorphans='sudo pacman -Rns (pacman -Qtdq)'

set PRISM_INSTANCE_FOLDER ~/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances

function migrate-gtnh-instance -a from to
    if test ! -d "$PRISM_INSTANCE_FOLDER"
        echo "ERROR: Invalid PRISM_INSTANCE_FOLDER: $PRISM_INSTANCE_FOLDER"
        return 1
    end
    echo "Using prism instance folder: $PRISM_INSTANCE_FOLDER"

    if test -z "$from"
        echo "ERROR: Specify a source instance name !"
        echo -n "Valid instances: "
        ls --hide 'instgroups.json' --indicator-style=none --color=never "$PRISM_INSTANCE_FOLDER"
        return 1
    end
    if test -z "$to"
        echo "ERROR: Specify a destination instance name !"
        echo -n "Valid instances: "
        ls --hide 'instgroups.json' --indicator-style=none --color=never "$PRISM_INSTANCE_FOLDER"
        return 1
    end

    if test "$from" = "$to"
        echo "ERROR: Source and destination must be different"
        return 1
    end

    set from_path "$PRISM_INSTANCE_FOLDER/$from/.minecraft"
    if test ! -d "$from_path"
        echo "ERROR: Source instance doesn't exist: $from_path"
        return 1
    end
    echo "Source instance: $from_path"

    set to_path "$PRISM_INSTANCE_FOLDER/$to/.minecraft"
    if test ! -d "$to_path"
        echo "ERROR: Destination instance doesn't exist: $to_path"
        return 1
    end
    echo "Destination instance: $to_path"

    echo
    echo "Migration script:"
    echo
    echo "cp -rT '$from_path/saves' '$to_path/saves'"
    echo "cp -rT '$from_path/journeymap' '$to_path/journeymap'"
    echo "cp -rT '$from_path/visualprospecting' '$to_path/visualprospecting'"
    echo "cp -rT '$from_path/TCNodeTracker' '$to_path/TCNodeTracker'"
    echo "cp -rT '$from_path/schematics' '$to_path/schematics'"
    echo "cp -rT '$from_path/screenshots' '$to_path/screenshots'"
    echo "cp -rT '$from_path/localconfig.cfg' '$to_path/localconfig.cfg'"
    echo "cp -rT '$from_path/BotaniaVars.dat' '$to_path/BotaniaVars.dat'"
    echo "cp -rT '$from_path/options.txt' '$to_path/options.txt'"
    echo "cp -rT '$from_path/optionsnf.txt' '$to_path/optionsnf.txt'"
    echo "cp -rT '$from_path/servers.dat' '$to_path/servers.dat'"
end
