class Book {
  final int id;
  final String title;
  final List<Author> authors;
  final List<String> subjects;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final Map<String, String> formats;
  final int downloadCount;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.subjects,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      authors: (json['authors'] as List<dynamic>?)
          ?.map((authorJson) => Author.fromJson(authorJson))
          .toList() ?? [],
      subjects: (json['subjects'] as List<dynamic>?)?.cast<String>() ?? [],
      languages: (json['languages'] as List<dynamic>?)?.cast<String>() ?? [],
      copyright: json['copyright'] ?? false,
      mediaType: json['media_type'] ?? '',
      formats: Map<String, String>.from(json['formats'] ?? {}),
      downloadCount: json['download_count'] ?? 0,
    );
  }
}

class Author {
  final String name;
  final int? birthYear;
  final int? deathYear;

  Author({
    required this.name,
    this.birthYear,
    this.deathYear,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'] ?? '',
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }
}