import numpy as np
import sys
import os

workdir=os.getcwd()
name=sys.argv[1].split('/')[-1]
name=name.split(".")[0]
print(name)
 ## This function read coordinates from orca out files
with open(sys.argv[1],'r') as logfile:
    log=logfile.read().splitlines()

    natom=0
    coord=[]
    xyz=[]
    atoms=[]
    for n,line in enumerate(log):
        if 'Number of atoms' in line:
            natom=int(line.split()[-1])
    for n,line in enumerate(log):
        if 'CARTESIAN COORDINATES (ANGSTROEM)' in line:
            coord=log[n+2:n+2+natom]
    for line in coord:
        e,x,y,z=line.split()
        x,y,z=float(x),float(y),float(z)
        atoms.append(e)
        xyz.append([x,y,z])

xyz=np.array(xyz)

with open('{0}/{1}.xyz'.format(workdir,name),'w') as newxyz:
    xyzline="""{0}
converted from {1}.out\n""".format(natom, name)
    newxyz.write(xyzline)

for i in range(0,natom):
    xyzline="""{0}    {1}    {2}    {3}\n""".format(atoms[i], xyz[i,0], xyz[i,1], xyz[i,2])
    with open('{0}/{1}.xyz'.format(workdir,name),'a') as newxyz:
        newxyz.write(xyzline) 
