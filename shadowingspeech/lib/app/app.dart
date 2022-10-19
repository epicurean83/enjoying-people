import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shadowingspeech/app/i10n.dart';
import 'package:shadowingspeech/app/ui/color_schemes.g.dart';
import 'package:shadowingspeech/app/ui/home/home_page.dart';
import 'package:shadowingspeech/app/ui/study/player_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (context) => i10n(context).appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      initialRoute: HomePage.routeName,
      getPages: [
        GetPage(name: HomePage.routeName, page: () => const HomePage()),
        GetPage(name: PlayerPage.routeName, page: () => const PlayerPage()),
      ],
    );
  }
}
