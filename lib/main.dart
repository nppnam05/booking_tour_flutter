import 'package:booking_tour_flutter/app.dart';
import 'package:booking_tour_flutter/app/app_navigator.dart';
import 'package:booking_tour_flutter/app/dependency_injection/configure_injectable.dart';
import 'package:booking_tour_flutter/app/dependency_injection/theme/theme_manager.dart';
import 'package:booking_tour_flutter/app/route_manager.dart';
import 'package:booking_tour_flutter/presentation/tour_guide/schedule_tourguide_screen.dart';
import 'package:booking_tour_flutter/presentation/trip/trip_screen.dart';
import 'package:booking_tour_flutter/presentation/trip/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjectable();

  // init firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}
