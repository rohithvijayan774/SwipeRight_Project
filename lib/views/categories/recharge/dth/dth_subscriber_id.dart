import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/payment_mode.dart';
import 'package:swiperight/views/categories/recharge/recharge_payment_mode.dart';

class DTHSubscriberID extends StatelessWidget {
  final String header;
  const DTHSubscriberID({
    required this.header,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final subscriberController = Provider.of<UserController>(context);

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
                        Text(
                          header,
                          style: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 20),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        height: height * 0.16,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(71, 33, 149, 243),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: subscriberController.dthSubscriberIDKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: subscriberController
                                      .dthSubscriberIDController,
                                  decoration: const InputDecoration(
                                    hintText:
                                        'Subscriber ID/ Regitered Mobile Numer',
                                    hintStyle:
                                        TextStyle(fontFamily: 'SofiaPro'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Press the menu buton on your $header and select My Account to get your suscriber ID',
                                  style:
                                      const TextStyle(fontFamily: 'SofiaPro'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: InkWell(
                          onTap: () {
                            if (subscriberController
                                .dthSubscriberIDKey.currentState!
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
