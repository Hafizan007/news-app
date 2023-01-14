import 'package:get/get.dart';
import 'package:technical_test/app/data/remote/news_remote_data_source.dart';

import '../data/remote/news_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(),
      tag: (NewsRemoteDataSource).toString(),
    );
  }
}
