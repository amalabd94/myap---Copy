import 'package:flutter/material.dart';
import 'package:myap/utils/app_routes.dart';
import 'package:myap/views/cart_screen.dart';
import 'package:myap/views/details_screen.dart';
import 'package:myap/views/home_screen.dart';
import 'package:myap/views/login_screen.dart';
import 'package:myap/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      //home: HomeScreen(),
      initialRoute: '/home',
      onGenerateRoute: AppRoutes.routeManager,
      //    استخدمنا الطريقة الثانية من التنقل عبر"routes" وتحمل ماب لانها ترتبط عن طريق "kay"و"value"
      // routes: {
      //   "/home":(ctx)=>HomeScreen(),
      //   "/details":(ctx)=>DetailsScreen(),
      //   "/cart":(ctx)=>CartScreen(),
      //   "/splash":(ctx)=>SplashScreen(),
      //   "/login":(ctx)=>LoginScreen(),
      //
      // },
    );
  }
}
