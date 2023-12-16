import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/add_electricity_bill.dart';
import 'package:swiperight/views/categories/bill/loan/select_bank.dart';
import 'package:swiperight/views/categories/bill/water%20bill/add_water_bill.dart';
import 'package:swiperight/views/categories/bill/water%20bill/water_bill_list.dart';
import 'package:swiperight/widgets/bills_custom_tile.dart';

class Bills extends StatelessWidget {
  const Bills({super.key});

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
                          'BILLS',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      BillsCustomTile(
                        title: 'ELECTRICITY BILL',
                        icon: Icons.document_scanner_outlined,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PayElectricityBills(),
                            ),
                          );
                        },
                      ),
                      BillsCustomTile(
                          title: 'WATER BILL',
                          icon: Icons.water_damage_outlined,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const WaterBillsList(),
                            ));
                          }),
                      BillsCustomTile(
                          title: 'PAY LOAN',
                          icon: Icons.local_atm_rounded,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SelectBank(),
                            ));
                          }),
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
