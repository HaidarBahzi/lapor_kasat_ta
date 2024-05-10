import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final Map<String, dynamic>? notification;

  const CustomBody({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => notification != null
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          notification!['icon'],
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(height: 16),
                        Text(
                          notification!['keterangan'],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF979090)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification!['judul'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        notification!['waktu'],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF979090),
                            fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(notification!['deskripsi']),
                    ],
                  )
                ],
              ),
            ),
          )
        : Center(
            child: Text('Tidak ada notifikasi'),
          ));
  }
}

class DetailNotifikasi extends StatelessWidget {
  DetailNotifikasi({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> notificationsList = [
    {
      'icon': 'assets/notifikasi.png',
      'keterangan': 'INFORMASI',
      'waktu': 'Hari Ini',
      'judul': 'Laporan Telah Dikonfirmasi',
      'deskripsi':
          'Laporan anda tentang  “tawuran antar sekolah di depan rumah arya” telah dikirim'
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    final notification =
        notificationsList.isNotEmpty ? notificationsList.first : null;

    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomBody(notification: notification),
    );
  }
}
