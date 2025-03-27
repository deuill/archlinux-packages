function edit --wraps='emacsclient --no-window-system' --description 'alias edit=emacsclient --no-window-system'
  emacsclient --no-window-system $argv
        
end
