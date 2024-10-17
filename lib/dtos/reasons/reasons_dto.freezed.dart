// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reasons_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReasonsDTO _$ReasonsDTOFromJson(Map<String, dynamic> json) {
  return _ReasonsDTO.fromJson(json);
}

/// @nodoc
mixin _$ReasonsDTO {
  String get reason => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ReasonsDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReasonsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReasonsDTOCopyWith<ReasonsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReasonsDTOCopyWith<$Res> {
  factory $ReasonsDTOCopyWith(
          ReasonsDTO value, $Res Function(ReasonsDTO) then) =
      _$ReasonsDTOCopyWithImpl<$Res, ReasonsDTO>;
  @useResult
  $Res call({String reason, int? id});
}

/// @nodoc
class _$ReasonsDTOCopyWithImpl<$Res, $Val extends ReasonsDTO>
    implements $ReasonsDTOCopyWith<$Res> {
  _$ReasonsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReasonsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReasonsDTOImplCopyWith<$Res>
    implements $ReasonsDTOCopyWith<$Res> {
  factory _$$ReasonsDTOImplCopyWith(
          _$ReasonsDTOImpl value, $Res Function(_$ReasonsDTOImpl) then) =
      __$$ReasonsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason, int? id});
}

/// @nodoc
class __$$ReasonsDTOImplCopyWithImpl<$Res>
    extends _$ReasonsDTOCopyWithImpl<$Res, _$ReasonsDTOImpl>
    implements _$$ReasonsDTOImplCopyWith<$Res> {
  __$$ReasonsDTOImplCopyWithImpl(
      _$ReasonsDTOImpl _value, $Res Function(_$ReasonsDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReasonsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? id = freezed,
  }) {
    return _then(_$ReasonsDTOImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
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
class _$ReasonsDTOImpl implements _ReasonsDTO {
  const _$ReasonsDTOImpl({required this.reason, this.id});

  factory _$ReasonsDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReasonsDTOImplFromJson(json);

  @override
  final String reason;
  @override
  final int? id;

  @override
  String toString() {
    return 'ReasonsDTO(reason: $reason, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReasonsDTOImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason, id);

  /// Create a copy of ReasonsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReasonsDTOImplCopyWith<_$ReasonsDTOImpl> get copyWith =>
      __$$ReasonsDTOImplCopyWithImpl<_$ReasonsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReasonsDTOImplToJson(
      this,
    );
  }
}

abstract class _ReasonsDTO implements ReasonsDTO {
  const factory _ReasonsDTO({required final String reason, final int? id}) =
      _$ReasonsDTOImpl;

  factory _ReasonsDTO.fromJson(Map<String, dynamic> json) =
      _$ReasonsDTOImpl.fromJson;

  @override
  String get reason;
  @override
  int? get id;

  /// Create a copy of ReasonsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReasonsDTOImplCopyWith<_$ReasonsDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
