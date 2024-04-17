import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg-splash.png'), fit: BoxFit.cover)),
        child: Center(
          child: 
              Padding(
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
                "Login ke Dashboard",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                "Masukkan username dan password anda",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
              ),
              const SizedBox(height: 25),
                    Row(
                      children: [
                        const Text("Username", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        Text("*", style: TextStyle(color: Colors.red)), 
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Masukkan Username",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none, 
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                     Row(
                      children: [
                        const Text("Password", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        Text("*", style: TextStyle(color: Colors.red)), 
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: "Masukkan Password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 240, 
                      height: 50, 
                      child: ElevatedButton(
                        onPressed: () {
                         
                        },
                        child: Text("Login",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
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
                        const Text("Tidak punya akun? ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        Text("Register", style: TextStyle(color: Colors.lightBlue)), 
                      ],
                    ),
                  ],
                ),
              ),
          
          
        ),
      ),
    );
  }
}
