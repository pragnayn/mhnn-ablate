# MHNN-Ablate: Molecular Hypergraph Neural Networks Ablation Study

Extended study of Molecular Hypergraph Neural Networks by [Chen et al.](https://doi.org/10.1063/5.0193557)
Code for the original paper: https://github.com/schwallergroup/mhnn/tree/main

We have repurposed the original code to perform an ablation study. We introduce a `delocalization` flag in the training scripts, which, when false, does not include the higher-order hyperedges. Including or excluding this flag leads to a different representation of the data. We save the data and the results separately for ease of study.

## 🚀 Environment Setup

- We'll use `conda` to install dependencies and set up the environment.
We recommend using the [Python 3.9 Miniconda installer](https://docs.conda.io/en/latest/miniconda.html#linux-installers).
- After installing `conda`, install [`mamba`](https://mamba.readthedocs.io/en/latest/) to the base environment. `mamba` is a faster, drop-in replacement for `conda`:
    ```bash
    conda install mamba -n base -c conda-forge
    ```
- Create a new environment named `mhnn-ablate` and install dependencies.
    ```bash
    mamba env create -f env.yml
    ```
- Activate the conda environment with `conda activate mhnn-ablate`.

## 📌 Datasets

| Dataset  | Graphs    | Task type  | Task number | Metric |
|:--------:|:---------:|:----------:|:-----------:|:------:|
| OPV      | 90,823    | regression | 8           | MAE    |
| OCELOTv1 | 25,251    | regression | 15          | MAE    |
| PCQM4Mv2 | 3,746,620 | regression | 1           | MAE    |

## 🔥 Model Training

We provide distinct training scripts to handle both scenarios: one for cases with delocalization and another for cases without.

### OPV
1. We provide training scripts for `MHNN` and `baselines` under [`scripts/opv`](scripts/opv)
2. For a particular task, we can train the ablated version (without delocalization) by running:

    ```bash
        bash scripts/opv/mhnn.sh [TASK_ID]
    ```
    We can train the regular version (with delocalization) by running:

    ```bash
        bash scripts/opv/mhnn_delocal.sh [TASK_ID]
    ```
3. Similarly, all tasks can be run either by running:

    ```bash
        bash scripts/opv/run_all_tasks.sh [MODEL_NAME]
    ```
    or

    ```bash
        bash scripts/opv/run_all_tasks_delocal.sh [MODEL_NAME]
    ```
4. We have also provided a pair of separate scripts to perform the data efficiency tests (`opv_small.sh` and `opv_small_delocal.sh`)
5. The OPV dataset will be downloaded automatically at the first time of training.
6. The model names and task ID for different tasks can be found [here](scripts/opv/run_all_tasks.sh).

### OCELOTv1
1. We provide training scripts for `MHNN` under [`scripts/ocelot`](scripts/ocelot)
2. For a particular task, we can train the ablated version (without delocalization) by running:

    ```bash
        bash scripts/ocelot/train.sh [TASK_ID]
    ```
    We can train the regular version (with delocalization) by running:

    ```bash
        bash scripts/ocelot/train_delocal.sh [TASK_ID]
    ```
3. Similarly, all tasks can be run either by running:

    ```bash
        bash scripts/ocelot/run_all_tasks.sh [MODEL_NAME]
    ```
    or

    ```bash
        bash scripts/ocelot/run_all_tasks_delocal.sh [MODEL_NAME]
    ```
4. The ocelot dataset will be downloaded automatically at the first time of training.
5. The task ID for different tasks can be found [here](scripts/ocelot/run_all_tasks.sh).

### PCQM4Mv2
1. We provide training scripts for `MHNN` under [`scripts/pcqm4mv2`](scripts/pcqm4mv2)
2. For a particular task, we can train the ablated version (without delocalization) by running:

    ```bash
        bash scripts/pcqm4mv2/train.sh [TASK_ID]
    ```
    We can train the regular version (with delocalization) by running:

    ```bash
        bash scripts/pcqm4mv2/train_delocal.sh [TASK_ID]
3. The PCQM4Mv2 dataset will be downloaded automatically at the first time of training.

## 📫 Contact
If you have any questions, feel free to contact me at:

Pragnay Nevatia: pnevatia@mit.edu