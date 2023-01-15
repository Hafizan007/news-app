import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:technical_test/app/core/utils/date_helper.dart';
import 'package:technical_test/app/modules/news/widgets/hero_image_item.dart';
import 'package:technical_test/app/modules/news/widgets/news_item.dart';

import '../../../base/service_mock.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });
  group('News Item Widget', () {
    testWidgets(
        'should display title, short description, date, image, and source',
        (WidgetTester tester) async {
      const title = 'news Title';
      const shortDesc = 'news Short Description';
      const date = '2023-01-15T00:08:47Z';
      const imageUrl = 'http://news.com/image.jpg';
      const source = 'news Source';

      await tester.pumpWidget(
        MaterialApp(
          home: NewsItem(
            title: title,
            shortDesc: shortDesc,
            date: date,
            imageUrl: imageUrl,
            source: source,
            onTap: mockOnTap,
          ),
        ),
      );

      final result = DateHelper.strDateToStrDate(date);

      expect(find.text(title), findsOneWidget);
      expect(find.text(shortDesc), findsOneWidget);
      expect(find.text(result), findsOneWidget);
      expect(find.byType(HeroImageItem), findsOneWidget);
      expect(find.text(source), findsOneWidget);
    });

    testWidgets('should call onTap function on tap',
        (WidgetTester tester) async {
      const title = 'news Title';
      const shortDesc = 'news Short Description';
      const date = '2022-01-01';
      const imageUrl = 'http://news.com/image.jpg';
      const source = 'news Source';

      await tester.pumpWidget(
        MaterialApp(
          home: NewsItem(
            title: title,
            shortDesc: shortDesc,
            date: date,
            imageUrl: imageUrl,
            source: source,
            onTap: mockOnTap,
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      verify(() => mockOnTap()).called(1);
    });

    testWidgets('should display "Read More" text and date',
        (WidgetTester tester) async {
      const title = 'news Title';
      const shortDesc = 'news Short Description';
      const date = '2022-01-01';
      const imageUrl = 'http://news.com/image.jpg';
      const source = 'news Source';

      await tester.pumpWidget(
        MaterialApp(
          home: NewsItem(
            title: title,
            shortDesc: shortDesc,
            date: date,
            imageUrl: imageUrl,
            source: source,
            onTap: mockOnTap,
          ),
        ),
      );
      final result = DateHelper.strDateToStrDate(date);

      expect(find.text('Read More'), findsOneWidget);
      expect(find.text(result), findsOneWidget);
    });
  });
}
