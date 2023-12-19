import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/forgot_password.dart';
import 'package:swiperight/views/register_screen.dart';
import 'package:swiperight/views/welcome_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                          (route) => false);
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
              child: Consumer<UserController>(
                builder: (context, userLoginController, _) {
                  return Form(
                    key: userLoginController.loginKey,
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
                          controller: userLoginController.loginEmailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*required field';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller:
                              userLoginController.loginpasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*required field';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen(),
                                ));
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontFamily: 'SofiaPro', color: Colors.grey),
                              ),
                            ),
                          ],
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
                              if (userLoginController.loginKey.currentState!
                                  .validate()) {
                                userLoginController.userLogin(
                                    userLoginController
                                        .loginEmailController.text,
                                    userLoginController
                                        .loginpasswordController.text,
                                    context);
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'SofiaPro'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                endIndent: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Or Login with',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Expanded(
                              child: Divider(
                                indent: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                userLoginController.googleLogin(context);
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(color: Colors.grey),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/google_icon.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: defaultBgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 12),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ));
              },
              child: const Text(
                'Register Now',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
