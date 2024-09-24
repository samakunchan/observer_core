// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  String get fullDescription => throw _privateConstructorUsedError;
  String get client => throw _privateConstructorUsedError;
  String get dateDebutProjet => throw _privateConstructorUsedError;
  String get dateFinProjet => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  List<PictureModel> get picturesProject => throw _privateConstructorUsedError;
  String? get deletedAt => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String title,
      String slug,
      String shortDescription,
      String fullDescription,
      String client,
      String dateDebutProjet,
      String dateFinProjet,
      String createdAt,
      String updatedAt,
      CategoryModel category,
      List<PictureModel> picturesProject,
      String? deletedAt,
      int? id});

  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? slug = null,
    Object? shortDescription = null,
    Object? fullDescription = null,
    Object? client = null,
    Object? dateDebutProjet = null,
    Object? dateFinProjet = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? picturesProject = null,
    Object? deletedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      picturesProject: null == picturesProject
          ? _value.picturesProject
          : picturesProject // ignore: cast_nullable_to_non_nullable
              as List<PictureModel>,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String slug,
      String shortDescription,
      String fullDescription,
      String client,
      String dateDebutProjet,
      String dateFinProjet,
      String createdAt,
      String updatedAt,
      CategoryModel category,
      List<PictureModel> picturesProject,
      String? deletedAt,
      int? id});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? slug = null,
    Object? shortDescription = null,
    Object? fullDescription = null,
    Object? client = null,
    Object? dateDebutProjet = null,
    Object? dateFinProjet = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? picturesProject = null,
    Object? deletedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ProjectModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      picturesProject: null == picturesProject
          ? _value._picturesProject
          : picturesProject // ignore: cast_nullable_to_non_nullable
              as List<PictureModel>,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModelImpl implements _ProjectModel {
  const _$ProjectModelImpl(
      {required this.title,
      required this.slug,
      required this.shortDescription,
      required this.fullDescription,
      required this.client,
      required this.dateDebutProjet,
      required this.dateFinProjet,
      required this.createdAt,
      required this.updatedAt,
      required this.category,
      final List<PictureModel> picturesProject =
          PictureModel.listWithDefaultPicture,
      this.deletedAt,
      this.id})
      : _picturesProject = picturesProject;

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final String title;
  @override
  final String slug;
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
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final CategoryModel category;
  final List<PictureModel> _picturesProject;
  @override
  @JsonKey()
  List<PictureModel> get picturesProject {
    if (_picturesProject is EqualUnmodifiableListView) return _picturesProject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_picturesProject);
  }

  @override
  final String? deletedAt;
  @override
  final int? id;

  @override
  String toString() {
    return 'ProjectModel(title: $title, slug: $slug, shortDescription: $shortDescription, fullDescription: $fullDescription, client: $client, dateDebutProjet: $dateDebutProjet, dateFinProjet: $dateFinProjet, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, picturesProject: $picturesProject, deletedAt: $deletedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.fullDescription, fullDescription) ||
                other.fullDescription == fullDescription) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.dateDebutProjet, dateDebutProjet) ||
                other.dateDebutProjet == dateDebutProjet) &&
            (identical(other.dateFinProjet, dateFinProjet) ||
                other.dateFinProjet == dateFinProjet) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._picturesProject, _picturesProject) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      slug,
      shortDescription,
      fullDescription,
      client,
      dateDebutProjet,
      dateFinProjet,
      createdAt,
      updatedAt,
      category,
      const DeepCollectionEquality().hash(_picturesProject),
      deletedAt,
      id);

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel implements ProjectModel {
  const factory _ProjectModel(
      {required final String title,
      required final String slug,
      required final String shortDescription,
      required final String fullDescription,
      required final String client,
      required final String dateDebutProjet,
      required final String dateFinProjet,
      required final String createdAt,
      required final String updatedAt,
      required final CategoryModel category,
      final List<PictureModel> picturesProject,
      final String? deletedAt,
      final int? id}) = _$ProjectModelImpl;

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get title;
  @override
  String get slug;
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
  String get createdAt;
  @override
  String get updatedAt;
  @override
  CategoryModel get category;
  @override
  List<PictureModel> get picturesProject;
  @override
  String? get deletedAt;
  @override
  int? get id;

  /// Create a copy of ProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
