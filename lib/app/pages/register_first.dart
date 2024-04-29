import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:get/get.dart';
import 'package:lapor_kasat/app/pages/register_otp.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final _numberTextInputFormatter = FilteringTextInputFormatter.digitsOnly;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ktpController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  bool _showNameWarning = false;
  bool _showKtpWarning = false;
  bool _showPhoneWarning = false;
  bool _showAddressWarning = false;

  @override
  void dispose() {
    _nameController.dispose();
    _ktpController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg-splash.png'), fit: BoxFit.cover)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/ic_logo.webp',
                    width: 200,
                    height: 200,
                  ),
                  const Text(
                    "Registrasi Akun",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Masukkan biodata untuk registrasi akun",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                  const SizedBox(height: 25),
                  buildTextField(
                    labelText: "Nama Lengkap",
                    controller: _nameController,
                    isEmpty: _showNameWarning,
                  ),
                  const SizedBox(height: 20),
                  buildTextField(
                    labelText: "No. KTP",
                    controller: _ktpController,
                    isEmpty: _showKtpWarning,
                    isNumberOnly: true,
                  ),
                  const SizedBox(height: 20,),
                  buildTextField(
                    labelText: "No. Handphone",
                    controller: _phoneController,
                    isEmpty: _showPhoneWarning,
                    isNumberOnly: true, 
                  ),
                  const SizedBox(height: 20,),
                  buildTextField(
                    labelText: "Alamat",
                    controller: _addressController,
                    isEmpty: _showAddressWarning,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 240, 
                    height: 50, 
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showNameWarning = _nameController.text.isEmpty;
                          _showKtpWarning = _ktpController.text.isEmpty;
                          _showPhoneWarning = _phoneController.text.isEmpty;
                          _showAddressWarning = _addressController.text.isEmpty;
                        });

                        if (!_showNameWarning && !_showKtpWarning && !_showPhoneWarning && !_showAddressWarning) {
                          Get.to(RegisterOTP(phoneNumber: _phoneController.text));
                        }
                      },
                      child: Text("Lanjutkan",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Sudah punya akun? ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                      Text("Login", style: TextStyle(color: Colors.lightBlue)), 
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildTextField({
    required String labelText,
    required TextEditingController controller,
    bool obscureText = false,
    bool isEmpty = false,
    bool isNumberOnly = false, 
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(labelText, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
            Text("*", style: TextStyle(color: Colors.red)), 
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          obscureText: obscureText,
          inputFormatters: isNumberOnly ? [_numberTextInputFormatter] : null, // logic formatter untuk number only
          keyboardType: isNumberOnly ? TextInputType.number : TextInputType.text, // setting keyboard text atau number
          decoration: InputDecoration(
            hintText: isEmpty ? "Kolom ini harus diisi" : "Masukkan $labelText",
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none, 
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            prefixIcon: isEmpty ? Icon(Icons.error_outline, color: Colors.red) : null,
          ),
        ),
      ],
    );
  }
}

