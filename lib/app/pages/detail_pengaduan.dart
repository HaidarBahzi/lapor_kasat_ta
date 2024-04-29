import 'package:flutter/material.dart';

class DetailPengaduan extends StatelessWidget {
  const DetailPengaduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengaduan',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/detail.png',
            width: screenWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terjadi tawuran antar sekolah di depan rumah arya',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kemarin 11.45',
                      style: TextStyle(
                          color: Color(0xFF979090),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Terkirim',
                      style: TextStyle(
                          color: Color(0xFF979090),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Color(0xFF5189C4),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Mlati Lor, Kudus',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'Ada tawuran antar sekolah di depan rumah arya pada saat saya pulang dari pasar, saya langsung kabur saat melihatnya')
              ],
            ),
          )
        ],
      ),
    );
  }
}
