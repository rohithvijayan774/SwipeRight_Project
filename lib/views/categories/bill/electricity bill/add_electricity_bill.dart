import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/bills_list.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/electricity_bill_view.dart';

class PayElectricityBills extends StatelessWidget {
  const PayElectricityBills({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<String> electricityBoards = [
      'Kannan Devan Hills Plantations Company Private Limited',
      'Kerala State Electricity Board Ltd. (KSEBL)',
      'Lakshadweep Electricity Department',
      'Thrissur Corperation Electricity Department',
    ];

    List<String> logos = [
      'assets/images/kannandevan.png',
      'assets/images/KSEB.png',
      'assets/images/lakshadweep.png',
      'assets/images/thrissur.png',
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
                          'PAY ELECTRICITY BILLS',
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
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'KERALA',
                            style: TextStyle(
                                fontFamily: 'Sofiapro', color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        height: height * 0.5,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(71, 33, 149, 243),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Billers in Kerala',
                                style: TextStyle(
                                    fontFamily: 'Sofiapro',
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 30,
                                  ),
                                  itemCount: electricityBoards.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(logos[index])),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      title: Text(electricityBoards[index],
                                          style: const TextStyle(
                                              fontFamily: 'Sofiapro',
                                              color: Colors.white)),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => BillsList(
                                                logos: logos[index],
                                                header:
                                                    electricityBoards[index]),
                                          ),
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
