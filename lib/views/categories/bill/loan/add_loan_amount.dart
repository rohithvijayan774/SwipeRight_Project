import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/loan/select_bank.dart';

class AddLoanAmount extends StatelessWidget {
  final String header;
  final String logos;
  const AddLoanAmount({
    required this.header,
    required this.logos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final loanAddPro = Provider.of<UserController>(context);
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: loanAddPro.loanAddKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
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
                                TextFormField(
                                  controller:
                                      loanAddPro.loanAccountNumberController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    hintText: 'Loan Account Number',
                                    hintStyle: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller:
                                      loanAddPro.loanCustomerNameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    hintText: 'Customer Name',
                                    hintStyle: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller:
                                      loanAddPro.loanMobileNumberController,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    hintText: 'Mobile Number',
                                    hintStyle: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: loanAddPro.loanAmountController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    hintText: 'Amount',
                                    hintStyle: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  onTap: () => loanAddPro.selectDate(
                                      context,
                                      loanAddPro.selectedFormattedDate,
                                      loanAddPro.loanDueDateController),
                                  controller: loanAddPro.loanDueDateController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    hintText: 'Due Date',
                                    hintStyle: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  onTap: () => loanAddPro.selectDate(
                                      context,
                                      loanAddPro.selectedFormattedDate,
                                      loanAddPro.loanreminderDateController),
                                  controller:
                                      loanAddPro.loanreminderDateController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*this field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                    hintText: 'Reminding Date',
                                    hintStyle: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            if (loanAddPro.loanAddKey.currentState!
                                .validate()) {
                              loanAddPro
                                  .storeLoan(
                                      int.parse(loanAddPro
                                          .loanAccountNumberController.text),
                                      loanAddPro
                                          .loanCustomerNameController.text,
                                      int.parse(
                                          loanAddPro.loanAmountController.text),
                                      int.parse(loanAddPro
                                          .loanMobileNumberController.text),
                                      loanAddPro.loanDueDateController.text,
                                      loanAddPro
                                          .loanreminderDateController.text,
                                      header,
                                      false)
                                  .then(
                                    (value) =>
                                        Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectBank(),
                                      ),
                                    ),
                                  );
                            }
                          },
                          child: Container(
                            color: const Color.fromARGB(123, 13, 72, 161),
                            width: width,
                            height: height * 0.06,
                            child: const Center(
                              child: Text(
                                'CONFIRM',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
