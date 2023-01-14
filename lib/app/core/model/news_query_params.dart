import 'package:technical_test/app/modules/news/controllers/news_controller.dart';

import '../values/app_values.dart';

class NewsQueryParams {
  int page;
  int pageSize;
  String search;
  NewsCategory category;
  NewsCountry country;

  NewsQueryParams({
    this.page = AppValues.defaultPageNumber,
    this.pageSize = AppValues.defaultPageSize,
    this.search = '',
    this.category = NewsCategory.technology,
    this.country = NewsCountry.us,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['category'] = category.name;
    data['country'] = country.name;

    if (search.isNotEmpty) data['q'] = search;

    return data;
  }
}
