// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organisation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrganisationModel _$OrganisationModelFromJson(Map<String, dynamic> json) {
  return _OrganisationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganisationModel {
  String get siren => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get codeNaf => throw _privateConstructorUsedError;
  String get codeNafLabel => throw _privateConstructorUsedError;
  String get activity => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get legalCategory => throw _privateConstructorUsedError;
  String get legalForm => throw _privateConstructorUsedError;
  bool get isHiring => throw _privateConstructorUsedError;
  int get capital => throw _privateConstructorUsedError;
  String get lastUpdateToSiren => throw _privateConstructorUsedError;
  String get lastRecord => throw _privateConstructorUsedError;
  String get vta => throw _privateConstructorUsedError;
  List<RepresentantModel> get representants =>
      throw _privateConstructorUsedError;
  SiegeModel get siege => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this OrganisationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganisationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganisationModelCopyWith<OrganisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganisationModelCopyWith<$Res> {
  factory $OrganisationModelCopyWith(
          OrganisationModel value, $Res Function(OrganisationModel) then) =
      _$OrganisationModelCopyWithImpl<$Res, OrganisationModel>;
  @useResult
  $Res call(
      {String siren,
      String companyName,
      String codeNaf,
      String codeNafLabel,
      String activity,
      String createdAt,
      int legalCategory,
      String legalForm,
      bool isHiring,
      int capital,
      String lastUpdateToSiren,
      String lastRecord,
      String vta,
      List<RepresentantModel> representants,
      SiegeModel siege,
      int? id});

  $SiegeModelCopyWith<$Res> get siege;
}

/// @nodoc
class _$OrganisationModelCopyWithImpl<$Res, $Val extends OrganisationModel>
    implements $OrganisationModelCopyWith<$Res> {
  _$OrganisationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganisationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siren = null,
    Object? companyName = null,
    Object? codeNaf = null,
    Object? codeNafLabel = null,
    Object? activity = null,
    Object? createdAt = null,
    Object? legalCategory = null,
    Object? legalForm = null,
    Object? isHiring = null,
    Object? capital = null,
    Object? lastUpdateToSiren = null,
    Object? lastRecord = null,
    Object? vta = null,
    Object? representants = null,
    Object? siege = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      siren: null == siren
          ? _value.siren
          : siren // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      codeNaf: null == codeNaf
          ? _value.codeNaf
          : codeNaf // ignore: cast_nullable_to_non_nullable
              as String,
      codeNafLabel: null == codeNafLabel
          ? _value.codeNafLabel
          : codeNafLabel // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      legalCategory: null == legalCategory
          ? _value.legalCategory
          : legalCategory // ignore: cast_nullable_to_non_nullable
              as int,
      legalForm: null == legalForm
          ? _value.legalForm
          : legalForm // ignore: cast_nullable_to_non_nullable
              as String,
      isHiring: null == isHiring
          ? _value.isHiring
          : isHiring // ignore: cast_nullable_to_non_nullable
              as bool,
      capital: null == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdateToSiren: null == lastUpdateToSiren
          ? _value.lastUpdateToSiren
          : lastUpdateToSiren // ignore: cast_nullable_to_non_nullable
              as String,
      lastRecord: null == lastRecord
          ? _value.lastRecord
          : lastRecord // ignore: cast_nullable_to_non_nullable
              as String,
      vta: null == vta
          ? _value.vta
          : vta // ignore: cast_nullable_to_non_nullable
              as String,
      representants: null == representants
          ? _value.representants
          : representants // ignore: cast_nullable_to_non_nullable
              as List<RepresentantModel>,
      siege: null == siege
          ? _value.siege
          : siege // ignore: cast_nullable_to_non_nullable
              as SiegeModel,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of OrganisationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SiegeModelCopyWith<$Res> get siege {
    return $SiegeModelCopyWith<$Res>(_value.siege, (value) {
      return _then(_value.copyWith(siege: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrganisationModelImplCopyWith<$Res>
    implements $OrganisationModelCopyWith<$Res> {
  factory _$$OrganisationModelImplCopyWith(_$OrganisationModelImpl value,
          $Res Function(_$OrganisationModelImpl) then) =
      __$$OrganisationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String siren,
      String companyName,
      String codeNaf,
      String codeNafLabel,
      String activity,
      String createdAt,
      int legalCategory,
      String legalForm,
      bool isHiring,
      int capital,
      String lastUpdateToSiren,
      String lastRecord,
      String vta,
      List<RepresentantModel> representants,
      SiegeModel siege,
      int? id});

  @override
  $SiegeModelCopyWith<$Res> get siege;
}

/// @nodoc
class __$$OrganisationModelImplCopyWithImpl<$Res>
    extends _$OrganisationModelCopyWithImpl<$Res, _$OrganisationModelImpl>
    implements _$$OrganisationModelImplCopyWith<$Res> {
  __$$OrganisationModelImplCopyWithImpl(_$OrganisationModelImpl _value,
      $Res Function(_$OrganisationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganisationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siren = null,
    Object? companyName = null,
    Object? codeNaf = null,
    Object? codeNafLabel = null,
    Object? activity = null,
    Object? createdAt = null,
    Object? legalCategory = null,
    Object? legalForm = null,
    Object? isHiring = null,
    Object? capital = null,
    Object? lastUpdateToSiren = null,
    Object? lastRecord = null,
    Object? vta = null,
    Object? representants = null,
    Object? siege = null,
    Object? id = freezed,
  }) {
    return _then(_$OrganisationModelImpl(
      siren: null == siren
          ? _value.siren
          : siren // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      codeNaf: null == codeNaf
          ? _value.codeNaf
          : codeNaf // ignore: cast_nullable_to_non_nullable
              as String,
      codeNafLabel: null == codeNafLabel
          ? _value.codeNafLabel
          : codeNafLabel // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      legalCategory: null == legalCategory
          ? _value.legalCategory
          : legalCategory // ignore: cast_nullable_to_non_nullable
              as int,
      legalForm: null == legalForm
          ? _value.legalForm
          : legalForm // ignore: cast_nullable_to_non_nullable
              as String,
      isHiring: null == isHiring
          ? _value.isHiring
          : isHiring // ignore: cast_nullable_to_non_nullable
              as bool,
      capital: null == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdateToSiren: null == lastUpdateToSiren
          ? _value.lastUpdateToSiren
          : lastUpdateToSiren // ignore: cast_nullable_to_non_nullable
              as String,
      lastRecord: null == lastRecord
          ? _value.lastRecord
          : lastRecord // ignore: cast_nullable_to_non_nullable
              as String,
      vta: null == vta
          ? _value.vta
          : vta // ignore: cast_nullable_to_non_nullable
              as String,
      representants: null == representants
          ? _value._representants
          : representants // ignore: cast_nullable_to_non_nullable
              as List<RepresentantModel>,
      siege: null == siege
          ? _value.siege
          : siege // ignore: cast_nullable_to_non_nullable
              as SiegeModel,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganisationModelImpl implements _OrganisationModel {
  const _$OrganisationModelImpl(
      {required this.siren,
      required this.companyName,
      required this.codeNaf,
      required this.codeNafLabel,
      required this.activity,
      required this.createdAt,
      required this.legalCategory,
      required this.legalForm,
      required this.isHiring,
      required this.capital,
      required this.lastUpdateToSiren,
      required this.lastRecord,
      required this.vta,
      required final List<RepresentantModel> representants,
      required this.siege,
      this.id})
      : _representants = representants;

  factory _$OrganisationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganisationModelImplFromJson(json);

  @override
  final String siren;
  @override
  final String companyName;
  @override
  final String codeNaf;
  @override
  final String codeNafLabel;
  @override
  final String activity;
  @override
  final String createdAt;
  @override
  final int legalCategory;
  @override
  final String legalForm;
  @override
  final bool isHiring;
  @override
  final int capital;
  @override
  final String lastUpdateToSiren;
  @override
  final String lastRecord;
  @override
  final String vta;
  final List<RepresentantModel> _representants;
  @override
  List<RepresentantModel> get representants {
    if (_representants is EqualUnmodifiableListView) return _representants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_representants);
  }

  @override
  final SiegeModel siege;
  @override
  final int? id;

  @override
  String toString() {
    return 'OrganisationModel(siren: $siren, companyName: $companyName, codeNaf: $codeNaf, codeNafLabel: $codeNafLabel, activity: $activity, createdAt: $createdAt, legalCategory: $legalCategory, legalForm: $legalForm, isHiring: $isHiring, capital: $capital, lastUpdateToSiren: $lastUpdateToSiren, lastRecord: $lastRecord, vta: $vta, representants: $representants, siege: $siege, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganisationModelImpl &&
            (identical(other.siren, siren) || other.siren == siren) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.codeNaf, codeNaf) || other.codeNaf == codeNaf) &&
            (identical(other.codeNafLabel, codeNafLabel) ||
                other.codeNafLabel == codeNafLabel) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.legalCategory, legalCategory) ||
                other.legalCategory == legalCategory) &&
            (identical(other.legalForm, legalForm) ||
                other.legalForm == legalForm) &&
            (identical(other.isHiring, isHiring) ||
                other.isHiring == isHiring) &&
            (identical(other.capital, capital) || other.capital == capital) &&
            (identical(other.lastUpdateToSiren, lastUpdateToSiren) ||
                other.lastUpdateToSiren == lastUpdateToSiren) &&
            (identical(other.lastRecord, lastRecord) ||
                other.lastRecord == lastRecord) &&
            (identical(other.vta, vta) || other.vta == vta) &&
            const DeepCollectionEquality()
                .equals(other._representants, _representants) &&
            (identical(other.siege, siege) || other.siege == siege) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      siren,
      companyName,
      codeNaf,
      codeNafLabel,
      activity,
      createdAt,
      legalCategory,
      legalForm,
      isHiring,
      capital,
      lastUpdateToSiren,
      lastRecord,
      vta,
      const DeepCollectionEquality().hash(_representants),
      siege,
      id);

  /// Create a copy of OrganisationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganisationModelImplCopyWith<_$OrganisationModelImpl> get copyWith =>
      __$$OrganisationModelImplCopyWithImpl<_$OrganisationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganisationModelImplToJson(
      this,
    );
  }
}

abstract class _OrganisationModel implements OrganisationModel {
  const factory _OrganisationModel(
      {required final String siren,
      required final String companyName,
      required final String codeNaf,
      required final String codeNafLabel,
      required final String activity,
      required final String createdAt,
      required final int legalCategory,
      required final String legalForm,
      required final bool isHiring,
      required final int capital,
      required final String lastUpdateToSiren,
      required final String lastRecord,
      required final String vta,
      required final List<RepresentantModel> representants,
      required final SiegeModel siege,
      final int? id}) = _$OrganisationModelImpl;

  factory _OrganisationModel.fromJson(Map<String, dynamic> json) =
      _$OrganisationModelImpl.fromJson;

  @override
  String get siren;
  @override
  String get companyName;
  @override
  String get codeNaf;
  @override
  String get codeNafLabel;
  @override
  String get activity;
  @override
  String get createdAt;
  @override
  int get legalCategory;
  @override
  String get legalForm;
  @override
  bool get isHiring;
  @override
  int get capital;
  @override
  String get lastUpdateToSiren;
  @override
  String get lastRecord;
  @override
  String get vta;
  @override
  List<RepresentantModel> get representants;
  @override
  SiegeModel get siege;
  @override
  int? get id;

  /// Create a copy of OrganisationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganisationModelImplCopyWith<_$OrganisationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
