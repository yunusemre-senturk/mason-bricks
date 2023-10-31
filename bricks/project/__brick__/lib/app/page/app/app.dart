// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/app/page/app/app_vm.dart';
import 'package:{{projectName.snakeCase()}}/core/base/base_widget.dart';
import 'package:{{projectName.snakeCase()}}/core/res/theme.dart';
import 'package:{{projectName.snakeCase()}}/core/util/siren.dart';
import 'package:{{projectName.snakeCase()}}/core/widget/force_update.dart';
import 'package:{{projectName.snakeCase()}}/route.dart';
import 'package:{{projectName.snakeCase()}}/route.routes.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends BaseState<AppViewModel, MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: viewModel.appName,
      theme: AppTheme.theme(isDark: viewModel.isDark),
      initialRoute: RouteMaps.splashRoute,
      onGenerateRoute: onGenerateRoute,
      locale: const Locale('tr'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: viewModel.mainNavigatorKey,
      localeResolutionCallback: (
        locale,
        supportedLocales,
      ) {
        Intl.defaultLocale = locale?.languageCode;
        return locale;
      },
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            if (viewModel.sirenType != SirenType.none)
              ForceUpdatePage(
                sirenType: viewModel.sirenType,
              )
          ],
        );
      },
    );
  }
}
