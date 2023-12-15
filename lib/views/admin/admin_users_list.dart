import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/const.dart';
import 'package:swiperight/controller/admin_controller.dart';
import 'package:swiperight/widgets/admin_dashboard_tile.dart';

class AdminUsersList extends StatelessWidget {
  const AdminUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final adminuserPro = Provider.of<AdminController>(context, listen: false);
    return Scaffold(
      backgroundColor: defaultBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height / 8,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'USERS LIST',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Consumer<AdminController>(
              builder: (context, adminFetchUsers, _) {
                return FutureBuilder(
                  future: adminFetchUsers.fetchUsers(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: adminFetchUsers.usersList.isEmpty
                                ? const Center(
                                    child: Text('No users found'),
                                  )
                                : ListView.builder(
                                    itemCount: adminuserPro.usersList.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Card(
                                          child: ListTile(
                                            title: Text(
                                              adminFetchUsers
                                                  .usersList[index].userName,
                                              style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                color: defaultTextColor,
                                              ),
                                            ),
                                            subtitle: Text(
                                              adminFetchUsers
                                                  .usersList[index].userEmail,
                                              style: const TextStyle(
                                                fontFamily: 'SofiaPro',
                                                color: defaultTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
