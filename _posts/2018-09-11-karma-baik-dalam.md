---
layout: post
title: Karma baik dalam unit Testing
author: ndaru
categories: ["Unit Testing", "Karma", "Software Development", "Software Engineering"]
image: https://miro.medium.com/max/4475/1*HHDukZRJntS_i2nc9ouNrQ.png
---

### Cacat yang muncul pada fase produksi memiliki ongkos lebih besar daripada saat pengembangan.

Berkaca pada [kasus Samsung Note 4](https://www.forbes.com/sites/maribellopez/2017/01/22/samsung-reveals-cause-of-note-7-issue-turns-crisis-into-opportunity/#3c01110d24f1) yang lalu, pabrikan ini melakukan perbaikan pada segi testing menjadi lebih menyeluruh. Namun hal ini tidak mengurangi kerugian samsung sebesar [5.3 miliar dollar](https://www.usatoday.com/story/tech/2016/10/14/samsung-note-7-recall-cost-least-53-billion/92040942/) dari segi penukaran produk maupun pengembalian dana, termasuk tergerusnya tingkat kepercayaan konsumen, hingga [larangan masuk ke kabin dan bagasi pesawat](https://money.cnn.com/2016/10/14/technology/samsung-galaxy-note-7-flight-ban/index.html).

Tentunya apabila tes ini dilakukan sebelum rilis dari produk, kerugian ini dapat diminimalisir secara signifikan.

Kembali ke ranah pengembangan aplikasi. Dalam lingkup siklus hidup pengembangan perangkat lunak ada suatu fase testing, dimana dilakukan pengecekan kelayakan sebelum produk tersebut rilis.

Secara garis besar ada 2 jenis pengetesan pada aplikasi:

* Tes secara otomatis

Dilakukan dengan membuat skenario yang dijalankan melalui aplikasi internal atau eksternal. Digunakan untuk melakukan tes secara berulang secara cepat. Tipe tes ini dapat dijalankan dalam berbagai tingkatan mulai dari *method/function* di dalam *class* hingga pengetesan antar muka pengguna yang rumit.

* Manual Testing

Dilakukan oleh manusia, dengan melakukan klik dan interaksi melalui aplikasi atau API (postman/soap UI/paw). Relatif mahal dikarenakan memerlukan set pada environment khusus dan memiliki tendensi untuk terjadi kesalahan, atau melakukan by-passpada tes yang sering dilakukan

**Mengapa perlu unit testing?**

![ongkos penemuan bug](https://cdn-images-1.medium.com/max/4972/1*HHDukZRJntS_i2nc9ouNrQ.png)

*Replikasi masalah*

Pada fase pengembangan aplikasi, seringkali data yang dikelola sedikit, hanya menggunakan 1 *browser *dan menggunakan bantuan *debugger*. Berbeda ketika ditemukan di fase produksi, *bug* lebih susah ditemukan penyebabnya dan di rekonstruksi ulang.

*Ongkos penemuan error*

*Error* juga menjadi lebih mahal setiap melewati fase pengembangan.

Ada beberapa poin ketika *bug* muncul di *production*:

* Pengembang menghabiskan sumber daya untuk menemukan dan memperbaiki *error.*

* Hilangnya pendapatan + kepercayaan akibat ketidak puasan pelanggan.

### Selentingan yang muncul…

**Unit Test hanya membuang waktu development?**

Bila dihitung dari waktu pengembangan aplikasi. Bisa dikatakan benar.

Namun bilamana terjadi temuan cacat produk. Maka diperlukan usaha untuk melakukan perbaikan. Bila hanya kode relatif bisa dikontrol. Bagaimana bila data juga tercemar. Perlu ada *seeder* dan migrasi perbaikan yang cukup menguras emosi dan tenaga.

![Tanpa unit test](https://cdn-images-1.medium.com/max/3056/1*1GfY_kwYlkV9Ytyl0hWGPw.png)

Dibandingkan dengan menggunakan unit test. Dimana waktu pengembangan seakan terlihat lebih lama tapi tidak meninggalkan residu atau hutang perbaikan di masa mendatang.

![Dengan unit test](https://cdn-images-1.medium.com/max/2140/1*adzw24daMSeYL7rTpQ2o5A.png)

Sehingga apabila dihitung dari waktu untuk memperbaiki bug saat muncul di produksi, mereplikasi bug muncul hingga mencari cara untuk perbaikan dan melakukan tes ulang, maka waktu pengerjaan setelah pengembangan aplikasi akan lebih panjang. Selain juga menyandera kita untuk menambah fitur baru.

Atau pernahkah kita merasa khawatir bahwa fitur baru yang akan kita implementasikan akan mengganggu atau membuat rusak pada modul lain.

Jadi masihkah kita mengesampingkan unit testing.
>  Menunda unit testing sama seperti kita menunda membayar hutang, yang menjadi bunga berbunga yang akan mencederai kita di kemudian hari

**Bicara gampang bos, tapi bagaimana nih bila aplikasi sudah *live *namun tidak ada unit test.**

Ada beberapa pendekatan yang bisa ditempuh:

**Pertama** tentukan prioritas dari data.

* Temukan error yang sering muncul

![error di production](https://cdn-images-1.medium.com/max/4176/1*xvgHgMLut4AHkg4gmKb_4A.png)

— Lebih penting mana — error yang muncul 900 x

— atau error yang muncul 29 x

Hmm tergantung,

Mana yang paling banyak berpengaruh pada user? Error koneksi ke database lah yang paling berpengaruh dan harus diatasi terlebih dahulu.
>  [Amazon](https://www.datacenterdynamics.com/news/amazon-to-credit-customers-affected-by-outage/) termasuk perusahaan yang mengukur dampak gangguan ke pelanggan sebagai prioritas. Pemrioritasan ini akan membantu mengalokasikan sumber daya secara efisien.

**Kedua**, pisahkan kode yang ingin dites dari konektor seperti API, database, redis. Sehingga input dapat dikontrol dan output dapat dibandingkan dengan hasil yang diinginkan.

**Oke deh saya mau mencoba unit testing, darimana saya memulai**

Untuk meng-otomatisasi tes. Pertama yang harus dilakukan adalah menulis skenario menggunakan kerangka tes yang sesuai dengan aplikasi. [PHPUnit](https://phpunit.de/), [Mocha](https://mochajs.org/), [RSpec](http://rspec.info/), [NUnit](https://docs.microsoft.com/en-us/dotnet/core/testing/unit-testing-with-nunit), [JUnit](https://junit.org/) adalah contoh untuk penggunaan PHP, Javascript, Ruby, .Net dan Java. Tentunya banyak alternatif berhadiran untuk setiap bahasa pemograman yang dapat diriset dan didiskusikan pada komunitas pengembang, mana yang paling cocok untuk diimplementasikan.

**Kita sudah punya unit test, apa nih langkah seterusnya**

![](https://cdn-images-1.medium.com/max/2000/0*Y5UlNQYmZQXltfP1)

Tes harus berjalan sebelum fase rilis. Bila tidak tes akan menjadi kadaluarsa. Unit test yang dijalankan di lokal juga seringkali di-*bypass* sebab terkadang memerlukan waktu lama untuk eksekusi.

Setelah tes berhasil dieksekusi via *script terminal*, kita bisa mengimplementasikan secara otomatis melalui *Continuous Integration Server *seperti Ba[mboo](https://de.atlassian.com/software/bamboo), [Jenkins](https://jenkins.io/) atau layanan awan seperti [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines). Layanan ini akan membantu memonitor *repositories *dan menjalankan *test suite* kapanpun perubahan diunggah ke repository

![Hasil test di Bitbucket](https://cdn-images-1.medium.com/max/3720/1*r2tBWvmv1XDTrST527FcpQ.png)

Detail dari tes yang dijalankan melalui *continous integration.*

![Unit test sebagai salah satu pengecekan](https://cdn-images-1.medium.com/max/3376/1*-EubVMct_QywhfehQBsnsg.png)

Sehingga setiap kode baru/perubahan yang rilis dipastikan telah lolos inspeksi. Baik secara fungsionalitas maupun tidak mengganggu kode yang telah berjalan.
>  Unit testing tidak menghilangkan 100 % bug namun dapat mencegah defect yang diprediksi tidak muncul kembali.

Tentunya ketika kita diterjunkan ke aplikasi yang sudah berjalan kita ingin dapat mudah memahami alur prosesnya. Dan kepastian bahwa kode yang kita kerjakan tidak merusak fungsi lain di aplikasi akan memberi kenyamanan bagi pengembang.

Akhir kata, *unit testing* akan menjadi warisan bagi pengembang aplikasi selanjutnya untuk meneruskan kerja kita dan menjadi salah satu pengingat kode yang telah dihasilkan.
>  Unit test yang baik akan membantu pengembang lain untuk mengembangkan kode yang kita buat, serta membantu pengecekan bahwa kode yang mereka buat tidak merusak kode yang kita hasilkan.

### Jadi warisan seperti apakah yang akan kita tinggalkan?

Pranala :

[different types of testing in software](https://www.atlassian.com/continuous-delivery/different-types-of-software-testing) — attlasian

[what is the cost of defects in software testing ](https://www.utest.com/articles/what-is-the-cost-of-defects-in-software-testing)— uTest

[cost of defects in software testing](https://www.astegic.com/the-cost-defects-software-testing/) — astegic

[cost of software errors](https://raygun.com/blog/cost-of-software-errors/) — raygun

[what is the cost of defects in software testing](http://tryqa.com/what-is-the-cost-of-defects-in-software-testing/) — tryqa
