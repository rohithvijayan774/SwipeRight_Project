import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';

class AdminDashBoardTile extends StatelessWidget {
  final String title;
  final int count;
  const AdminDashBoardTile({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: width,
        height: height * 0.07,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: defaultTextColor,
                ),
              ),
              const Spacer(),
              Text(
                count.toString(),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: defaultTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
