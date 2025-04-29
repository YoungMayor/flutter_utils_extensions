import 'package:flutter/material.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void buildContext(BuildContext context) {
  context.form; //                Shorthand for Form.of(context)
  context.navigator; //           Shorthand for `Navigator.of(context)
  context.overlay; //             Shorthand for Overlay.of(context)
  context.scaffold; //            Shorthand for Scaffold.of(context)
  context.scaffoldMessenger; //   Shorthand for ScaffoldMessenger.of(context)
  context.mediaQuery; //          Shorthand for MediaQuery.of(context)

  context.showSnackBar("Fluttering the right way");

  // MediaQuery Extensions
  context.platformBrightness;
  context.platformInDarkMode || context.platformInLightMode;

  context.widgetSize;
  context.widgetHeight;
  context.widgetWidth;

  context.orientation;
  context.isLandscape || context.isPortrait;

  context.widgetShortestSide;
  context.isPhone || context.isTablet || context.isDesktop;
  context.isSmallTablet || context.isLargeTablet;
}
