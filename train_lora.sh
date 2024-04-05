 #!/bin/bash

export MODEL_NAME="runwayml/stable-diffusion-v1-5"
export OUTPUT_DIR="output"

accelerate launch train_lora.py \
    --pretrained_teacher_model=$MODEL_NAME \
    --output_dir=$OUTPUT_DIR \
    --mixed_precision=fp16 \
    --resolution=512 \
    --lora_rank=64 \
    --learning_rate=1e-6 --loss_type="huber" --adam_weight_decay=0.0 \
    --max_train_steps=50000 \
    --max_train_samples=40000 \
    --dataloader_num_workers=8 \
    --train_shards_path_or_url="./CubiCasa5k/data/custom.tar" \
    --validation_steps=500 \
    --checkpointing_steps=500 --checkpoints_total_limit=50 \
    --train_batch_size=8 \
    --gradient_checkpointing  \
    --gradient_accumulation_steps=1 \
    --use_8bit_adam \
    --resume_from_checkpoint=latest \
    --report_to=wandb \
    --seed=453645634 \
#    --push_to_hub \
#   --enable_xformers_memory_efficient_attention    
