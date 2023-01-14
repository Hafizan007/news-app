import 'package:technical_test/app/modules/news/controllers/news_controller.dart';

class CommonHelper {
  static String countryName(NewsCountry country) {
    switch (country) {
      case NewsCountry.id:
        return 'Indonesian';
      case NewsCountry.us:
        return 'United States';
      case NewsCountry.gb:
        return 'United Kingdom';
      case NewsCountry.kr:
        return 'South Korean';
      case NewsCountry.jp:
        return 'Japan';

      default:
        return '';
    }
  }
}
