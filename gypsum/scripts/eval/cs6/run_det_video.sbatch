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

echo $1


python tools/face/detect_video.py \
    --video_name $1 \
    --exp_name $2 \
    --output-dir $3 \
    --thresh $4 \
    --vis



