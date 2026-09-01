#
# Thème rose-pine pour gum
#
# Appelée depuis config.fish : les couleurs ne servent qu'aux sessions
# interactives, mais la définition vit ici pour rester chargée par conf.d.
#
function __gum_rose_pine --description 'Applique le thème rose-pine à gum'
    set -gx GUM_FILTER_MATCH_FOREGROUND 2
    set -gx GUM_FILTER_PROMPT_FOREGROUND 7
    set -gx GUM_FILTER_INDICATOR_FOREGROUND 1

    set -gx GUM_FILTER_SELECTED_PREFIX_FOREGROUND 4
    set -gx GUM_FILTER_UNSELECTED_PREFIX_FOREGROUND '#6e738d'

    set -gx GUM_FILTER_INDICATOR '>'
end
