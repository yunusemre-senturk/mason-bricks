// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextEx on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this)!;
}
