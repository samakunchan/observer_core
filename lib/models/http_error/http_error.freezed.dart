// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HttpError _$HttpErrorFromJson(Map<String, dynamic> json) {
  return _HttpError.fromJson(json);
}

/// @nodoc
mixin _$HttpError {
  int get statusCode => throw _privateConstructorUsedError;
  String get errorName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  /// Serializes this HttpError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HttpErrorCopyWith<HttpError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpErrorCopyWith<$Res> {
  factory $HttpErrorCopyWith(HttpError value, $Res Function(HttpError) then) =
      _$HttpErrorCopyWithImpl<$Res, HttpError>;
  @useResult
  $Res call(
      {int statusCode,
      String errorName,
      String description,
      String path,
      String date});
}

/// @nodoc
class _$HttpErrorCopyWithImpl<$Res, $Val extends HttpError>
    implements $HttpErrorCopyWith<$Res> {
  _$HttpErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? errorName = null,
    Object? description = null,
    Object? path = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      errorName: null == errorName
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HttpErrorImplCopyWith<$Res>
    implements $HttpErrorCopyWith<$Res> {
  factory _$$HttpErrorImplCopyWith(
          _$HttpErrorImpl value, $Res Function(_$HttpErrorImpl) then) =
      __$$HttpErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int statusCode,
      String errorName,
      String description,
      String path,
      String date});
}

/// @nodoc
class __$$HttpErrorImplCopyWithImpl<$Res>
    extends _$HttpErrorCopyWithImpl<$Res, _$HttpErrorImpl>
    implements _$$HttpErrorImplCopyWith<$Res> {
  __$$HttpErrorImplCopyWithImpl(
      _$HttpErrorImpl _value, $Res Function(_$HttpErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? errorName = null,
    Object? description = null,
    Object? path = null,
    Object? date = null,
  }) {
    return _then(_$HttpErrorImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      errorName: null == errorName
          ? _value.errorName
          : errorName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HttpErrorImpl implements _HttpError {
  const _$HttpErrorImpl(
      {this.statusCode = 0,
      this.errorName = 'Le nom de l‘exception n‘a pas été définis',
      this.description =
          'La description n‘a pas été définis dans les exceptions',
      this.path = 'Le path n‘a pas été définis dans les exceptions',
      this.date = 'La date n‘a pas été définis dans les exceptions'});

  factory _$HttpErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$HttpErrorImplFromJson(json);

  @override
  @JsonKey()
  final int statusCode;
  @override
  @JsonKey()
  final String errorName;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String path;
  @override
  @JsonKey()
  final String date;

  @override
  String toString() {
    return 'HttpError(statusCode: $statusCode, errorName: $errorName, description: $description, path: $path, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpErrorImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.errorName, errorName) ||
                other.errorName == errorName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, errorName, description, path, date);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpErrorImplCopyWith<_$HttpErrorImpl> get copyWith =>
      __$$HttpErrorImplCopyWithImpl<_$HttpErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HttpErrorImplToJson(
      this,
    );
  }
}

abstract class _HttpError implements HttpError {
  const factory _HttpError(
      {final int statusCode,
      final String errorName,
      final String description,
      final String path,
      final String date}) = _$HttpErrorImpl;

  factory _HttpError.fromJson(Map<String, dynamic> json) =
      _$HttpErrorImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get errorName;
  @override
  String get description;
  @override
  String get path;
  @override
  String get date;

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpErrorImplCopyWith<_$HttpErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
