import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: Consumer<UserController>(
          builder: (context, splashScreenController, _) {
        return FutureBuilder(
          future: splashScreenController.gotoNext(context),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/swiperight_logo.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'SWIPERIGHT',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 30),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
