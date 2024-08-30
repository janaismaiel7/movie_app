import 'dart:convert';

import 'package:collection/collection.dart';

import 'genre.dart';

class GenreResponse {
  List<Genre>? genres;

  GenreResponse({this.genres});

  factory GenreResponse.fromMap(Map<String, dynamic> data) => GenreResponse(
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'genres': genres?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenreResponse].
  factory GenreResponse.fromJson(String data) {
    return GenreResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenreResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenreResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => genres.hashCode;
}
