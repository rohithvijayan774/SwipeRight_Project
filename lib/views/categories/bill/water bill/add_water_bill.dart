import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/water%20bill/water_bill_list.dart';

class AddWaterBill extends StatelessWidget {
  const AddWaterBill({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    String header = 'Kerala Water Authority';
    String logo = 'assets/images/water_authority.png';
    final waterBillAddPro = Provider.of<UserController>(context);
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
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'Kerala',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 17),
                          ),
                        ],
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
                          child: SingleChildScrollView(
                            child: Form(
                              key: waterBillAddPro.waterBillKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(logo),
                                          fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: waterBillAddPro
                                        .waterConnectionidController,
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
                                      hintText: 'Connection ID',
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
                                    controller: waterBillAddPro
                                        .waterCustomerNameController,
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
                                    controller: waterBillAddPro
                                        .waterBillAmountController,
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
                                    onTap: () => waterBillAddPro.selectDate(
                                        context,
                                        waterBillAddPro.selectedFormattedDate,
                                        waterBillAddPro
                                            .waterBillDateController),
                                    controller:
                                        waterBillAddPro.waterBillDateController,
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
                                    onTap: () => waterBillAddPro.selectDate(
                                        context,
                                        waterBillAddPro.selectedFormattedDate,
                                        waterBillAddPro.waterDueDateController),
                                    controller:
                                        waterBillAddPro.waterDueDateController,
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
                                    onTap: () => waterBillAddPro.selectDate(
                                        context,
                                        waterBillAddPro.selectedFormattedDate,
                                        waterBillAddPro
                                            .waterRemiderDateController),
                                    controller: waterBillAddPro
                                        .waterRemiderDateController,
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
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          if (waterBillAddPro.waterBillKey.currentState!
                              .validate()) {
                            waterBillAddPro
                                .storeWaterBill(
                                    int.parse(waterBillAddPro
                                        .waterConnectionidController.text),
                                    waterBillAddPro
                                        .waterCustomerNameController.text,
                                    int.parse(waterBillAddPro
                                        .waterBillAmountController.text),
                                    waterBillAddPro
                                        .waterBillDateController.text,
                                    waterBillAddPro.waterDueDateController.text,
                                    waterBillAddPro
                                        .waterRemiderDateController.text,
                                    header,
                                    false)
                                .then(
                                  (value) =>
                                      Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const WaterBillsList(),
                                    ),
                                  ),
                                );
                          }
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => WaterBillsList(),
                          //   ),
                          // );
                        },
                        child: Container(
                          width: width,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(123, 13, 72, 161),
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                            child: Text(
                              'Link Account',
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
