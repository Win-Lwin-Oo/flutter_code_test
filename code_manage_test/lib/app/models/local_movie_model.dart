import 'dart:convert';

class LocalMovie {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final int? favourite;
  LocalMovie({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.favourite,
  });

  LocalMovie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    int? favourite,
  }) {
    return LocalMovie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      favourite: favourite ?? this.favourite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'posterPath': posterPath,
      'favourite': favourite,
    };
  }

  factory LocalMovie.fromMap(Map<String, dynamic> map) {
    return LocalMovie(
      id: map['id']?.toInt(),
      title: map['title'],
      overview: map['overview'],
      posterPath: map['posterPath'],
      favourite: map['favourite']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalMovie.fromJson(String source) =>
      LocalMovie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocalMovie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, favourite: $favourite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalMovie &&
        other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.favourite == favourite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        favourite.hashCode;
  }
}
