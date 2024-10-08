#! /bin/bash

[ ! -d "exp_results/opv_small" ] && mkdir -p exp_results/opv_small


# molecular: 0-gap, 1-homo, 2-lumo, 3-spectral_overlap
# polymer: 4-homo, 5-lumo, 6-gap, 7-optical_lumo
TASK=$1
SIZE=$2

echo -e "\ntrain data size = $SIZE\n"
python -u train_opv_small.py \
    --method mhnn \
    --data_dir "pyg_data/opv_small/mhnn" \
    --dsize $SIZE \
    --runs 3 \
    --target $TASK \
    --All_num_layers 3 \
    --MLP1_num_layers 2 \
    --MLP2_num_layers 2 \
    --MLP3_num_layers 2 \
    --MLP4_num_layers 2 \
    --output_num_layers 3 \
    --MLP_hidden 256 \
    --output_hidden 128 \
    --aggregate mean \
    --lr 0.0001 \
    --min_lr 0.0001 \
    --wd 0 \
    --clip_gnorm 5.0 \
    --dropout 0.0 \
    --batch_size 32 \
    --epochs 400 \
    > exp_results/opv_small/mhnn_task${TASK}_${SIZE}.log 2>&1
