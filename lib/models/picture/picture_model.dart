import 'package:json_annotation/json_annotation.dart';

part 'picture_model.g.dart';

@JsonSerializable()
class PictureModel {
  const PictureModel({required this.src, required this.alt});

  factory PictureModel.fromJson(Map<String, dynamic> json) => _$PictureModelFromJson(json);

  @JsonKey(name: 'src')
  final String src;
  @JsonKey(name: 'alt')
  final String alt;

  Map<String, dynamic> toJson() => _$PictureModelToJson(this);

  static const oneDefaultPicture = PictureModel(src: 'default/image/world-map.png', alt: 'Image par défaut');
  static const listWithDefaultPicture = <PictureModel>[
    oneDefaultPicture,
  ];
}
