import 'package:flutter/material.dart';

abstract final class AppBorderRadius {
  static const double button = 4.0;

  static const double chip = 6.0;
  static const double sm = 8.0;
  static const double card = 12.0;
  static const double imageLg = 16.0;
  static const double bottomSheet = 20.0;
  static const double searchBar = 24.0;
  static const double circle = 999.0;

  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(button),
  );
  static const BorderRadius chipRadius = BorderRadius.all(
    Radius.circular(chip),
  );
  static const BorderRadius cardRadius = BorderRadius.all(
    Radius.circular(card),
  );
  static const BorderRadius inputRadius = BorderRadius.all(
    Radius.circular(button),
  );

  static const BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(bottomSheet),
    topRight: Radius.circular(bottomSheet),
  );
  static const BorderRadius circleRadius = BorderRadius.all(
    Radius.circular(circle),
  );

  static const BorderRadius searchBarRadius = BorderRadius.all(
    Radius.circular(searchBar),
  );
}
