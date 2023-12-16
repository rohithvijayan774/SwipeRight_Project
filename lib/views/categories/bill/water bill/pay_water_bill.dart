import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/payment_mode.dart';
import 'package:swiperight/views/categories/bill/water%20bill/water_payment_mode.dart';

class PayWaterBill extends StatelessWidget {
  final String header;
  final String logos;
  final String billid;
  final int connectionID;
  final int billAmount;
  final String customerName;
  final String billDate;
  final String billDueDate;
  final bool billStatus;

  const PayWaterBill({
    required this.header,
    required this.logos,
    required this.connectionID,
    super.key,
    required this.billid,
    required this.billAmount,
    required this.customerName,
    required this.billDate,
    required this.billDueDate,
    required this.billStatus,
  });

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
                        Expanded(
                          child: Text(
                            header,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis),
                          ),
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
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: width,
                        // height: height * 0.10,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(93, 33, 149, 243),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              billStatus == true ? 'Paid' : 'Pending',
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'SofiaPro'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(logos)),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Consumer Number',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins'),
                                    ),
                                    Text(
                                      connectionID.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SofiaPro'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Customer Name : ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins'),
                                ),
                                Text(
                                  customerName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Amount : ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                ),
                                Text(
                                  '₹ $billAmount/-',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Bill Date : ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                ),
                                Text(
                                  billDate,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Due Date : ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                ),
                                Text(
                                  billDueDate,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Click Here To Pay The Bill',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                          fontFamily: 'SofiaPro'),
                                    ),
                                    SizedBox(
                                      width: width * 0.5,
                                      child: ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    defaultBgColor)),
                                        onPressed: () {
                                          billStatus
                                              ? null
                                              : Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WaterPaymentModes(
                                                      paymentAmount: billAmount,
                                                      billid: billid,
                                                      billStatus: billStatus,
                                                    ),
                                                  ),
                                                );
                                        },
                                        child: Text(
                                          billStatus == true
                                              ? 'ALREADY PAID'
                                              : 'PAY BILL',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
