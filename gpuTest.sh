#!/usr/bin/env zsh

### Job name
#BSUB -J "TFOD-FRCNN"

### File / path where STDOUT & STDERR will be written
###    %J is the job ID, %I is the array ID
#BSUB -o "/work/xx804416/Logs/TFOD-FRCNN-TRAINING-%J-%I.log"

# Email when start and end
#BSUB -B -N -u "vinoth.pandian@rwth-aachen.de"

### Request the time you need for execution in minutes
### The format for the parameter is: [hour:]minute,
### that means for 80 minutes you could also use this: 1:20
#BSUB -W "23:59"

### Request memory you need for your job in TOTAL in MB
#BSUB -M 32768

### GPU run
#BSUB -q gpu
#BSUB -gpu -
#BSUB -R gpu

module load cuda/90
cd /home/xx804416/
nvidia-smi
nvcc --version
which nvcc
ldconfig -p | grep cuda
