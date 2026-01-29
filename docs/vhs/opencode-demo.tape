Output docs/vhs/opencode-demo.gif
Set FontSize 16
Set Width 1100
Set Height 600
Set Theme "Solarized Light"
Set TypingSpeed 100ms

Type "tmux new-session -d \"opencode 'Give a one-line summary of TrollVNC.'\""
Enter
Sleep 2s
Type "tmux capture-pane -pt 0"
Enter
Sleep 2s
Type "tmux kill-session"
Enter
