// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_delete_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryDeleteDTO _$CategoryDeleteDTOFromJson(Map<String, dynamic> json) {
  return _CategoryDeleteDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryDeleteDTO {
  List<int> get categoriesIds => throw _privateConstructorUsedError;

  /// Serializes this CategoryDeleteDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDeleteDTOCopyWith<CategoryDeleteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDeleteDTOCopyWith<$Res> {
  factory $CategoryDeleteDTOCopyWith(
          CategoryDeleteDTO value, $Res Function(CategoryDeleteDTO) then) =
      _$CategoryDeleteDTOCopyWithImpl<$Res, CategoryDeleteDTO>;
  @useResult
  $Res call({List<int> categoriesIds});
}

/// @nodoc
class _$CategoryDeleteDTOCopyWithImpl<$Res, $Val extends CategoryDeleteDTO>
    implements $CategoryDeleteDTOCopyWith<$Res> {
  _$CategoryDeleteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesIds = null,
  }) {
    return _then(_value.copyWith(
      categoriesIds: null == categoriesIds
          ? _value.categoriesIds
          : categoriesIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDeleteDTOImplCopyWith<$Res>
    implements $CategoryDeleteDTOCopyWith<$Res> {
  factory _$$CategoryDeleteDTOImplCopyWith(_$CategoryDeleteDTOImpl value,
          $Res Function(_$CategoryDeleteDTOImpl) then) =
      __$$CategoryDeleteDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> categoriesIds});
}

/// @nodoc
class __$$CategoryDeleteDTOImplCopyWithImpl<$Res>
    extends _$CategoryDeleteDTOCopyWithImpl<$Res, _$CategoryDeleteDTOImpl>
    implements _$$CategoryDeleteDTOImplCopyWith<$Res> {
  __$$CategoryDeleteDTOImplCopyWithImpl(_$CategoryDeleteDTOImpl _value,
      $Res Function(_$CategoryDeleteDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesIds = null,
  }) {
    return _then(_$CategoryDeleteDTOImpl(
      categoriesIds: null == categoriesIds
          ? _value._categoriesIds
          : categoriesIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDeleteDTOImpl implements _CategoryDeleteDTO {
  const _$CategoryDeleteDTOImpl({required final List<int> categoriesIds})
      : _categoriesIds = categoriesIds;

  factory _$CategoryDeleteDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDeleteDTOImplFromJson(json);

  final List<int> _categoriesIds;
  @override
  List<int> get categoriesIds {
    if (_categoriesIds is EqualUnmodifiableListView) return _categoriesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesIds);
  }

  @override
  String toString() {
    return 'CategoryDeleteDTO(categoriesIds: $categoriesIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDeleteDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._categoriesIds, _categoriesIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoriesIds));

  /// Create a copy of CategoryDeleteDTO
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

abstract class _CategoryDeleteDTO implements CategoryDeleteDTO {
  const factory _CategoryDeleteDTO({required final List<int> categoriesIds}) =
      _$CategoryDeleteDTOImpl;

  factory _CategoryDeleteDTO.fromJson(Map<String, dynamic> json) =
      _$CategoryDeleteDTOImpl.fromJson;

  @override
  List<int> get categoriesIds;

  /// Create a copy of CategoryDeleteDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDeleteDTOImplCopyWith<_$CategoryDeleteDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
