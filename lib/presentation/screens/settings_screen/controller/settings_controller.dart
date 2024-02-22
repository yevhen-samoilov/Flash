import 'package:flash/data/local/services/database_local.dart';
import 'package:flash/domain/services/navigation_service.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SettingsController extends ChangeNotifier {
  SettingsController() {
    initState();
  }
  void initState() => init();

  bool _loading = false;

  Locale? _locale;

  Locale? get locale => _locale;
  bool get loading => _loading;

  set setLocale(Locale l) {
    if (_locale == l) return;
    _locale = l;
    notifyListeners();
  }

  set setLoading(bool v) {
    if (_loading == v) return;
    _loading = v;
    notifyListeners();
  }

  setLang(int index) async {
    Nav.navigationService.goBack();
    final item = L10n.all[index];
    setLocale = item;
    await DataBaseService.save('Locale', {'Locale': '$item'});
  }

  checkLocale() async {
    if (!await DataBaseService.check('Locale')) return;
    final data = await DataBaseService.read('Locale');
    final languageCode = data['Locale'];
    setLocale = Locale(languageCode);
  }

  Future<void> init() async {
    setLoading = true;
    await checkLocale();
    setLoading = false;
  }
}
