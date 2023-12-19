import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';

class AddInsurance extends StatelessWidget {
  const AddInsurance({super.key});

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
                          'ADD INSURANCE',
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
                      builder: (context, insureAddController, _) {
                    return Form(
                      key: insureAddController.insuranceAddKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller:
                                insureAddController.insuranceTypeController,
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
                                hintText: 'Insurance Type (Eg: Car)',
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
                            onTap: () => insureAddController.selectDate(
                                context,
                                insureAddController.selectedFormattedDate,
                                insureAddController.insuranceDateController),
                            controller:
                                insureAddController.insuranceDateController,
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
                                hintText: 'Insurance Date',
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
                            onTap: () => insureAddController.selectDate(
                                context,
                                insureAddController.selectedFormattedDate,
                                insureAddController
                                    .insuranceDateExpiryController),
                            controller: insureAddController
                                .insuranceDateExpiryController,
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
                                hintText: 'Insurance Expiry Date',
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
                            onTap: () => insureAddController.selectDate(
                                context,
                                insureAddController.selectedFormattedDate,
                                insureAddController
                                    .insuranceDateReminderController),
                            controller: insureAddController
                                .insuranceDateReminderController,
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
                            controller: insureAddController
                                .insuranceCustomerNameController,
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
                            controller: insureAddController
                                .insuranceCustomerNumberController,
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
                                hintText: 'Customer Number',
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
                              if (insureAddController
                                  .insuranceAddKey.currentState!
                                  .validate()) {
                                insureAddController
                                    .storeInsurance(
                                        insureAddController
                                            .insuranceTypeController.text,
                                        insureAddController
                                            .insuranceDateController.text,
                                        insureAddController
                                            .insuranceDateExpiryController.text,
                                        insureAddController
                                            .insuranceDateReminderController
                                            .text,
                                        insureAddController
                                            .insuranceCustomerNameController
                                            .text,
                                        int.parse(insureAddController
                                            .insuranceCustomerNumberController
                                            .text))
                                    .then(
                                        (value) => Navigator.of(context).pop());
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
                          )
                        ],
                      ),
                    );
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
