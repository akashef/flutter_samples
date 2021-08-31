class Repo {
  dynamic id;
  dynamic title;
  dynamic url;
  dynamic description = "";
  dynamic language = "";
  dynamic forksCount;
  dynamic watchersCount;

  Repo({
    required this.id,
    required this.title,
    required this.url,
    required this.description,
    required this.language,
    required this.forksCount,
    required this.watchersCount,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      json['id'] = 0;
    }
    if (json['name'] == null) {
      json['name'] = "";
    }
    if (json['description'] == null) {
      json['description'] = "";
    }
    if (json['language'] == null) {
      json['language'] = "";
    }
    if (json['url'] == null) {
      json['url'] = "";
    }
    if (json['forks_count'] == null) {
      json['forks_count'] = 0;
    }
    return Repo(
      id: json['id'],
      title: json['name'],
      description: json['description'],
      language: json['language'],
      forksCount: json['forks_count'],
      watchersCount: json['watchers'],
      url: json['url'],
    );
  }
}
