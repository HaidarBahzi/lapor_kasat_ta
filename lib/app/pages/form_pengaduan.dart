import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class FormPengaduan extends StatefulWidget {
  const FormPengaduan({Key? key}) : super(key: key);

  @override
  State<FormPengaduan> createState() => _FormPengaduanState();
}

class _FormPengaduanState extends State<FormPengaduan> {
  File? _image; // var simpan gambar
  TextEditingController _judulController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  bool _judulError = false;
  bool _lokasiError = false;
  bool _keteranganError = false;

  // func gambar buka galery
  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // func submit form
  void _submitForm() {
    setState(() {
      _judulError = _judulController.text.isEmpty;
      _lokasiError = _lokasiController.text.isEmpty;
      _keteranganError = _keteranganController.text.isEmpty;
    });

    if (!_judulError && !_lokasiError && !_keteranganError && _image != null) {
      // _submitForm()
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 75,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
              color: Colors.black,
              onPressed: () {},
            ),
            SizedBox(width: 45),
            Text(
              "Form Pengaduan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukan Judul Lokasi dan Keterangan laporan secara detail!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xff979090),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Judul",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            customTextField(
              controller: _judulController,
              hintText: 'Masukkan Judul Laporan',
              isError: _judulError,
            ),
            SizedBox(height: 10),
            Text(
              "Lokasi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            customTextField(
              controller: _lokasiController,
              hintText: 'Pilih lokasi',
              isError: _lokasiError,
              suffixIcon: Icon(Icons.location_on, color: Color(0xff5189C4)),
            ),
            SizedBox(height: 10),
            Text(
              "Keterangan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            customTextField(
              controller: _keteranganController,
              hintText: 'Masukkan Keterangan',
              isError: _keteranganError,
              maxLines: 4,
            ),
            SizedBox(height: 10),
            Text(
              "Bukti Foto",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                _getImageFromGallery();
              },
              child: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: _image == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 70,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Silahkan foto / pilih dari galeri",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 240,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    "Kirim",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  bool isError = false,
  int? maxLines,
  Widget? suffixIcon,
}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      hintText: isError ? 'Kolom ini harus diisi' : hintText,
      prefixIcon: isError ? Icon(Icons.error_outline, color: Colors.red) : null,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: isError ? Colors.red : Color(0xff5189C4)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );
}

}

