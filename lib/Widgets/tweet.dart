class Tweet {
  Tweet({required this.id, required this.name});

  int id;
  String name;

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id'] as int,
      name: json['name'],
    );
  }
}
