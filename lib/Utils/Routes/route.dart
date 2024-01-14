import 'package:chatbot/Utils/Routes/route_name.dart';
import 'package:chatbot/View/home.dart';

import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Home();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Container(
              color: Colors.red,
              width: double.infinity,
              height: double.infinity,
              child: const Text('No Route Find'),
            ),
          );
        });
    }
  }
}
