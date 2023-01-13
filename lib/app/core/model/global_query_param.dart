import '../values/app_values.dart';

class GlobalQueryParam {
  int page;
  int pageSize;
  String search;

  GlobalQueryParam({
    this.page = AppValues.defaultPageNumber,
    this.pageSize = AppValues.defaultPageSize,
    this.search = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = pageSize;

    if (search.isNotEmpty) data['name'] = search;

    return data;
  }
}
