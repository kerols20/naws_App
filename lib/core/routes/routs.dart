import 'package:flutter/material.dart';
import 'package:naws_app/core/routes/pageRouts.dart';
import 'package:naws_app/modules/on_bording/on_Bording_Screen.dart';
import 'package:naws_app/modules/search_screen/search_screen.dart';
import 'package:naws_app/modules/splach_screen/splach_screen.dart';
abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.splach:
        return MaterialPageRoute(
          builder: (context) => SplachScreen(),
          settings: settings,
        );
        case PagesRouteName.onboarding:
        return MaterialPageRoute(
          builder: (context) => on_Bording(),
          settings: settings,
        );
        case PagesRouteName.id:
        return MaterialPageRoute(
          builder: (context) => SearchScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplachScreen(), // المسار الافتراضي
          settings: settings,
        );
    }
  }
}
