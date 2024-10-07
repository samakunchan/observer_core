// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentResponse _$DocumentResponseFromJson(Map<String, dynamic> json) {
  return _DocumentResponse.fromJson(json);
}

/// @nodoc
mixin _$DocumentResponse {
  int get total => throw _privateConstructorUsedError;
  List<DocumentModel> get results => throw _privateConstructorUsedError;

  /// Serializes this DocumentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentResponseCopyWith<DocumentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentResponseCopyWith<$Res> {
  factory $DocumentResponseCopyWith(
          DocumentResponse value, $Res Function(DocumentResponse) then) =
      _$DocumentResponseCopyWithImpl<$Res, DocumentResponse>;
  @useResult
  $Res call({int total, List<DocumentModel> results});
}

/// @nodoc
class _$DocumentResponseCopyWithImpl<$Res, $Val extends DocumentResponse>
    implements $DocumentResponseCopyWith<$Res> {
  _$DocumentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentResponseImplCopyWith<$Res>
    implements $DocumentResponseCopyWith<$Res> {
  factory _$$DocumentResponseImplCopyWith(_$DocumentResponseImpl value,
          $Res Function(_$DocumentResponseImpl) then) =
      __$$DocumentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<DocumentModel> results});
}

/// @nodoc
class __$$DocumentResponseImplCopyWithImpl<$Res>
    extends _$DocumentResponseCopyWithImpl<$Res, _$DocumentResponseImpl>
    implements _$$DocumentResponseImplCopyWith<$Res> {
  __$$DocumentResponseImplCopyWithImpl(_$DocumentResponseImpl _value,
      $Res Function(_$DocumentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocumentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? results = null,
  }) {
    return _then(_$DocumentResponseImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentResponseImpl implements _DocumentResponse {
  const _$DocumentResponseImpl(
      {required this.total, required final List<DocumentModel> results})
      : _results = results;

  factory _$DocumentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentResponseImplFromJson(json);

  @override
  final int total;
  final List<DocumentModel> _results;
  @override
  List<DocumentModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'DocumentResponse(total: $total, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentResponseImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_results));

  /// Create a copy of DocumentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentResponseImplCopyWith<_$DocumentResponseImpl> get copyWith =>
      __$$DocumentResponseImplCopyWithImpl<_$DocumentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentResponseImplToJson(
      this,
    );
  }
}

abstract class _DocumentResponse implements DocumentResponse {
  const factory _DocumentResponse(
      {required final int total,
      required final List<DocumentModel> results}) = _$DocumentResponseImpl;

  factory _DocumentResponse.fromJson(Map<String, dynamic> json) =
      _$DocumentResponseImpl.fromJson;

  @override
  int get total;
  @override
  List<DocumentModel> get results;

  /// Create a copy of DocumentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentResponseImplCopyWith<_$DocumentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
