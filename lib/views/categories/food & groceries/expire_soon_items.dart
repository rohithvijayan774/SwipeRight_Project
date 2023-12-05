import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/widgets/food_details_tile.dart';

class ExpireSoonItems extends StatelessWidget {
  const ExpireSoonItems({super.key});

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
                          'EXPIRE SOON LIST',
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
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return FoodDetailsTile(
                    title: 'BREAD',
                    date: '2023/11/22',
                    days: 3,
                    onPressed: () {},
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
