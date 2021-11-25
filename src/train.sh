#!/bin/bash

GPU_ID=0

######################################################################################################
# EDSR Train X2
    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --template EDSR_paper --scale 2\
        --n_GPUs 1 --batch_size 16 --patch_size 96 --rgb_range 255 --res_scale 0.1\
        --save EDSR_AdaDM_Test_DIV2K_X2 --dir_data ../dataset --data_test Urban100\
        --epochs 1000 --decay 200-400-600-800 --lr 1e-4 --save_models --save_results 

# EDSR Train X3
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --template EDSR_paper --scale 3\
#        ---n_GPUs 1 -batch_size 16 --patch_size 144 --rgb_range 255 --res_scale 0.1\
#        --save EDSR_AdaDM_Test_DIV2K_X3 --dir_data ../dataset --data_test Urban100\
#        --epochs 1000 --decay 200-400-600-800 --lr 1e-4 --save_models --save_results\
#       --pre_train ../experiment/EDSR_AdaDM_Test_DIV2K_X2/model/model_best.pt 

# EDSR Train X4
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --template EDSR_paper --scale 4\
#        ---n_GPUs 1 -batch_size 16 --patch_size 192 --rgb_range 255 --res_scale 0.1\
#        --save EDSR_AdaDM_Test_DIV2K_X4 --dir_data ../dataset --data_test Urban100\
#        --epochs 1000 --decay 200-400-600-800 --lr 1e-4 --save_models --save_results\
#       --pre_train ../experiment/EDSR_AdaDM_Test_DIV2K_X2/model/model_best.pt 

######################################################################################################
# RDN Train X2
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --model RDN --scale 2\
#        --batch_size 16 --patch_size 96 --rgb_range 255 --n_GPUs 1\
#        --save RDN_AdaDM_Test_DIV2K_X2 --dir_data ../dataset --data_test Urban100\
#        --epochs 1000 --decay 200-400-600-800 --lr 1e-4 --save_models --save_results

# RDN Train X3
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --model RDN --scale 3\
#        --batch_size 16 --patch_size 144 --rgb_range 255 --n_GPUs 1\
#        --save RDN_AdaDM_Test_DIV2K_X3 --dir_data ../dataset --data_test Urban100\
#        --epochs 1000 --decay 200-400-600-800 --lr 1e-4 --save_models --save_results\
#        --pre_train ../experiment/RDN_AdaDM_Test_DIV2K_X2/model/model_best.pt 

# RDN Train X4
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --model RDN --scale 4\
#        --batch_size 16 --patch_size 192 --rgb_range 255 --n_GPUs 1\
#        --save RDN_AdaDM_Test_DIV2K_X4 --dir_data ../dataset --data_test Urban100\
#        --epochs 1000 --decay 200-400-600-800 --lr 1e-4 --save_models --save_results\
#        --pre_train ../experiment/RDN_AdaDM_Test_DIV2K_X2/model/model_best.pt 



######################################################################################################
# NLSN Train X2
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --model NLSN --dir_data ../dataset --n_GPUs 1\
#        --chunk_size 144 --n_hashes 4 --lr 1e-4 --decay 200-400-600-800 --epochs 1000 --chop\
#        --n_resblocks 32 --n_feats 256 --rgb_range 1 --res_scale 0.1 --batch_size 16 --scale 2\
#        --patch_size 96 --save NLSN_AdaDM_Test_DIV2K_X2 --data_test Urban100 --save_models --save_results  

# NLSN Train X3
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --model NLSN --dir_data ../dataset --n_GPUs 1\
#        --chunk_size 144 --n_hashes 4 --lr 1e-4 --decay 200-400-600-800 --epochs 1000 --chop\
#        --n_resblocks 32 --n_feats 256 --rgb_range 1 --res_scale 0.1 --batch_size 16 --scale 3\
#        --patch_size 144 --save NLSN_AdaDM_Test_DIV2K_X3 --data_test Urban100 --save_models --save_results\
#        --pre_train ../experiment/NLSN_AdaDM_Test_DIV2K_X2/model/model_best.pt 

# NLSN Train X4
#    CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --model NLSN --dir_data ../dataset --n_GPUs 1\
#        --chunk_size 144 --n_hashes 4 --lr 1e-4 --decay 200-400-600-800 --epochs 1000 --chop\
#        --n_resblocks 32 --n_feats 256 --rgb_range 1 --res_scale 0.1 --batch_size 16 --scale 4\
#        --patch_size 192 --save NLSN_AdaDM_Test_DIV2K_X4 --data_test Urban100 --save_models --save_results\
#        --pre_train ../experiment/NLSN_AdaDM_Test_DIV2K_X2/model/model_best.pt 




