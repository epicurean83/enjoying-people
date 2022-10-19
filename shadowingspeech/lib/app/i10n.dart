import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ko.dart';

AppLocalizations i10n(BuildContext context) {
  return AppLocalizations.of(context) ?? AppLocalizationsKo();
}
