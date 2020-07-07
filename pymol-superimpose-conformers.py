name='cat2-4-all-sorted-conf'
nstruct=
atoms=''


#execute the script with 'run superimpose.py' in pymol command line


for xyz in range(1,nstruct+1): cmd.load('{0}{1}.xyz'.format(name,xyz))

for xyz in range(2,nstruct+1): 
    cmd.select("struct1", "model {0}{1} and id {2}".format(name, xyz, atoms))
    cmd.select("struct2", "model {0}{1} and id {2}".format(name, xyz-1, atoms))
    cmd.pair_fit("struct1", "struct2")