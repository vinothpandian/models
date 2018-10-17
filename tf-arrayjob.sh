#!/usr/bin/env zsh

### Job name
#BSUB -J "TFOD[2]"

### File / path where STDOUT & STDERR will be written
###    %J is the job ID, %I is the array ID
#BSUB -o "/work/xx804416/Logs/TFOD-ARRAY-TRAINING-%J-%I.log"

# Email when start and end
#BSUB -B -N -u "vinoth.pandian@rwth-aachen.de"

### Request the time you need for execution in minutes
### The format for the parameter is: [hour:]minute,
### that means for 80 minutes you could also use this: 1:20
#BSUB -W "9:30"

### Request memory you need for your job in TOTAL in MB
#BSUB -M "16384"

# GPU run
#BSUB -q gpu
#BSUB -gpu -
#BSUB -R pascal

### Change to the work directory
cd /home/xx804416/tf-models/research/object_detection

### Execute your application
source /home/xx804416/.bashrc
conda activate tf-obj

### which one array job is this?
echo LSB_JOBINDEX: $LSB_JOBINDEX

### for '1' and '2' run a.out with yet another parameters,
### for all other values use it directly as input parameter
case "$LSB_JOBINDEX" in
    1)
        python model_main.py --alsologtostderr --pipeline_config_path=pipeline-faster.config --model_dir=training-faster-rcnn-nas
    ;;
    2)
        python model_main.py --alsologtostderr --pipeline_config_path=pipeline-ssdlite.config --model_dir=training-ssdlite-mobilenet
    ;;
    *)
        python main_model.py --helpfull
    ;;
esac
