import 'package:lol_champions/feature/domain/entities/champion_entity.dart';

class ChampionModel extends ChampionEntity {
  const ChampionModel({
    required id,
    required name,
    required title,
    required image,
    required tags,
  }) : super(
          id: id,
          name: name,
          title: title,
          image: image,
          tags: tags,
        );

  factory ChampionModel.fromJson(Map<String, dynamic> json) {
    return ChampionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
      tags: json['image'] != null ? TagsModel.fromJson(json['tags']) : null,
      /* image: json['image'] as String,
      tags:
          (json['tags'] as List<dynamic>).map((e) => e as String).toList(), */
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'image': image,
      'tags': tags,
    };
  }
}

class ImageModel extends ImageEntity {
  ImageModel({
    full,
  }) : super(
          full: full,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      full: json['full'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full': full,
    };
  }
}

class TagsModel extends TagsEntity {
  TagsModel({
    tags,
  }) : super(
          tags: tags,
        );

  factory TagsModel.fromJson(Map<String, dynamic> json) {
    return TagsModel(
      tags: json['tags'] as List<String>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tags': tags,
    };
  }
}
