// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_level_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopLevelUiState {
  int get currentTabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopLevelUiStateCopyWith<TopLevelUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopLevelUiStateCopyWith<$Res> {
  factory $TopLevelUiStateCopyWith(
          TopLevelUiState value, $Res Function(TopLevelUiState) then) =
      _$TopLevelUiStateCopyWithImpl<$Res, TopLevelUiState>;
  @useResult
  $Res call({int currentTabIndex});
}

/// @nodoc
class _$TopLevelUiStateCopyWithImpl<$Res, $Val extends TopLevelUiState>
    implements $TopLevelUiStateCopyWith<$Res> {
  _$TopLevelUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTabIndex = null,
  }) {
    return _then(_value.copyWith(
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopLevelUiStateImplCopyWith<$Res>
    implements $TopLevelUiStateCopyWith<$Res> {
  factory _$$TopLevelUiStateImplCopyWith(_$TopLevelUiStateImpl value,
          $Res Function(_$TopLevelUiStateImpl) then) =
      __$$TopLevelUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentTabIndex});
}

/// @nodoc
class __$$TopLevelUiStateImplCopyWithImpl<$Res>
    extends _$TopLevelUiStateCopyWithImpl<$Res, _$TopLevelUiStateImpl>
    implements _$$TopLevelUiStateImplCopyWith<$Res> {
  __$$TopLevelUiStateImplCopyWithImpl(
      _$TopLevelUiStateImpl _value, $Res Function(_$TopLevelUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTabIndex = null,
  }) {
    return _then(_$TopLevelUiStateImpl(
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TopLevelUiStateImpl implements _TopLevelUiState {
  const _$TopLevelUiStateImpl({this.currentTabIndex = 0});

  @override
  @JsonKey()
  final int currentTabIndex;

  @override
  String toString() {
    return 'TopLevelUiState(currentTabIndex: $currentTabIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopLevelUiStateImpl &&
            (identical(other.currentTabIndex, currentTabIndex) ||
                other.currentTabIndex == currentTabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentTabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopLevelUiStateImplCopyWith<_$TopLevelUiStateImpl> get copyWith =>
      __$$TopLevelUiStateImplCopyWithImpl<_$TopLevelUiStateImpl>(
          this, _$identity);
}

abstract class _TopLevelUiState implements TopLevelUiState {
  const factory _TopLevelUiState({final int currentTabIndex}) =
      _$TopLevelUiStateImpl;

  @override
  int get currentTabIndex;
  @override
  @JsonKey(ignore: true)
  _$$TopLevelUiStateImplCopyWith<_$TopLevelUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
