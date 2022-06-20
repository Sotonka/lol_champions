import 'package:lol_champions/feature/domain/entities/champion_info_entity.dart';

class ChampionInfoModel extends ChampionInfoEntity {
  const ChampionInfoModel({
    required id,
    required name,
    required title,
    required image,
    required tags,
    required skins,
    required lore,
    required allytips,
    required enemytips,
    required partype,
    required info,
    required spells,
    required passive,
  }) : super(
          id: id,
          name: name,
          title: title,
          image: image,
          tags: tags,
          skins: skins,
          lore: lore,
          allytips: allytips,
          enemytips: enemytips,
          partype: partype,
          info: info,
          spells: spells,
          passive: passive,
        );

  factory ChampionInfoModel.fromJson(Map<String, dynamic> json) {
    return ChampionInfoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      //skins: ChampionInfoModel,
      lore: json['lore'] as String,
      allytips: json['allytips'] as String,
      enemytips: json['enemytips'] as String,
      // info:
      //spells:
      //passive:
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'image': image,
      'tags': tags,
      'skins': skins,
      'lore': lore,
      'allytips': allytips,
      'enemytips': enemytips,
      'partype': partype,
      'info': info,
      'spells': spells,
      'passive': passive,
    };
  }
}

class ImageModel extends ImageEntity {
  ImageModel({
    full,
    sprite,
    group,
  }) : super(
          full: full,
          sprite: sprite,
          group: group,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      full: json['full'] as String,
      sprite: json['sprite'] as String,
      group: json['group'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full': full,
      'sprite': sprite,
      'group': group,
    };
  }
}
