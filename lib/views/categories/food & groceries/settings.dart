import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final settingsController = Provider.of<UserController>(context);
    bool soundOn = true;
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height / 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton.outlined(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'SETTINGS',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width,
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 230,
                              child: Text(
                                'Play notification sound : ',
                                style: TextStyle(fontFamily: 'SofiaPro'),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.grey[300],
                                  child: IconButton(
                                      onPressed: () {
                                        soundOn == true
                                            ? soundOn = false
                                            : soundOn == false
                                                ? soundOn = true
                                                : false;
                                        print(soundOn);
                                      },
                                      icon: soundOn == true
                                          ? const Icon(Icons.done)
                                          : const Icon(Icons.close)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width,
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 230,
                              child: Text(
                                'Recieve notification at : ',
                                style: TextStyle(fontFamily: 'SofiaPro'),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.grey[300],
                                  child: IconButton(
                                      onPressed: () {
                                        soundOn == true
                                            ? soundOn = false
                                            : soundOn == false
                                                ? soundOn = true
                                                : false;
                                        print(soundOn);
                                      },
                                      icon: soundOn == true
                                          ? const Icon(Icons.done)
                                          : const Icon(Icons.close)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width,
                      height: height * 0.09,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 230,
                              child: Text(
                                'Delete all expired items : ',
                                style: TextStyle(fontFamily: 'SofiaPro'),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300]),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.grey[300],
                                  child: CircleAvatar(
                                    backgroundColor: defaultBgColor,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.delete_outline_rounded)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        settingsController.signOut(context);
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SofiaPro',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
