---
layout: post
title: Memindah akun Pritunl
author: angga kusumandaru
categories: ["Pritunl", "Copy"]
image: https://cdn-images-1.medium.com/max/2000/1*z7m0an3TB8LtMegn6xZ6LA.png
featured: false
---

Terkadang kita lupa akun pritunl ketika berpindah ke gawai baru. Dan tidak ada cadangan data pritunl. Kita dapat memindahkan dari gawai lama dengan beberapa langkah sebagai berikut:

Catatan: OS yang digunakan adalah Mac

* Men-duplikasi data profile : Klik Finder pilih Tab Go -> Go to Folder dan isi dengan */Users/{user}/Library/Application Support/pritunl/profiles*

![Go to Folder](https://cdn-images-1.medium.com/max/2000/1*GOpn90sdMT60DF9h_hXU9Q.png)

* Salin ke *folder* pritunl yang baru

![profile keys](https://cdn-images-1.medium.com/max/2000/1*YsLtT41CEbIm_ISa1bNGRw.png)

* Selain data *profile*, kita juga memerlukan data *Keychain*

* Klik command — space dan ketik Keychain access

* Cari pada *keychain* dengan kata kunci nama berkas ovpn pada langkah sebelumnya

![](https://cdn-images-1.medium.com/max/3500/1*wQKenpmTrbjHT7IxnMSkxQ.png)

* Pilih Get info dan catat informasi account dan password

![Get Info](https://cdn-images-1.medium.com/max/2192/1*8Qomxv5ldadJHPN9hFormw.png)

* Buat *key* baru dengan data diatas

![](https://cdn-images-1.medium.com/max/2000/1*gyyhQmR9slxvGHe9tfTEtQ.png)

* Maka pritunl siap digunakan di gawai baru

![](https://cdn-images-1.medium.com/max/2000/1*z7m0an3TB8LtMegn6xZ6LA.png)
