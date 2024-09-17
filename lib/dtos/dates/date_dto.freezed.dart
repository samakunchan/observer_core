// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DateDTO _$DateDTOFromJson(Map<String, dynamic> json) {
  return _DateDTO.fromJson(json);
}

/// @nodoc
mixin _$DateDTO {
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get dateFormated => throw _privateConstructorUsedError;

  /// Serializes this DateDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateDTOCopyWith<DateDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateDTOCopyWith<$Res> {
  factory $DateDTOCopyWith(DateDTO value, $Res Function(DateDTO) then) =
      _$DateDTOCopyWithImpl<$Res, DateDTO>;
  @useResult
  $Res call({DateTime dateTime, String dateFormated});
}

/// @nodoc
class _$DateDTOCopyWithImpl<$Res, $Val extends DateDTO>
    implements $DateDTOCopyWith<$Res> {
  _$DateDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? dateFormated = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateFormated: null == dateFormated
          ? _value.dateFormated
          : dateFormated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateDTOImplCopyWith<$Res> implements $DateDTOCopyWith<$Res> {
  factory _$$DateDTOImplCopyWith(
          _$DateDTOImpl value, $Res Function(_$DateDTOImpl) then) =
      __$$DateDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime dateTime, String dateFormated});
}

/// @nodoc
class __$$DateDTOImplCopyWithImpl<$Res>
    extends _$DateDTOCopyWithImpl<$Res, _$DateDTOImpl>
    implements _$$DateDTOImplCopyWith<$Res> {
  __$$DateDTOImplCopyWithImpl(
      _$DateDTOImpl _value, $Res Function(_$DateDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? dateFormated = null,
  }) {
    return _then(_$DateDTOImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateFormated: null == dateFormated
          ? _value.dateFormated
          : dateFormated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateDTOImpl implements _DateDTO {
  const _$DateDTOImpl({required this.dateTime, required this.dateFormated});

  factory _$DateDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateDTOImplFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final String dateFormated;

  @override
  String toString() {
    return 'DateDTO(dateTime: $dateTime, dateFormated: $dateFormated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateDTOImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.dateFormated, dateFormated) ||
                other.dateFormated == dateFormated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, dateFormated);

  /// Create a copy of DateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateDTOImplCopyWith<_$DateDTOImpl> get copyWith =>
      __$$DateDTOImplCopyWithImpl<_$DateDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateDTOImplToJson(
      this,
    );
  }
}

abstract class _DateDTO implements DateDTO {
  const factory _DateDTO(
      {required final DateTime dateTime,
      required final String dateFormated}) = _$DateDTOImpl;

  factory _DateDTO.fromJson(Map<String, dynamic> json) = _$DateDTOImpl.fromJson;

  @override
  DateTime get dateTime;
  @override
  String get dateFormated;

  /// Create a copy of DateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateDTOImplCopyWith<_$DateDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
