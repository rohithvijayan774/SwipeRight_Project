import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/recharge/dth/dth_subscriber_id.dart';

class SelectOperator extends StatelessWidget {
  const SelectOperator({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> dthUsers = [
      {'operator': 'Airtel Digital TV', 'logo': 'assets/images/airtel.png'},
      {'operator': 'Dish TV', 'logo': 'assets/images/dishtv.png'},
      {'operator': 'Videocon D2H', 'logo': 'assets/images/d2h.png'},
      {'operator': 'Sun Direct', 'logo': 'assets/images/sundirect.png'},
      {'operator': 'Tata Sky', 'logo': 'assets/images/tatasky.png'},
      {'operator': 'Reliance Broadcast', 'logo': 'assets/images/reliance.png'},
    ];
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
                        height: height * 0.7,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(71, 33, 149, 243),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 30,
                                  ),
                                  itemCount: dthUsers.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        child: Image.asset(
                                            dthUsers[index]['logo']),
                                      ),
                                      title: Text(dthUsers[index]['operator'],
                                          style: const TextStyle(
                                              fontFamily: 'Sofiapro',
                                              color: Colors.white)),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DTHSubscriberID(
                                                      header: dthUsers[index]
                                                          ['operator'])),
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
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
