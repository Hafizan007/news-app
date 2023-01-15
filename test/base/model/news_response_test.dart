import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test/app/data/model/news_response.dart';

void main() {
  test('fromJson should return NewsResponse object', () {
    const jsonString = '''
    {
      "status": "ok",
      "totalResults": 1,
      "articles": [
        {
          "source": {
            "id": "techcrunch",
            "name": "TechCrunch"
          },
          "author": "John Doe",
          "title": "Test article",
          "description": "This is a test article",
          "url": "https://techcrunch.com/test-article",
          "urlToImage": "https://techcrunch.com/test-article-image.jpg",
          "publishedAt": "2022-04-20T09:00:00.935Z",
          "content": "Test article content"
        }
      ]
    }
    ''';
    final newsResponse = NewsResponse.fromJson(jsonString);
    expect(newsResponse.status, "ok");
    expect(newsResponse.totalResults, 1);
    expect(newsResponse.articles?.length, 1);
    expect(newsResponse.articles?[0].author, "John Doe");
    expect(newsResponse.articles?[0].title, "Test article");
    expect(newsResponse.articles?[0].description, "This is a test article");
    expect(
        newsResponse.articles?[0].url, "https://techcrunch.com/test-article");
    expect(newsResponse.articles?[0].urlToImage,
        "https://techcrunch.com/test-article-image.jpg");
    expect(newsResponse.articles?[0].publishedAt, "2022-04-20T09:00:00.935Z");
    expect(newsResponse.articles?[0].content, "Test article content");
  });

  test('toJson should return json string', () {
    const article = Article(
        source: Source(id: "techcrunch", name: "TechCrunch"),
        author: "John Doe",
        title: "Test article",
        description: "This is a test article",
        url: "https://techcrunch.com/test-article",
        urlToImage: "https://techcrunch.com/test-article-image.jpg",
        publishedAt: "2022-04-20T09:00:00.935Z",
        content: "Test article content");
    const newsResponse = NewsResponse(
      status: "ok",
      totalResults: 1,
      articles: [article],
    );
    final jsonString = newsResponse.toJson();
    const expectedJsonString = '''
    {
      "status": "ok",
      "totalResults": 1,
      "articles": [
        {
          "source": {
            "id": "techcrunch",
            "name": "TechCrunch"
          },
          "author": "John Doe",
          "title": "Test article",
          "description": "This is a test
description",
"url": "https://techcrunch.com/test-article",
"urlToImage": "https://techcrunch.com/test-article-image.jpg",
"publishedAt": "2022-04-20T09:00:00.935Z",
"content": "Test article content"
}
]
}
''';
    expect(jsonString, expectedJsonString);
  });

  test('copyWith should return new NewsResponse with updated values', () {
    const article = Article(
        source: Source(id: "techcrunch", name: "TechCrunch"),
        author: "John Doe",
        title: "Test article",
        description: "This is a test article",
        url: "https://techcrunch.com/test-article",
        urlToImage: "https://techcrunch.com/test-article-image.jpg",
        publishedAt: "2022-04-20T09:00:00.935Z",
        content: "Test article content");
    const newsResponse = NewsResponse(
      status: "ok",
      totalResults: 1,
      articles: [article],
    );
    const newStatus = "error";
    const newTotalResults = 2;
    final newArticle = article.copyWith(title: "New Test Article");
    final newNewsResponse = newsResponse.copyWith(
      status: newStatus,
      totalResults: newTotalResults,
      articles: [newArticle],
    );
    expect(newNewsResponse.status, newStatus);
    expect(newNewsResponse.totalResults, newTotalResults);
    expect(newNewsResponse.articles?[0].title, "New Test Article");
  });
}
