// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'multiple_documents_upsert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MultipleDocumentsUpsertDTO _$MultipleDocumentsUpsertDTOFromJson(
    Map<String, dynamic> json) {
  return _MultipleDocumentsUpsertDTO.fromJson(json);
}

/// @nodoc
mixin _$MultipleDocumentsUpsertDTO {
  List<OneDocumentUpsertDTO> get documents =>
      throw _privateConstructorUsedError;

  /// Serializes this MultipleDocumentsUpsertDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MultipleDocumentsUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultipleDocumentsUpsertDTOCopyWith<MultipleDocumentsUpsertDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultipleDocumentsUpsertDTOCopyWith<$Res> {
  factory $MultipleDocumentsUpsertDTOCopyWith(MultipleDocumentsUpsertDTO value,
          $Res Function(MultipleDocumentsUpsertDTO) then) =
      _$MultipleDocumentsUpsertDTOCopyWithImpl<$Res,
          MultipleDocumentsUpsertDTO>;
  @useResult
  $Res call({List<OneDocumentUpsertDTO> documents});
}

/// @nodoc
class _$MultipleDocumentsUpsertDTOCopyWithImpl<$Res,
        $Val extends MultipleDocumentsUpsertDTO>
    implements $MultipleDocumentsUpsertDTOCopyWith<$Res> {
  _$MultipleDocumentsUpsertDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MultipleDocumentsUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
  }) {
    return _then(_value.copyWith(
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<OneDocumentUpsertDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MultipleDocumentsUpsertDTOImplCopyWith<$Res>
    implements $MultipleDocumentsUpsertDTOCopyWith<$Res> {
  factory _$$MultipleDocumentsUpsertDTOImplCopyWith(
          _$MultipleDocumentsUpsertDTOImpl value,
          $Res Function(_$MultipleDocumentsUpsertDTOImpl) then) =
      __$$MultipleDocumentsUpsertDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OneDocumentUpsertDTO> documents});
}

/// @nodoc
class __$$MultipleDocumentsUpsertDTOImplCopyWithImpl<$Res>
    extends _$MultipleDocumentsUpsertDTOCopyWithImpl<$Res,
        _$MultipleDocumentsUpsertDTOImpl>
    implements _$$MultipleDocumentsUpsertDTOImplCopyWith<$Res> {
  __$$MultipleDocumentsUpsertDTOImplCopyWithImpl(
      _$MultipleDocumentsUpsertDTOImpl _value,
      $Res Function(_$MultipleDocumentsUpsertDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of MultipleDocumentsUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
  }) {
    return _then(_$MultipleDocumentsUpsertDTOImpl(
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<OneDocumentUpsertDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MultipleDocumentsUpsertDTOImpl implements _MultipleDocumentsUpsertDTO {
  const _$MultipleDocumentsUpsertDTOImpl(
      {required final List<OneDocumentUpsertDTO> documents})
      : _documents = documents;

  factory _$MultipleDocumentsUpsertDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MultipleDocumentsUpsertDTOImplFromJson(json);

  final List<OneDocumentUpsertDTO> _documents;
  @override
  List<OneDocumentUpsertDTO> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'MultipleDocumentsUpsertDTO(documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultipleDocumentsUpsertDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_documents));

  /// Create a copy of MultipleDocumentsUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultipleDocumentsUpsertDTOImplCopyWith<_$MultipleDocumentsUpsertDTOImpl>
      get copyWith => __$$MultipleDocumentsUpsertDTOImplCopyWithImpl<
          _$MultipleDocumentsUpsertDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MultipleDocumentsUpsertDTOImplToJson(
      this,
    );
  }
}

abstract class _MultipleDocumentsUpsertDTO
    implements MultipleDocumentsUpsertDTO {
  const factory _MultipleDocumentsUpsertDTO(
          {required final List<OneDocumentUpsertDTO> documents}) =
      _$MultipleDocumentsUpsertDTOImpl;

  factory _MultipleDocumentsUpsertDTO.fromJson(Map<String, dynamic> json) =
      _$MultipleDocumentsUpsertDTOImpl.fromJson;

  @override
  List<OneDocumentUpsertDTO> get documents;

  /// Create a copy of MultipleDocumentsUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultipleDocumentsUpsertDTOImplCopyWith<_$MultipleDocumentsUpsertDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
