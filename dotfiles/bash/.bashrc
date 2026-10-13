# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias m269-26j='cd "/home/apstefans/m269-26j";source /home/apstefans/venvs/m269-26j/bin/activate;unalias allowed 2> /dev/null'
alias nb='source /home/apstefans/venvs/m269-26j/bin/activate;unalias allowed 2> /dev/null;jupyter lab --custom-css &'
