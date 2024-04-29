import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapor_kasat/app/pages/register_second.dart';

class RegisterOTP extends StatefulWidget {
  final String phoneNumber;

  const RegisterOTP({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<RegisterOTP> createState() => _RegisterOTPState();
}

class _RegisterOTPState extends State<RegisterOTP> {
  late List<String> _otpDigits;

  @override
  void initState() {
    super.initState();
    _otpDigits = List.generate(6, (index) => '');
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
                    Text(
                      "Verifikasi Kode OTP",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Kami telah mengirimkan kode verifikasi ke ${widget.phoneNumber}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 25),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 40,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                _otpDigits[index] = value;
                                if (value.length == 1 && index < 5) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        // fungsi untuk kirim kode otp
                        print("Mengirim ulang kode...");
                      },
                      child: Text(
                        "Kirim kode lagi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(RegisterPage2());
                      },
                      child: Text(
                        "Verifikasi",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 70),
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
