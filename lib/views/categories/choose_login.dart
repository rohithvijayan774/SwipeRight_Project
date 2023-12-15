import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/admin/admin_login.dart';
import 'package:swiperight/views/login_screen.dart';

class ChooseLogin extends StatelessWidget {
  const ChooseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  },
                  child: const Text(
                    'Continue as User',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'SofiaPro'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AdminLoginScreen(),
                    ));
                  },
                  child: const Text(
                    'Continue as Admin',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'SofiaPro'),
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
