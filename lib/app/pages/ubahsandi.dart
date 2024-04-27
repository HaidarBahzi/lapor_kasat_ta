import 'package:flutter/material.dart';

class UbahSandiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        color: Colors.blue, // Background color biru keseluruhan halaman
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10), // Tambahkan spasi atas
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10), // Tambahkan margin top dan bottom
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/kunci.png'),
                      ),
                    ),
                    SizedBox(
                        height: 10), // Tambahkan spasi antara gambar dan teks
                    Text(
                      'Ubah Kata Sandi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Buat kata sandi baru anda',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15), // Tambahkan spasi antara gambar dan card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20), // Jarak dari atas
                      Row(
                        children: [
                          Icon(Icons.lock), // Icon untuk Masukkan Sandi
                          SizedBox(width: 10),
                          Text(
                            'Masukkan sandi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan kata sandi lama anda',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ), // Atur padding input box
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.lock), // Icon untuk Buat Kata Sandi
                          SizedBox(width: 10),
                          Text(
                            'Buat kata sandi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'buat kata sandi baru anda',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ), // Atur padding input box
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.lock), // Icon untuk Konfirmasi Kata Sandi
                          SizedBox(width: 10),
                          Text(
                            'Konfirmasi kata sandi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Konfirmasi sandi baru anda',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ), // Atur padding input box
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Simpan action
                          },
                          child: Text(
                            'Ubah Kata Sandi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UbahSandiPage(),
  ));
}
