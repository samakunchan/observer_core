import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';
part 'picture_model.g.dart';

@freezed
class PictureModel with _$PictureModel {
  const factory PictureModel({
    required int id,
    required String src,
    required String alt,
  }) = _PictureModel;

  factory PictureModel.fromJson(Map<String, dynamic> json) => _$PictureModelFromJson(json);

  static const oneDefaultPicture = PictureModel(id: -1, src: 'default/image/world-map.png', alt: 'Image par défaut');
  static const listWithDefaultPicture = <PictureModel>[
    oneDefaultPicture,
  ];
}
