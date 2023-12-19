import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/payment_mode.dart';
import 'package:swiperight/views/categories/recharge/recharge_payment_mode.dart';

class PayInsurance extends StatelessWidget {
  const PayInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final payInsureController =
        Provider.of<UserController>(context, listen: false);
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
                  child: Form(
                    key: payInsureController.insurancePayKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "* this field is required";
                            } else {
                              return null;
                            }
                          },
                          controller: payInsureController
                              .insuranceCompanyNameController,
                          style: const TextStyle(
                              fontFamily: 'SofiaPro', color: Colors.black),
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
                          keyboardType: const TextInputType.numberWithOptions(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "* this field is required";
                            } else {
                              return null;
                            }
                          },
                          controller: payInsureController
                              .insurancePolicyNumberController,
                          style: const TextStyle(
                              fontFamily: 'SofiaPro', color: Colors.black),
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
                            if (payInsureController
                                .insurancePayKey.currentState!
                                .validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const RechargePaymentMode(),
                              ));
                            }
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
            ),
          ],
        ),
      ),
    );
  }
}
