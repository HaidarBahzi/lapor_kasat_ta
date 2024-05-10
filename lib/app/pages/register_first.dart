import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/controller/RegisterController.dart';
import 'package:lapor_kasat/app/pages/register_otp.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController registerController = Get.put(RegisterController());


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
                image: AssetImage('assets/bg-splash.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
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
                    const SizedBox(height: 10),
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
                    Obx(() => buildTextField(
                      labelText: "Nama Lengkap",
                      controller: registerController.nameController,
                      isEmpty: registerController.showNameWarning.value,
                    )),
                    const SizedBox(height: 20),
                    Obx(() => buildTextField(
                      labelText: "No. KTP",
                      controller: registerController.ktpController,
                      isEmpty: registerController.showKtpWarning.value,
                      isNumberOnly: true,
                    )),
                    const SizedBox(height: 20,),
                    Obx(() => buildTextField(
                      labelText: "No. Handphone",
                      controller: registerController.phoneController,
                      isEmpty: registerController.showPhoneWarning.value,
                      isNumberOnly: true, 
                    )),
                    const SizedBox(height: 20,),
                    Obx(() => buildTextField(
                      labelText: "Alamat",
                      controller: registerController.addressController,
                      isEmpty: registerController.showAddressWarning.value,
                    )),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 240, 
                      height: 50, 
                      child: ElevatedButton(
                        onPressed: () {
                          registerController.checkWarnings();
                          if (!registerController.hasWarnings) {
                            Get.to(RegisterOTP(phoneNumber: registerController.phoneController.text));
                            print("menuju register otp");
                          }else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Harap isi semua kolom dengan benar.')));

                                      print("ada error");
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
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String labelText,
    required TextEditingController controller,
    bool obscureText = false,
    required bool isEmpty,
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
          inputFormatters: isNumberOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
          keyboardType: isNumberOnly ? TextInputType.number : TextInputType.text,
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