import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/component/appbar_statistik.dart';
import 'package:lapor_kasat/app/component/body_statistik.dart';
import 'package:lapor_kasat/app/component/card_pengaduan.dart';
import 'package:lapor_kasat/app/pages/detail_pengaduan.dart';

class StatistikKonfirmasi extends StatelessWidget {
  StatistikKonfirmasi({Key? key}) : super(key: key);

  final statistikList = [
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
  ].obs; // Make your list observable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomBody(statistikList: statistikList),
    );
  }
}
