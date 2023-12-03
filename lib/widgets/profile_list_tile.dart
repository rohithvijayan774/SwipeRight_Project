import 'package:flutter/material.dart';
import 'package:swiperight/const.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final IconData tileIcon;
  final Function onPressed;
  const ProfileListTile(
      {super.key,
      required this.title,
      required this.tileIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: width,
        height: height * 0.07,
        decoration: BoxDecoration(
            color: defaultLightPurpleColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                tileIcon,
                color: defaultTextColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: defaultTextColor,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  onPressed();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
