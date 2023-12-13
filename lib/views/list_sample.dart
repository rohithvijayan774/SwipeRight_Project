import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/controller/user_controller.dart';

class ListSample extends StatelessWidget {
  const ListSample({super.key});

  @override
  Widget build(BuildContext context) {
    final userPro = Provider.of<UserController>(context, listen: false);

    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: userPro.fetchFoodGroup(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return userPro.foodGroupList.isEmpty
                ? const Center(
                    child: Text('List is Empty'),
                  )
                : ListView.builder(
                    itemCount: userPro.foodGroupList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(userPro.foodGroupList[index].groupName),
                      );
                    },
                  );
          },
        ));
  }
}
