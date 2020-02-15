---
layout: post
title: Build docker image from github repository
author: ndaru
categories: ["Docker", "Github"]
image: https://cdn-images-1.medium.com/max/4212/1*QCFJcnmMnwZ1DZJpjfk0OQ.png
featured: false
---

We can integrate github to build docker image with just few steps and it comes easily in nowadays. This is one of example:

In github put your Dockerfile in root folder like [this](https://github.com/kusumandaru/ruby-chromedriver)

than go to [hub docker](https://hub.docker.com/). Choose create -> create automate build

![](https://cdn-images-1.medium.com/max/2000/1*v374824w-uWz3t6n3zo9Eg.png)

choose from spesific repo, now support two types, either bitbucket or github.

choose link account than fill your credential.

![](https://cdn-images-1.medium.com/max/2000/1*ByeRIAKjqw55NPAiHjqLdA.png)

Than choose repository to build image

![choose ruby-chromedriver](https://cdn-images-1.medium.com/max/5032/1*LswVWeSXUTsAGwkN8Dv9Lg.png)

choose build than let reset docker hub to build image. you can check status of your build on tab build details

![](https://cdn-images-1.medium.com/max/3252/1*OgOpCvhNUzZV9u0qHk1L5w.png)

Than if success your docker image updated/created succesfully.

For spesific case you can choose spesific branch, so image can have spesific tags rather than master.
