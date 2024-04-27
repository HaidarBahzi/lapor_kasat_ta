import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/pages/editprofile.dart';
import 'package:lapor_kasat/app/pages/profile.dart';
import 'package:lapor_kasat/app/pages/ubahsandi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: {
       '/profil': (context) =>
            ProfilePage(), 
        '/editprofil': (context) =>
            EditProfilePage(), 
        '/ubahsandi': (context) =>
            UbahSandiPage(), 
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Text('Main Content'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Action when Home icon is pressed
              },
            ),
            IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                // Action when Bookmarks icon is pressed
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context,
                    '/profil'); 
              },
            ),
          ],
        ),
      ),
    );
  }
}
