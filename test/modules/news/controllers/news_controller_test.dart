import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:technical_test/app/data/model/news_response.dart';
import 'package:technical_test/app/modules/news/controllers/news_controller.dart';
import 'package:technical_test/flavors/build_config.dart';
import 'package:technical_test/flavors/env_config.dart';
import 'package:technical_test/flavors/environment.dart';

import '../../../base/service_mock.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  EnvConfig devConfig = EnvConfig(
    appName: "Template Project",
    baseUrl: dotenv.env['BASE_URL'] ?? "",
    shouldCollectCrashLog: true,
  );
  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  setUp(() {
    Get.testMode = true;
    registerFallbackValue(fakeNewsParams);
    initServiceMock();
  });

  tearDown(() {
    Get.reset();
    reset(mockNewsRepository);
  });

  group("controller news", () {
    test('show news data when controller init', () async {
      const newsResponse = NewsResponse(
        articles: [
          Article(title: 'cnn'),
        ],
        totalResults: 10,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse);

      final ctrl = Get.put(NewsController());

      await Future.delayed(const Duration(milliseconds: 10));

      expect(ctrl.newsList[0].title, 'cnn');
      expect(ctrl.newsList.length, 1);
    });
    test('show error news data when controller init', () async {
      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => throw SocketException);

      final ctrl = Get.put(NewsController());

      await Future.delayed(const Duration(milliseconds: 10));

      expect(ctrl.isError.value, true);
    });

    test('show data news data base on search', () async {
      const newsResponse = NewsResponse(
        articles: [
          Article(title: 'cnn'),
        ],
        totalResults: 10,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse);

      final ctrl = Get.put(NewsController());

      await Future.delayed(const Duration(milliseconds: 10));

      expect(ctrl.newsList[0].title, 'cnn');
      expect(ctrl.newsList.length, 1);

      ctrl.searchTextController.text = 'id';

      var newsResponse2 = NewsResponse(
        articles: [
          Article(title: ctrl.searchTextController.text),
        ],
        totalResults: 10,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse2);

      ctrl.onSearchChange('');

      await Future.delayed(const Duration(milliseconds: 10));
      expect(ctrl.newsList[0].title, ctrl.searchTextController.text);
    });
    test('show data when infinite scroll trigger', () async {
      const newsResponse = NewsResponse(
        articles: [
          Article(title: 'cnn'),
        ],
        totalResults: 10,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse);

      final ctrl = Get.put(NewsController());

      await Future.delayed(const Duration(milliseconds: 10));

      expect(ctrl.newsList[0].title, 'cnn');
      expect(ctrl.newsList.length, 1);

      const newsResponse2 = NewsResponse(
        articles: [
          Article(title: 'bcc'),
          Article(title: 'cnn'),
        ],
        totalResults: 10,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse2);

      ctrl.onLoadNextPage();
      await Future.delayed(const Duration(milliseconds: 10));

      verify(() => mockNewsRepository.getListNews(any())).called(2);
      expect(ctrl.newsList.length, 3);
    });
    test('dont call api when model data > total data', () async {
      const newsResponse = NewsResponse(
        articles: [
          Article(title: 'cnn'),
          Article(title: 'gizmo'),
        ],
        totalResults: 4,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse);

      final ctrl = Get.put(NewsController());

      await Future.delayed(const Duration(milliseconds: 10));

      expect(ctrl.newsList[0].title, 'cnn');
      expect(ctrl.newsList.length, 2);

      const newsResponse2 = NewsResponse(
        articles: [
          Article(title: 'bcc'),
          Article(title: 'cnn'),
        ],
        totalResults: 4,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse2);

      ctrl.onLoadNextPage();
      await Future.delayed(const Duration(milliseconds: 10));

      verify(() => mockNewsRepository.getListNews(any())).called(2);
      expect(ctrl.newsList.length, 4);

      const newsResponse3 = NewsResponse(
        articles: [
          Article(title: 'bcc'),
          Article(title: 'cnn'),
        ],
        totalResults: 4,
      );

      when(
        () => mockNewsRepository.getListNews(any()),
      ).thenAnswer((_) async => newsResponse3);

      ctrl.onLoadNextPage();
      await Future.delayed(const Duration(milliseconds: 10));
      expect(ctrl.newsList.length, 4);
    });
  });
}
