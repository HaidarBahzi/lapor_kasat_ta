import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/pages/detail_notifikasi.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Notifikasi',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  final List<Map<String, dynamic>> notificationsList;

  const CustomBody({Key? key, required this.notificationsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: notificationsList.length,
          itemBuilder: (BuildContext context, int index) {
            final notification = notificationsList[index];
            return Card(
              elevation: 4, // set the elevation (shadow)
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // rounded corners
              ),
              color: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // rounded corners
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  leading: Image.asset(notification['icon']),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notification['keterangan'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF979090)),
                          ),
                          Text(
                            notification['waktu'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF979090)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        notification['judul'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(notification['deskripsi']),
                    ],
                  ),
                  onTap: () {
                    Get.to(DetailNotifikasi());
                  },
                ),
              ),
            );
          },
        ));
  }
}

class Notifikasi extends StatelessWidget {
  Notifikasi({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> notificationsList = [
    {
      'icon': 'assets/notifikasi.png',
      'keterangan': 'INFORMASI',
      'waktu': 'Hari Ini',
      'judul': 'Laporan Telah Dikonfirmasi',
      'deskripsi': 'Laporan "Pencurian di pasar bitingan..."'
    },
    {
      'icon': 'assets/notifikasi.png',
      'keterangan': 'INFORMASI',
      'waktu': 'Hari Ini',
      'judul': 'Laporan Telah Dikonfirmasi',
      'deskripsi': 'Laporan "Pencurian di pasar bitingan..."'
    },
    {
      'icon': 'assets/notifikasi.png',
      'keterangan': 'INFORMASI',
      'waktu': 'Hari Ini',
      'judul': 'Laporan Telah Dikonfirmasi',
      'deskripsi': 'Laporan "Pencurian di pasar bitingan..."'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomBody(notificationsList: notificationsList),
    );
  }
}
