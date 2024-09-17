// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_upsert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryUpsertDTO _$CategoryUpsertDTOFromJson(Map<String, dynamic> json) {
  return _CategoryUpsertDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryUpsertDTO {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get environment => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this CategoryUpsertDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryUpsertDTOCopyWith<CategoryUpsertDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryUpsertDTOCopyWith<$Res> {
  factory $CategoryUpsertDTOCopyWith(
          CategoryUpsertDTO value, $Res Function(CategoryUpsertDTO) then) =
      _$CategoryUpsertDTOCopyWithImpl<$Res, CategoryUpsertDTO>;
  @useResult
  $Res call({String title, String content, int environment, int? id});
}

/// @nodoc
class _$CategoryUpsertDTOCopyWithImpl<$Res, $Val extends CategoryUpsertDTO>
    implements $CategoryUpsertDTOCopyWith<$Res> {
  _$CategoryUpsertDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? environment = null,
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
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryUpsertDTOImplCopyWith<$Res>
    implements $CategoryUpsertDTOCopyWith<$Res> {
  factory _$$CategoryUpsertDTOImplCopyWith(_$CategoryUpsertDTOImpl value,
          $Res Function(_$CategoryUpsertDTOImpl) then) =
      __$$CategoryUpsertDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content, int environment, int? id});
}

/// @nodoc
class __$$CategoryUpsertDTOImplCopyWithImpl<$Res>
    extends _$CategoryUpsertDTOCopyWithImpl<$Res, _$CategoryUpsertDTOImpl>
    implements _$$CategoryUpsertDTOImplCopyWith<$Res> {
  __$$CategoryUpsertDTOImplCopyWithImpl(_$CategoryUpsertDTOImpl _value,
      $Res Function(_$CategoryUpsertDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? environment = null,
    Object? id = freezed,
  }) {
    return _then(_$CategoryUpsertDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      environment: null == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryUpsertDTOImpl implements _CategoryUpsertDTO {
  const _$CategoryUpsertDTOImpl(
      {required this.title,
      required this.content,
      required this.environment,
      this.id});

  factory _$CategoryUpsertDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryUpsertDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  final int environment;
  @override
  final int? id;

  @override
  String toString() {
    return 'CategoryUpsertDTO(title: $title, content: $content, environment: $environment, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryUpsertDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, environment, id);

  /// Create a copy of CategoryUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryUpsertDTOImplCopyWith<_$CategoryUpsertDTOImpl> get copyWith =>
      __$$CategoryUpsertDTOImplCopyWithImpl<_$CategoryUpsertDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryUpsertDTOImplToJson(
      this,
    );
  }
}

abstract class _CategoryUpsertDTO implements CategoryUpsertDTO {
  const factory _CategoryUpsertDTO(
      {required final String title,
      required final String content,
      required final int environment,
      final int? id}) = _$CategoryUpsertDTOImpl;

  factory _CategoryUpsertDTO.fromJson(Map<String, dynamic> json) =
      _$CategoryUpsertDTOImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  int get environment;
  @override
  int? get id;

  /// Create a copy of CategoryUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryUpsertDTOImplCopyWith<_$CategoryUpsertDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
