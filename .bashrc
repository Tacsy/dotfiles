# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source Gromacs
#source /home/xr7/apps/gromacs/bin/GMXRC
# Source Gromacs-5.1.4 with MPI
#source /home/xr7/apps/gromacs-5.1.4/bin/GMXRC
# Source Gromacs-5.1.4 with double precision
source /home/xr7/apps/gromacs-5.1.4-dp/bin/GMXRC
# Export TERM
export TERM=xterm-256color

# don't put duplicate lines or lines starting with space in the history.                                                         
# See bash(1) for more options
HISTCONTROL=ignoreboth
  
# append to the history file, don't overwrite it
shopt -s histappend
  
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000
   
# Export Gromacs lib path
#export GMXLIB=/home/xr7/apps/gromacs/share/gromacs/top
#:/home/xr7/work/tutorial/gromacs/tutorial_2_KALP15_in_DPPC

# Module load for use
module load matlab
module load g09
module load amber14
module load mpi/openmpi-1.10.0
module load mpi4py
#module load vmd/1.9.2
module load namd/2.11-single-node

# User specific aliases
alias ll='ls -CFlh --color=auto'
alias la='ls -alh --color=auto'
# set Vim editor as Vi
alias vim='/home/zc62/local/bin/vim'
alias vi='vim'
# aliases for ssh
alias sftpxr7='sftp xr7@dnb06.chem.duke.edu'
# aliases for et-mei slurm control
alias que='squeue -u xr7'
alias queall='squeue --partition=et2,et1_new,et1_old,et3,et3short'
alias cancel='scancel'
alias submit='sbatch'
alias etmem='scontrol -o show nodes | awk '"'"' {print $1,"\t", $6,"\t", $4,"\t", $14,"\t", $15}'"'"' | grep "et0"'
alias etinfo='sinfo | grep 'et''
alias etreport='sreport user TopUsage Group TopCount=30 start=0401'
alias etshare='sshare -A am424,bjr29,cl221,jv100,lz91,ml340,nfp3,pz19,rl108,xr7,yz146,zm14,rt131,yz325'
# aliases for regular expression commmand
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
# OpenBLAS
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/xr7/apps/openblas/OpenBLAS-0.2.14-gcc-4.8.2-i4/lib

# Up function
up (){
	local d=""
	limit=$1
	for ((i=1;i<=limit;i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# function for powerline shell
function _update_ps1() {
    PS1="$(/home/xr7/apps/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# added by Anaconda2 4.2.0 installer
export PATH="/home/xr7/apps/anaconda2/bin:$PATH"

