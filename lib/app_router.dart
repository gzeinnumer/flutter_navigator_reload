import 'package:flutter/material.dart';
import 'package:flutter_navigator_reload/my_home_page.dart';
import 'package:flutter_navigator_reload/page_2_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Page2View.TAG:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(builder: (_) => Page2View(args));
      default:
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page'));
    }
  }
}

void pushAndRemoveUntil(BuildContext context, String tag, Widget view) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => view), ModalRoute.withName(tag));
}
