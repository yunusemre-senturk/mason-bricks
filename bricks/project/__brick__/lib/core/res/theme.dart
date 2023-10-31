// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/res/colors.dart';
import 'package:{{projectName.snakeCase()}}/core/res/dimens.dart';

class AppTheme {
  static ThemeData theme({bool isDark = false}) => ThemeData(
        // useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
            brightness: isDark ? Brightness.dark : Brightness.light,
            primarySwatch: AppColors.primarySwatch,
            accentColor: AppColors.primarySwatch),

        // scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        indicatorColor: AppColors.primarySwatch,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          // elevation: 0,
          foregroundColor: Colors.white,
        ),
        // textTheme: textTheme,
        buttonTheme: buttonTheme,
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.xs)),
        ),
        elevatedButtonTheme: elevatedButtonTheme,
        textButtonTheme: textButtonTheme,
        outlinedButtonTheme: outlinedButtonThemeData,
        inputDecorationTheme: InputDecorationTheme(
            errorMaxLines: 2,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.s),
            ),
            alignLabelWithHint: true),
        bottomNavigationBarTheme: bottomNavigationBarTheme,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return AppColors.primarySwatch;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return AppColors.primarySwatch;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return AppColors.primarySwatch;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return AppColors.primarySwatch;
            }
            return null;
          }),
        ),
      );

  static BottomNavigationBarThemeData bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    elevation: 4,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primarySwatch,
    unselectedItemColor: AppColors.darkGrey,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );

  static ButtonThemeData buttonTheme = const ButtonThemeData(
    padding: EdgeInsets.only(
        top: Dimens.m, bottom: Dimens.m, left: Dimens.m, right: Dimens.m),
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.only(
        top: Dimens.m, bottom: Dimens.m, left: Dimens.m, right: Dimens.m),
  ));
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.only(
        top: Dimens.m, bottom: Dimens.m, left: Dimens.m, right: Dimens.m),
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        width: 0.0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(Dimens.xs)),
    ),
  ));

  static OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    side: BorderSide(color: AppColors.primarySwatch),
    padding: const EdgeInsets.only(
        top: Dimens.m, bottom: Dimens.m, left: Dimens.m, right: Dimens.m),
  ));

  static ButtonStyle greenElevatedButton() {
    return ElevatedButton.styleFrom(backgroundColor: AppColors.green);
  }

  static ButtonStyle darkGreyElevatedButton() {
    return ElevatedButton.styleFrom(backgroundColor: AppColors.darkGrey);
  }
}
