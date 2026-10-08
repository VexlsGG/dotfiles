
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ff='clear && fastfetch'

# eza shortcuts
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --octal-permissions --group-directories-first"
alias tree="eza --tree --level=2 --icons"
alias cat='bat --paging=never --style=plain'
alias lg='lazygit'

# Interactive project text search (Ctrl + F)
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --pretty --context 10 '$1' {}"
}

# yt-dlp shortcuts
# Rip clean MP3 audio directly to ~/Downloads
alias ytmp3='yt-dlp -x --audio-format mp3 -P "~/Downloads" -o "%(title)s.%(ext)s"'

# Download best quality MP4 video directly to ~/Downloads

# yt-dlp to ~/Movies/Converts
alias ytmp3='yt-dlp -x --audio-format mp3 -P "~/Movies/Converts" -o "%(title)s.%(ext)s"'
alias ytmp4='yt-dlp -P "~/Movies/Converts" -o "%(title)s.%(ext)s" --remux-video mp4 --recode-video mp4 --postprocessor-args "VideoConvertor:-c:v libx264 -pix_fmt yuv420p -c:a aac"'
eval "$(navi widget zsh)"
