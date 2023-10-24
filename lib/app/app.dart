import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:godseyeev1/app/config/screencontroller_config.dart';
import 'package:godseyeev1/l10n/l10n.dart';
import 'package:godseyeev1/theme/theme.dart';
import 'package:godseyeev1/theme/theme_notifier.dart';
import 'package:godseyeev1/utils/app_strings.dart';

class TimesUpApp extends StatefulWidget {
  const TimesUpApp({Key? key}) : super(key: key);

  @override
  State<TimesUpApp> createState() => _TimesUpAppState();
}

class _TimesUpAppState extends State<TimesUpApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeNotifier>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: ScreensController.create(context),
    );
  }
}
