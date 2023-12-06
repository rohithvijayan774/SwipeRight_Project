import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/insurance/add_insure.dart';
import 'package:swiperight/views/categories/insurance/insure_users_details.dart';
import 'package:swiperight/views/categories/recharge/mobile/add_user.dart';
import 'package:swiperight/views/categories/recharge/mobile/user_details.dart';

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
              child: ListView.separated(
                itemCount: insureUsers.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(71, 33, 149, 243)),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InsureUserDetails(
                              userName: insureUsers[index]['name'],
                              insureType: insureUsers[index]['insureType'],
                              rechargeDate: insureUsers[index]['rechargedDate'],
                              expiryDate: insureUsers[index]['expiryDate'],
                              reminderDate: insureUsers[index]['reminderDate'],
                              number: insureUsers[index]['number']),
                        ));
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            insureUsers[index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SofiaPro',
                            ),
                          ),
                          Text(
                            insureUsers[index]['number'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SofiaPro',
                            ),
                          ),
                          Text(
                            insureUsers[index]['insureType'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SofiaPro',
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none)),
                    ),
                  );
                },
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
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
