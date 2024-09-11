import 'package:flutter/material.dart';
import 'package:myap/models/product.dart';
import 'package:myap/views/cart_screen.dart';
import 'package:myap/views/details_screen.dart';

import 'package:myap/views/home_screen.dart';
import 'package:myap/views/login_screen.dart';
import 'package:myap/views/not_found.dart';
import 'package:myap/views/order.dart';
import 'package:myap/views/receipt.dart';
import 'package:myap/views/sing.dart';
import 'package:myap/views/splash_screen.dart';

import '../views/demoStateful.dart';

class AppRoutes {
  //ادارة الروت
  //التنقل بين الصفحات"routeManager"
  static Route<dynamic>? routeManager(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
        case '/order':
        return MaterialPageRoute(builder: (ctx) => Order());
        case '/rececip':
        return MaterialPageRoute(builder: (ctx) => Receipt());
        case '/sing':
        return MaterialPageRoute(builder: (ctx) => Sing());

      case '/details':
        {
          Product per = settings.arguments as Product;
          return MaterialPageRoute(
              builder: (ctx) => DetailsScreen(p:per), );
        }
      case '/cart':
        {
          List<Map<Product, int>> cartItems =
              settings.arguments as List<Map<Product, int>>;
          return MaterialPageRoute(
              builder: (ctx) => CartScreen(cart: cartItems));
        }
      case '/splash':
        return MaterialPageRoute(builder: (ctx) => SplashScreen());
      case '/State':
        return MaterialPageRoute(builder: (ctx) => DemoeScreen());
      case '/login':
        return MaterialPageRoute(builder: (ctx) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (ctx) => NotFoundScreen());
    }
  }
}
