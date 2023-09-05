+++
title = 'Deploy your own Llama 2'
date = 2023-09-05T10:46:45+02:00
draft = false
ShowCodeCopyButtons	= true
+++

At this time of writing, the Llama 2 models released by Meta are probably the best open source large language models available, outperforming other LLMs on many tasks such as reasoning, coding, proficiency and knowledge tests. 
We have several variants of Llama 2, ranging from 7B to 70B parameters, fine-tuned for different tasks such as chatting, and even a code Llama 2, which I'm particularly interested on. They also have a context length of 4k tokens.

Because of this, you might be tempted to use Llama 2 for research purposes, or develop an application, or you just want to tinker with the models. Either way, you will want to deploy your own Llama 2 model so that you can do whatever you want with it, so in this post I'll explain how to do that exactly.

### 1. Request access to Llama 2

Despite these models being open sourced, you still have to request access to the models and accept its license, which basically tells you that you can use the models for anything that you want except shady stuff such as terrorism and other criminal activities. Anyway, follow [this link](https://ai.meta.com/resources/models-and-libraries/llama-downloads/), fill in with your data and select the models you would like access to. You can select all the models with no problem. Usually they give you access in a couple minutes.

### 2. Deploy Llama 2 with HuggingFace's Text Generation Inference

If completed the previous step you already have complete access to the weights of the models, so you can already start testing it. However, you may also want to deploy it so that you can perform inference. In my case, I found that the easiest way to do it is by using [Text Generation Inference](https://github.com/huggingface/text-generation-inference), a library developed by HuggingFace to power their Hugging Chat, the Inference API and Inference Endpoint.

Before we start, we need to create a HuggingFace account **with the same email that we used to request the access to the models**. Then, we will also need to create an access token, so on your HF profile go to `Settings->Access Tokens` and select `New Token` with the following options:

- `Name`: Deploy Llama 2
- `Role`: read

This will generate a token that we will use when downloading the models. Now we can finally deploy our Llama! The easiest way is to run the official Text Generation Inference docker container so, assuming that you have [Docker](https://www.docker.com/get-started/) installed on the machine that you want to deploy the model (if not, install it), run the following, replacing `<your cli READ token>` with the token that we obtained earlier.: 

```
model=meta-llama/Llama-2-7b-chat-hf
volume=$PWD/data 
token=<your cli READ token>

docker run --gpus all --shm-size 1g -e HUGGING_FACE_HUB_TOKEN=$token -p 8080:80 -v $volume:/data ghcr.io/huggingface/text-generation-inference:1.0.3 --model-id $model
```

Depending on the machine you are using you might want to modify the parameters. For example, I had to set `--gpus "device=0"` as I don't have access to the rest of GPUs of my university cluster. The previous example deployed the 7B Llama 2 variant fine-tuned for chatting purposes, but you can pick [any Llama 2 model](https://huggingface.co/meta-llama) that you want, by replacing the value of `model`.

Now, the model will be downloaded and deployed in the docker container. Once that is has been deployed, press `Ctrl+p` followed by `Ctrl+q` to exit the container and leave it running. That's it, we have deployed our model!

However, I had to do an extra step, as we have to work inside docker containers on our university cluster. If you don't have this problem, you can already skip this part and go to the last step. If not, you'll need to take an extra step to connect the docker container that you use to work with the docker container where the model is deployed. To do this, you just have to add the flag `--network="host"` to the `docker run` command that you usually enter to start your container. For example, in my case I just use:

```
docker run --gpus "device=0" -it --rm --name jgcarrasco --network="host" -v ~/../../raid/jgcarrasco:/workspace nvcr.io/nvidia/pytorch:23.03-py3
```

### 3. Enjoy your personal Llama

That's it! Now you can perform inference on your model via:

```
curl 127.0.0.1:8080/generate \
    -X POST \
    -d '{"inputs":"What is Deep Learning?","parameters":{"max_new_tokens":20}}' \
    -H 'Content-Type: application/json'
```

Or by using Python, after installing the `text_generation` library (via `pip install text-generation`):

```
from text_generation import Client

client = Client("http://127.0.0.1:8080")
print(client.generate("What is Deep Learning?", max_new_tokens=20).generated_text)

text = ""
for response in client.generate_stream("What is Deep Learning?", max_new_tokens=20):
    if not response.token.special:
        text += response.token.text
print(text)
```