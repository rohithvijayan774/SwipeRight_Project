import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';

class AddDTHUser extends StatelessWidget {
  const AddDTHUser({super.key});

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
                child: SingleChildScrollView(
                  child: Consumer<UserController>(
                      builder: (context, dthRechargeController, _) {
                    return Builder(builder: (context) {
                      return Form(
                        key: dthRechargeController.dthRechargeUserKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller:
                                  dthRechargeController.dthOperatorController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "* this field is required";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro', color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Select Operator',
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SofiaPro'),
                                isDense: true,
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(71, 33, 149, 243),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                suffixIcon: Row(
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        items: dthRechargeController
                                            .dthOperatorsList
                                            .map((dthoperators) {
                                          return DropdownMenuItem(
                                              value: dthoperators,
                                              child: Text(
                                                dthoperators.operatorName,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'SofiaPro'),
                                              ));
                                        }).toList(),
                                        onChanged: (value) {
                                          dthRechargeController
                                              .dthOperatorController
                                              .text = value!.operatorName;
                                        },
                                        decoration: const InputDecoration(
                                            hintText: 'Category',
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'SofiaPro'),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none)),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Add new category'),
                                                content: TextFormField(
                                                  controller: dthRechargeController
                                                      .addNewDTHOperatorController,
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      await dthRechargeController
                                                          .addNewDTHOperator(
                                                              dthRechargeController
                                                                  .addNewDTHOperatorController
                                                                  .text)
                                                          .then(
                                                            (value) =>
                                                                dthRechargeController
                                                                    .fetchDTHOperators()
                                                                    .then(
                                                                      (value) =>
                                                                          Navigator.of(context)
                                                                              .pop(),
                                                                    ),
                                                          );
                                                    },
                                                    child: const Text('Add'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.add))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onTap: () {
                                dthRechargeController.selectDate(
                                    context,
                                    dthRechargeController.selectedFormattedDate,
                                    dthRechargeController
                                        .dthRechargeDateController);
                              },
                              controller: dthRechargeController
                                  .dthRechargeDateController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "* this field is required";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro', color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Recharged Date',
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                  isDense: true,
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(71, 33, 149, 243),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onTap: () {
                                dthRechargeController.selectDate(
                                    context,
                                    dthRechargeController.selectedFormattedDate,
                                    dthRechargeController
                                        .dthRechargeExpiryDateController);
                              },
                              controller: dthRechargeController
                                  .dthRechargeExpiryDateController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "* this field is required";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro', color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Recharge Expiry Date',
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                  isDense: true,
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(71, 33, 149, 243),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onTap: () {
                                dthRechargeController.selectDate(
                                    context,
                                    dthRechargeController.selectedFormattedDate,
                                    dthRechargeController
                                        .dthRechargeReminderDateController);
                              },
                              controller: dthRechargeController
                                  .dthRechargeReminderDateController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "* this field is required";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro', color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Reminder Date',
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                  isDense: true,
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(71, 33, 149, 243),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: dthRechargeController
                                  .dthRechargeCustomerNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "* this field is required";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro', color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Customer Name',
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                  isDense: true,
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(71, 33, 149, 243),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: dthRechargeController
                                  .dthRechargeAmountController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "* this field is required";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro', color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Amount',
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'SofiaPro'),
                                  isDense: true,
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(71, 33, 149, 243),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none)),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            InkWell(
                              onTap: () {
                                if (dthRechargeController
                                    .dthRechargeUserKey.currentState!
                                    .validate()) {
                                  dthRechargeController
                                      .storeDTHRecharge(
                                        dthRechargeController
                                            .dthOperatorController.text,
                                        dthRechargeController
                                            .dthRechargeDateController.text,
                                        dthRechargeController
                                            .dthRechargeExpiryDateController
                                            .text,
                                        dthRechargeController
                                            .dthRechargeReminderDateController
                                            .text,
                                        dthRechargeController
                                            .dthRechargeCustomerNameController
                                            .text,
                                        int.parse(dthRechargeController
                                            .dthRechargeAmountController.text),
                                      )
                                      .then(
                                        (value) => Navigator.of(context).pop(),
                                      );
                                }
                              },
                              child: Container(
                                width: width,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Center(
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'SofiaPro'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      );
                    });
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
