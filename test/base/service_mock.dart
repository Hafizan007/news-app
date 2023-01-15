import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:technical_test/app/core/model/news_query_params.dart';
import 'package:technical_test/app/data/repository/news_repository.dart';

class MockDio extends Mock implements Dio {}

class MockNewsRepository extends Mock implements NewsRepository {}

class FakeNewsQueryParams extends Fake implements NewsQueryParams {}

abstract class MyFunction {
  void call();
}

class MyFunctionMock extends Mock implements MyFunction {}

final mockDio = MockDio();
final mockNewsRepository = MockNewsRepository();
final fakeNewsParams = FakeNewsQueryParams();
final mockOnTap = MyFunctionMock();

void initServiceMock() {
  Get.lazyPut<Dio>(() => mockDio);
  Get.lazyPut<NewsRepository>(
    () => mockNewsRepository,
    tag: (NewsRepository).toString(),
  );
}
