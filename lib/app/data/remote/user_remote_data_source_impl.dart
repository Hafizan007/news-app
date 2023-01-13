import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_test/app/core/base/base_remote_source.dart';
import 'package:technical_test/app/core/model/global_query_param.dart';
import 'package:technical_test/app/data/model/user_response.dart';
import 'package:technical_test/app/data/remote/user_remote_data_source.dart';

import '../../network/dio_provider.dart';

class UserRemoteDataSourceImpl extends BaseRemoteSource
    implements UserRemoteDataSource {
  @override
  Future<UserResponse> getUser(GlobalQueryParam queryParam) {
    final endPoint = "${DioProvider.baseUrl}${dotenv.env['URL_LIST_USER']}";
    final dioCall = dioClient.get(
      endPoint,
      queryParameters: queryParam.toJson(),
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseUserResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  UserResponse _parseUserResponse(Response<dynamic> response) {
    return UserResponse.fromMap(response.data);
  }

  @override
  Future<bool> deleteUser(int userId) async {
    final endPoint =
        "${DioProvider.baseUrl}${dotenv.env['URL_LIST_USER']}/$userId";

    final dioCall = dioClient.delete(endPoint);
    try {
      return callApiWithErrorParser(dioCall).then((response) => true);
    } catch (e) {
      rethrow;
    }
  }
}
