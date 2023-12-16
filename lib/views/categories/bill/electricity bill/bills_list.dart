import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/add_electricity_bill.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/electricity_bill_view.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/pay_electricity_bill.dart';
import 'package:swiperight/widgets/bill_tile.dart';

class BillsList extends StatelessWidget {
  final String header;
  final String logos;
  const BillsList({
    required this.header,
    required this.logos,
    super.key,
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
              child: Consumer<UserController>(
                  builder: (context, billListController, _) {
                return FutureBuilder(
                    future: billListController.fetchElecBills(header),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : billListController.elecBillsList.isEmpty
                              ? const Center(
                                  child: Text('List is Empty'),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return BillTile(
                                        title: 'Consumer Number',
                                        logos: logos,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => PayBill(
                                                header: header,
                                                logos: logos,
                                                billid: billListController
                                                    .elecBillsList[index]
                                                    .billid!,
                                                consumerNumber:
                                                    billListController
                                                        .elecBillsList[index]
                                                        .consumerNumber,
                                                customerName: billListController
                                                    .elecBillsList[index]
                                                    .customerName,
                                                billAmount: billListController
                                                    .elecBillsList[index]
                                                    .billAmount,
                                                billDate: billListController
                                                    .elecBillsList[index]
                                                    .billDate,
                                                billDueDate: billListController
                                                    .elecBillsList[index]
                                                    .dueDate,
                                                billStatus: billListController
                                                    .elecBillsList[index]
                                                    .billStatus,
                                              ),
                                            ),
                                          );
                                        },
                                        consumerNumber: billListController
                                            .elecBillsList[index]
                                            .consumerNumber,
                                        billStatus: billListController
                                            .elecBillsList[index].billStatus);
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount:
                                      billListController.elecBillsList.length);
                    });
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  ElectricityBillView(header: header, logos: logos),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
