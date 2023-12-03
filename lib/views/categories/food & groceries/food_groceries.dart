import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/views/categories/food%20&%20groceries/all_items.dart';
import 'package:swiperight/widgets/food_custom_tile.dart';

class FoodAndGroceries extends StatelessWidget {
  const FoodAndGroceries({super.key});

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
                          'FOOD & GROCERY',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FoodCustomTile(
                          title: 'ALL ITEMS',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AllItems(),
                            ));
                          }),
                      FoodCustomTile(title: 'SOON EXPIRE', onPressed: () {}),
                      FoodCustomTile(title: 'EXPIRED', onPressed: () {}),
                      SizedBox(
                        width: width,
                        height: height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
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
                              onPressed: () {},
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
