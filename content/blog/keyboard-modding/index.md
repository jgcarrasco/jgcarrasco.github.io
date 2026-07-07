---
title: "Hacking hardware with LLM agents"
date: 2025-04-21
slug: "keyboard-modding"
description: "Modifying an old keyboard with almost zero hardware/embedded knowledge with the help of Codex"
image: index.assets/thumbnail.jpg
categories:
  - building
  - log
math: true
draft: true
---



I've been tinkering with LLMs for a long time. I remember trying ChatGPT in 2023 and finding that it was a cool toy, but without much value for real usage. Then, I experienced a progression that many people had: it got better and I started using it to generate small code snippets, but nothing too fancy (mostly visualization code).  It got even better and started using it more and more, until November of 2025 where I tried claude code and was extremely surprised with the results. Since then, I've been using agents more and more up to the point that it has reshaped the way I work.

I consider myself pretty skeptical though, and I'm always asking myself whether using agents is valuable for my work or not. If you ask people and explore different forums you'll see that people either say that LLMs are the future and will take all of our jobs, or that LLMs are worthless and don't work at all. From what I have experienced, I think that current LLMs are an amazing tool, but it strongly depends on how and where you use it. For example, using LLMs to quickly vibe code your work might be a good idea at first, but in the long run it's not typically worth it. 

Instead, you can keep using LLMs but slow down a little bit and try to understand what's going on and even learn new things during the process. One valid criticism of this approach is that it will take almost the same time than doing it manually. And I say this might be true  for things that you are really familiar with, but this changes when you are exploring less familiar territory.

What follows is hopefully an example of what I'm trying to convey. My brother gave me an old keyboard which came with an old PS/2 connection. I was curious about whether it would be possible to mod it and add an USB cable to it so I could use it with modern PCs. It turns out it was possible, and I was able to do it in a single morning with the help of LLMs:

![thumbnail](index.assets/thumbnail.jpg)

I started discussing the idea with ChatGPT and eventually decided that the best way would be to buy a small MCU and wire it up to the old controller. The MCU acts as a translator from PS/2 protocol to USB protocol.

So the first thing to do was to open up the keyboard and identify the cables. I looked at the PSU diagram from wikipedia and with the help of the multimeter I identified what was each cable doing.

{{< image src="index.assets/image-20260707160800947.png" width="300" >}}

Now that I knew

- `DATA` -> `D2`
- `CLOCK` -> `D3`
- `GND` -> `GND`
- `VCC` -> `VCC`
