import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiperight/controller/admin_controller.dart';
import 'package:swiperight/controller/food_grocery_controller.dart';
import 'package:swiperight/controller/medicine_controller.dart';
import 'package:swiperight/controller/user_controller.dart';
import 'package:swiperight/firebase_options.dart';
import 'package:swiperight/views/splash_screen.dart';
import 'package:swiperight/views/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserController>(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider<FoodGroceryController>(
          create: (context) => FoodGroceryController(),
        ),
        ChangeNotifierProvider<MedicineController>(
          create: (context) => MedicineController(),
        ),
        ChangeNotifierProvider<AdminController>(
          create: (context) => AdminController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SwipeRight',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
