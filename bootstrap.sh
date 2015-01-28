#!/usr/bin/env bash
# install all the things

DOTFILES="`pwd`"

info () {
	printf "\r\033[2K [   \033[00;34m.\033[0m] $1\n"
}

user () {
	printf "\r\033[2K [   \033[00;33m?\033[0m] $1 "
}

success () {
	printf "\r\033[2K [  \033[00;32mok\033[0m] $1\n"
}

fail () {
	printf "\r\033[2K [\033[00;31mfail\033[0m] $1\n"
	echo ''
	exit
}

link_files () {
 	ln -s $1 $2
	success "linked $1 to $2"
}

update_modules () {
	info "updating git modules"
	git submodule update --init --recursive
}

install_dotfiles () {
	info "installing dotfiles"

	overwrite_all=false
	backup_all=false
	skip_all=false

    # find files named with a dot at the end, link those with a dot at the beginning
	for source in `find $DOTFILES -maxdepth 2 -name \*.`
	do
        # if it's a directory, it goes in .config
        if [ -d $source ]
        then
            config=${XDG_CONFIG_HOME:="$HOME/.config"}
            dest="$config/`basename \"${source%.*}\"`"
        else
		    dest="$HOME/.`basename \"${source%.*}\"`"
        fi

		# if it's already correct, skip
		if [ -L $dest ] && [ "$(readlink $dest)" = "$source" ]
		then
			success "extant $dest"
		elif [ -f $dest ] || [ -d $dest ]
		then
			overwrite=false
			backup=false
			skip=false

			if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
			then
				user "file exists: `basename $source` - [sS]kip, [oO]verwrite, [bB]ackup ?"
				read -n 1 action

				case "$action" in
					o )
						overwrite=true;;
					O )
						overwrite_all=true;;
					b )
						backup=true;;
					B )
						backup_all=true;;
					s )
						skip=true;;
					S )
						skip_all=true;;
					* )
						;;
				esac
			fi
			
			if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
			then
				rm -rf $dest
				success "removed $dest"
			fi

			if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
			then
				mv $dest $dest\.backup
				success "moved $dest to $dest\.backup"
			fi

			if [ "$skip" == "true" ] || [ "$skip_all" == "true" ]
			then
				success "skipped $source"
			else
				link_files $source $dest
			fi
		else
			link_files $source $dest
		fi
	done
}

update_modules
install_dotfiles
