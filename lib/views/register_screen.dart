import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: Column(
        children: [
          SizedBox(
            height: height / 8,
            width: width,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Icon(Icons.arrow_back_ios_new_sharp)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const Text(
                    'Welcome back! Glad to see you. Again!',
                    style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Username',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Confirm password',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        'Agree and Register',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'SofiaPro'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 0,
      //   color: defaultBgColor,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         "Don't have an account?",
      //         style: TextStyle(
      //             color: Colors.black, fontFamily: 'Poppins', fontSize: 12),
      //       ),
      //       TextButton(
      //         onPressed: () {},
      //         child: const Text(
      //           'Register Now',
      //           style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
