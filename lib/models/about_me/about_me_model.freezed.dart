// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_me_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AboutMeModel _$AboutMeModelFromJson(Map<String, dynamic> json) {
  return _AboutMeModel.fromJson(json);
}

/// @nodoc
mixin _$AboutMeModel {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this AboutMeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutMeModelCopyWith<AboutMeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutMeModelCopyWith<$Res> {
  factory $AboutMeModelCopyWith(
          AboutMeModel value, $Res Function(AboutMeModel) then) =
      _$AboutMeModelCopyWithImpl<$Res, AboutMeModel>;
  @useResult
  $Res call({String title, String content, int? id});
}

/// @nodoc
class _$AboutMeModelCopyWithImpl<$Res, $Val extends AboutMeModel>
    implements $AboutMeModelCopyWith<$Res> {
  _$AboutMeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AboutMeModelImplCopyWith<$Res>
    implements $AboutMeModelCopyWith<$Res> {
  factory _$$AboutMeModelImplCopyWith(
          _$AboutMeModelImpl value, $Res Function(_$AboutMeModelImpl) then) =
      __$$AboutMeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, int? id});
}

/// @nodoc
class __$$AboutMeModelImplCopyWithImpl<$Res>
    extends _$AboutMeModelCopyWithImpl<$Res, _$AboutMeModelImpl>
    implements _$$AboutMeModelImplCopyWith<$Res> {
  __$$AboutMeModelImplCopyWithImpl(
      _$AboutMeModelImpl _value, $Res Function(_$AboutMeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? id = freezed,
  }) {
    return _then(_$AboutMeModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutMeModelImpl implements _AboutMeModel {
  const _$AboutMeModelImpl(
      {required this.title, required this.content, this.id});

  factory _$AboutMeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutMeModelImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final int? id;

  @override
  String toString() {
    return 'AboutMeModel(title: $title, content: $content, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutMeModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, id);

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutMeModelImplCopyWith<_$AboutMeModelImpl> get copyWith =>
      __$$AboutMeModelImplCopyWithImpl<_$AboutMeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutMeModelImplToJson(
      this,
    );
  }
}

abstract class _AboutMeModel implements AboutMeModel {
  const factory _AboutMeModel(
      {required final String title,
      required final String content,
      final int? id}) = _$AboutMeModelImpl;

  factory _AboutMeModel.fromJson(Map<String, dynamic> json) =
      _$AboutMeModelImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  int? get id;

  /// Create a copy of AboutMeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutMeModelImplCopyWith<_$AboutMeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
