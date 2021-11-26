#!/bin/bash

GPU_ID=3
SCALE=2
TEST_DATASET="Urban100"
TEST_MODEL="EDSR"

######################################################################################################
# EDSR Test
if [[ $TEST_MODEL == "EDSR" ]]; then
    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --template EDSR_paper --scale $SCALE\
        --res_scale 0.1 --pre_train ../experiment/test/model/EDSR_AdaDM_DIV2K_X$SCALE.pt\
        --dir_data ../dataset --n_GPUs 1 --test_only --data_test $TEST_DATASET
fi

######################################################################################################
# RDN Test
if [[ $TEST_MODEL == "RDN" ]]; then
CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --model RDN --scale $SCALE\
    --pre_train ../experiment/test/model/RDN_AdaDM_DIV2K_X$SCALE.pt\
    --dir_data ../dataset --n_GPUs 1 --test_only --data_test $TEST_DATASET
fi

######################################################################################################
# NLSN Test
if [[ $TEST_MODEL == "NLSN" ]]; then
CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --dir_data ../dataset --model NLSN --chunk_size 144\
    --n_hashes 4 --chop  --rgb_range 1  --scale $SCALE --n_feats 256 --n_resblocks 32 --res_scale 0.1\
    --pre_train ../experiment/test/model/NLSN_AdaDM_DIV2K_X$SCALE.pt --test_only --data_test $TEST_DATASET 
fi














