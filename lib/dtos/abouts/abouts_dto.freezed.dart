// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abouts_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AboutsDTO _$AboutsDTOFromJson(Map<String, dynamic> json) {
  return _AboutsDTO.fromJson(json);
}

/// @nodoc
mixin _$AboutsDTO {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this AboutsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AboutsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutsDTOCopyWith<AboutsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutsDTOCopyWith<$Res> {
  factory $AboutsDTOCopyWith(AboutsDTO value, $Res Function(AboutsDTO) then) =
      _$AboutsDTOCopyWithImpl<$Res, AboutsDTO>;
  @useResult
  $Res call({String title, String content, int? id});
}

/// @nodoc
class _$AboutsDTOCopyWithImpl<$Res, $Val extends AboutsDTO>
    implements $AboutsDTOCopyWith<$Res> {
  _$AboutsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutsDTO
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
abstract class _$$AboutsDTOImplCopyWith<$Res>
    implements $AboutsDTOCopyWith<$Res> {
  factory _$$AboutsDTOImplCopyWith(
          _$AboutsDTOImpl value, $Res Function(_$AboutsDTOImpl) then) =
      __$$AboutsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, int? id});
}

/// @nodoc
class __$$AboutsDTOImplCopyWithImpl<$Res>
    extends _$AboutsDTOCopyWithImpl<$Res, _$AboutsDTOImpl>
    implements _$$AboutsDTOImplCopyWith<$Res> {
  __$$AboutsDTOImplCopyWithImpl(
      _$AboutsDTOImpl _value, $Res Function(_$AboutsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? id = freezed,
  }) {
    return _then(_$AboutsDTOImpl(
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
class _$AboutsDTOImpl implements _AboutsDTO {
  const _$AboutsDTOImpl({required this.title, required this.content, this.id});

  factory _$AboutsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutsDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final int? id;

  @override
  String toString() {
    return 'AboutsDTO(title: $title, content: $content, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutsDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, id);

  /// Create a copy of AboutsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutsDTOImplCopyWith<_$AboutsDTOImpl> get copyWith =>
      __$$AboutsDTOImplCopyWithImpl<_$AboutsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutsDTOImplToJson(
      this,
    );
  }
}

abstract class _AboutsDTO implements AboutsDTO {
  const factory _AboutsDTO(
      {required final String title,
      required final String content,
      final int? id}) = _$AboutsDTOImpl;

  factory _AboutsDTO.fromJson(Map<String, dynamic> json) =
      _$AboutsDTOImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  int? get id;

  /// Create a copy of AboutsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutsDTOImplCopyWith<_$AboutsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
