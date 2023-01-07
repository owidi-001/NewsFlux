class Source {
  String? id;
  String? name;

  Source(this.id, this.name);

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }

  Source.empty() {
    id = "anonymous";
    name = "Unknown";
  }
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  bool isFavourite = false;

  Article(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content, this.isFavourite);

  Article.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["source"] = source;
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;
    return data;
  }

  Article.empty() {
    source = Source.empty();
    author = "author";
    title = "title";
    description = "description";
    url = "url";
    urlToImage = "urlToImage";
    publishedAt = "publishedAt";
    content = "content";
  }

  Article.dummy() {
    source = Source.empty();
    author =
        "James Morris, Contributor, \n James Morris, Contributor\n https://www.forbes.com/sites/jamesmorris/";
    title = "Tesla Next Generation Platform: Everything We Know So Far";
    description =
        "Tesla will be announcing its next-generation platform for a smaller, cheaper electric car this year. Here's what we know about it plus some predictions.";
    url =
        "https://www.forbes.com/sites/jamesmorris/2023/01/07/tesla-next-generation-platform-everything-we-know-so-far/";
    urlToImage =
        "https://imageio.forbes.com/specials-images/imageserve/63b9343eb393c2c56af26064/0x0.jpg?format=jpg&width=1200";
    publishedAt = "2023-01-07T09:28:04Z";
    content =
        "Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \nTeslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \nTeslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n Teslas image has been overshadowed for the last few months by Elon Musks antics around his purchase of Twitter. But the car company has continued to perform well, despite its share price dropping lik… \n";
  }
}
