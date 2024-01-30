+++
title = "Predicting digits with a neural network in C"
date = "2024-01-30T11:35:52+01:00"
katex = true
+++

**Note:** Here I will write down my notes related to my [baccpropagation project](https://github.com/jgcarrasco/baccpropagation), specifically related to building a simple 1-layer NN to predict digits from the [MNIST dataset](http://yann.lecun.com/exdb/mnist/) in C language. I will keep adding notes as I advance through the project, so expect it to be a little bit messy at first!

## TODO
- [ ] Implement code to read the dataset and images, maybe print them in terminal.
## Input Data

The MNIST dataset contains handwritten digits and has a training set of 60000 examples, and a test set of 10000 examples. The images are 28x28 pixels. I'm going to try implementing the code to load the data directly from the binary format provided. As an example, it can be seen at the end of the MNIST webpage what the format of the training set is as follows:

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