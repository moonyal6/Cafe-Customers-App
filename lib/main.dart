import 'package:flutter/material.dart';
import 'package:cafe_customers_app/providers/user_provider.dart';
import 'package:cafe_customers_app/screens/profile_screen.dart';
import 'package:cafe_customers_app/screens/reward_screen.dart';
import 'package:cafe_customers_app/screens/scan_screen.dart';
import 'package:cafe_customers_app/screens/welcome_screen.dart';
import 'package:cafe_customers_app/utilities/cache_helper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(const LoyaltyApp());
}

class LoyaltyApp extends StatelessWidget {
  const LoyaltyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          WelcomeScreen.route: ((context) => WelcomeScreen()),
          ScanScreen.route: (context) => const ScanScreen(),
          RewardScreen.route: (context) => const RewardScreen(),
          ProfileScreen.route: (context) => const ProfileScreen(),
        },
        initialRoute: WelcomeScreen.route,
      ),
    );
  }
}
