import 'package:flutter/widgets.dart';
import 'package:intellibra/l10n/arb/app_localizations.dart';

export 'package:intellibra/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
