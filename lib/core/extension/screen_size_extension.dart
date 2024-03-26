import 'package:flutter/widgets.dart';

extension ScreenSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenAspectRatio => MediaQuery.of(this).size.aspectRatio;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  double get smallFontSize => screenWidth * 0.035;
  double get mediumFontSize => screenWidth * 0.045;
  double get largeFontSize => screenWidth * 0.058;

  double get smallIconSize => screenWidth * 0.06;
  double get mediumIconSize => screenWidth * 0.08;
  double get largeIconSize => screenWidth * 0.1;

  double get getIconSizeForScreen {
    return screenWidth * (screenWidth < 600 ? 0.08 : 0.15);
  }
}
