+++
title = "Advice to my past self getting into Deep Learning"
date = 2023-09-03T15:21:01+02:00
showtoc = true
draft = false
+++

I remember, back in 2018 while I was a Physics undergrad, to stumble upon Generative Adversarial Networks (GAN) and become amazed by the results that could be obtained. Since that moment, I became really interested on knowing more about neural networks and how do they work. In fact, it ended up becoming my main interest and started pursuing a PhD in this field, instead of quantum computing or theoretical physics, which were my other big interests. Maybe it was the combination of problem-solving, maths and coding that caught my attention, or the sheer amount and variety of exciting papers that were published month by month. Either way, I found myself stepping into the shores of Machine Learning, and finally getting into deep waters once that I finished my degree and had a little more time.

Some time ago, while I was surfing on the web, I read somewhere that a meaningful thing to do is to **write about things that your past self would have wished to read**. I remember the confusion and overwhelming feeling that I got when getting into AI, there were many exciting places to start! I must admit that the process of learning is not a straight path by any means, and this is one of the facts that make it so exciting. However, this doesn't mean that some guidance or advice can't be useful. In fact, some of the most valuable lessons can be found into others' people posts, as it has happened to me personally. Following this idea, I have decided to write my first post about giving advice that my past self would have wanted to know when getting into the field of AI. I don't intend this to be a comprehensive bible on how to get into the field, but just to informally present a series of advice and/or resources that I wished I knew earlier in my career. 

## Before we start: a word on deep work and distractions

We live in the era of information. We have millions of videos, movies or series just one click away, we have social networks, e-mails, messages... This is a double-edged sword; it is true that we have an almost instant access to an incredible amount of extremely valuable information, but on the other hand, it is too easy to get caught in a distraction loop: you open Instagram/Twitter to check something quick and end up scrolling trough memes for an hour, you open YouTube to put music and end up watching videos of dudes building mud mansions with sticks. I'm sure that you can also think of a similar situation that happened to you in the last few days, and it's completely normal! We are humans, and these apps are literally designed to catch your attention. 

Don't get me wrong, I think that these can be amazing tools; I myself discovered a lot of interesting papers and blog posts that made a significant impact in my career through Twitter, as well as lots of interesting things through YouTube. The point that I'm trying to make here is that **getting distracted in the current world is extremely easy**. 

However, if you want to learn about any topic, you'll need to keep a **deep focus**, and these distractions are super likely to get in your way. Because of this, my first advice is that **you should cultivate a habit of deep working**. What do I mean by this? **Deep work is a state where we are completely focused on a single task, with no distractions**: for me, this means not checking emails in between, no music... just working on the single task that you have proposed.

The ability to maintain deep focus can be trained: the more you try, the longer you will be able to keep focus. Therefore, I recommend that you choose a task that you want to do, and then start doing it with no distractions until you can't keep focus. Then, rest by taking a walk, laying on the couch... something that doesn't distract you that much, and then keep going. You'll see that your capacity will increase. As a reference, studies show that humans can keep deep focus at full capacity up to 4 daily hours on total, so don't blame yourself if you can't have laser focus during 12 hours, it's completely normal! 

Anyway, this looks like obvious advice, but it's often completely overlooked despite being extremely important. You'll notice that by specifying clear tasks and commiting to fully focus on them, one at a time with no distractions, **will get you further in a shorter time**.

If you are interested in this topic, I recommend that you read the book [Deep Work: Rules for Focused Success in a Distracted World](https://www.goodreads.com/en/book/show/25744928) by Cal Newport, specially the first part.


## Learn the Basics

In my opinion, I think that the most important thing when it comes to learn about anything is to **get a solid grasp on the fundamentals**, specially on a field that is so rapidly changing: a popular model/architecture/technique can become completely obsolete in a matter of weeks or months, but if you really understand the underlying concepts, you'll be able to easily keep track of future advances in the field. Moreover, it will also equip you with the necessary tools to contribute on such progress.

Specifically, Deep Learning makes use of a diverse toolkit consisting of **mathematics**, **programming** as well as **machine/statistical learning** (Deep Learning is a subfield of Machine Learning, hence it is important to know the basics!). 

You'll need a decent amount of **maths** knowledge, as it will make building neural networks, reading papers, etc. way easier. Typically, the mathematics used on Deep Learning are not specially advanced, so you can just learn the basics and learn about more specific topics as required along the way. At the very least, you'll need to know basic **linear algebra** (you'll soon discover that, when building a neural network, most of the time is spent on tensor manipulation and figuring out dimensions), **calculus** (gradient descent is just doing partial derivatives on the weights) and **statistics** (this is probably the most important!).

In my case, I already had a decent background on mathematics due to studying a Physics degree, but if I had to re-learn again, I would choose any basic book/online course (it's really easy to find free online courses given by top universities) for each of the topics above to learn the basics to get into the cool stuff as soon as possible. There are also excellent resources on YouTube, such as [3Blue1Brown's channel](https://www.youtube.com/@3blue1brown). If you already have some knowledge of mathematics but you don't know if it will be enough, I'd recommend you to start learning ML (more on that later) and go back to learn mathematics only if you are not able to keep up.

Obviously, you'll also need a strong knowledge of **programming**. Almost all neural networks are programmed on Python, so you'll to know how to code at least on Python. This was my weakest point, as I had very little programming-related subjects on my degree, so I had to learn by myself. I did a ton of programming courses, read lots of books... but if I could talk with my old self, I would recommend him to:

1. Take a basic programming course on Python to get a solid grasp of the fundamentals. I recommend doing [Harvard CS50's Introduction to Programming with Python](https://cs50.harvard.edu/python/2022/).
2. After doing the course, you could go straight to learn ML, but if the course has left you wanting more, I recommend that you read a C/C++ programming book. You don't have to read the whole book, but skimming and focusing on something like pointers and doing some exercises will vastly improve your ability to code. I recommend you to read the [K&R Book](https://kremlin.cc/k&r.pdf). 
3. If you want, I also recommend that you do some little coding challenge every now and then, such as [Hackerrank](https://www.hackerrank.com/) and [Project Euler](https://projecteuler.net/) to sharpen your algorithmic thinking.


Once that you have the basics on maths/programming dialed in, it's time to finally get into AI! As Deep Learning is a subfield of Machine Learning, it's really important that you get a grasp on the **fundamentals of ML**. After doing lots of courses and reading lots of books, the resources that I found the most useful were:

- [Andrew Ng's Machine Learning course](https://www.coursera.org/specializations/machine-learning-introduction): This course focuses on understanding the underlying mathematical concepts of basic ML algorithms, as well as implementing them, which I found extremely useful! In my case, I did and old version of this course a long time ago, but I can say that it gave a solid grasp of ML fundamentals.
- [An Introduction to Statistical Learning](https://www.statlearning.com/): This book was introduced to me by a great teacher during my Master's Degree and, in my opinion, it's the best ML book that I've read. This book leans more into the statistical rather than the coding/practical side, but you'll be grateful to have a good base of statistics when you get into DL!


## Learn Deep Learning

It's been a long way, but now we're ready to get into Deep Learning! As DL has become really popular, the internet is **completely flooded** of learning resources. Again, this is a double-edged sword: there are lots of useful resources out there, but it is really easy to get lost. I personally found myself in that situation, reading lots of random books and doing random courses and feeling that I wasn't actually learning. **Honestly, I recommend you to do these two things if you want to get into DL**:

1. [Read the Deep Learning Book](https://www.deeplearningbook.org/). This is literally the bible of DL, you don't need anything else when it comes to learning the theoretical foundation of DL. The first part is a refresher of the basics that we discussed in the previous section; you can skip it or skim it, whatever you decide. The **second part** is where you want to focus your attention, as it gives an excellent introduction to the basics of DL. The third part contains more advanced topics, so you can skip it if you want.
2. Watch and do the exercises of the [2016 CS231n Course](https://www.youtube.com/watch?v=NfnWJUyUJYU&list=PLkt2uSq6rBVctENoVBg1TpCC7OQi31AlC) lectured by Andrej Karpathy. I specially loved this course because it tries to give you some tricks and intuitions that are extremely useful when working with neural networks. Also, you will **literally build neural networks from scratch**, which in my opinion is one of the best ways of really understanding neural networks. 
3. Watch the course [Neural Networks: from Zero to Hero](https://www.youtube.com/watch?v=VMj-3S1tku0&list=PLAqhIrjkxbuWI23v9cThsA9GvCAUhRvKZ). Also given by Andrej Karpathy, it focuses more into language models, which are currently the most popular architectures around. It complements very well with CS231n, as the previous focuses more on convolutional neural networks.

If you do these three things (the order doesn't matter), I can assure you that you will have a strong grasp of the fundamentals of DL.

## Keep Learning!

Now it comes the most exciting part, which is to choose your own way! Once that you get a grasp on the basics, you will be able to learn about anything that catches your attention. I personally recommend you to try out these two things:

1. **Read and implement papers:** to be able to understand and implement papers is exciting, as well as being a required ability if you want to get into research. I recommend you to start by reading/implementing easier papers, such as [Image-to-Image Translation with Conditional Adversarial Nets
](https://phillipi.github.io/pix2pix/). You can also look at [already implemented papers](https://nn.labml.ai/) and choose one that excites you the most. 

2. **Join a Kaggle Competition:** Kaggle Competitions makes you work on a real-world problem, so it's the perfect oportunity to put all your skills to test. Moreover, you can meet people with the same interests than you, and you could even earn some cash if you win! 





