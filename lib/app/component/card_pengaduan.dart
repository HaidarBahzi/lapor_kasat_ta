import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPengaduan extends StatelessWidget {
  final String gambar;
  final String keterangan;
  final String waktu;
  final String judul;
  final String deskripsi;
  final VoidCallback onTap;

  const CardPengaduan({
    required this.gambar,
    required this.keterangan,
    required this.waktu,
    required this.judul,
    required this.deskripsi,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          leading: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              gambar,
              fit: BoxFit.cover,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    keterangan,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color(0xFF979090),
                    ),
                  ),
                  Text(
                    waktu,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color(0xFF979090),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                judul,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                deskripsi,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
