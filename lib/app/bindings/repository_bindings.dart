import 'package:get/get.dart';
import 'package:technical_test/app/data/repository/user_repository.dart';

import '../data/repository/user_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
      tag: (UserRepository).toString(),
    );
  }
}
