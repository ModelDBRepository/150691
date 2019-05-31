#!/bin/tcsh

#PBS -l nodes=4:ppn=8,walltime=03:30:00 -A std12-092 -N bl-g5p
module load env/experimental
module load neuron/7.3

# ALDO: devi cambiare il percorso qui sotto per indicare il direttorio...
setenv WORKDIR /work/projects/std12-092/TestPVC/Ggap-Analisi/Fixed-g/Bl-g5p
cd $WORKDIR
pwd

# il comando sotto serve per compilare il codice
$N/bin/nrnivmodl

# cambio i permessi di scrittura/lettura...
chmod 755 $WORKDIR/x86_64/special
chmod 755 $WORKDIR/sortspike

# lancio il job...
mpiexec -np 32 $WORKDIR/x86_64/special -mpi parinit.hoc
$WORKDIR/sortspike out32.dat bl_g5p.spk

