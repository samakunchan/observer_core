import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_me_model.freezed.dart';
part 'about_me_model.g.dart';

@freezed
class AboutMeModel with _$AboutMeModel {
  const factory AboutMeModel({
    required String title,
    required String content,
    int? id,
  }) = _AboutMeModel;

  factory AboutMeModel.fromJson(Map<String, dynamic> json) => _$AboutMeModelFromJson(json);

  static const emptyDatas = AboutMeModel(title: '', content: '');
}
