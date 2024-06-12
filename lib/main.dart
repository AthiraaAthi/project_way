import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/view/language_selection/language_selection.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(
  //   EasyLocalization(
  //     path: "assets/translations",
  //     supportedLocales: [
  //       Locale("en", "US"),
  //       Locale("ml", "IN"),
  //     ],
  //     fallbackLocale: Locale("en", "US"),
  //     startLocale: Locale("en", "US"),
  //     child: ProjectWay(),
  //   ),
  // );
  runApp(ProjectWay());
}

class ProjectWay extends StatelessWidget {
  const ProjectWay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => categoryprovider(),
        )
      ],
      child: MaterialApp(
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: LanguageSelection(),
      ),
    );
  }
}
