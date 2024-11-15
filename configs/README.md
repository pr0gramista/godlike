# macOS
```
defaults write com.apple.Finder AppleShowAllFiles YES
sudo softwareupdate --install-rosetta --agree-to-license
sudo gem install cocoapods
# The default version of Ruby requires sudo to install the CocoaPods gem. If you are using a Ruby Version manager, you might need to run without sudo.
# Fir for M1s
sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc
```

## Key Repeat
```
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```
Logout and login again to apply changes.

# User snippets
Now all in [./snippets.json]

# VSCode cool keyboard shortcuts
```
Option + § - Close active editor
CMD + . - Open Quick fix
CMD + I - Show on hover
CMD + E - Search everywhere/commands
CMD + W - Expand selection
CMD + T - Switch terminal
CMD + D - Delete line
CMD + R - Rename
CMD + 1 - Focus left bar
CMD + 2 - Focus first editor
CMD + 3 - Focus second editor (splits screen)
CMD + [ - Fold
CMD + ] - Unfold
F1 - Go to next problem
```

CMD + Shift + . - Move to... (symbol in file)

On explorer view
CMD + Arrow down - open file (macOS...) or space
```

# ZSH sweetness
+ [kubectl](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/kubectl) - fe. kga (kubectl get all), kdels myapp (kubectl delete service myapp)
+ [docker-compose](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/docker-compose) - fe. dcb (docker-compose build), dcup (docker-compose up), dcdn
+ encode64 - encode64, decode64 commands
+ [macOS](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/osx) - cdf (cd to current Finder directory), pfs (Finder selection path), pfd (path of Finder)
+ [git](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git) - gp, gst, glog, gl
