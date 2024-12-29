---
title: Neural Physics Engine
---

# Simulating Games with Neural Networks

I recently found out about [Oasis](https://oasisaiminecraft.com/), an AI-generated Minecraft clone. Roughly, my guess is that they trained a neural network to predict the next frame of the game given the current frame and the user input. Once trained, the neural network has learned a model of how the game works, and what you see is the result of the neural network "dreaming" about the next step. I find this extremely cool, you can actually play it directly from the website and I recommend you to do it. You can find really trippy situations, such as placing a block, moving the camera and finding out that the block has disappeared.

I find that this is similar with how current Large Language Models (LLMs) work: 

1. They are pretrained on a large chunk of the internet to predict the next word/token of the sequence.
2. It turns out that, if you do this with sufficient data, a sufficiently large LLM and for long enough, the LLM learns some kind of internal model.
3. If you input a prompt to the pretrained LLM, it will continue the sequence by "dreaming" about it.

Note that in order for an LLM to be "useful" it has to be fine-tuned to answer questions, or perform instructions. Otherwise, it's just a "dreaming" machine. Actually, you can sometimes see hints of this "dreaming" also called hallucinations. For example, you may ask ChatGPT to search for references of a given topic and provide papers that look legit but do not actually exist.

Now, it is desirable to reduce the amount of hallucinations when using LLMs to build useful tools such as a QA chatbot, but I find the dreaming aspect really interesting. That's why I have decided to build something similar to Oasis. Obviously, I'm just a PhD student doing this on his free time so I am going to look for a simpler alternative. This is also the perfect opportunity to get involved in the whole process of creating a ML project: from the dataset curation, to building the model, to training it, to deploying it. Also, instead of waiting until the project is finished to share this blog post, I am going to make it public since the beginning in the hopes that I commit to it. Also, I think that it might be a cool experiment to really show the obstacles that I find along the way. 

## Design

These major questions must be addressed:

- **What game do we choose?** It should be cool but also simple, with as few inputs as possible.
- **How do we get the data?** It is quite likely that I'll have to play myself to compile the data. Or better yet, use a trained RL agent to play for myself.
- **What model do we use?** Most likely a CNN or a Vision Transformer.
- **How do we train it?** We feed in the current input + state and train it to predict the next state.

### TO DO

- Research for a bit about simulation with neural networks 

### Resources

- <https://joshmoody.org/blog/emulating-pong-neural-network/>
- <https://arxiv.org/pdf/1507.08750>