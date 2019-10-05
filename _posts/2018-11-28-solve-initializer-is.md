---
layout: post
title: Solve initializer is trying to connect db on rake assets:precompile
author: angga kusumandaru
categories: ["Ruby on rails", "Initializer"]
image: https://cdn-images-1.medium.com/max/2048/1*8uE4fGeueN23XR84nQLJDA.png
featured: false
---

Sometimes, you need load connection on db using initializer/ on Ruby on rails. For some environment like test and development it’s fine. But when we try to deploy on production which make lazy load turn on. it call to database. and throw message like this.

    0m[91mMysql2::Error: Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2 "No such file or directory")

To avoid this only on rake assets, we search where file [located](https://github.com/rails/sprockets-rails/blob/master/lib/sprockets/rails/task.rb). than we skip using !defined?(selected_class)

 <iframe src="https://medium.com/media/dd6a5ac148f5e2a952a301c39d326639" frameborder=0></iframe>

Finally, when we running rake assets:precompile, we skip block code to execute.

