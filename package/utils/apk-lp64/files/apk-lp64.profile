# LP64 programs installed by apk-lp64: at the end of PATH, so programs of the system come first
for d in /opt/lp64/usr/bin /opt/lp64/usr/sbin /opt/lp64/bin /opt/lp64/sbin; do
	[ -d "$d" ] && case ":$PATH:" in *":$d:"*) ;; *) PATH="$PATH:$d" ;; esac
done
unset d
export PATH
# terminal descriptions of the LP64 packages (htop, ...) next to those of the system: ncurses searches
# TERMINFO_DIRS before its built-in path, which points to this (ILP32) system
if [ -d /opt/lp64/usr/share/terminfo ]; then
	case ":${TERMINFO_DIRS:-}:" in
	*":/opt/lp64/usr/share/terminfo:"*) ;;
	*) TERMINFO_DIRS="${TERMINFO_DIRS:+$TERMINFO_DIRS:}/opt/lp64/usr/share/terminfo" ;;
	esac
	export TERMINFO_DIRS
fi
