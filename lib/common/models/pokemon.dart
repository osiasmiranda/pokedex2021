import 'dart:convert';

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String image;
  final List<String> type;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.image,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? '',
      num: json['num'] ?? '',
      name: json['name'] ?? '',
      image: json['img'] ?? '',
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source));
}
