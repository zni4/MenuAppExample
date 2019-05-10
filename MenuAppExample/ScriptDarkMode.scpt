# Script que pasa de dark a light mode y viceversa
tell application "System Events"
    tell appearance preferences
        set dark mode to not dark mode
    end tell
end tell
