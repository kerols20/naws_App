import 'package:flutter/material.dart';
import 'package:naws_app/core/routes/pageRouts.dart';
import 'package:naws_app/core/routes/routs.dart';
import 'package:naws_app/modules/home_viwe/Home_viwe_Model.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  initTimeAgo();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Home_viwe(),
      child: MyApp(),
    ),
  );
}

void initTimeAgo() {
  timeago.setLocaleMessages('short', ShortTimeMessages());
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

class ShortTimeMessages implements timeago.LookupMessages {
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => '1m';
  @override String aboutAMinute(int minutes) => '1m';
  @override String minutes(int minutes) => '${minutes}m';
  @override String aboutAnHour(int minutes) => '1h';
  @override String hours(int hours) => '${hours}h';
  @override String aDay(int hours) => '1d';
  @override String days(int days) => '${days}d';
  @override String aboutAMonth(int days) => '1mo';
  @override String months(int months) => '${months}mo';
  @override String aboutAYear(int year) => '1y';
  @override String years(int years) => '${years}y';
  @override String wordSeparator() => ' ';
}
