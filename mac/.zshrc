
greeting() {
        echo
        echo -e $(uname -rs | awk '{print " OS: "$0""}')
        echo -e $(uptime | sed 's/^up //' | awk '{print " Uptime: "$0""}')
        echo -e $(uname -n | awk '{print " Hostname: "$0""}')
        echo ""
        echo -e "Disk usage:"
        echo ""
	df -h / | grep -E "(Filesystem|dev/(disk|xvda|sd|mapper))" | awk '{print "\t"$1"\t"$2"\t"$3"\t"$5"\t"$9}'

        echo
}

greeting
