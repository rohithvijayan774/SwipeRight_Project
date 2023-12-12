import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              child: Consumer<UserController>(
                  builder: (context, changePassEmailController, _) {
                return Form(
                  key: changePassEmailController.resetPassEmailKey,
                  child: ListView(
                    children: [
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                      ),
                      const Text(
                        "Don't worry it occurs. Please enter the email address linked with your account.",
                        style: TextStyle(
                            fontFamily: 'SofiaPro', color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: changePassEmailController.passwordResetEmailController,
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
                            if (changePassEmailController
                                .resetPassEmailKey.currentState!
                                .validate()) {
                              changePassEmailController.sendPasswordResetEmail(
                                  changePassEmailController
                                      .passwordResetEmailController.text,
                                  context);
                            }
                          },
                          child: const Text(
                            'Confirm',
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
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: defaultBgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Remember Password?",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 12),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
