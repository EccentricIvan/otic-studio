import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._();

  static const double xs = 8;
  static const double sm = 16;
  static const double md = 24;
  static const double lg = 32;

  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);

  static const EdgeInsets paddingHorizSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizMd = EdgeInsets.symmetric(horizontal: md);

  static const double radiusSm = 12;
  static const double radiusLg = 16;

  static final BorderRadius borderRadiusSm = BorderRadius.circular(radiusSm);
  static final BorderRadius borderRadiusLg = BorderRadius.circular(radiusLg);
}
