import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swiperight/const.dart';

class AddMedicines extends StatelessWidget {
  const AddMedicines({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final addFoodItemsKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController reminderDateController = TextEditingController();
    DateTime? selectedDate;
    DateTime? selectedReminderDate;
    Future<void> selectDate(
        context, selectedDate, TextEditingController controller) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100));

      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        controller.text = DateFormat('dd-MM-yyyy').format(picked);
      }
    }

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
                  child: Form(
                    key: addFoodItemsKey,
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          controller: nameController,
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          controller: dateController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "* this field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          onTap: () {
                                            selectDate(context, selectedDate,
                                                dateController);
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon:
                                                Icon(Icons.date_range_outlined),
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          controller: reminderDateController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "* this field is required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          onTap: () {
                                            selectDate(
                                                context,
                                                selectedReminderDate,
                                                reminderDateController);
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon:
                                                Icon(Icons.date_range_outlined),
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          controller: reminderDateController,
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
                                                    items: const [],
                                                    onChanged: (value) {},
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
                                                                TextFormField(),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: const Text(
                                                                    'Cancel'),
                                                              ),
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child:
                                                                    const Text(
                                                                        'Add'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    icon: const Icon(Icons.add))
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300]),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          controller: nameController,
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
                            if (addFoodItemsKey.currentState!.validate()) {
                              print(nameController.text);
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
