import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/admin_controller.dart';
import 'package:swiperight/views/forgot_password.dart';
import 'package:swiperight/views/welcome_page.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

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
              child: Consumer<AdminController>(
                  builder: (context, adminLoginController, _) {
                return Form(
                  key: adminLoginController.adminLoginKey,
                  child: ListView(
                    children: [
                      const Text(
                        'Admin Login',
                        style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: adminLoginController.adminNameController,
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
                        controller: adminLoginController.adminPassController,
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
                            if (adminLoginController.adminLoginKey.currentState!
                                .validate()) {
                              adminLoginController.checkAdmin(
                                  context,
                                  adminLoginController.adminNameController.text,
                                  adminLoginController
                                      .adminPassController.text);
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'SofiaPro'),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
