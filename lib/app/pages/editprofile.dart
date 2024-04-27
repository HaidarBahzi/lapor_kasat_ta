import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Container(
        color: Colors.blue, // Background color biru keseluruhan halaman
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10), // Tambahkan spasi atas
              Container(
                margin: EdgeInsets.symmetric(vertical: 10), // Tambahkan margin top dan bottom
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
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
                      SizedBox(height: 10), // Jarak dari atas
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        initialValue: 'laporkasat123@gmail.com',
                        style:
                            TextStyle(color: Colors.grey), // Warna teks abu-abu
                        decoration: InputDecoration(
                          hintText: 'Masukkan email Anda',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ), // Atur padding input box
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        initialValue: 'Nama lengkap',
                        style:
                            TextStyle(color: Colors.grey), // Warna teks abu-abu
                        decoration: InputDecoration(
                          hintText: 'Masukkan username Anda',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ), // Atur padding input box
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Alamat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        initialValue: 'Jawa Tengah Kudus',
                        style:
                            TextStyle(color: Colors.grey), // Warna teks abu-abu
                        decoration: InputDecoration(
                          hintText: 'Masukkan alamat Anda',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ), // Atur padding input box
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No. Hp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        initialValue: '+62 85589009876',
                        style:
                            TextStyle(color: Colors.grey), // Warna teks abu-abu
                        decoration: InputDecoration(
                          hintText: 'Masukkan nomor HP Anda',
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
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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
    home: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          // Jika layar lebar lebih besar atau sama dengan 600 (tablet atau desktop)
          return EditProfilePageDesktop();
        } else {
          // Jika layar lebih kecil dari 600 (hp)
          return EditProfilePage();
        }
      },
    ),
  ));
}

class EditProfilePageDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Container(
          width: 600, // Lebar konten desktop
          child: EditProfilePage(), // Tampilkan halaman edit profil
        ),
      ),
    );
  }
}
