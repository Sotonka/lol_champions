import 'package:equatable/equatable.dart';

class ChampionEntity extends Equatable {
  final String id;
  final String name;
  final String title;
  final ImageEntity image;
  final List<String> tags;

  const ChampionEntity({
    required this.id,
    required this.name,
    required this.title,
    required this.image,
    required this.tags,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        title,
        image,
        tags,
      ];
}

class ImageEntity {
  final String full;

  const ImageEntity({
    required this.full,
  });
}
