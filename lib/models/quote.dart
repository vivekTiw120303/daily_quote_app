class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['q'] ?? 'Unknown Quote',
      author: json['a'] ?? 'Unknown Author',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'q': text,
      'a': author,
    };
  }
}
