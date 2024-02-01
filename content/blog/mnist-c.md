+++
title = "Predicting digits with a neural network in C"
date = "2024-01-30T11:35:52+01:00"
+++

**Note:** Here I will write down my notes related to my [baccpropagation project](https://github.com/jgcarrasco/baccpropagation), specifically related to building a simple 1-layer NN to predict digits from the [MNIST dataset](http://yann.lecun.com/exdb/mnist/) in C language. I will keep adding notes as I advance through the project, so expect it to be a little bit messy at first! Also, don't expect this to be a comprehensive tutorial or something like that, my idea is to write down the process of advancing through the project, complementing the code in the repository.

## TODO
- [x] Implement code to read the dataset and images, maybe print them in terminal.
- [ ] Write the theory behind backprop with a 1L NN.
## Input Data

The MNIST dataset contains handwritten digits and has a training set of 60000 examples, and a test set of 10000 examples. The images are 28x28 pixels. I'm going to try implementing the code to load the data directly from the binary format provided. As an example, it can be seen at the end of the MNIST webpage that the format of the training set is as follows:

```
[offset] [type]          [value]          [description]  
0000     32 bit integer  0x00000803(2051) magic number  
0004     32 bit integer  60000            number of images  
0008     32 bit integer  28               number of rows  
0012     32 bit integer  28               number of columns  
0016     unsigned byte   ??               pixel  
0017     unsigned byte   ??               pixel  
........  
xxxx     unsigned byte   ??               pixel
```

So we first have a "header" containing:
- `magic_number`: 32-bit integer (or 4 byte int) containing the magic number 2051. This is used to check that we have downloaded the correct file and our implementation is right.
- `n_images`: Number of images in the dataset, it should be 60000 in the training dataset file.
- `n_rows`: Number of rows in the image, i.e. 28.
- `n_cols`: Number of columns in the image, also 28.
And then we have `n_images * n_rows * n_cols` unsigned bytes, each one representing a pixel. The values range from 0 (white, background) to 255 (black, foreground).

> **Important note:** In the page, they state that *"All the integers in the files are stored in the MSB first (high endian) format used by most non-Intel processors. Users of Intel processors and other low-endian machines must flip the bytes of the header."* This essentially implies that we have to swap the bytes of the header integers to pass from high to low [endian](https://en.wikipedia.org/wiki/Endianness).

I struggled to even properly read the magic number (BRUH), but after a few hours I managed to read it. Once that we are able to read the header information, we can easily read images. 

After a little bit of work, I managed to print the digits on the command line:

![](/images/Pasted%20image%2020240131102320.png)

Yes, that is a five. Now, I just have to implement the functionality to store the information on a dataset.

## 1-Layer NN

Okay, now let's work through the math behind a 1-Layer NN. The input data $\mathbf{x}$ will be a real-valued vector of $28*28 = 784$ pixels (i.e. a flattened image). We will normalize from $[0, 256]$ to the $[0,1]$ range. As the NN has just one layer, it will have one neuron for every possible class. In this case, we have $10$ classes/neurons (one for every digit, from zero to nine). The output of each neuron $y_j$ will just be a linear combination of the input plus a bias term, whose coefficients will be learned during training via backpropagation.  

$$y_j = \sum_{i=0}^{784} x_iw_{ij} + b_j \qquad j=0,...10$$
Generally, the parameters $w_{ij}$ are called *weights*, and $b_j$, *biases*. We can express the above expression in vectorial/matrix form as follows: 

$$\mathbf{y} = \mathbf{x} \mathbf{W} + \mathbf{b} ,\quad \mathbf{x}\in\mathbb{R}^{784}, \mathbf{W}\in \mathbb{R}^{784\times10}, \mathbf{b}\in \mathbb{R}^{10}$$
**Logits:** That's cool, but what does $\mathbf{y}$ represent? Ideally, $y_j$ should represent the probability of predicting the $j$th digit, right? Well, not exactly! We say that this vector contains the unnormalized [logits](https://en.wikipedia.org/wiki/Logit) associated to each possible class. Intuitively, the higher the value of a logit with respect to the rest, the higher the probability of predicting the digit associated to such logit value. Essentially, the logit is defined as follows:

$$y_j = \text{logit } p_j = \log \frac{p_j}{1-p_j}$$
where $p_j$ is the probability of predicting the $j$th digit. Performing some basic math gives us that:

$$p_j = \frac{e^{y_j}}{1 + e^{y_j}} = \sigma(y_j)$$
where $\sigma$ is the [sigmoid function](https://en.wikipedia.org/wiki/Sigmoid_function). There is just one more step that we need to take: as the logits were unnormalized, we just have to normalize $p_j$ so that the probabilities sum to one (i.e. $\sum_j^{10} p_j = 1$), which is simply:
$$p_j = \frac{e^{y_j}}{\sum_i^{10} \left( 1 + e^{y_j} \right)}$$
That's it! Just so you know, the function that passes from unnormalized logits to probabilities in a multiclass problem is called the [softmax function](https://en.wikipedia.org/wiki/Softmax_function). 

**Loss:** Now, we need a way to quantify the difference between the prediction and the real result. This is defined by a function of the output of the NN and the ground truth termed the **loss function**: the lower its value, the closer the predictions will be to the ground truth. We will use the [cross-entropy loss](https://en.wikipedia.org/wiki/Cross-entropy), which in our case is just:

$$\mathcal{L}(\mathbf{y}^{gt}, \mathbf{p}) = -\sum_i^{10}y^{gt}_i\log p_i$$
where $\mathbf{y}^{gt}$ is the ground truth vector, which is simply a one-hot vector representing the correct digit. For example, if the input is the number one, then $\mathbf{y}^{gt}=(0,1,0,0,0,0,0,0,0,0,0)$. Therefore, if the correct digit is the $j$th one, we can write the loss term as:
$$\mathcal{L}(\mathbf{y}^{gt}, \mathbf{p}) = -y_j + \sum_i^{10}\log (1 + e^{y_i})$$
To get an intuition of which values does $\mathcal{L}$ takes, we can compute the following limits:

- For $y_j \to \infty, y_i \to -\infty \quad \forall i \in [0,10]\setminus \{j\}$  (i.e. perfect classification) we get that $\mathcal{L} = 0$.
- For $y_j \to -\infty, y_i \to \infty \quad \forall i \in [0,10]\setminus \{j\}$ (i.e. infinitely bad classification) we get $\mathcal{L} \to \infty$. 

**Backprop:** Okay, we have defined a 1-Layer NN, that will output the logit values associated to the possible predicted digits, and defined a loss value that tells us how well is our model doing. The problem now is that if we randomly initialize the weights of our network, the predictions will be extremely bad! How can we tweak the values of the weights so that we progressively improve the predictions? That's where the [backpropagation algorithm](https://en.wikipedia.org/wiki/Backpropagation) comes into action. The idea behind backprop is really simple: intuitively, the **gradient** of the loss with respect to a weight gives us the "direction" in which tweaking the weight causes an increase in the loss value. Therefore, if we substract this gradient to our weight **we will be tweaking the weight so that the loss is reduced**. This is expressed as:

$$w_{ij} \leftarrow w_{ij} - \alpha\frac{\partial\mathcal{L}}{\partial w_{ij}}$$
where $\frac{\partial\mathcal{L}}{\partial w_{ij}}$ is the partial derivative of $\mathcal{L}$ with respect to the weight $w_{ij}$. 