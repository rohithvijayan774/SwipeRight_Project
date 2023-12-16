import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/water%20bill/add_water_bill.dart';
import 'package:swiperight/views/categories/bill/water%20bill/pay_water_bill.dart';
import 'package:swiperight/widgets/bill_tile.dart';

class WaterBillsList extends StatelessWidget {
  const WaterBillsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String header = 'Kerala Water Authority';
    String logo = 'assets/images/water_authority.png';
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
                  builder: (context, waterBillListController, _) {
                return FutureBuilder(
                    future: waterBillListController.fetchWaterBills(header),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : waterBillListController.waterBillsList.isEmpty
                              ? const Center(
                                  child: Text('List is Empty'),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return BillTile(
                                        title: 'Connection ID',
                                        logos: logo,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PayWaterBill(
                                                header: header,
                                                logos: logo,
                                                billid: waterBillListController
                                                    .waterBillsList[index]
                                                    .billid!,
                                                connectionID:
                                                    waterBillListController
                                                        .waterBillsList[index]
                                                        .connectionid,
                                                customerName:
                                                    waterBillListController
                                                        .waterBillsList[index]
                                                        .customerName,
                                                billAmount:
                                                    waterBillListController
                                                        .waterBillsList[index]
                                                        .billAmount,
                                                billDate:
                                                    waterBillListController
                                                        .waterBillsList[index]
                                                        .billDate,
                                                billDueDate:
                                                    waterBillListController
                                                        .waterBillsList[index]
                                                        .dueDate,
                                                billStatus:
                                                    waterBillListController
                                                        .waterBillsList[index]
                                                        .billStatus,
                                              ),
                                            ),
                                          );
                                        },
                                        consumerNumber: waterBillListController
                                            .waterBillsList[index].connectionid,
                                        billStatus: waterBillListController
                                            .waterBillsList[index].billStatus);
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: waterBillListController
                                      .waterBillsList.length);
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
              builder: (context) => const AddWaterBill(),
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
