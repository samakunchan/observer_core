// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectDTO _$ProjectDTOFromJson(Map<String, dynamic> json) {
  return _ProjectDTO.fromJson(json);
}

/// @nodoc
mixin _$ProjectDTO {
  String get title => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  String get fullDescription => throw _privateConstructorUsedError;
  String get client => throw _privateConstructorUsedError;
  String get dateDebutProjet => throw _privateConstructorUsedError;
  String get dateFinProjet => throw _privateConstructorUsedError;
  int get category => throw _privateConstructorUsedError;
  List<PicturesProjectDTO>? get picturesProject =>
      throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ProjectDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectDTOCopyWith<ProjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDTOCopyWith<$Res> {
  factory $ProjectDTOCopyWith(
          ProjectDTO value, $Res Function(ProjectDTO) then) =
      _$ProjectDTOCopyWithImpl<$Res, ProjectDTO>;
  @useResult
  $Res call(
      {String title,
      String shortDescription,
      String fullDescription,
      String client,
      String dateDebutProjet,
      String dateFinProjet,
      int category,
      List<PicturesProjectDTO>? picturesProject,
      int? id});
}

/// @nodoc
class _$ProjectDTOCopyWithImpl<$Res, $Val extends ProjectDTO>
    implements $ProjectDTOCopyWith<$Res> {
  _$ProjectDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? shortDescription = null,
    Object? fullDescription = null,
    Object? client = null,
    Object? dateDebutProjet = null,
    Object? dateFinProjet = null,
    Object? category = null,
    Object? picturesProject = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      fullDescription: null == fullDescription
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String,
      dateDebutProjet: null == dateDebutProjet
          ? _value.dateDebutProjet
          : dateDebutProjet // ignore: cast_nullable_to_non_nullable
              as String,
      dateFinProjet: null == dateFinProjet
          ? _value.dateFinProjet
          : dateFinProjet // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      picturesProject: freezed == picturesProject
          ? _value.picturesProject
          : picturesProject // ignore: cast_nullable_to_non_nullable
              as List<PicturesProjectDTO>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectDTOImplCopyWith<$Res>
    implements $ProjectDTOCopyWith<$Res> {
  factory _$$ProjectDTOImplCopyWith(
          _$ProjectDTOImpl value, $Res Function(_$ProjectDTOImpl) then) =
      __$$ProjectDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String shortDescription,
      String fullDescription,
      String client,
      String dateDebutProjet,
      String dateFinProjet,
      int category,
      List<PicturesProjectDTO>? picturesProject,
      int? id});
}

/// @nodoc
class __$$ProjectDTOImplCopyWithImpl<$Res>
    extends _$ProjectDTOCopyWithImpl<$Res, _$ProjectDTOImpl>
    implements _$$ProjectDTOImplCopyWith<$Res> {
  __$$ProjectDTOImplCopyWithImpl(
      _$ProjectDTOImpl _value, $Res Function(_$ProjectDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? shortDescription = null,
    Object? fullDescription = null,
    Object? client = null,
    Object? dateDebutProjet = null,
    Object? dateFinProjet = null,
    Object? category = null,
    Object? picturesProject = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ProjectDTOImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      fullDescription: null == fullDescription
          ? _value.fullDescription
          : fullDescription // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String,
      dateDebutProjet: null == dateDebutProjet
          ? _value.dateDebutProjet
          : dateDebutProjet // ignore: cast_nullable_to_non_nullable
              as String,
      dateFinProjet: null == dateFinProjet
          ? _value.dateFinProjet
          : dateFinProjet // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      picturesProject: freezed == picturesProject
          ? _value._picturesProject
          : picturesProject // ignore: cast_nullable_to_non_nullable
              as List<PicturesProjectDTO>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectDTOImpl implements _ProjectDTO {
  const _$ProjectDTOImpl(
      {required this.title,
      required this.shortDescription,
      required this.fullDescription,
      required this.client,
      required this.dateDebutProjet,
      required this.dateFinProjet,
      required this.category,
      final List<PicturesProjectDTO>? picturesProject = const [],
      this.id})
      : _picturesProject = picturesProject;

  factory _$ProjectDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectDTOImplFromJson(json);

  @override
  final String title;
  @override
  final String shortDescription;
  @override
  final String fullDescription;
  @override
  final String client;
  @override
  final String dateDebutProjet;
  @override
  final String dateFinProjet;
  @override
  final int category;
  final List<PicturesProjectDTO>? _picturesProject;
  @override
  @JsonKey()
  List<PicturesProjectDTO>? get picturesProject {
    final value = _picturesProject;
    if (value == null) return null;
    if (_picturesProject is EqualUnmodifiableListView) return _picturesProject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? id;

  @override
  String toString() {
    return 'ProjectDTO(title: $title, shortDescription: $shortDescription, fullDescription: $fullDescription, client: $client, dateDebutProjet: $dateDebutProjet, dateFinProjet: $dateFinProjet, category: $category, picturesProject: $picturesProject, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectDTOImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.fullDescription, fullDescription) ||
                other.fullDescription == fullDescription) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.dateDebutProjet, dateDebutProjet) ||
                other.dateDebutProjet == dateDebutProjet) &&
            (identical(other.dateFinProjet, dateFinProjet) ||
                other.dateFinProjet == dateFinProjet) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._picturesProject, _picturesProject) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      shortDescription,
      fullDescription,
      client,
      dateDebutProjet,
      dateFinProjet,
      category,
      const DeepCollectionEquality().hash(_picturesProject),
      id);

  /// Create a copy of ProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectDTOImplCopyWith<_$ProjectDTOImpl> get copyWith =>
      __$$ProjectDTOImplCopyWithImpl<_$ProjectDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectDTOImplToJson(
      this,
    );
  }
}

abstract class _ProjectDTO implements ProjectDTO {
  const factory _ProjectDTO(
      {required final String title,
      required final String shortDescription,
      required final String fullDescription,
      required final String client,
      required final String dateDebutProjet,
      required final String dateFinProjet,
      required final int category,
      final List<PicturesProjectDTO>? picturesProject,
      final int? id}) = _$ProjectDTOImpl;

  factory _ProjectDTO.fromJson(Map<String, dynamic> json) =
      _$ProjectDTOImpl.fromJson;

  @override
  String get title;
  @override
  String get shortDescription;
  @override
  String get fullDescription;
  @override
  String get client;
  @override
  String get dateDebutProjet;
  @override
  String get dateFinProjet;
  @override
  int get category;
  @override
  List<PicturesProjectDTO>? get picturesProject;
  @override
  int? get id;

  /// Create a copy of ProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectDTOImplCopyWith<_$ProjectDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PicturesProjectDTO _$PicturesProjectDTOFromJson(Map<String, dynamic> json) {
  return _PicturesProjectDTO.fromJson(json);
}

/// @nodoc
mixin _$PicturesProjectDTO {
  int? get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this PicturesProjectDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PicturesProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PicturesProjectDTOCopyWith<PicturesProjectDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PicturesProjectDTOCopyWith<$Res> {
  factory $PicturesProjectDTOCopyWith(
          PicturesProjectDTO value, $Res Function(PicturesProjectDTO) then) =
      _$PicturesProjectDTOCopyWithImpl<$Res, PicturesProjectDTO>;
  @useResult
  $Res call({int? id, String description});
}

/// @nodoc
class _$PicturesProjectDTOCopyWithImpl<$Res, $Val extends PicturesProjectDTO>
    implements $PicturesProjectDTOCopyWith<$Res> {
  _$PicturesProjectDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PicturesProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PicturesProjectDTOImplCopyWith<$Res>
    implements $PicturesProjectDTOCopyWith<$Res> {
  factory _$$PicturesProjectDTOImplCopyWith(_$PicturesProjectDTOImpl value,
          $Res Function(_$PicturesProjectDTOImpl) then) =
      __$$PicturesProjectDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String description});
}

/// @nodoc
class __$$PicturesProjectDTOImplCopyWithImpl<$Res>
    extends _$PicturesProjectDTOCopyWithImpl<$Res, _$PicturesProjectDTOImpl>
    implements _$$PicturesProjectDTOImplCopyWith<$Res> {
  __$$PicturesProjectDTOImplCopyWithImpl(_$PicturesProjectDTOImpl _value,
      $Res Function(_$PicturesProjectDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PicturesProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = null,
  }) {
    return _then(_$PicturesProjectDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PicturesProjectDTOImpl implements _PicturesProjectDTO {
  const _$PicturesProjectDTOImpl({required this.id, required this.description});

  factory _$PicturesProjectDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PicturesProjectDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String description;

  @override
  String toString() {
    return 'PicturesProjectDTO(id: $id, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PicturesProjectDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, description);

  /// Create a copy of PicturesProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PicturesProjectDTOImplCopyWith<_$PicturesProjectDTOImpl> get copyWith =>
      __$$PicturesProjectDTOImplCopyWithImpl<_$PicturesProjectDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PicturesProjectDTOImplToJson(
      this,
    );
  }
}

abstract class _PicturesProjectDTO implements PicturesProjectDTO {
  const factory _PicturesProjectDTO(
      {required final int? id,
      required final String description}) = _$PicturesProjectDTOImpl;

  factory _PicturesProjectDTO.fromJson(Map<String, dynamic> json) =
      _$PicturesProjectDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String get description;

  /// Create a copy of PicturesProjectDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PicturesProjectDTOImplCopyWith<_$PicturesProjectDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
