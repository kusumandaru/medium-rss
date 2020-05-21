---
layout: post
title: Membuat personal touchbar
author: ndaru
categories: ["Vscode", "Touch Bar", "Ruby on Rails"]
image: https://miro.medium.com/max/1125/1*JfjtG0s419RtEZk-nuF93w.png
featured: false
---

Touch bar telah didukung [visual studio code](https://code.visualstudio.com/updates/v1_17#_macos-touch-bar-support), yang implementasinya dapat dilihat pada *repository *[microsoft](https://github.com/Microsoft/vscode-extension-samples). Kita juga dapat menggunakan tutorial yang disampaikan [Dan Kelch](https://spin.atomicobject.com/2018/01/28/vs-code-mac-touch-bar/) yang terstruktur dan jelas.

Kita coba implementasi lebih lanjut menggunakan perintah *terminal *dan memanggil extension dari modul lain yang dapat kita kustomisasi *shortcut icon-*nya.

![shortcut icon](https://cdn-images-1.medium.com/max/2000/1*JfjtG0s419RtEZk-nuF93w.png)

**Langkah pertama** siapkan *icon* dengan ukuran 44x44 px. Gunakan rasio 40% gambar berada di pusat kanvas.

![rasio ikon dengan kanvas](https://cdn-images-1.medium.com/max/2000/1*7R6AB4lKIrDZ66dJnirXug.png)

simpan di folder assets/

**Langkah kedua**, siapkan [extension generator](https://code.visualstudio.com/docs/extensions/yocode). Kita menggunakan *template *dari [Yeoman](http://yeoman.io/) untuk membuat extesion ‘Hello World’ yang akan kita rubah dengan menggunakan terminal.

    npm install -g yo generator-code
    yo code

![](https://cdn-images-1.medium.com/max/2000/1*D5yYQiU_wY5ZecaliNjKpA.png)

Pilih Typescript (untuk tutorial ini) dan isi dengan nama proyek, semisal rails-touchbar, untuk selanjutnya anda dapat menekan enter (default value), isi publisher dengan nama anda.

![](https://cdn-images-1.medium.com/max/3460/1*hzkBa6zjtulnPWfT57AkXg.png)

lalu buka menggunakan perintah code rails-touchbar

**Langkah ketiga, **kita kenali dan rubah beberapa file berikut:

***package.json***

 <script src="https://gist.github.com/kusumandaru/9fb592f53243f53e9deccff5ee607fa8.js"></script>

Pada sesi activationEvents : pilih '*' untuk auto load semua modul

Pada bagian Commands terbagi menajdi beberapa bagian:

* command: ekstensi yang ingin dipanggil (internal modul)

* title: Judul ekstensi -> salin gambar ke internal proyek

* icon: *path *untuk asset yang ingin di-load pada touchbar

Pada bagian touchBar terbagi menjadi beberapa aspek:

* command: ekstensi yang ingin dipanggil (internal modul)

* when: kapan ekstensi akan muncul ke touchbar

    "when": "editorLangId == markdown",

***extension.ts***

<script src="https://gist.github.com/kusumandaru/d6165045696a329741c8d5d66575c927.js"></script>

Disini kita memasang extension yang ingin dipasang:

Terdapat 2 fungsi dasar:

* memanggil terminal dan mengisi command seperti “git push”

* memanggil extension lain yang ada di dalam visual studio code seperti rubocop clean

Untuk melihat daftar extension yang jalan di visual studio code, run vscode.extension.all; di debug windows

![](https://cdn-images-1.medium.com/max/4452/1*hmB_39rY91gMvtdjgomWSg.png)

copy id nya untuk kita panggil dengan menulis

var rubocopExtension = vscode.extensions.getExtension('misogi.ruby-rubocop');

bila belum aktif dapat kita aktifkan dengan command rubocopExtension.activate();

Kita dapat mendapat daftar extension command dengan cara vscode.extensions.all[82]['packageJSON']['contributes']['commands'];

82 adalah list dimana extension rubocop berada

![](https://cdn-images-1.medium.com/max/3200/1*Dn0daMigqheNJXJGS7TiDA.png)

Selanjutnya kita dapat memanggilnya denganvscode.commands.executeCommand('editor.action.formatDocument');

Kita save dan kita coba dengan menekan fn-f5 atau tombol play di touchbar.

### Pasang ekstensi

Untuk meng-export ekstensi ke lokal dengan cara

To install the extension locally, copy the project to ~/.vscode/extensions/rails-touchbar:

cp -r ../rails-touchbar ~/.vscode/extensions

### Rilis ekstensi ke marketplace

install VSCE npm install -g vsce

Daftarkan dan dapatkan Personal access token di [sini](https://docs.microsoft.com/azure/devops/organizations/accounts/create-organization-msa-or-work-student)

lalu pada root folder ekstensi, jalankan vsce login {user anda}

untuk tutorial versi official bisa dilihat [disini](https://code.visualstudio.com/api/working-with-extensions/publishing-extension)

lalu vsce publish dan kode anda sukses muncul di marketplace

![](https://cdn-images-1.medium.com/max/2000/1*iGW9Ft5d2BORlPc_VeZpXA.png)

Selamat mencoba..

Repository dapat diunduh [disini](https://github.com/kusumandaru/rails-touchbar)
