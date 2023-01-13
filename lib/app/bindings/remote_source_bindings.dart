import 'package:get/get.dart';
import 'package:technical_test/app/data/remote/user_remote_data_source.dart';

import '../data/remote/user_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(),
      tag: (UserRemoteDataSource).toString(),
    );
  }
}
