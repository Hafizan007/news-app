import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test/app/modules/news/models/news_ui_data.dart';

void main() {
  group('NewsUiData', () {
    test('should initialize with default values', () {
      final newsUiData = NewsUiData();
      expect(newsUiData.title, equals(''));
      expect(newsUiData.imageUrl, equals(''));
      expect(newsUiData.newsUrl, equals(''));
      expect(newsUiData.content, equals(''));
      expect(newsUiData.publishedAt, equals(''));
      expect(newsUiData.sourceName, equals(''));
      expect(newsUiData.description, equals(''));
    });

    test('should initialize with provided values', () {
      final newsUiData = NewsUiData(
        title: 'News Title',
        imageUrl: 'http://News.com/image.jpg',
        newsUrl: 'http://News.com/news',
        content: 'News Content',
        publishedAt: '2022-01-01',
        sourceName: 'News Source',
        description: 'News Description',
      );
      expect(newsUiData.title, equals('News Title'));
      expect(newsUiData.imageUrl, equals('http://News.com/image.jpg'));
      expect(newsUiData.newsUrl, equals('http://News.com/news'));
      expect(newsUiData.content, equals('News Content'));
      expect(newsUiData.publishedAt, equals('2022-01-01'));
      expect(newsUiData.sourceName, equals('News Source'));
      expect(newsUiData.description, equals('News Description'));
    });
    test('should update properties', () {
      final newsUiData = NewsUiData();
      newsUiData.title = 'New Title';
      newsUiData.imageUrl = 'http://news.com/new_image.jpg';
      newsUiData.newsUrl = 'http://news.com/new_news';
      newsUiData.content = 'New Content';
      newsUiData.publishedAt = '2022-02-01';
      newsUiData.sourceName = 'New Source';
      newsUiData.description = 'New Description';
      expect(newsUiData.title, equals('New Title'));
      expect(newsUiData.imageUrl, equals('http://news.com/new_image.jpg'));
      expect(newsUiData.newsUrl, equals('http://news.com/new_news'));
      expect(newsUiData.content, equals('New Content'));
      expect(newsUiData.publishedAt, equals('2022-02-01'));
      expect(newsUiData.sourceName, equals('New Source'));
      expect(newsUiData.description, equals('New Description'));
    });
  });
}
