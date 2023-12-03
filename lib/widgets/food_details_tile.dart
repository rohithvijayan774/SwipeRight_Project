import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';

class FoodDetailsTile extends StatelessWidget {
  final String title;
  final String date;
  final int days;
  final Function onPressed;
  const FoodDetailsTile({
    super.key,
    required this.title,
    required this.date,
    required this.days,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: width,
        height: height * 0.12,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: defaultTextColor,
                        fontSize: 18),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: defaultTextColor,
                    ),
                  ),
                ],
              ),
              days < 0
                  ? const Text(
                      'EXPIRED',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.red),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '$days',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: days >= 0 ? Colors.blue : Colors.red,
                            fontSize: 25),
                      ),
                      days >= 0
                          ? const Text(
                              "DAY'S LEFT",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: defaultTextColor,
                                  fontSize: 10),
                            )
                          : const Text(
                              'DAYS',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: defaultTextColor,
                                fontSize: 15,
                              ),
                            ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_rounded),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
