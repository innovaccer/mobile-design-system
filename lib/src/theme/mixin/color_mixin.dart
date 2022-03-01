import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

mixin ColorMixin {
  ColorTheme get _currentTheme => ThemeManager.shared.currentTheme;

  Color get primary => _currentTheme.primary.base;
  Color get primaryDark => _currentTheme.primary.dark;
  Color get primaryDarker => _currentTheme.primary.darker;
  Color get primaryLight => _currentTheme.primary.light;
  Color get primaryLighter => _currentTheme.primary.lighter;
  Color get primaryLightest => _currentTheme.primary.lightest;
  Color get primaryShadow => _currentTheme.primary.shadow;

  Color get secondary => _currentTheme.secondary.base;
  Color get secondaryDark => _currentTheme.secondary.dark;
  Color get secondaryDarker => _currentTheme.secondary.darker;
  Color get secondaryLight => _currentTheme.secondary.light;
  Color get secondaryLighter => _currentTheme.secondary.lighter;
  Color get secondaryLightest => _currentTheme.secondary.lightest;
  Color get secondaryShadow => _currentTheme.secondary.shadow;

  Color get success => _currentTheme.success.base;
  Color get successDark => _currentTheme.success.dark;
  Color get successDarker => _currentTheme.success.darker;
  Color get successLight => _currentTheme.success.light;
  Color get successLighter => _currentTheme.success.lighter;
  Color get successLightest => _currentTheme.success.lightest;
  Color get successShadow => _currentTheme.success.shadow;

  Color get alert => _currentTheme.alert.base;
  Color get alertDark => _currentTheme.alert.dark;
  Color get alertDarker => _currentTheme.alert.darker;
  Color get alertLight => _currentTheme.alert.light;
  Color get alertLighter => _currentTheme.alert.lighter;
  Color get alertLightest => _currentTheme.alert.lightest;
  Color get alertShadow => _currentTheme.alert.shadow;

  Color get warning => _currentTheme.warning.base;
  Color get warningDark => _currentTheme.warning.dark;
  Color get warningDarker => _currentTheme.warning.darker;
  Color get warningLight => _currentTheme.warning.light;
  Color get warningLighter => _currentTheme.warning.lighter;
  Color get warningLightest => _currentTheme.warning.lightest;
  Color get warningShadow => _currentTheme.warning.shadow;

  Color get accent1 => _currentTheme.accent1.base;
  Color get accent1Dark => _currentTheme.accent1.dark;
  Color get accent1Darker => _currentTheme.accent1.darker;
  Color get accent1Light => _currentTheme.accent1.light;
  Color get accent1Lighter => _currentTheme.accent1.lighter;
  Color get accent1Lightest => _currentTheme.accent1.lightest;
  Color get accent1Shadow => _currentTheme.accent1.shadow;

  Color get accent2 => _currentTheme.accent2.base;
  Color get accent2Dark => _currentTheme.accent2.dark;
  Color get accent2Darker => _currentTheme.accent2.darker;
  Color get accent2Light => _currentTheme.accent2.light;
  Color get accent2Lighter => _currentTheme.accent2.lighter;
  Color get accent2Lightest => _currentTheme.accent2.lightest;
  Color get accent2Shadow => _currentTheme.accent2.shadow;

  Color get accent3 => _currentTheme.accent3.base;
  Color get accent3Dark => _currentTheme.accent3.dark;
  Color get accent3Darker => _currentTheme.accent3.darker;
  Color get accent3Light => _currentTheme.accent3.light;
  Color get accent3Lighter => _currentTheme.accent3.lighter;
  Color get accent3Lightest => _currentTheme.accent3.lightest;
  Color get accent3Shadow => _currentTheme.accent3.shadow;

  Color get accent4 => _currentTheme.accent4.base;
  Color get accent4Dark => _currentTheme.accent4.dark;
  Color get accent4Darker => _currentTheme.accent4.darker;
  Color get accent4Light => _currentTheme.accent4.light;
  Color get accent4Lighter => _currentTheme.accent4.lighter;
  Color get accent4Lightest => _currentTheme.accent4.lightest;
  Color get accent4Shadow => _currentTheme.accent4.shadow;

  Color get inverse => _currentTheme.inverse.base;
  Color get inverseDark => _currentTheme.inverse.dark;
  Color get inverseDarker => _currentTheme.inverse.darker;
  Color get inverseLight => _currentTheme.inverse.light;
  Color get inverseLighter => _currentTheme.inverse.lighter;
  Color get inverseLightest => _currentTheme.inverse.lightest;
  Color get inverseShadow => _currentTheme.inverse.shadow;

  Color get textColor => _currentTheme.inverse.base;
  Color get textSubtleColor => _currentTheme.inverse.lighter;
  Color get textSubtitleColor => _currentTheme.inverse.light;
  Color get textLinkColor => _currentTheme.primary.base;
  Color get textAlertColor => _currentTheme.alert.base;
  Color get textDisabledColor => _currentTheme.inverse.lightest;
  Color get textDestructiveColor => _currentTheme.alert.base;
  Color get textWhiteColor => _currentTheme.textColor.light;
  Color get textBlackColor => _currentTheme.textColor.dark;
  Color get textSuccessColor => _currentTheme.success.base;

  Color get shadowColor => ColorToken.black.withOpacity(ColorThemes.shadowOpacity);

  Color get backgroundColor => _currentTheme.background.backgroundColor;
  Color get navigationBarColor => _currentTheme.background.navigationBarBackgroundColor;

  Color get lightTintColor => _currentTheme.tintColor.light;
  Color get darkTintColor => _currentTheme.tintColor.dark;

  Brightness get brightness => _currentTheme.brightness;
}
