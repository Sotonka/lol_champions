import 'package:equatable/equatable.dart';

class ChampionInfoEntity extends Equatable {
  final String id;
  final String name;
  final String title;
  final ImageEntity image;
  final List<String> tags;
  final List<SkinEntity> skins;
  final String lore;
  final List<String> allytips;
  final List<String> enemytips;
  final String partype;
  final InfoEntity info;
  final List<SpellEntity> spells;
  final PassiveEntity passive;

  const ChampionInfoEntity({
    required this.id,
    required this.name,
    required this.title,
    required this.image,
    required this.tags,
    required this.skins,
    required this.lore,
    required this.allytips,
    required this.enemytips,
    required this.partype,
    required this.info,
    required this.spells,
    required this.passive,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        title,
        image,
        tags,
        skins,
        lore,
        allytips,
        enemytips,
        partype,
        info,
        spells,
        passive,
      ];
}

class ImageEntity {
  final String full;
  final String sprite;
  final String group;

  const ImageEntity({
    required this.full,
    required this.sprite,
    required this.group,
  });
}

class SkinEntity {
  final int id;
  final int number;
  final String name;
  final bool chromas;

  const SkinEntity({
    required this.id,
    required this.number,
    required this.name,
    required this.chromas,
  });
}

class InfoEntity {
  final int attack;
  final int defence;
  final int magic;
  final int difficulty;

  const InfoEntity({
    required this.attack,
    required this.defence,
    required this.magic,
    required this.difficulty,
  });
}

class SpellEntity {
  final String id;
  final String name;
  final String description;
  final String cooldownBurn;
  final String manaBurn;
  final String rangeBurn;
  final ImageEntity image;

  const SpellEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.cooldownBurn,
    required this.manaBurn,
    required this.rangeBurn,
    required this.image,
  });
}

class PassiveEntity {
  final String name;
  final String description;
  final ImageEntity image;

  const PassiveEntity({
    required this.name,
    required this.description,
    required this.image,
  });
}
