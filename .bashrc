# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#this is a test change

#module add legacy
# User specific aliases and functions
#module load slurm-14.11.8
#module load gnu-4.4-compilers
#module load gnu-4.9.3-compilers
#module load fftw-3.3.3-single
#module load fftw-3.3.3
#module load platform-mpi
#module load gaussian-16
#imodule load gaussview-6
module load gaussian/g16
#module load eigen-3.2.4
#module load gnu-4.8.1-compilers
#module load python/3.7.1
module load openbabel/2.4.1
module load drive
source /shared/centos7/gaussian/g16/bsd/g16.profile
#export GAUSS_EXEDIR="/shared/apps/gaussian/gaussian-16/g16/"

export LD_LIBRARY_PATH="/work/lopez/orca_4_2_1_linux_x86-64_shared_openmpi216/":$LD_LIBRARY_PATH

export LIBRARY_PATH="/work/lopez/OpenBLAS/lib/pkgconfig":"/work/lopez/OpenBLAS/lib":"/work/lopez/OpenBLAS":"/work/lopez/orca_4_2_1_linux_x86-64_shared_openmpi216/":$LD_LIBRARY_PATH

export PATH="/shared/centos7/intel/parallel_studio_xe/2019-4/bin":"/home/neal.pa/python4/bin":"/home/neal.pa/.local/bin":"/work/lopez/OpenBLAS/lib":$PATH

export PATH="$PATH:/home/neal.pa/SAPT2016.1/bin"

alias mq='squeue -u neal.pa --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'
alias danq='squeue -u adrion.d --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'
alias stephanq='squeue -u st.freeman --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'
alias fatemahq='squeue -u mukadum.f --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'
alias bradq='squeue -u mileson.b --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'
alias stevenq='squeue -u steven.lopez --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'
alias rachelq='squeue -u steinr --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'

alias watch='watch -n1 '

alias si='sinfo -p lopez, general -o "%P %5a %.10l %.5D %6t %C"'

alias lopez='sinfo -p lopez -t idle,mix -o "%15P %5a %.10l %.5D %6t %C"'

alias short='sinfo -p short -t idle,mix -o "%15P %5a %.10l %.5D %6t %C"'

alias debug='sinfo -p debug -t idle,mix -o "%15P %5a %.10l %.5D %6t %C"'

alias express='sinfo -p express -t idle,mix -o "%15P %5a %.10l %.5D %6t %C"'

alias qmon='squeue -u neal.pa -o "%12i %.2t %40j %6u %.11M %14P %.2D %.3C %R" -i 5'

alias scr='cd /scratch/neal.pa/'

alias cln='find ./ -name "Gau-*" -delete' 

alias interact="salloc -N 1 --exclusive -p ser-par-10g-4"

alias scf='grep "SCF Done" *log'

alias station='grep "Stationary" *log'

alias freq='grep "Frequencies" *log'

alias polar='grep "Exact p" *log'

alias dos='/home/jmcox2/dynamics-0.4.2/dynamics2/utils/fitdos '

alias lopezq='squeue -u neal.pa -p lopez --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'

alias shortq='squeue -u neal.pa -p short --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'

alias expressq='squeue -u neal.pa -p express --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'

alias debugq='squeue -u neal.pa -p debug --Format=jobarrayid:21,partition:15,nodelist:15,name:35,statecompact:4,timeused:12,reason:12'

# VERDE Materials DB workflow utils
export SCRATCH=/scratch/neal.pa
export PFLOW=/home/neal.pa/vee_flow
export FLOW=/home/neal.pa/flow
set -a; source /home/neal.pa/vee_flow/functions.sh; set +a
#set -a; source /home/neal.pa/flow/functions.sh; set +a
export AUTOTS=/home/neal.pa/autots
# load gaussian 16
module load gaussian/g16
export g16root=/work/lopez
. $g16root/g16/bsd/g16.profile

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/shared/centos7/anaconda3/3.7/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/shared/centos7/anaconda3/3.7/etc/profile.d/conda.sh" ]; then
        . "/shared/centos7/anaconda3/3.7/etc/profile.d/conda.sh"
    else
        export PATH="/shared/centos7/anaconda3/3.7/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


