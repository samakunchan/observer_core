// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnvironmentModel _$EnvironmentModelFromJson(Map<String, dynamic> json) {
  return _EnvironmentModel.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentModel {
  String get title => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  List<CategoryModel>? get categories => throw _privateConstructorUsedError;

  /// Serializes this EnvironmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvironmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvironmentModelCopyWith<EnvironmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentModelCopyWith<$Res> {
  factory $EnvironmentModelCopyWith(
          EnvironmentModel value, $Res Function(EnvironmentModel) then) =
      _$EnvironmentModelCopyWithImpl<$Res, EnvironmentModel>;
  @useResult
  $Res call({String title, int? id, List<CategoryModel>? categories});
}

/// @nodoc
class _$EnvironmentModelCopyWithImpl<$Res, $Val extends EnvironmentModel>
    implements $EnvironmentModelCopyWith<$Res> {
  _$EnvironmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvironmentModel
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
abstract class _$$EnvironmentModelImplCopyWith<$Res>
    implements $EnvironmentModelCopyWith<$Res> {
  factory _$$EnvironmentModelImplCopyWith(_$EnvironmentModelImpl value,
          $Res Function(_$EnvironmentModelImpl) then) =
      __$$EnvironmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int? id, List<CategoryModel>? categories});
}

/// @nodoc
class __$$EnvironmentModelImplCopyWithImpl<$Res>
    extends _$EnvironmentModelCopyWithImpl<$Res, _$EnvironmentModelImpl>
    implements _$$EnvironmentModelImplCopyWith<$Res> {
  __$$EnvironmentModelImplCopyWithImpl(_$EnvironmentModelImpl _value,
      $Res Function(_$EnvironmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnvironmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$EnvironmentModelImpl(
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
class _$EnvironmentModelImpl implements _EnvironmentModel {
  const _$EnvironmentModelImpl(
      {required this.title, this.id, final List<CategoryModel>? categories})
      : _categories = categories;

  factory _$EnvironmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvironmentModelImplFromJson(json);

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
    return 'EnvironmentModel(title: $title, id: $id, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvironmentModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, id, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of EnvironmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvironmentModelImplCopyWith<_$EnvironmentModelImpl> get copyWith =>
      __$$EnvironmentModelImplCopyWithImpl<_$EnvironmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvironmentModelImplToJson(
      this,
    );
  }
}

abstract class _EnvironmentModel implements EnvironmentModel {
  const factory _EnvironmentModel(
      {required final String title,
      final int? id,
      final List<CategoryModel>? categories}) = _$EnvironmentModelImpl;

  factory _EnvironmentModel.fromJson(Map<String, dynamic> json) =
      _$EnvironmentModelImpl.fromJson;

  @override
  String get title;
  @override
  int? get id;
  @override
  List<CategoryModel>? get categories;

  /// Create a copy of EnvironmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvironmentModelImplCopyWith<_$EnvironmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnvironmentAssociatedModel _$EnvironmentAssociatedModelFromJson(
    Map<String, dynamic> json) {
  return _EnvironmentAssociatedModel.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentAssociatedModel {
  String get title => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this EnvironmentAssociatedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvironmentAssociatedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvironmentAssociatedModelCopyWith<EnvironmentAssociatedModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentAssociatedModelCopyWith<$Res> {
  factory $EnvironmentAssociatedModelCopyWith(EnvironmentAssociatedModel value,
          $Res Function(EnvironmentAssociatedModel) then) =
      _$EnvironmentAssociatedModelCopyWithImpl<$Res,
          EnvironmentAssociatedModel>;
  @useResult
  $Res call({String title, int? id});
}

/// @nodoc
class _$EnvironmentAssociatedModelCopyWithImpl<$Res,
        $Val extends EnvironmentAssociatedModel>
    implements $EnvironmentAssociatedModelCopyWith<$Res> {
  _$EnvironmentAssociatedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvironmentAssociatedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvironmentAssociatedModelImplCopyWith<$Res>
    implements $EnvironmentAssociatedModelCopyWith<$Res> {
  factory _$$EnvironmentAssociatedModelImplCopyWith(
          _$EnvironmentAssociatedModelImpl value,
          $Res Function(_$EnvironmentAssociatedModelImpl) then) =
      __$$EnvironmentAssociatedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int? id});
}

/// @nodoc
class __$$EnvironmentAssociatedModelImplCopyWithImpl<$Res>
    extends _$EnvironmentAssociatedModelCopyWithImpl<$Res,
        _$EnvironmentAssociatedModelImpl>
    implements _$$EnvironmentAssociatedModelImplCopyWith<$Res> {
  __$$EnvironmentAssociatedModelImplCopyWithImpl(
      _$EnvironmentAssociatedModelImpl _value,
      $Res Function(_$EnvironmentAssociatedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnvironmentAssociatedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
  }) {
    return _then(_$EnvironmentAssociatedModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
class _$EnvironmentAssociatedModelImpl implements _EnvironmentAssociatedModel {
  const _$EnvironmentAssociatedModelImpl({required this.title, this.id});

  factory _$EnvironmentAssociatedModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EnvironmentAssociatedModelImplFromJson(json);

  @override
  final String title;
  @override
  final int? id;

  @override
  String toString() {
    return 'EnvironmentAssociatedModel(title: $title, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvironmentAssociatedModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, id);

  /// Create a copy of EnvironmentAssociatedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvironmentAssociatedModelImplCopyWith<_$EnvironmentAssociatedModelImpl>
      get copyWith => __$$EnvironmentAssociatedModelImplCopyWithImpl<
          _$EnvironmentAssociatedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvironmentAssociatedModelImplToJson(
      this,
    );
  }
}

abstract class _EnvironmentAssociatedModel
    implements EnvironmentAssociatedModel {
  const factory _EnvironmentAssociatedModel(
      {required final String title,
      final int? id}) = _$EnvironmentAssociatedModelImpl;

  factory _EnvironmentAssociatedModel.fromJson(Map<String, dynamic> json) =
      _$EnvironmentAssociatedModelImpl.fromJson;

  @override
  String get title;
  @override
  int? get id;

  /// Create a copy of EnvironmentAssociatedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvironmentAssociatedModelImplCopyWith<_$EnvironmentAssociatedModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
