#!/usr/bin/env bash
#SBATCH --job-name=cs6_video
#SBATCH -o gypsum/logs/%j_cs6_video.txt 
#SBATCH -e gypsum/errs/%j_cs6_video.txt
#SBATCH -p titanx-long
#SBATCH --gres=gpu:1
#SBATCH --mem=80000
##SBATCH --cpus-per-task=4
##SBATCH --mem-per-cpu=4096

# Run detector on a CS6 video to get visualized boxes on frames
# Usage: sbatch gypsum/scripts/eval/run_det_video.sh 501.mp4

DET_NAME=frcnn-R-50-C4-1x
CONF_THRESH=0.25
OUT_DIR=Outputs/evaluations/${DET_NAME}/cs6/sample-baseline-video_conf-${CONF_THRESH}

echo $1
python tools/face/detect_video.py --vis --video_name $1 \
    --thresh ${CONF_THRESH} \
    --output-dir ${OUT_DIR}

