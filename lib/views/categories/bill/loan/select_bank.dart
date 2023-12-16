import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/bill/loan/add_loan_amount.dart';
import 'package:swiperight/views/categories/bill/loan/loans_list.dart';

class SelectBank extends StatelessWidget {
  const SelectBank({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> banks = [
      {'bank': 'Bajaj Finance LTD', 'logo': 'assets/images/bajaj.png'},
      {
        'bank': 'HDB Financial Services Limited',
        'logo': 'assets/images/hdfc.png'
      },
      {'bank': 'Home Credit', 'logo': 'assets/images/home_credit.png'},
      {'bank': 'Ring', 'logo': 'assets/images/ring.png'},
      {'bank': 'IIFL Finance', 'logo': 'assets/images/iifl.png'},
      {'bank': 'Muthoot Finance', 'logo': 'assets/images/muthoot.png'},
      {'bank': 'Axis Bank Finance', 'logo': 'assets/images/axis.png'},
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
                          'PAY LOAN',
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
                        height: height * 0.8,
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
                                  itemCount: banks.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  banks[index]['logo'])),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      title: Text(banks[index]['bank'],
                                          style: const TextStyle(
                                              fontFamily: 'Sofiapro',
                                              color: Colors.white)),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => LoansList(
                                                  header: banks[index]['bank'],
                                                  logos: banks[index]['logo'])),
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
