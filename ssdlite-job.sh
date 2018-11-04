#!/usr/bin/env zsh

### Job name
#BSUB -J "TFOD-SSD"

### File / path where STDOUT & STDERR will be written
###    %J is the job ID, %I is the array ID
#BSUB -o "/work/xx804416/Logs/TFOD-SSD-TRAINING-%J-%I.log"

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

### Change to the work directory
cd /home/xx804416/tf-models/research/object_detection

### Execute your application
source /home/xx804416/.bashrc
conda activate tf-obj
python model_main.py --alsologtostderr --pipeline_config_path=training-ssdlite-mobilenet/pipeline.config --model_dir=training-ssdlite-mobilenet
