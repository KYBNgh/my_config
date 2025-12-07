#!/usr/bin/env bash

# Functions
info(){
	echo "[INFO] $1"
}

do_backup(){
	# Dir name like: ~/backup_shell_config_20251206_103955/
	backup_dir="${HOME}/backup_shell_config_$(date +%Y%m%d_%H%M%S)"
	mkdir -p -v "$backup_dir"
	info "Backup directory: $backup_dir"

	[[ -f ~/.bashrc ]] && mv -v ~/.bashrc "$backup_dir"
	[[ -f ~/.bash_profile ]] && mv -v ~/.bash_profile "$backup_dir"
	[[ -f ~/.profile ]] && mv -v ~/.profile "$backup_dir"
	[[ -f ~/.inputrc ]] && mv -v ~/.inputrc "$backup_dir"
	
	info "Backup done"
}

do_accept(){
	info "Do some accept..."

}

do_linux_setting(){
	info "Do Linux setting"

}

do_termux_setting(){
	info "Do Termux setting"

}

# Check enviroment
if [[ "$PREFIX" = /data/data/com.termux/files/usr ]] ; then
	info "Environment: Termux"
	is_termux=true
else
	info "Environment: Linux"
	is_termux=false
fi

# Confirm and backup config
read -n 1 -p "Do you want to continue? (y/n): " confirm
echo

case "$confirm" in
	[Yy])
		do_backup
		do_accept

		if $is_termux; then
			do_termux_setting
		elif ! $is_termux; then
			do_linux_setting
		fi
		
		exit 0
		;;
	* )
		echo 'canceled by user'
		exit 1
		;;
esac
