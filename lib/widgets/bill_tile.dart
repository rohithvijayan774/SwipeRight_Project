import 'package:flutter/material.dart';

class BillTile extends StatelessWidget {
  final String logos;
  final String title;
  final Function onPressed;
  final int consumerNumber;
  final bool billStatus;

  const BillTile({
    required this.logos,
    required this.title,
    required this.onPressed,
    required this.consumerNumber,
    required this.billStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: width,
          height: height * 0.10,
          decoration: BoxDecoration(
              color: const Color.fromARGB(93, 33, 149, 243),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(logos)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'Poppins'),
                    ),
                  ),
                  Text(
                    consumerNumber.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'SofiaPro'),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                billStatus == true ? 'Paid' : 'Pending',
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'SofiaPro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
