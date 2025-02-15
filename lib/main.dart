import 'package:flutter/material.dart';
import 'package:naws_app/core/routes/pageRouts.dart';
import 'package:naws_app/core/routes/routs.dart';
GlobalKey <NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
///متى تحتاج إلى GlobalKey<NavigatorState>؟
// عند استخدام إدارة الحالة مثل Provider أو Bloc، حيث لا يمكن الوصول إلى context بسهولة.
// للتنقل من أماكن خارج شجرة الودجتس، مثل background notifications أو services.
// لإغلاق جميع الشاشات وفتح شاشة جديدة (مثلاً عند تسجيل الخروج من التطبيق).
 // navigatorKey.currentState?.pushNamed(PagesRouteName.onboarding); example
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PagesRouteName.splach,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
