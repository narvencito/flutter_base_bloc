import 'package:emerson/app/config/routes_app.dart';
import 'package:emerson/app/config/theme_app.dart';

import 'package:emerson/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getItApp = GetIt.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeApp().light,
      onGenerateRoute: RoutesApp.routes,
    );
  }
}
