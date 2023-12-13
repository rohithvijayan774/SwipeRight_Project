import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/food_grocery_controller.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/widgets/food_details_tile.dart';

class ExpiredItems extends StatelessWidget {
  const ExpiredItems({super.key});

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
                          'EXPIRED LIST',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width / 6, left: 50),
              child: Container(
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'ALL ITEMS',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: defaultTextColor,
                        ),
                      ),
                      const Spacer(),
                      DropdownButton(
                        items: const [],
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
              child: Consumer2<UserController, FoodGroceryController>(builder:
                  (context, allItemsController, foodGroceryController, _) {
                return FutureBuilder(
                    future: allItemsController.fetchFoodGroceryExpired(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return allItemsController.foodGroceryList.isEmpty
                          ? const Center(
                              child: Text('Nothing here...'),
                            )
                          : ListView.builder(
                              itemCount:
                                  allItemsController.foodGroceryList.length,
                              itemBuilder: (context, index) {
                                DateTime currentDate = DateTime.now();
                                DateTime formattedExpiryDate = DateTime.parse(
                                    allItemsController
                                        .foodGroceryList[index].expiryDate);
                                Duration difference =
                                    formattedExpiryDate.difference(currentDate);
                                return FoodDetailsTile(
                                  title: allItemsController
                                      .foodGroceryList[index].foodGroceryName,
                                  date: allItemsController
                                      .foodGroceryList[index]
                                      .foodGroceryExpiryDate,
                                  days: difference.inDays,
                                  onPressed: () {},
                                );
                              },
                            );
                    });
              }),
            ))
          ],
        ),
      ),
    );
  }
}
