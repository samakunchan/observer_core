// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment_delete_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnvironmentDeleteDTO _$EnvironmentDeleteDTOFromJson(Map<String, dynamic> json) {
  return _CategoryDeleteDTO.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentDeleteDTO {
  String get title => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  List<CategoryModel>? get categories => throw _privateConstructorUsedError;

  /// Serializes this EnvironmentDeleteDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvironmentDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvironmentDeleteDTOCopyWith<EnvironmentDeleteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentDeleteDTOCopyWith<$Res> {
  factory $EnvironmentDeleteDTOCopyWith(EnvironmentDeleteDTO value,
          $Res Function(EnvironmentDeleteDTO) then) =
      _$EnvironmentDeleteDTOCopyWithImpl<$Res, EnvironmentDeleteDTO>;
  @useResult
  $Res call({String title, int? id, List<CategoryModel>? categories});
}

/// @nodoc
class _$EnvironmentDeleteDTOCopyWithImpl<$Res,
        $Val extends EnvironmentDeleteDTO>
    implements $EnvironmentDeleteDTOCopyWith<$Res> {
  _$EnvironmentDeleteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvironmentDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDeleteDTOImplCopyWith<$Res>
    implements $EnvironmentDeleteDTOCopyWith<$Res> {
  factory _$$CategoryDeleteDTOImplCopyWith(_$CategoryDeleteDTOImpl value,
          $Res Function(_$CategoryDeleteDTOImpl) then) =
      __$$CategoryDeleteDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int? id, List<CategoryModel>? categories});
}

/// @nodoc
class __$$CategoryDeleteDTOImplCopyWithImpl<$Res>
    extends _$EnvironmentDeleteDTOCopyWithImpl<$Res, _$CategoryDeleteDTOImpl>
    implements _$$CategoryDeleteDTOImplCopyWith<$Res> {
  __$$CategoryDeleteDTOImplCopyWithImpl(_$CategoryDeleteDTOImpl _value,
      $Res Function(_$CategoryDeleteDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnvironmentDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$CategoryDeleteDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDeleteDTOImpl implements _CategoryDeleteDTO {
  const _$CategoryDeleteDTOImpl(
      {required this.title, this.id, final List<CategoryModel>? categories})
      : _categories = categories;

  factory _$CategoryDeleteDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDeleteDTOImplFromJson(json);

  @override
  final String title;
  @override
  final int? id;
  final List<CategoryModel>? _categories;
  @override
  List<CategoryModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EnvironmentDeleteDTO(title: $title, id: $id, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDeleteDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of EnvironmentDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDeleteDTOImplCopyWith<_$CategoryDeleteDTOImpl> get copyWith =>
      __$$CategoryDeleteDTOImplCopyWithImpl<_$CategoryDeleteDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDeleteDTOImplToJson(
      this,
    );
  }
}

abstract class _CategoryDeleteDTO implements EnvironmentDeleteDTO {
  const factory _CategoryDeleteDTO(
      {required final String title,
      final int? id,
      final List<CategoryModel>? categories}) = _$CategoryDeleteDTOImpl;

  factory _CategoryDeleteDTO.fromJson(Map<String, dynamic> json) =
      _$CategoryDeleteDTOImpl.fromJson;

  @override
  String get title;
  @override
  int? get id;
  @override
  List<CategoryModel>? get categories;

  /// Create a copy of EnvironmentDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDeleteDTOImplCopyWith<_$CategoryDeleteDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
