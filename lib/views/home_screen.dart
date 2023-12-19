import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/views/categories/bill/electricity%20bill/bills.dart';
import 'package:swiperight/views/categories/food%20&%20groceries/food_groceries.dart';
import 'package:swiperight/views/categories/insurance/insure_users_list.dart';
import 'package:swiperight/views/categories/medicines/medicines.dart';
import 'package:swiperight/views/categories/recharge/mobile/recharge_type.dart';
import 'package:swiperight/views/list_sample.dart';
import 'package:swiperight/widgets/home_screen_category_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: SafeArea(
        child:
            Consumer<UserController>(builder: (context, userHomeController, _) {
          return FutureBuilder(
              future: userHomeController.fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: defaultPurpleColor,
                                  child: Icon(Icons.person),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ListSample(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width,
                              height: height * 0.20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: defaultPurpleColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/swiperight_logo.png',
                                    scale: 2,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'SWIPERIGHT',
                                    style: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeScreenCategoryTile(
                                  title: 'Food & Grocery',
                                  tileIcon: Icons.shopping_cart_outlined,
                                  tileColor: const Color(0xFFD9FFE1),
                                  iconColor: Colors.green,
                                  onPressed: () {
                                    userHomeController.fetchFoodGroup().then(
                                        (value) => Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const FoodAndGroceries(),
                                              ),
                                            ));
                                  },
                                ),
                                HomeScreenCategoryTile(
                                  title: 'Medicine',
                                  tileIcon: Icons.monitor_heart_outlined,
                                  tileColor: const Color(0xFF0D5981),
                                  iconColor: const Color(0xFFEE90DF),
                                  onPressed: () {
                                    userHomeController.fetchAllMedicines().then(
                                        (value) => Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Medicines(),
                                              ),
                                            ));
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeScreenCategoryTile(
                                  title: 'Bill',
                                  tileIcon: Icons.receipt_long_sharp,
                                  tileColor: const Color(0xFFD6FAFB),
                                  iconColor: const Color(0xFFEE90DF),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const Bills(),
                                      ),
                                    );
                                  },
                                ),
                                HomeScreenCategoryTile(
                                  title: 'Recharge',
                                  tileIcon: Icons.phone_iphone_rounded,
                                  tileColor:
                                      const Color.fromARGB(51, 255, 136, 0),
                                  iconColor: Colors.white,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RechargeType(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeScreenCategoryTile(
                                  title: 'Insurance',
                                  tileIcon: Icons.account_balance_rounded,
                                  tileColor: const Color(0xFFFADEAC),
                                  iconColor: Colors.black,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const InsureUsersList(),
                                      ),
                                    );
                                  },
                                ),
                                HomeScreenCategoryTile(
                                  title: 'Subscription',
                                  tileIcon: Icons.subscriptions_outlined,
                                  tileColor:
                                      const Color.fromARGB(78, 0, 133, 133),
                                  iconColor: defaultBgColor,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // HomeScreenCategoryTile(
                            //   title: 'Calender',
                            //   tileIcon: Icons.edit_calendar_outlined,
                            //   tileColor: const Color.fromARGB(67, 60, 75, 188),
                            //   iconColor: const Color(0xFFEE90DF),
                            //   onPressed: () {},
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              });
        }),
      ),
    );
  }
}
