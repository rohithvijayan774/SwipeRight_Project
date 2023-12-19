import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/insurance/add_insure.dart';
import 'package:swiperight/views/categories/insurance/insure_users_details.dart';

class InsureUsersList extends StatelessWidget {
  const InsureUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> insureUsers = [
      {
        'name': 'Rohith',
        "number": 977838283,
        "insureType": 'Car',
        'rechargedDate': "0/0/00",
        'expiryDate': "0/0/00",
        'reminderDate': "0/0/00",
      },
      {
        'name': 'Sanay',
        "number": 8943846774,
        "insureType": 'Bike',
        'rechargedDate': "0/0/00",
        'expiryDate': "0/0/00",
        'reminderDate': "0/0/00",
      }
    ];
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
              child: Consumer<UserController>(
                  builder: (context, insureListController, _) {
                return FutureBuilder(
                    future: insureListController.fetchInsurance(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : insureListController.insuranceList.isEmpty
                              ? const Center(
                                  child: Text('List is Empty'),
                                )
                              : ListView.separated(
                                  itemCount:
                                      insureListController.insuranceList.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 20,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color:
                                              Color.fromARGB(71, 33, 149, 243)),
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  InsureUserDetails(
                                                userName: insureListController
                                                    .insuranceList[index]
                                                    .insuranceCustomerName,
                                                insureType: insureListController
                                                    .insuranceList[index]
                                                    .insuranceType,
                                                insuranceDate:
                                                    insureListController
                                                        .insuranceList[index]
                                                        .insuranceDate,
                                                expiryDate: insureListController
                                                    .insuranceList[index]
                                                    .insuranceExpiryDate,
                                                reminderDate:
                                                    insureListController
                                                        .insuranceList[index]
                                                        .insuranceReminderDate,
                                                number: insureListController
                                                    .insuranceList[index]
                                                    .insuranceCustomerNumber,
                                              ),
                                            ),
                                          );
                                        },
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              insureListController
                                                  .insuranceList[index]
                                                  .insuranceCustomerName,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                            Text(
                                              insureListController
                                                  .insuranceList[index]
                                                  .insuranceCustomerNumber
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                            Text(
                                              insureListController
                                                  .insuranceList[index]
                                                  .insuranceType,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.notifications_none)),
                                      ),
                                    );
                                  },
                                );
                    });
              }),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const AddInsurance(),
            ));
          },
          child: const Icon(
            Icons.add,
            color: defaultBgColor,
          )),
    );
  }
}
