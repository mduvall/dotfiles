# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell
set fish_plugins git

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

function gifit
    command mkdir frames;
            and ffmpeg -i $argv -vf scale=600:-1 -r 10 frames/ffout%03d.png;
            cd frames;
            and convert -delay 5 -loop 0 ffout*.png output.gif;
            and mv output.gif ../;
            and cd ..;
            and rm -rf frames
end

set -x GOROOT /usr/local/go
set -x GOBIN $GOROOT/bin
