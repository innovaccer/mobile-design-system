import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String persistedThemeKey = 'persistedThemeKey';

class ThemeManager extends ChangeNotifier {
  ///The singleton instance of the Theme Manager
  static ThemeManager? _sharedInstance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  factory ThemeManager.init({ColorTheme? persistedTheme}) {
    _sharedInstance ??= ThemeManager._(
        persistedTheme: persistedTheme ?? ColorThemes.mdsStandardTheme);
    // since you are sure you will return non-null value, add '!' operator
    return _sharedInstance!;
  }

  ///Private constructor for initializing
  ThemeManager._({required ColorTheme persistedTheme}) {
    currentTheme = persistedTheme;
    updateBrightness();
  }

  ///This is the getter for the singleton logger instance
  static ThemeManager get shared {
    return _sharedInstance ?? ThemeManager.init();
  }

  ColorTheme currentTheme = ColorThemes.mdsStandardTheme;

  void updateTheme({
    required ThemeType to,
  }) {
    switch (to) {
      case ThemeType.mdsStandardTheme:
        _sharedInstance?.currentTheme = ColorThemes.mdsStandardTheme;
        break;
      case ThemeType.mdsStandardDarkTheme:
        _sharedInstance?.currentTheme = ColorThemes.mdsStandardDarkTheme;
        break;
    }
    _persistTheme(to);
    updateBrightness();
    notify();
  }

  void notify() {
    notifyListeners();
  }

  void _persistTheme(ThemeType type) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(persistedThemeKey, type.key);
  }

  void updateBrightness() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: currentTheme.brightness,
      ),
    );
  }
}

class ThemeManagerHelper {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<ColorTheme> fetchPersistedThemeFromLocalStorage() async {
    final SharedPreferences prefs = await _prefs;
    String? persistedTheme = prefs.getString(persistedThemeKey);
    if (persistedTheme == ThemeType.mdsStandardDarkTheme.key) {
      return ColorThemes.mdsStandardDarkTheme;
    } else if (persistedTheme == ThemeType.mdsStandardTheme.key) {
      return ColorThemes.mdsStandardTheme;
    } else {
      return ColorThemes.mdsStandardTheme;
    }
  }
}
