// cat_fact_model.dart
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CatFact {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final DateTime creationDate;

  CatFact({required this.text, required this.creationDate});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      text: json['text'],
      creationDate: DateTime.parse(json['createdAt']),
    );
  }
}

// cat_image_model.dart
@HiveType(typeId: 1)
class CatImage {
  @HiveField(0)
  final String imageUrl;

  CatImage({required this.imageUrl});

  factory CatImage.fromJson(Map<String, dynamic> json) {
    return CatImage(
      imageUrl: json['url'],
    );
  }
}

List<CatFact> catFactList = [];
