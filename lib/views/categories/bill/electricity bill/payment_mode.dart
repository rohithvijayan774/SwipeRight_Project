import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';

class PaymentModes extends StatefulWidget {
  final int paymentAmount;
  const PaymentModes({
    required this.paymentAmount,
    super.key,
  });

  @override
  State<PaymentModes> createState() => _PaymentModesState();
}

class _PaymentModesState extends State<PaymentModes> {
  String selectedMode = 'GooglePay';
  int amount = 0;

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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Choose Payment Option',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        height: height * 0.09,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(93, 33, 149, 243),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: height,
                              width: width / 1.5,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/google_pay.png'),
                                      fit: BoxFit.contain)),
                            ),
                            const Spacer(),
                            Radio(
                              activeColor: Colors.white,
                              value: 'GooglePay',
                              groupValue: selectedMode,
                              onChanged: (value) {
                                setState(() {
                                  selectedMode = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: width,
                        height: height * 0.09,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(93, 33, 149, 243),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: height,
                              width: width / 1.5,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/phonepay_logo.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const Spacer(),
                            Radio(
                              activeColor: Colors.white,
                              value: 'PhonePay',
                              groupValue: selectedMode,
                              onChanged: (value) {
                                setState(() {
                                  selectedMode = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: width,
                        height: height * 0.09,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(93, 33, 149, 243),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: height,
                              width: width / 1.5,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/paytm_logo.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const Spacer(),
                            Radio(
                              activeColor: Colors.white,
                              value: 'Paytm',
                              groupValue: selectedMode,
                              onChanged: (value) {
                                setState(() {
                                  selectedMode = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: width,
                        height: height * 0.09,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(93, 33, 149, 243),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: height,
                              width: width / 1.5,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/upi_logo.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const Spacer(),
                            Radio(
                              activeColor: Colors.white,
                              value: 'upi',
                              groupValue: selectedMode,
                              onChanged: (value) {
                                setState(() {
                                  selectedMode = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      InkWell(
                        onTap: () {
                          print('$selectedMode');
                        },
                        child: Container(
                          color: const Color.fromARGB(123, 13, 72, 161),
                          width: width,
                          height: height * 0.06,
                          child: const Center(
                            child: Text(
                              'CONFIRM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
