import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/login_screen.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Password Changed!',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
              ),
              const Text(
                'Your password has been changed successfully',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 40,
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
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    'Back to Login',
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
