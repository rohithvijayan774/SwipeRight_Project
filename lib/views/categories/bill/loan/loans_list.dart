import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/loan/add_loan_amount.dart';
import 'package:swiperight/views/categories/bill/loan/pay_loan.dart';
import 'package:swiperight/widgets/bill_tile.dart';

class LoansList extends StatelessWidget {
  final String header;
  final String logos;
  const LoansList({
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
                  builder: (context, loanListController, _) {
                return FutureBuilder(
                    future: loanListController.fetchLoan(header),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : loanListController.loanList.isEmpty
                              ? const Center(
                                  child: Text('List is Empty'),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return BillTile(
                                        title: header,
                                        logos: logos,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => PayLoan(
                                                header: header,
                                                logos: logos,
                                                loanid: loanListController
                                                    .loanList[index].loanid!,
                                                loanAccountNumber:
                                                    loanListController
                                                        .loanList[index]
                                                        .loanAccountNumber,
                                                customerName: loanListController
                                                    .loanList[index]
                                                    .customerName,
                                                loanAmount: loanListController
                                                    .loanList[index].loanAmount,
                                                mobileNumber: loanListController
                                                    .loanList[index]
                                                    .mobileNumber,
                                                loanStatus: loanListController
                                                    .loanList[index].loanStatus,
                                              ),
                                            ),
                                          );
                                        },
                                        consumerNumber: loanListController
                                            .loanList[index].loanAccountNumber,
                                        billStatus: loanListController
                                            .loanList[index].loanStatus);
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount:
                                      loanListController.loanList.length);
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
              builder: (context) => AddLoanAmount(
                header: header,
                logos: logos,
              ),
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
