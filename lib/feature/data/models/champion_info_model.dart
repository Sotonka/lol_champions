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
      partype: json['partype'] as String,
      skins: (json['skins'] as List<dynamic>)
          .map((e) => SkinModel.fromJson(e))
          .toList(),
      lore: json['lore'] as String,
      allytips:
          (json['allytips'] as List<dynamic>).map((e) => e as String).toList(),
      enemytips:
          (json['enemytips'] as List<dynamic>).map((e) => e as String).toList(),
      info: InfoModel.fromJson(json['info']),
      spells: (json['spells'] as List<dynamic>)
          .map((e) => SpellModel.fromJson(e))
          .toList(),
      passive: PassiveModel.fromJson(json['passive']),
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

class SkinModel extends SkinEntity {
  SkinModel({
    id,
    number,
    name,
    chromas,
  }) : super(
          id: id,
          number: number,
          name: name,
          chromas: chromas,
        );

  factory SkinModel.fromJson(Map<String, dynamic> json) {
    return SkinModel(
      id: json['id'] as String,
      number: json['num'] as int,
      name: json['name'] as String,
      chromas: json['chromas'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': number,
      'name': name,
      'chromas': chromas,
    };
  }
}

class InfoModel extends InfoEntity {
  InfoModel({
    attack,
    defense,
    magic,
    difficulty,
  }) : super(
          attack: attack,
          defense: defense,
          magic: magic,
          difficulty: difficulty,
        );

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      attack: json['attack'] as int,
      defense: json['defense'] as int,
      magic: json['magic'] as int,
      difficulty: json['difficulty'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'attack': attack,
      'defense': defense,
      'magic': magic,
      'difficulty': difficulty,
    };
  }
}

class SpellModel extends SpellEntity {
  SpellModel({
    id,
    name,
    description,
    cooldownBurn,
    manaBurn,
    rangeBurn,
    image,
  }) : super(
          id: id,
          name: name,
          description: description,
          cooldownBurn: cooldownBurn,
          manaBurn: manaBurn,
          rangeBurn: rangeBurn,
          image: image,
        );

  factory SpellModel.fromJson(Map<String, dynamic> json) {
    return SpellModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      cooldownBurn: json['cooldownBurn'] as String,
      manaBurn: json['costBurn'] as String,
      rangeBurn: json['rangeBurn'] as String,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'cooldownBurn': cooldownBurn,
      'costBurn': manaBurn,
      'rangeBurn': rangeBurn,
      'image': image,
    };
  }
}

class PassiveModel extends PassiveEntity {
  PassiveModel({
    name,
    description,
    image,
  }) : super(
          name: name,
          description: description,
          image: image,
        );

  factory PassiveModel.fromJson(Map<String, dynamic> json) {
    return PassiveModel(
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
