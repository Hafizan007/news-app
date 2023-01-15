abstract class AppValues {
  //logger
  static const int loggerLineLength = 120;
  static const int loggerMethodCount = 2;
  static const int loggerErrorMethodCount = 8;

  //network
  static const int defaultPageSize = 10;
  static const int defaultPageNumber = 1;
  static const int defaultDebounceTimeInMilliSeconds = 500;
  static const int defaultThrottleTimeInMilliSeconds = 500;

  //margin
  static const double margin = 16;
  static const double marginZero = 0;
  static const double smallMargin = 8;
  static const double extraSmallMargin = 6;
  static const double largeMargin = 24;
  static const double margin_40 = 40;
  static const double margin_32 = 32;
  static const double margin_18 = 18;
  static const double margin_2 = 2;
  static const double margin_4 = 4;
  static const double margin_6 = 6;
  static const double margin_12 = 12;
  static const double margin_16 = 16;
  static const double margin_10 = 10;
  static const double margin_30 = 30;
  static const double margin_20 = 20;
  static const double extraLargeMargin = 36;
  static const double marginBelowVerticalLine = 64;
  static const double extraLargeSpacing = 96;

//radius
  static const double radius = 16;
  static const double bigRadius = 28;
  static const double radiusZero = 0;
  static const double smallRadius = 8;
  static const double radius_4 = 4;
  static const double radius_6 = 6;
  static const double radius_12 = 12;
  static const double radius_10 = 10;

  //list
  static const double listBottomEmptySpace = 100;

  static const double extraSmallTextSize = 10;
  static const double smallTextSize = 12;
  static const double mediumTextSize = 14;
  static const double largeTextSize = 16;

  static const double height_24 = 24;
  static const double height_16 = 16;
  static const double height_12 = 12;
  static const double height_10 = 10;
  static const double height_8 = 8;
  static const double height_4 = 4;
  static const double height_2 = 2;

  static const double padding = 16;
  static const double paddingZero = 0;
  static const double halfPadding = 8;
  static const double smallPadding = 10;
  static const double extraSmallPadding = 6;
  static const double largePadding = 24;
  static const double extraLargePadding = 32;
  static const double padding_12 = 12;
  static const double padding_4 = 4;
  static const double padding_2 = 2;
  static const double padding_3 = 3;
  static const double buttonVerticalPadding = 12;

  //icon
  static const double iconSize5 = 5;
  static const double iconSize20 = 20;

  //image
  static const double newsHeroImageHeight = 114;
  static const double errorImageWidth = 300;

  static const List<String> adUrlFilters = [
    ".*.doubleclick.net/.*",
    ".*.ads.pubmatic.com/.*",
    ".*.googlesyndication.com/.*",
    ".*.google-analytics.com/.*",
    ".*.adservice.google.*/.*",
    ".*.adbrite.com/.*",
    ".*.exponential.com/.*",
    ".*.quantserve.com/.*",
    ".*.scorecardresearch.com/.*",
    ".*.zedo.com/.*",
    ".*.adsafeprotected.com/.*",
    ".*.teads.tv/.*",
    ".*.outbrain.com/.*"
  ];

  static const double minButtonHeigh = 44;

  static const double iconDefaultSize = 24;
}
