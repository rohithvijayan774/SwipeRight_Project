import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/recharge/dth/dth_user_details.dart';
import 'package:swiperight/views/categories/recharge/mobile/add_user.dart';
import 'package:swiperight/views/categories/recharge/mobile/user_details.dart';

class DTHUsersList extends StatelessWidget {
  const DTHUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dthUsers = [
      {
        'name': 'Rohith',
        "number": 977838283,
        "operator": 'Airtel DIgital TV',
        'rechargedDate': "0/0/00",
        'expiryDate': "0/0/00",
        'reminderDate': "0/0/00",
        'amount': 250,
      },
      {
        'name': 'Sanay',
        "number": 8943846774,
        "operator": 'Dish TV',
        'rechargedDate': "0/0/00",
        'expiryDate': "0/0/00",
        'reminderDate': "0/0/00",
        'amount': 185,
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
                          'DTH RECHARGE',
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
                  itemCount: dthUsers.length,
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DTHUserDetails(
                                userName: dthUsers[index]['name'],
                                operator: dthUsers[index]['operator'],
                                rechargeDate: dthUsers[index]['rechargedDate'],
                                expiryDate: dthUsers[index]['expiryDate'],
                                reminderDate: dthUsers[index]['reminderDate'],
                                number: dthUsers[index]['number'],
                                amount: dthUsers[index]['amount'],
                              ),
                            ),
                          );
                        },
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dthUsers[index]['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                              ),
                            ),
                            Text(
                              dthUsers[index]['operator'],
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
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddUser(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: defaultBgColor,
        ),
      ),
    );
  }
}
