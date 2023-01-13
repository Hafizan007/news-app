import 'package:get/instance_manager.dart';
import 'package:technical_test/app/core/model/global_query_param.dart';
import 'package:technical_test/app/data/model/user_response.dart';
import 'package:technical_test/app/data/remote/user_remote_data_source.dart';
import 'package:technical_test/app/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteSource =
      Get.find(tag: (UserRemoteDataSource).toString());

  @override
  Future<UserResponse> getUser(GlobalQueryParam queryParam) {
    return _remoteSource.getUser(queryParam);
  }

  @override
  Future<bool> deleteUser(int userId) {
    return _remoteSource.deleteUser(userId);
  }
}
