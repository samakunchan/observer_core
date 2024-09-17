// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment_upsert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnvironmentUpsertDTO _$EnvironmentUpsertDTOFromJson(Map<String, dynamic> json) {
  return _EnvironmentUpsertDTO.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentUpsertDTO {
  String get title => throw _privateConstructorUsedError;
  List<CategoryUpsertDTO>? get categories => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this EnvironmentUpsertDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvironmentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvironmentUpsertDTOCopyWith<EnvironmentUpsertDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentUpsertDTOCopyWith<$Res> {
  factory $EnvironmentUpsertDTOCopyWith(EnvironmentUpsertDTO value,
          $Res Function(EnvironmentUpsertDTO) then) =
      _$EnvironmentUpsertDTOCopyWithImpl<$Res, EnvironmentUpsertDTO>;
  @useResult
  $Res call({String title, List<CategoryUpsertDTO>? categories, int? id});
}

/// @nodoc
class _$EnvironmentUpsertDTOCopyWithImpl<$Res,
        $Val extends EnvironmentUpsertDTO>
    implements $EnvironmentUpsertDTOCopyWith<$Res> {
  _$EnvironmentUpsertDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvironmentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? categories = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryUpsertDTO>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvironmentUpsertDTOImplCopyWith<$Res>
    implements $EnvironmentUpsertDTOCopyWith<$Res> {
  factory _$$EnvironmentUpsertDTOImplCopyWith(_$EnvironmentUpsertDTOImpl value,
          $Res Function(_$EnvironmentUpsertDTOImpl) then) =
      __$$EnvironmentUpsertDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<CategoryUpsertDTO>? categories, int? id});
}

/// @nodoc
class __$$EnvironmentUpsertDTOImplCopyWithImpl<$Res>
    extends _$EnvironmentUpsertDTOCopyWithImpl<$Res, _$EnvironmentUpsertDTOImpl>
    implements _$$EnvironmentUpsertDTOImplCopyWith<$Res> {
  __$$EnvironmentUpsertDTOImplCopyWithImpl(_$EnvironmentUpsertDTOImpl _value,
      $Res Function(_$EnvironmentUpsertDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnvironmentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? categories = freezed,
    Object? id = freezed,
  }) {
    return _then(_$EnvironmentUpsertDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryUpsertDTO>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnvironmentUpsertDTOImpl implements _EnvironmentUpsertDTO {
  const _$EnvironmentUpsertDTOImpl(
      {required this.title, final List<CategoryUpsertDTO>? categories, this.id})
      : _categories = categories;

  factory _$EnvironmentUpsertDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvironmentUpsertDTOImplFromJson(json);

  @override
  final String title;
  final List<CategoryUpsertDTO>? _categories;
  @override
  List<CategoryUpsertDTO>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? id;

  @override
  String toString() {
    return 'EnvironmentUpsertDTO(title: $title, categories: $categories, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvironmentUpsertDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_categories), id);

  /// Create a copy of EnvironmentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvironmentUpsertDTOImplCopyWith<_$EnvironmentUpsertDTOImpl>
      get copyWith =>
          __$$EnvironmentUpsertDTOImplCopyWithImpl<_$EnvironmentUpsertDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvironmentUpsertDTOImplToJson(
      this,
    );
  }
}

abstract class _EnvironmentUpsertDTO implements EnvironmentUpsertDTO {
  const factory _EnvironmentUpsertDTO(
      {required final String title,
      final List<CategoryUpsertDTO>? categories,
      final int? id}) = _$EnvironmentUpsertDTOImpl;

  factory _EnvironmentUpsertDTO.fromJson(Map<String, dynamic> json) =
      _$EnvironmentUpsertDTOImpl.fromJson;

  @override
  String get title;
  @override
  List<CategoryUpsertDTO>? get categories;
  @override
  int? get id;

  /// Create a copy of EnvironmentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvironmentUpsertDTOImplCopyWith<_$EnvironmentUpsertDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
