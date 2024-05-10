import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/component/appbar_statistik.dart';
import 'package:lapor_kasat/app/component/body_statistik.dart';
import 'package:lapor_kasat/app/component/card_pengaduan.dart';
import 'package:lapor_kasat/app/pages/detail_pengaduan.dart';

class StatistikTertindak extends StatelessWidget {
  StatistikTertindak({Key? key}) : super(key: key);

  final statistikList = [
    {
      'gambar': 'assets/detail4.png',
      'keterangan': 'Tertindak',
      'waktu': 'Hari ini',
      'judul': 'Kericuhan di Pasar Kliwon',
      'deskripsi': 'Ada kericuhan antara penjual...'
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
