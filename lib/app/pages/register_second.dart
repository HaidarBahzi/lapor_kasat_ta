import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/controller/RegisterController.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({Key? key}) : super(key: key);

  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Stack(
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
                      const Text(
                        "Registrasi Akun",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Masukkan username dan password untuk registrasi akun",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 25),
                      buildTextField(
                        labelText: "Username",
                        controller: registerController.usernameController,
                        isEmpty: registerController.showUsernameWarning.value,
                      ),
                      const SizedBox(height: 20),
                      buildTextField(
                        labelText: "Password",
                        controller: registerController.passwordController,
                        obscureText: true,
                        isEmpty: registerController.showPasswordWarning.value,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(
                        labelText: "Konfirmasi Password",
                        controller:
                            registerController.confirmPasswordController,
                        obscureText: true,
                        isEmpty:
                            registerController.showConfirmPasswordWarning.value,
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 240,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            registerController.checkWarnings();
                            if (!registerController.hasWarnings2) {
                              if (registerController.passwordController.text !=
                                  registerController
                                      .confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Konfirmasi password tidak cocok.')));
                              } else {
                                // Get.to(dashboard); jika true ke dashboard
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Harap isi semua kolom dengan benar.')));
                            }
                          },
                          child: Text(
                            "Daftar",
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
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Sudah punya akun? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text("Login",
                              style: TextStyle(color: Colors.lightBlue)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                  print("test");
                },
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required String labelText,
    required TextEditingController controller,
    bool obscureText = false,
    bool isEmpty = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(labelText,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            Text("*", style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: isEmpty ? "Kolom ini harus diisi" : "Masukkan $labelText",
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            prefixIcon:
                isEmpty ? Icon(Icons.error_outline, color: Colors.red) : null,
          ),
        ),
      ],
    );
  }
}
