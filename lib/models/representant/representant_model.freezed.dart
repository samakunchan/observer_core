// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'representant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepresentantModel _$RepresentantModelFromJson(Map<String, dynamic> json) {
  return _RepresentantModel.fromJson(json);
}

/// @nodoc
mixin _$RepresentantModel {
  String get uuid => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  bool get isCompany => throw _privateConstructorUsedError;
  String get dateStart => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;

  /// Serializes this RepresentantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepresentantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepresentantModelCopyWith<RepresentantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepresentantModelCopyWith<$Res> {
  factory $RepresentantModelCopyWith(
          RepresentantModel value, $Res Function(RepresentantModel) then) =
      _$RepresentantModelCopyWithImpl<$Res, RepresentantModel>;
  @useResult
  $Res call(
      {String uuid,
      String gender,
      bool isCompany,
      String dateStart,
      String title,
      String lastname,
      String firstname,
      String fullname});
}

/// @nodoc
class _$RepresentantModelCopyWithImpl<$Res, $Val extends RepresentantModel>
    implements $RepresentantModelCopyWith<$Res> {
  _$RepresentantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepresentantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? gender = null,
    Object? isCompany = null,
    Object? dateStart = null,
    Object? title = null,
    Object? lastname = null,
    Object? firstname = null,
    Object? fullname = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      isCompany: null == isCompany
          ? _value.isCompany
          : isCompany // ignore: cast_nullable_to_non_nullable
              as bool,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepresentantModelImplCopyWith<$Res>
    implements $RepresentantModelCopyWith<$Res> {
  factory _$$RepresentantModelImplCopyWith(_$RepresentantModelImpl value,
          $Res Function(_$RepresentantModelImpl) then) =
      __$$RepresentantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String gender,
      bool isCompany,
      String dateStart,
      String title,
      String lastname,
      String firstname,
      String fullname});
}

/// @nodoc
class __$$RepresentantModelImplCopyWithImpl<$Res>
    extends _$RepresentantModelCopyWithImpl<$Res, _$RepresentantModelImpl>
    implements _$$RepresentantModelImplCopyWith<$Res> {
  __$$RepresentantModelImplCopyWithImpl(_$RepresentantModelImpl _value,
      $Res Function(_$RepresentantModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepresentantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? gender = null,
    Object? isCompany = null,
    Object? dateStart = null,
    Object? title = null,
    Object? lastname = null,
    Object? firstname = null,
    Object? fullname = null,
  }) {
    return _then(_$RepresentantModelImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      isCompany: null == isCompany
          ? _value.isCompany
          : isCompany // ignore: cast_nullable_to_non_nullable
              as bool,
      dateStart: null == dateStart
          ? _value.dateStart
          : dateStart // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepresentantModelImpl implements _RepresentantModel {
  const _$RepresentantModelImpl(
      {required this.uuid,
      required this.gender,
      required this.isCompany,
      required this.dateStart,
      required this.title,
      required this.lastname,
      required this.firstname,
      required this.fullname});

  factory _$RepresentantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepresentantModelImplFromJson(json);

  @override
  final String uuid;
  @override
  final String gender;
  @override
  final bool isCompany;
  @override
  final String dateStart;
  @override
  final String title;
  @override
  final String lastname;
  @override
  final String firstname;
  @override
  final String fullname;

  @override
  String toString() {
    return 'RepresentantModel(uuid: $uuid, gender: $gender, isCompany: $isCompany, dateStart: $dateStart, title: $title, lastname: $lastname, firstname: $firstname, fullname: $fullname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentantModelImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isCompany, isCompany) ||
                other.isCompany == isCompany) &&
            (identical(other.dateStart, dateStart) ||
                other.dateStart == dateStart) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, gender, isCompany,
      dateStart, title, lastname, firstname, fullname);

  /// Create a copy of RepresentantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepresentantModelImplCopyWith<_$RepresentantModelImpl> get copyWith =>
      __$$RepresentantModelImplCopyWithImpl<_$RepresentantModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepresentantModelImplToJson(
      this,
    );
  }
}

abstract class _RepresentantModel implements RepresentantModel {
  const factory _RepresentantModel(
      {required final String uuid,
      required final String gender,
      required final bool isCompany,
      required final String dateStart,
      required final String title,
      required final String lastname,
      required final String firstname,
      required final String fullname}) = _$RepresentantModelImpl;

  factory _RepresentantModel.fromJson(Map<String, dynamic> json) =
      _$RepresentantModelImpl.fromJson;

  @override
  String get uuid;
  @override
  String get gender;
  @override
  bool get isCompany;
  @override
  String get dateStart;
  @override
  String get title;
  @override
  String get lastname;
  @override
  String get firstname;
  @override
  String get fullname;

  /// Create a copy of RepresentantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepresentantModelImplCopyWith<_$RepresentantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
