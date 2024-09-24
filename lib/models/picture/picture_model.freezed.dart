// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PictureModel _$PictureModelFromJson(Map<String, dynamic> json) {
  return _PictureModel.fromJson(json);
}

/// @nodoc
mixin _$PictureModel {
  int get id => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;
  String get alt => throw _privateConstructorUsedError;

  /// Serializes this PictureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PictureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PictureModelCopyWith<PictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureModelCopyWith<$Res> {
  factory $PictureModelCopyWith(
          PictureModel value, $Res Function(PictureModel) then) =
      _$PictureModelCopyWithImpl<$Res, PictureModel>;
  @useResult
  $Res call({int id, String src, String alt});
}

/// @nodoc
class _$PictureModelCopyWithImpl<$Res, $Val extends PictureModel>
    implements $PictureModelCopyWith<$Res> {
  _$PictureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PictureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? src = null,
    Object? alt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureModelImplCopyWith<$Res>
    implements $PictureModelCopyWith<$Res> {
  factory _$$PictureModelImplCopyWith(
          _$PictureModelImpl value, $Res Function(_$PictureModelImpl) then) =
      __$$PictureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String src, String alt});
}

/// @nodoc
class __$$PictureModelImplCopyWithImpl<$Res>
    extends _$PictureModelCopyWithImpl<$Res, _$PictureModelImpl>
    implements _$$PictureModelImplCopyWith<$Res> {
  __$$PictureModelImplCopyWithImpl(
      _$PictureModelImpl _value, $Res Function(_$PictureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PictureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? src = null,
    Object? alt = null,
  }) {
    return _then(_$PictureModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureModelImpl implements _PictureModel {
  const _$PictureModelImpl(
      {required this.id, required this.src, required this.alt});

  factory _$PictureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureModelImplFromJson(json);

  @override
  final int id;
  @override
  final String src;
  @override
  final String alt;

  @override
  String toString() {
    return 'PictureModel(id: $id, src: $src, alt: $alt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.alt, alt) || other.alt == alt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, src, alt);

  /// Create a copy of PictureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureModelImplCopyWith<_$PictureModelImpl> get copyWith =>
      __$$PictureModelImplCopyWithImpl<_$PictureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureModelImplToJson(
      this,
    );
  }
}

abstract class _PictureModel implements PictureModel {
  const factory _PictureModel(
      {required final int id,
      required final String src,
      required final String alt}) = _$PictureModelImpl;

  factory _PictureModel.fromJson(Map<String, dynamic> json) =
      _$PictureModelImpl.fromJson;

  @override
  int get id;
  @override
  String get src;
  @override
  String get alt;

  /// Create a copy of PictureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PictureModelImplCopyWith<_$PictureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
