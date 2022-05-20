
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%} %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}# "

greeting() {
        echo
        echo -e $fg[yellow]$(uname -rs | awk '{print "OS: "$0""}')$reset_color
        echo -e $fg[yellow]$(uptime | sed 's/^up //' | awk '{print "Uptime: "$0""}')$reset_color
        echo -e $fg[yellow]$(uname -n | awk '{print "Hostname: "$0""}')$reset_color

        echo $fg[green]
        echo -e "Disk usage:"
        echo ""
	df -h / | grep -E "(Filesystem|dev/(disk|xvda|sd|mapper))" | awk '{print "\t"$1"\t"$2"\t"$3"\t"$5}'
        echo $reset_color
}

greeting
