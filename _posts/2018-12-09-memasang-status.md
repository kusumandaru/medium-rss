---
layout: post
title: Memasang status build aplikasi pada github
author: ndaru
categories: ["Github", "Status", Repositories", "Dotnet Core", "Pipeline"]
image: https://miro.medium.com/max/1076/1*N-bToix9t6hG0qFKzf91pw.png
featured: false
---
Status build untuk aplikasi kita di repository dapat menambah nilai lebih di repo kita atau dapat menjadi acuan bahwa kerja dengan lintas anggota dapat lebih terjaga.

Untuk contoh saat ini kita akan menggunakan repository github dan appveyor sebagai pipeline buildnya. Basis kode yang digunakan adalah dotnet core. Untuk bahasa lainnya akan dapat diatur pada konfigurasi build.

Langkah pertama, usahakan kode yang di-cek telah memiliki unit test. Sehingga apabila ada commit yang terunggah pada repository dapat dicek.

Kedua masuk ke web [appveyor](https://ci.appveyor.com/projects), daftar menggunakan akun repository.

Pada menu Project pilih new project.

![New project](https://cdn-images-1.medium.com/max/2000/1*WOKkM8yQfpXgg5k7s_hRWg.png)

Pilih dan authorize salah satu repository yang disediakan, mulai dari github, bitbucket, gitlab, klin dan lainnya.

Pilih repo yang dibuka aksesnya.

![](https://cdn-images-1.medium.com/max/2236/1*t5p9D9xiwJ9OmxCdgWygFw.png)

Lalu pada project tab, pilih project yang ingin dibuild.

![](https://cdn-images-1.medium.com/max/4012/1*2xi2DpntecUDZm-gHQfqlg.png)

Current build, adalah build saat ini, history berisi daftar build yang pernah dijalankan, settings untuk pengaturan build.

Pada build pertama tampak error yang terjadi karena build masih menggunakan msbuild sedangkan target menggunakan dotnet build.

![](https://cdn-images-1.medium.com/max/4076/1*y6A966feUg0IfFFz5UJhtw.png)

Untuk itu kita melakukan perubahan konfigurasi build dengan merubah ke Visual Studio Code 2017

![](https://cdn-images-1.medium.com/max/2608/1*0ktppeU16R6IAYArbWWs_w.png)

Selain itu karena kita menggunakan custom build untuk melakukan build dan test menggunakan dotnet sdk.

![](https://cdn-images-1.medium.com/max/3708/1*il97-h7YHaLTiwoLZg1wdA.png)

Sehingga build dapat berjalan sukses termasuk melakukan tes didalamnya.

![](https://cdn-images-1.medium.com/max/3732/1*CQ4iRZ9FJQE2yBAViJwr9g.png)

Untuk menyisipkan kedalam readme gunakan tag image.
>  <img src=”[https://ci.appveyor.com/api/projects/status/github/{user}/{project-name}?branch={branch_name}&svg=true](https://ci.appveyor.com/api/projects/status/github/kusumandaru/message-broker?branch=master&svg=true)">

Opsi yang dapat dipilih adalah:

* branch={name} -nama branch yang dipiih

* retina=true - menampilkan sesuai retina display;

* svg=true - format gambar berbentuk svg;

dan simpan pada readme.md repo

Untuk menambah test build tag tambahkan
>  <img src=”[https://ci.appveyor.com/api/projects/status/github/{user}/{project-name}?branch={branch_name}&svg=true](https://ci.appveyor.com/api/projects/status/github/kusumandaru/message-broker?branch=master&svg=true)&passingText=Test%20-%20Passed">

dan masukkan script test pada test navigation

![](https://cdn-images-1.medium.com/max/2000/1*76IbbSA2Iqwy73qxpsuaUg.png)