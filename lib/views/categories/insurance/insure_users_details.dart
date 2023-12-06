import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/payment_mode.dart';
import 'package:swiperight/views/categories/insurance/pay_insure.dart';

class InsureUserDetails extends StatelessWidget {
  final String userName;
  final String insureType;
  final String rechargeDate;
  final String expiryDate;
  final String reminderDate;
  final int number;
  const InsureUserDetails(
      {super.key,
      required this.userName,
      required this.insureType,
      required this.rechargeDate,
      required this.expiryDate,
      required this.reminderDate,
      required this.number});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                          'INSURANCE',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(71, 33, 149, 243)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Mobile Number',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              number.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Insurance Type',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              insureType,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Insurance Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              rechargeDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Expiry Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              expiryDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Reminder Date',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              reminderDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PayInsurance(),
                          ));
                        },
                        child: Container(
                          width: width,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                            child: Text(
                              'Pay now',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'SofiaPro'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
