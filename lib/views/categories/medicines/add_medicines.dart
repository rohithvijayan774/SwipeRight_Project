import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/medicine_controller.dart';
import 'package:swiperight/controller/user_controller.dart';

class AddMedicines extends StatelessWidget {
  const AddMedicines({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    print('******REBUILDING*************');
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height / 3,
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
                          'ADD NEW ITEMS',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/swiperight_logo.png',
                          scale: 1.1,
                        ),
                        const Text(
                          'SWIPERIGHT',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: SingleChildScrollView(
                  child: Consumer2<MedicineController, UserController>(builder:
                      (context, medicineAddController,
                          userAddMedicineController, _) {
                    return Form(
                      key: medicineAddController.addMedicineKey,
                      child: Column(
                        children: [
                          //Custom TextFormField
                          Container(
                            width: width,
                            height: height * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Enter Name : ',
                                      style: TextStyle(fontFamily: 'SofiaPro'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300]),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: medicineAddController
                                                .medicineNameController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "* this field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter here',
                                              hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width,
                            height: height * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Enter Date : ',
                                      style: TextStyle(fontFamily: 'SofiaPro'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300]),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: medicineAddController
                                                .medicineDateController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "* this field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onTap: () {
                                              medicineAddController
                                                  .selectDateForMedicineExpiry(
                                                      context,
                                                      medicineAddController
                                                          .selectedFormattedDate,
                                                      medicineAddController
                                                          .medicineDateController);
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              suffixIcon: Icon(
                                                  Icons.date_range_outlined),
                                              hintText: 'Choose Date',
                                              hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width,
                            height: height * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Reminder : ',
                                      style: TextStyle(fontFamily: 'SofiaPro'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300]),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: medicineAddController
                                                .medicineReminderDateController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "* this field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            onTap: () {
                                              medicineAddController
                                                  .selectDateForMedicineReminder(
                                                      context,
                                                      medicineAddController
                                                          .selectedReminderDate,
                                                      medicineAddController
                                                          .medicineReminderDateController);
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              suffixIcon: Icon(
                                                  Icons.date_range_outlined),
                                              hintText: 'Choose Date',
                                              hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width,
                            height: height * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Select Group : ',
                                      style: TextStyle(fontFamily: 'SofiaPro'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300]),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: medicineAddController
                                                .medicineSelectGroupController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "* this field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: Row(
                                                children: [
                                                  Expanded(
                                                    child:
                                                        DropdownButtonFormField(
                                                      items:
                                                          userAddMedicineController
                                                              .medicineGroupList
                                                              .map(
                                                        (medicineGroup) {
                                                          return DropdownMenuItem(
                                                            value:
                                                                medicineGroup,
                                                            child: Text(
                                                              medicineGroup
                                                                  .groupName,
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'SofiaPro'),
                                                            ),
                                                          );
                                                        },
                                                      ).toList(),
                                                      onChanged: (value) {
                                                        medicineAddController
                                                                .medicineSelectGroupController
                                                                .text =
                                                            value!.groupName;
                                                      },
                                                      decoration: const InputDecoration(
                                                          hintText: 'Category',
                                                          hintStyle: TextStyle(
                                                              fontFamily:
                                                                  'SofiaPro'),
                                                          border:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none)),
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
                                                              content:
                                                                  TextFormField(
                                                                controller:
                                                                    medicineAddController
                                                                        .addNewMedicineGroupController,
                                                              ),
                                                              actions: [
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: const Text(
                                                                      'Cancel'),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    await medicineAddController
                                                                        .addNewMedicineGroup(medicineAddController
                                                                            .addNewMedicineGroupController
                                                                            .text)
                                                                        .then((value) => userAddMedicineController
                                                                            .fetchMedicineGroup()
                                                                            .then((value) =>
                                                                                Navigator.of(context).pop()));
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          'Add'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      icon:
                                                          const Icon(Icons.add))
                                                ],
                                              ),
                                              border: InputBorder.none,
                                              hintText: 'Pick Group',
                                              hintStyle: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width,
                            height: height * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Note : ',
                                      style: TextStyle(fontFamily: 'SofiaPro'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[300]),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: medicineAddController
                                                .medicineNotesController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "* this field is required";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter here',
                                              hintStyle: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'SofiaPro',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (medicineAddController
                                  .addMedicineKey.currentState!
                                  .validate()) {
                                userAddMedicineController
                                    .storeMedicine(
                                        '${medicineAddController.medicineNameController.text} ${DateTime.now()}',
                                        medicineAddController
                                            .medicineNameController.text,
                                        medicineAddController
                                            .medicineDateController.text,
                                        medicineAddController
                                            .medicineReminderDateController
                                            .text,
                                        medicineAddController
                                            .medicineSelectGroupController.text,
                                        medicineAddController
                                            .medicineNotesController.text,
                                        medicineAddController.expiryDate
                                            .toString())
                                    .then(
                                        (value) => Navigator.of(context).pop())
                                    .then((value) => medicineAddController
                                        .clearMedicineFields());
                              }
                            },
                            icon: const Icon(
                              Icons.save_outlined,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'SAVE',
                              style: TextStyle(
                                fontFamily: 'SofiaPro',
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
