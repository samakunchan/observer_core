// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'one_document_upsert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OneDocumentUpsertDTO _$OneDocumentUpsertDTOFromJson(Map<String, dynamic> json) {
  return _OneDocumentUpsertDTO.fromJson(json);
}

/// @nodoc
mixin _$OneDocumentUpsertDTO {
  String get mimetype => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get folder => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this OneDocumentUpsertDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OneDocumentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OneDocumentUpsertDTOCopyWith<OneDocumentUpsertDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneDocumentUpsertDTOCopyWith<$Res> {
  factory $OneDocumentUpsertDTOCopyWith(OneDocumentUpsertDTO value,
          $Res Function(OneDocumentUpsertDTO) then) =
      _$OneDocumentUpsertDTOCopyWithImpl<$Res, OneDocumentUpsertDTO>;
  @useResult
  $Res call(
      {String mimetype,
      String filename,
      String description,
      String folder,
      String path,
      int size,
      int? id});
}

/// @nodoc
class _$OneDocumentUpsertDTOCopyWithImpl<$Res,
        $Val extends OneDocumentUpsertDTO>
    implements $OneDocumentUpsertDTOCopyWith<$Res> {
  _$OneDocumentUpsertDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OneDocumentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mimetype = null,
    Object? filename = null,
    Object? description = null,
    Object? folder = null,
    Object? path = null,
    Object? size = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      mimetype: null == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OneDocumentUpsertDTOImplCopyWith<$Res>
    implements $OneDocumentUpsertDTOCopyWith<$Res> {
  factory _$$OneDocumentUpsertDTOImplCopyWith(_$OneDocumentUpsertDTOImpl value,
          $Res Function(_$OneDocumentUpsertDTOImpl) then) =
      __$$OneDocumentUpsertDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mimetype,
      String filename,
      String description,
      String folder,
      String path,
      int size,
      int? id});
}

/// @nodoc
class __$$OneDocumentUpsertDTOImplCopyWithImpl<$Res>
    extends _$OneDocumentUpsertDTOCopyWithImpl<$Res, _$OneDocumentUpsertDTOImpl>
    implements _$$OneDocumentUpsertDTOImplCopyWith<$Res> {
  __$$OneDocumentUpsertDTOImplCopyWithImpl(_$OneDocumentUpsertDTOImpl _value,
      $Res Function(_$OneDocumentUpsertDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of OneDocumentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mimetype = null,
    Object? filename = null,
    Object? description = null,
    Object? folder = null,
    Object? path = null,
    Object? size = null,
    Object? id = freezed,
  }) {
    return _then(_$OneDocumentUpsertDTOImpl(
      mimetype: null == mimetype
          ? _value.mimetype
          : mimetype // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      folder: null == folder
          ? _value.folder
          : folder // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
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
class _$OneDocumentUpsertDTOImpl implements _OneDocumentUpsertDTO {
  const _$OneDocumentUpsertDTOImpl(
      {required this.mimetype,
      required this.filename,
      required this.description,
      required this.folder,
      required this.path,
      required this.size,
      this.id});

  factory _$OneDocumentUpsertDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OneDocumentUpsertDTOImplFromJson(json);

  @override
  final String mimetype;
  @override
  final String filename;
  @override
  final String description;
  @override
  final String folder;
  @override
  final String path;
  @override
  final int size;
  @override
  final int? id;

  @override
  String toString() {
    return 'OneDocumentUpsertDTO(mimetype: $mimetype, filename: $filename, description: $description, folder: $folder, path: $path, size: $size, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OneDocumentUpsertDTOImpl &&
            (identical(other.mimetype, mimetype) ||
                other.mimetype == mimetype) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.folder, folder) || other.folder == folder) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, mimetype, filename, description, folder, path, size, id);

  /// Create a copy of OneDocumentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OneDocumentUpsertDTOImplCopyWith<_$OneDocumentUpsertDTOImpl>
      get copyWith =>
          __$$OneDocumentUpsertDTOImplCopyWithImpl<_$OneDocumentUpsertDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OneDocumentUpsertDTOImplToJson(
      this,
    );
  }
}

abstract class _OneDocumentUpsertDTO implements OneDocumentUpsertDTO {
  const factory _OneDocumentUpsertDTO(
      {required final String mimetype,
      required final String filename,
      required final String description,
      required final String folder,
      required final String path,
      required final int size,
      final int? id}) = _$OneDocumentUpsertDTOImpl;

  factory _OneDocumentUpsertDTO.fromJson(Map<String, dynamic> json) =
      _$OneDocumentUpsertDTOImpl.fromJson;

  @override
  String get mimetype;
  @override
  String get filename;
  @override
  String get description;
  @override
  String get folder;
  @override
  String get path;
  @override
  int get size;
  @override
  int? get id;

  /// Create a copy of OneDocumentUpsertDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OneDocumentUpsertDTOImplCopyWith<_$OneDocumentUpsertDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
