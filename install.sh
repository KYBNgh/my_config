#!/usr/bin/env bash
# Setup config
set -e
repo_dir="$(cd "$(dirname "${BASE_SOURCE[0]}")" && pwd )"

# Functions
info(){
	echo "[INFO] $1"
}

do_backup(){
	# Dir name like: ~/backup_shell_config_20251206_103955/
	backup_dir="${HOME}/backup_shell_config_$(date +%Y%m%d_%H%M%S)"
	mkdir -p -v "$backup_dir"
	info "Backup directory: $backup_dir"

	local targets=(
		"$HOME/.bashrc"
		"$HOME/.bash_profile"
		"$HOME/.profile"
		"$HOME/.inputrc"
		"$HOME/.termux"
		"$HOME/.config/mpd"
		"$HOME/.config/kitty"
		"$HOME/.config/nvim"
		# Add more ...
	)

	for target in "${targets[@]}"; do
		if [[ -e "$target" ]]; then
			
		fi
	done
	info "Backup done"
}

do_accept_mv(){
	info "Do accepting of move mode..."
	[[ -f ${base_dir}/mpd ]]
}

do_accept_ln(){
	info "Do accepting of link mode..."
}

do_termux_add(){
	info "Do Termux setting"

}

# Check enviroment
if [[ "$PREFIX" = /data/data/com.termux/files/usr ]] ; then
	info "Environment: Termux"
	is_termux=true
else
	info "Environment: GNU/Linux"
	is_termux=false
fi

# Show note, confirm and backup config
cat <<-NOTE
Note:
    There are two modes of deployments

    If you choose mv(move), the config files in repo will be MOVED to current location like ~/.bashrc
    You can remove the local git repo safely

    If you choose ln(link), the config files in repo will be LINKED to current location
    The local git repo must EXIST
    If you remove the repo, the symlinks will FAIL
    If you choose ln(link), you could move this git repo to ~/git/KYBNgh/my_config
NOTE


read -n 1 -p "Do you want to continue? (y/n) " y_or_n_confirm
read -n 1 -p "Do you want to mv(m) or ln(link) " mv_or_ln_confirm
echo

case "$y_or_n_confirm" in
	[Yy])
		do_backup
		do_accept

			doneif $is_termux; then
			do_accept
			do_termux_add
		elif !$is_termux; then
			do_accept
		fi
		
		exit 0
		;;
	* )
		echo 'Interrupted by user'
		exit 1
		;;
esac
