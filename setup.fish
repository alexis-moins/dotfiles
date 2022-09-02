# Faster dock autohide animation
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.6

# Restart the dock
killall Dock
