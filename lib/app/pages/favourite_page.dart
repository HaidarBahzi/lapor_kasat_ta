import 'package:flutter/material.dart';
import 'package:lapor_kasat/extension.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<String> dataList = []; // Inisialisasi dataList kosong

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00AADE),
        title: Text(
          "Disimpan",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        toolbarHeight: 75,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30,
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: dataList.isNotEmpty
            ? ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dataList[index]),
                    // LOGIC ATAU WIDGET NANTI
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon_note.png",
                    width: 135,
                    height: 135,
                  ),
                  Text(
                    "Belum ada aduan",
                    style: TextStyle(fontSize: 20, color: Color(0xff676767)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      reloadData();
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Ulangi",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ].withSpaceBetween(height: 25),
              ),
      ),
    );
  }

  // Func untuk reload data saat button di klik
  void reloadData() {
    // Perumpaan mengambil data dari API
    List<String> newDataList = ["Data 1", "Data 2", "Data 3"];
    
    // Perbarui dataList dengan data baru
    setState(() {
      dataList = newDataList;
    });
  }
}
