# AdaDM
## AdaDM: Enabling Normalization for Image Super-Resolution.
 You can apply BN, LN or GN in SR networks with our AdaDM. Pretrained models can be downloaded from
 [Google Drive](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) or
 [BaiduYun](https://pan.baidu.com/s/18I3j4DJFvbNvTFHzDwsssA). The password for BaiduYun is `kymj`.

:loudspeaker: If you use [BasicSR](https://github.com/xinntao/BasicSR) framework, you need to turn off the Exponential Moving Average (EMA) when
applying BN in the generator network (e.g. RRBDNet). You can disable EMA by setting `ema_decay=0` in `.yml` configuration file. 

| Model    | Scale | File name (.pt) | Urban100 | Manga109 |
|  ---     |  ---  | ---             | ---        | ---      |
|**EDSR** | 2 |                     | 32.93 | 39.10 |
|| 3 || 28.80 | 34.17 |
|| 4 || 26.64 | 31.02 |
|**EDSR***| 2 | [EDSR_AdaDM_DIV2K_X2](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 33.12 | 39.31 |
|| 3 | [EDSR_AdaDM_DIV2K_X3](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 29.02 | 34.48 |
|| 4 | [EDSR_AdaDM_DIV2K_X4](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 26.83  | 31.24 |
|**RDN**  | 2 |  | 32.89  | 39.18 |
|| 3 |  | 28.80 | 34.13 |
|| 4 |  | 26.61 | 31.00 |
|**RDN***| 2 | [RDN_AdaDM_DIV2K_X2](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 33.03 | 39.18 |
|| 3 | [RDN_AdaDM_DIV2K_X3](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 28.95 | 34.29  |
|| 4 | [RDN_AdaDM_DIV2K_X4](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 26.72 | 31.18 |
|**NLSN**  | 2 |  | 33.42 | 39.59 |
|| 3 |  | 29.25 | 34.57 |
|| 4 |  | 26.96 | 31.27 |
|**NLSN*** | 2 | [NLSN_AdaDM_DIV2K_X2](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 33.59 | 39.67 |
|| 3 | [NLSN_AdaDM_DIV2K_X3](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 29.53 | 34.95  |
|| 4 | [NLSN_AdaDM_DIV2K_X4](https://drive.google.com/drive/folders/1xljnGUUPAXpdAzXxCUMz5Rs2yOMAMOx6?usp=sharing) | 27.24 | 31.73 |

## Preparation
Please refer to [EDSR](https://github.com/thstkdgus35/EDSR-PyTorch) for instructions on dataset download and software installation, then clone our repository as follows:
```bash
git clone https://github.com/njulj/AdaDM.git
```

## Training
```bash
cd AdaDM/src
bash train.sh
```
Example training command in train.sh looks like:
```bash
CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --template EDSR_paper --scale 2\
        --n_GPUs 1 --batch_size 16 --patch_size 96 --rgb_range 255 --res_scale 0.1\
        --save EDSR_AdaDM_Test_DIV2K_X2 --dir_data ../dataset --data_test Urban100\
        --epochs 1000 --decay 200-400-600-800 --lr 1e-4 --save_models --save_results 
```
Here, `$GPU_ID` specifies the GPU id used for training. `EDSR_AdaDM_Test_DIV2K_X2` is the directory where all files are saved during training.
`--dir_data` specifies the root directory for all datasets, you should place the DIV2K and benchmark (e.g., Urban100) datasets under this directory.

## Testing
```bash
cd AdaDM/src
bash test.sh
```
Example testing command in test.sh looks like:
```bash
CUDA_VISIBLE_DEVICES=$GPU_ID python3 main.py --template EDSR_paper --scale $SCALE\
        --pre_train ../experiment/test/model/EDSR_AdaDM_DIV2K_X$SCALE.pt\
        --dir_data ../dataset --n_GPUs 1 --test_only --data_test $TEST_DATASET
```
Here, `$GPU_ID` specifies the GPU id used for testing. `$SCALE` indicates the upscaling factor (e.g., 2, 3, 4). `--pre_train` specifies the path of
saved checkpoints. `$TEST_DATASET` indicates the dataset to be tested.

## Acknowledgement
This repository is built on [EDSR](https://github.com/thstkdgus35/EDSR-PyTorch) and [NLSN](https://github.com/HarukiYqM/Non-Local-Sparse-Attention). We thank the authors for sharing their codes.
