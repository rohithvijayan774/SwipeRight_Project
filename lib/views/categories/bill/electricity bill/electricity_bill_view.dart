import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/bills_list.dart';

class ElectricityBillView extends StatelessWidget {
  final String header;
  final String logos;
  const ElectricityBillView({
    required this.header,
    required this.logos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final elecBillAddPro = Provider.of<UserController>(context);
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
                  child: Column(
                    children: [
                      const Text(
                        'ADD BILL',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20),
                      ),
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
                          child: Form(
                            key: elecBillAddPro.elecBillFormKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: elecBillAddPro
                                      .elecConsumerNumberController,
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
                                    hintText: 'Consumer Number',
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
                                      elecBillAddPro.elecCustomerNameController,
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
                                      elecBillAddPro.elecBillAmountController,
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
                                  controller:
                                      elecBillAddPro.elecBillDateController,
                                  onTap: () => elecBillAddPro.selectDate(
                                      context,
                                      elecBillAddPro.selectedFormattedDate,
                                      elecBillAddPro.elecBillDateController),
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
                                    hintText: 'Bill Date',
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
                                      elecBillAddPro.elecDueDateController,
                                  onTap: () => elecBillAddPro.selectDate(
                                      context,
                                      elecBillAddPro.selectedFormattedDate,
                                      elecBillAddPro.elecDueDateController),
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
                                  controller:
                                      elecBillAddPro.elecRemiderDateController,
                                  onTap: () => elecBillAddPro.selectDate(
                                      context,
                                      elecBillAddPro.selectedFormattedDate,
                                      elecBillAddPro.elecRemiderDateController),
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
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () async {
                          if (elecBillAddPro.elecBillFormKey.currentState!
                              .validate()) {
                            await elecBillAddPro
                                .storeElectricityBill(
                                  int.parse(elecBillAddPro
                                      .elecConsumerNumberController.text),
                                  elecBillAddPro
                                      .elecCustomerNameController.text,
                                  int.parse(elecBillAddPro
                                      .elecBillAmountController.text),
                                  elecBillAddPro.elecBillDateController.text,
                                  elecBillAddPro.elecDueDateController.text,
                                  elecBillAddPro.elecRemiderDateController.text,
                                  header,
                                  false,
                                )
                                .then(
                                  (value) =>
                                      Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => BillsList(
                                          header: header, logos: logos),
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
            )
          ],
        ),
      ),
    );
  }
}
