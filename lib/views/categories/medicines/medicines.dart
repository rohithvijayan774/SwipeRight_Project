import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/food%20&%20groceries/settings.dart';
import 'package:swiperight/views/categories/medicines/add_medicines.dart';
import 'package:swiperight/views/categories/medicines/medicine_all_items.dart';
import 'package:swiperight/views/categories/medicines/medicine_expire_soon_items.dart';
import 'package:swiperight/views/categories/medicines/medicine_expired_items.dart';
import 'package:swiperight/widgets/food_custom_tile.dart';

class Medicines extends StatelessWidget {
  const Medicines({super.key});

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
                          'MEDICINE',
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      FoodCustomTile(
                        title: 'ALL ITEMS',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MedicineAllItems(),
                            ),
                          );
                        },
                      ),
                      FoodCustomTile(
                          title: 'SOON EXPIRE',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const MedicineExpireSoonItems(),
                            ));
                          }),
                      FoodCustomTile(
                          title: 'EXPIRED',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const MedicineExpiredItems(),
                            ));
                          }),
                      SizedBox(
                        width: width,
                        height: height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddMedicines(),
                                ));
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              label: const Text(
                                'ADD ITEM',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Settings(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.settings_outlined,
                              ),
                            )
                          ],
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
