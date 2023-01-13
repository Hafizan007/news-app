import '../values/app_values.dart';

class NewsQueryParams {
  int page;
  int pageSize;
  String search;
  String category;

  NewsQueryParams({
    this.page = AppValues.defaultPageNumber,
    this.pageSize = AppValues.defaultPageSize,
    this.search = '',
    this.category = 'technology',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['category'] = category;
    data['country'] = 'us';

    if (search.isNotEmpty) data['q'] = search;

    return data;
  }
}
