+++
title = 'Text Adversarial Attacks'
date = 2023-10-11T12:01:45+02:00
draft = true
math = true
+++

**What is an adversarial example?:** Neural Networks are sensitive to small perturbations on the input, i.e. slightly changing the input can cause a large impact on the output. This can be leveraged to perform adversarial attacks.

Below you can see an example of an adversarial attack [(Goodfellow et. al., 2015)](https://arxiv.org/abs/1412.6572), where adding a small amount of noise to an image of a panda causes GoogLeNet to incorrectly classify the image as a gibbon with 99.3% confidence:

![[Pasted image 20231011113802.png|600]]

The general approach for creating adversarial samples on continuous data (such as images and audio) is to optimize the original sample $x$ by minimizing an **adversarial loss**, which encourages the model to predict incorrectly, as well as including some term that enforces that the perturbation is hard to detect for humans. However, **these gradient-based techniques cannot be directly applied on discrete data such as text**. 

### [Gradient-based Adversarial Attacks against Text Transformers](https://arxiv.org/abs/2104.13733)

