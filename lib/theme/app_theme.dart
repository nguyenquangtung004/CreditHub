import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({
    Key? key,
    this.data,
    required this.child,
  }) : super(key: key);

  final AppThemeData? data;
  final Widget child;

  static AppThemeData of(BuildContext context) {
    final _InheritedTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return inheritedTheme?.theme.data ?? AppThemeData.fromContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final AppTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final _InheritedTheme? ancestorTheme = context.findAncestorWidgetOfExactType<_InheritedTheme>();
    return identical(this, ancestorTheme) ? child : AppTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}