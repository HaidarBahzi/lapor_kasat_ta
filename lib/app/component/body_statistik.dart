import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/component/card_pengaduan.dart';
import 'package:lapor_kasat/app/pages/detail_pengaduan.dart';

class CustomBody extends StatelessWidget {
  final List<Map<String, String>> statistikList;

  const CustomBody({Key? key, required this.statistikList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (statistikList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/ic_report.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text('Tidak ada data'),
            ],
          ),
        );
      } else {
        return ListView(
          padding: EdgeInsets.all(15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Konfirmasi',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                Text(
                  '${statistikList.length} Laporan',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFFA3A3A3)),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: statistikList.length,
              itemBuilder: (BuildContext context, int index) {
                final statistik = statistikList[index];
                final gambar = statistik['gambar'] ?? '';
                final keterangan = statistik['keterangan'] ?? '';
                final waktu = statistik['waktu'] ?? '';
                final judul = statistik['judul'] ?? '';
                final deskripsi = statistik['deskripsi'] ?? '';

                return CardPengaduan(
                  gambar: gambar,
                  keterangan: keterangan,
                  waktu: waktu,
                  judul: judul,
                  deskripsi: deskripsi,
                  onTap: () => Get.to(() => DetailPengaduan()),
                );
              },
            ),
          ],
        );
      }
    });
  }
}