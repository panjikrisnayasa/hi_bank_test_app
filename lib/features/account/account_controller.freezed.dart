// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountUiState {
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountUiStateCopyWith<AccountUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountUiStateCopyWith<$Res> {
  factory $AccountUiStateCopyWith(
          AccountUiState value, $Res Function(AccountUiState) then) =
      _$AccountUiStateCopyWithImpl<$Res, AccountUiState>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class _$AccountUiStateCopyWithImpl<$Res, $Val extends AccountUiState>
    implements $AccountUiStateCopyWith<$Res> {
  _$AccountUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountUiStateImplCopyWith<$Res>
    implements $AccountUiStateCopyWith<$Res> {
  factory _$$AccountUiStateImplCopyWith(_$AccountUiStateImpl value,
          $Res Function(_$AccountUiStateImpl) then) =
      __$$AccountUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$AccountUiStateImplCopyWithImpl<$Res>
    extends _$AccountUiStateCopyWithImpl<$Res, _$AccountUiStateImpl>
    implements _$$AccountUiStateImplCopyWith<$Res> {
  __$$AccountUiStateImplCopyWithImpl(
      _$AccountUiStateImpl _value, $Res Function(_$AccountUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AccountUiStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$AccountUiStateImpl implements _AccountUiState {
  const _$AccountUiStateImpl({this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'AccountUiState(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountUiStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountUiStateImplCopyWith<_$AccountUiStateImpl> get copyWith =>
      __$$AccountUiStateImplCopyWithImpl<_$AccountUiStateImpl>(
          this, _$identity);
}

abstract class _AccountUiState implements AccountUiState {
  const factory _AccountUiState({final User? user}) = _$AccountUiStateImpl;

  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$AccountUiStateImplCopyWith<_$AccountUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
