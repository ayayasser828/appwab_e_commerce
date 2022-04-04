import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.dart';
import 'constant/get_lang.dart';
import 'constant/global_variable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  prefs =await SharedPreferences.getInstance();
  await GetLAng.getLang();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
    path: 'assets/lang',
    fallbackLocale: const Locale('en','US'),
    saveLocale: true,
    startLocale: const Locale('en','US'),
    child: MyApp(
      appRouter: AppRouter(),
    ),
    // child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRouts,
    );
  }
}