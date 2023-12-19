import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/recharge/mobile/add_user.dart';
import 'package:swiperight/views/categories/recharge/mobile/user_details.dart';

class RechargeUsersList extends StatelessWidget {
  const RechargeUsersList({super.key});

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
                          'MOBILE RECHARGE',
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
                  builder: (context, mobRechargeUsersController, _) {
                return FutureBuilder(
                    future: mobRechargeUsersController.fetchMobRecharges().then(
                          (value) =>
                              mobRechargeUsersController.fetchOperators(),
                        ),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : mobRechargeUsersController.mobRechargeList.isEmpty
                              ? const Center(
                                  child: Text('List is Empty'),
                                )
                              : ListView.separated(
                                  itemCount: mobRechargeUsersController
                                      .mobRechargeList.length,
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
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => UserDetails(
                                                userName:
                                                    mobRechargeUsersController
                                                        .mobRechargeList[index]
                                                        .mobCustomerName,
                                                operator:
                                                    mobRechargeUsersController
                                                        .mobRechargeList[index]
                                                        .mobOperator,
                                                rechargeDate:
                                                    mobRechargeUsersController
                                                        .mobRechargeList[index]
                                                        .mobRechargeDate,
                                                expiryDate:
                                                    mobRechargeUsersController
                                                        .mobRechargeList[index]
                                                        .mobRechargeExpiryDate,
                                                reminderDate:
                                                    mobRechargeUsersController
                                                        .mobRechargeList[index]
                                                        .mobRechargeReminderDate,
                                                number:
                                                    mobRechargeUsersController
                                                        .mobRechargeList[index]
                                                        .mobCustomerNumber),
                                          ));
                                        },
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mobRechargeUsersController
                                                  .mobRechargeList[index]
                                                  .mobCustomerName,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                            Text(
                                              mobRechargeUsersController
                                                  .mobRechargeList[index]
                                                  .mobCustomerNumber
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                            Text(
                                              mobRechargeUsersController
                                                  .mobRechargeList[index]
                                                  .mobOperator,
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
              builder: (context) => const AddUser(),
            ));
          },
          child: const Icon(
            Icons.add,
            color: defaultBgColor,
          )),
    );
  }
}
