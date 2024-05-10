import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/component/appbar_statistik.dart';
import 'package:lapor_kasat/app/component/body_statistik.dart';
import 'package:lapor_kasat/app/component/card_pengaduan.dart';
import 'package:lapor_kasat/app/pages/detail_pengaduan.dart';

class StatistikTerkirim extends StatelessWidget {
  StatistikTerkirim({Key? key}) : super(key: key);

  final statistikList = [
    {
      'gambar': 'assets/detail.png',
      'keterangan': 'Selesai',
      'waktu': 'Kemarin',
      'judul': 'Terjadi tawuran antar...',
      'deskripsi': 'Ada tawuran antar sekolah...'
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
