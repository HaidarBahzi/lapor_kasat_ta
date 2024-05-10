import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/component/card_pengaduan.dart';
import 'package:lapor_kasat/app/pages/detail_pengaduan.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Rekap Pengaduan',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  final List<Map<String, dynamic>> Pengaduan;

  const CustomBody({Key? key, required this.Pengaduan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Pengaduan.isEmpty
        ? Center(
            child: Text(
              'Tidak ada data',
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: Pengaduan.length,
            itemBuilder: (BuildContext context, int index) {
              final pengaduan = Pengaduan[index];
              final gambar = pengaduan['gambar'] ?? '';
              final keterangan = pengaduan['keterangan'] ?? '';
              final waktu = pengaduan['waktu'] ?? '';
              final judul = pengaduan['judul'] ?? '';
              final deskripsi = pengaduan['deskripsi'] ?? '';

              return CardPengaduan(
                gambar: gambar,
                keterangan: keterangan,
                waktu: waktu,
                judul: judul,
                deskripsi: deskripsi,
                onTap: () => Get.to(() => DetailPengaduan()),
              );
            },
          ));
  }
}

class RekapPengaduan extends StatelessWidget {
  RekapPengaduan({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> Pengaduan = [
    {
      'gambar': 'assets/detail.png',
      'keterangan': 'Selesai',
      'waktu': 'Kemarin',
      'judul': 'Terjadi tawuran antar...',
      'deskripsi': 'Ada tawuran antar sekolah...'
    },
    {
      'gambar': 'assets/detail2.png',
      'keterangan': 'Konfirmasi',
      'waktu': 'Hari ini',
      'judul': 'Pencurian Di Pasar Biting...',
      'deskripsi': 'Saya menemukan adanya pencurian...'
    },
    {
      'gambar': 'assets/detail3.png',
      'keterangan': 'Konfirmasi',
      'waktu': 'Hari ini',
      'judul': 'Pungutan Liar Di Indomaret',
      'deskripsi': 'Saya menemukan adanya pungli...'
    },
    {
      'gambar': 'assets/detail4.png',
      'keterangan': 'Tertindak',
      'waktu': 'Hari ini',
      'judul': 'Kericuhan di Pasar Kliwon',
      'deskripsi': 'Ada kericuhan antara penjual...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomBody(Pengaduan: Pengaduan),
    );
  }
}
