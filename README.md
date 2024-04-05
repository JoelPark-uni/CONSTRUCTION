## 사회문제 해결을 위한 해커톤 : A Proposal of Architectural Drawing Using Waste Materials through Image Generative AI
This repository contains some source codes for our project.  
We propose a specified image generative model using diffusion-based models.  
We used dataset CubiCasa5k(https://github.com/CubiCasa/CubiCasa5k.git)   
and LCM model architecture(https://github.com/luosiallen/latent-consistency-model.git).   \

  
Since the original dataset contains only architectural drawing images, not text imformation, we use BLIP image captioning model from Huggingface.  

To reduce training cost with restricted computing-resource condition, we use LoRA(Low-Rank Adaptation) method to fine-tune LCM model.  

  ### File Description
  #### LCM-lora Model
  1. **train_lora.py , train_lora.sh**   
     These files contain LCM-lora model, with training script. To check hyperparamers : 

| Hyperparameters | value |
|-----------------|-------|
| resolution      | 512   |
| lora_rank       | 64    |
| learning_rate   | 1e-6  |
  
  2. **sample.ipynb**  
     This notebook is for sampling architectural drawing images using trained LoRA weights.
     After LoRA fine-tuning, the weights of LoRA modules saved in ./output/ folder.
     In this notebook, it loads base Stable-Diffusion model and convert it to PeftModel class.  
     (Detailed description here : https://huggingface.co/docs/peft/index)  
     After converting to PeftModel, it add-on trained LoRA weights on the model.  

 #### text-image Dataset  
   1. **img2txt.ipynb**
      Using downloaded image files from CubiCasa5k, BLIP image captioning model used for generating prompts.  

      
