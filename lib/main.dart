import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: "assets/translations",
      supportedLocales: [
        //Locale("en", "US"),
        Locale("en"),
        Locale("ml"),
        //Locale("ml", "IN"),
      ],
      fallbackLocale: Locale("en"),
      startLocale: Locale("en"),
      child: ProjectWay(),
    ),
  );
  //runApp(ProjectWay());
}

class ProjectWay extends StatelessWidget {
  const ProjectWay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
