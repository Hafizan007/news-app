import 'package:technical_test/app/core/model/global_query_param.dart';
import 'package:technical_test/app/data/model/user_response.dart';

abstract class UserRemoteDataSource {
  Future<UserResponse> getUser(GlobalQueryParam queryParam);

  Future<bool> deleteUser(int userId);
}
