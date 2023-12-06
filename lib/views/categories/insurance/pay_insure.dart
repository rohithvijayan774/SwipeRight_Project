import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/payment_mode.dart';

class PayInsurance extends StatelessWidget {
  const PayInsurance({super.key});

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
                          'PAY INSURANCE',
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
                      TextFormField(
                        style: const TextStyle(
                            fontFamily: 'SofiaPro', color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Insurance Company',
                            hintStyle: const TextStyle(
                                color: Colors.black, fontFamily: 'SofiaPro'),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: const TextStyle(
                            fontFamily: 'SofiaPro', color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Policy Number',
                            hintStyle: const TextStyle(
                                color: Colors.black, fontFamily: 'SofiaPro'),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const PaymentModes(paymentAmount: 250),
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
