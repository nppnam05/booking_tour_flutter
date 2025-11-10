import 'package:booking_tour_flutter/app/app_global_provider.dart';
import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/theme_manager.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGlobalProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        navigatorKey: AppNavigator.navigatorKey,
        routes: RouteManager.routes,
<<<<<<< HEAD
        initialRoute: RouteName.login,
=======
        initialRoute: RouteName.profileDetailPaidSchedule,
>>>>>>> 232fc7887269f9077e5c38e57eb5202579982dbd
      ),
    );
  }
}
