import 'dart:ui';

import 'package:innovaccer_design_system/innovaccer_design_system.dart';

enum ThemeType {
  mdsStandardTheme,
  mdsStandardDarkTheme,
}

extension KeyValue on ThemeType {
  String get key {
    switch (this) {
      case ThemeType.mdsStandardTheme:
        return 'mdsStandardTheme';
      case ThemeType.mdsStandardDarkTheme:
        return 'mdsStandardDarkTheme';
      default:
        return 'mdsStandardTheme';
    }
  }
}

class ColorThemes {
  static final double shadowOpacity = 0.16;

  static final ColorTheme mdsStandardTheme = ColorTheme(
    primary: Primary(
      base: ColorToken.jal,
      dark: ColorToken.jalDark,
      darker: ColorToken.jalDarker,
      light: ColorToken.jalLight,
      lighter: ColorToken.jalLighter,
      lightest: ColorToken.jalLightest,
      shadow: ColorToken.jal.withOpacity(shadowOpacity),
    ),
    secondary: Secondary(
      base: ColorToken.stone,
      dark: ColorToken.stoneDark,
      darker: ColorToken.stoneDark,
      light: ColorToken.stoneLight,
      lighter: ColorToken.stoneLighter,
      lightest: ColorToken.stoneLightest,
      shadow: ColorToken.stone.withOpacity(shadowOpacity),
    ),
    success: Success(
      base: ColorToken.neem,
      dark: ColorToken.neemDark,
      darker: ColorToken.neemDarker,
      light: ColorToken.neemLight,
      lighter: ColorToken.neemLighter,
      lightest: ColorToken.neemLightest,
      shadow: ColorToken.neem.withOpacity(shadowOpacity),
    ),
    alert: Alert(
      base: ColorToken.mirch,
      dark: ColorToken.mirchDark,
      darker: ColorToken.mirchDarker,
      light: ColorToken.mirchLight,
      lighter: ColorToken.mirchLighter,
      lightest: ColorToken.mirchLightest,
      shadow: ColorToken.mirch.withOpacity(shadowOpacity),
    ),
    warning: Warning(
      base: ColorToken.haldi,
      dark: ColorToken.haldiDark,
      darker: ColorToken.haldiDarker,
      light: ColorToken.haldiLight,
      lighter: ColorToken.haldiLighter,
      lightest: ColorToken.haldiLightest,
      shadow: ColorToken.haldi.withOpacity(shadowOpacity),
    ),
    accent1: Accent1(
      base: ColorToken.tawak,
      dark: ColorToken.tawakDark,
      darker: ColorToken.tawakDarker,
      light: ColorToken.tawakLight,
      lighter: ColorToken.tawakLighter,
      lightest: ColorToken.tawakLightest,
      shadow: ColorToken.tawak.withOpacity(shadowOpacity),
    ),
    accent2: Accent2(
      base: ColorToken.jamun,
      dark: ColorToken.jamunDark,
      darker: ColorToken.jamunDarker,
      light: ColorToken.jamunLight,
      lighter: ColorToken.jamunLighter,
      lightest: ColorToken.jamunLightest,
      shadow: ColorToken.jamun.withOpacity(shadowOpacity),
    ),
    accent3: Accent3(
      base: ColorToken.neel,
      dark: ColorToken.neelDark,
      darker: ColorToken.neelDarker,
      light: ColorToken.neelLight,
      lighter: ColorToken.neelLighter,
      lightest: ColorToken.neelLightest,
      shadow: ColorToken.neel.withOpacity(shadowOpacity),
    ),
    accent4: Accent4(
      base: ColorToken.nimbu,
      dark: ColorToken.nimbuDark,
      darker: ColorToken.nimbuDarker,
      light: ColorToken.nimbuLight,
      lighter: ColorToken.nimbuLighter,
      lightest: ColorToken.nimbuLightest,
      shadow: ColorToken.nimbu.withOpacity(shadowOpacity),
    ),
    inverse: Inverse(
      base: ColorToken.night,
      dark: ColorToken.night,
      darker: ColorToken.night,
      light: ColorToken.nightLight,
      lighter: ColorToken.nightLighter,
      lightest: ColorToken.nightLightest,
      shadow: ColorToken.night.withOpacity(shadowOpacity),
    ),
    background: Background(
      backgroundColor: ColorToken.light,
      navigationBarBackgroundColor: ColorToken.lightNavigationBar,
    ),
    textColor: TextColor(
      light: ColorToken.light,
      dark: ColorToken.dark,
    ),
    tintColor: TintColor(
      light: ColorToken.light,
      dark: ColorToken.dark,
    ),
    brightness: Brightness.light,
  );

  static final ColorTheme mdsStandardDarkTheme = ColorTheme(
    primary: Primary(
      base: ColorToken.jalDarker,
      dark: ColorToken.jalDark,
      darker: ColorToken.jal,
      light: ColorToken.jalLightest,
      lighter: ColorToken.jalLighter,
      lightest: ColorToken.jalLight,
      shadow: ColorToken.jal.withOpacity(shadowOpacity),
    ),
    secondary: Secondary(
      darker: ColorToken.stone,
      dark: ColorToken.stoneDark,
      base: ColorToken.stoneDarker,
      lightest: ColorToken.stoneLight,
      lighter: ColorToken.stoneLighter,
      light: ColorToken.stoneLightest,
      shadow: ColorToken.stone.withOpacity(shadowOpacity),
    ),
    success: Success(
      darker: ColorToken.neem,
      dark: ColorToken.neemDark,
      base: ColorToken.neemDarker,
      lightest: ColorToken.neemLight,
      lighter: ColorToken.neemLighter,
      light: ColorToken.neemLightest,
      shadow: ColorToken.neem.withOpacity(shadowOpacity),
    ),
    alert: Alert(
      darker: ColorToken.mirch,
      dark: ColorToken.mirchDark,
      base: ColorToken.mirchDarker,
      lightest: ColorToken.mirchLight,
      lighter: ColorToken.mirchLighter,
      light: ColorToken.mirchLightest,
      shadow: ColorToken.mirch.withOpacity(shadowOpacity),
    ),
    warning: Warning(
      darker: ColorToken.haldi,
      dark: ColorToken.haldiDark,
      base: ColorToken.haldiDarker,
      light: ColorToken.haldiLight,
      lighter: ColorToken.haldiLighter,
      lightest: ColorToken.haldiLightest,
      shadow: ColorToken.haldi.withOpacity(shadowOpacity),
    ),
    accent1: Accent1(
      darker: ColorToken.tawak,
      dark: ColorToken.tawakDark,
      base: ColorToken.tawakDarker,
      lightest: ColorToken.tawakLight,
      lighter: ColorToken.tawakLighter,
      light: ColorToken.tawakLightest,
      shadow: ColorToken.tawak.withOpacity(shadowOpacity),
    ),
    accent2: Accent2(
      darker: ColorToken.jamun,
      dark: ColorToken.jamunDark,
      base: ColorToken.jamunDarker,
      lightest: ColorToken.jamunLight,
      lighter: ColorToken.jamunLighter,
      light: ColorToken.jamunLightest,
      shadow: ColorToken.jamun.withOpacity(shadowOpacity),
    ),
    accent3: Accent3(
      darker: ColorToken.neel,
      dark: ColorToken.neelDark,
      base: ColorToken.neelDarker,
      lightest: ColorToken.neelLight,
      lighter: ColorToken.neelLighter,
      light: ColorToken.neelLightest,
      shadow: ColorToken.neel.withOpacity(shadowOpacity),
    ),
    accent4: Accent4(
      darker: ColorToken.nimbu,
      dark: ColorToken.nimbuDark,
      base: ColorToken.nimbuDarker,
      lightest: ColorToken.nimbuLight,
      lighter: ColorToken.nimbuLighter,
      light: ColorToken.nimbuLightest,
      shadow: ColorToken.nimbu.withOpacity(shadowOpacity),
    ),
    inverse: Inverse(
      darker: ColorToken.night,
      dark: ColorToken.night,
      base: ColorToken.night,
      lightest: ColorToken.nightLight,
      lighter: ColorToken.nightLighter,
      light: ColorToken.nightLightest,
      shadow: ColorToken.night.withOpacity(shadowOpacity),
    ),
    background: Background(
      backgroundColor: ColorToken.dark,
      navigationBarBackgroundColor: ColorToken.darkNavigationBar,
    ),
    textColor: TextColor(
      light: ColorToken.dark,
      dark: ColorToken.light,
    ),
    tintColor: TintColor(
      light: ColorToken.dark,
      dark: ColorToken.light,
    ),
    brightness: Brightness.dark,
  );
}
