import 'package:filmy/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key key,
    @required this.child,
    @required this.navigatorKey,
    @required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      
      child: child,
      navigatorKey: navigatorKey,
      projectId: 'filmy-zshz6ef',
      secret: '4viuqnl4kx85l9qr6hizdci7e3hezc01',
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
        showDebugFloatingEntryPoint: false,
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.violetColor,
        dividerColor: AppColors.blueColor,
        secondaryBackgroundColor: AppColors.blackColor
      ),
    );
  }
}