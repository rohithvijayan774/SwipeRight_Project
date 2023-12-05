import 'package:flutter/material.dart';

class HomeScreenCategoryTile extends StatelessWidget {
  final String title;
  final IconData tileIcon;
  final Color tileColor;
  final Color iconColor;
  final Function onPressed;
  const HomeScreenCategoryTile({
    super.key,
    required this.title,
    required this.tileIcon,
    required this.tileColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onPressed();
            },
            child: Container(
              width: width * 0.4,
              height: height * 0.08,
              decoration: BoxDecoration(
                color: tileColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                tileIcon,
                size: 40,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(fontFamily: 'Poppins', fontSize: 10),
          )
        ],
      ),
    );
  }
}
