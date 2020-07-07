import numpy as np
import os
import sys
#from gaussian_setup import generate_com
#from gaussian_setup import  gaussian_batch
#from template import template_header
#from gaussian_setup import freqcheck_batch

# Input Parameters
cores="8"
memory="31" #GB
partition="short,lopez"
method="wB97XD"
basis="6-31+G(d,p)"
calculation_type="td=(NStates=10) SCRF=(Solvent=Water)"
charge="0"
multiplicity="1"

name=sys.argv[1].split('.')[0]
ext=sys.argv[1].split('.')[-1]
workdir=os.getcwd()
ext='com'
os.chdir(workdir)

# Error exit if no input is given
if len(sys.argv) <2:
    info="""
    no xyz input file was found
    """

    print(info)
    exit()
if ext == 'xyz':
    if not os.path.exists('{0}.xyz'.format(name)):
        print('{0}.xyz could not be found, or is empty'.format(title))
        exit()
    print("""xyz found: {0}

Setting up calculations...

""".format(name))
else:
    os.system('obabel {0} -o xyz -O {1}.xyz'.format(sys.argv[1],name))
    if os.stat('{0}.xyz'.format(name)).st_size < 1:
        print('File could not be converted by obabel, please supply xyz')
        exit()
    else:
        print("""{0} converted to {1}.xyz""".format(sys.argv[1],name))
 
#template definitions

def generate_com(name,cores,memory,partition,method,basis,calculation_type,charge,multiplicity,coord):
    coord='\n'.join(coord)
    xyz=open("{}.xyz".format(name))
    script="""%chk={0}.chk
%nprocs={1}
%mem={2}GB
# {3}/{4} {5}

equillibrium database script

{6} {7}
{8}

""".format(name,cores,memory,method,basis,calculation_type,charge,multiplicity,coord)
    return script

def gaussian_batch(name,partition,cores,memory,workdir):
    script="""#!/bin/bash
#SBATCH --job-name={0}
#SBATCH --error={1}.e
#SBATCH --output={2}.o
#SBATCH --partition={3}
#SBATCH --nodes=1
#SBATCH --ntasks={4}
#SBATCH --time=1-00
#SBATCH --mem={5}G

    export INPUT={0}.com
    export WORKDIR={6}
    export GAUSS_SCRDIR={6}
    export g16root=/work/lopez/
    . $g16root/g16/bsd/g16.profile

    cd $WORKDIR
    $g16root/g16/g16 $INPUT

    """.format(name,name,name,partition,cores,memory,workdir,name,name,name,name,name,name)
    return script

#Generation Steps

#take xyz and make com
coord=open('{}.xyz'.format(name), 'r').read().splitlines()
natom=int(coord[0])
coord=coord[2:natom+2]
shll=open('{0}/{1}.com'.format(workdir,name),'w')
shll.write(generate_com(name,cores,memory,partition,method,basis,calculation_type,charge,multiplicity,coord))
shll.close()
with open('{0}/{1}-tddft.sbatch'.format(workdir,name),'w') as sbatch:
    sbatch.write(gaussian_batch(name,partition,cores,memory,workdir))



