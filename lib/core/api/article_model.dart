class ArticleModel {
  final String status;
  final List<Article> articles;

  ArticleModel({required this.status, required this.articles});
  factory ArticleModel.fromHason(Map<String , dynamic> jason) =>
      ArticleModel(status: jason["status"], articles: (jason["articles"] as List).map((e) => Article.fromJson(e)).toList() );
}

class Article {
  final String id;
  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  Article({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(id: json['source']['id']?? "unknown_id", name: json['source']['name'], author: json['author'] ??"Unknown Author",
        title: json['title'], description: json['description'],
        url: json['url'], urlToImage: json['urlToImage'], publishedAt: json['publishedAt'] ?? "Unknown Date",
        content: json['content']);
  }
}
