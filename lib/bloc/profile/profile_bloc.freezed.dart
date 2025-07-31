// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileInfoRequested,
    required TResult Function(String oldPassword, String newPassword)
    passwordChangeRequested,
    required TResult Function(String name, String email) profileUpdateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? profileInfoRequested,
    TResult? Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult? Function(String name, String email)? profileUpdateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileInfoRequested,
    TResult Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult Function(String name, String email)? profileUpdateRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileInfoRequested value) profileInfoRequested,
    required TResult Function(_PasswordChangeRequested value)
    passwordChangeRequested,
    required TResult Function(_ProfileUpdateRequested value)
    profileUpdateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult? Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult? Function(_ProfileUpdateRequested value)? profileUpdateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult Function(_ProfileUpdateRequested value)? profileUpdateRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
    ProfileEvent value,
    $Res Function(ProfileEvent) then,
  ) = _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileInfoRequestedImplCopyWith<$Res> {
  factory _$$ProfileInfoRequestedImplCopyWith(
    _$ProfileInfoRequestedImpl value,
    $Res Function(_$ProfileInfoRequestedImpl) then,
  ) = __$$ProfileInfoRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileInfoRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileInfoRequestedImpl>
    implements _$$ProfileInfoRequestedImplCopyWith<$Res> {
  __$$ProfileInfoRequestedImplCopyWithImpl(
    _$ProfileInfoRequestedImpl _value,
    $Res Function(_$ProfileInfoRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileInfoRequestedImpl implements _ProfileInfoRequested {
  const _$ProfileInfoRequestedImpl();

  @override
  String toString() {
    return 'ProfileEvent.profileInfoRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileInfoRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileInfoRequested,
    required TResult Function(String oldPassword, String newPassword)
    passwordChangeRequested,
    required TResult Function(String name, String email) profileUpdateRequested,
  }) {
    return profileInfoRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? profileInfoRequested,
    TResult? Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult? Function(String name, String email)? profileUpdateRequested,
  }) {
    return profileInfoRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileInfoRequested,
    TResult Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult Function(String name, String email)? profileUpdateRequested,
    required TResult orElse(),
  }) {
    if (profileInfoRequested != null) {
      return profileInfoRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileInfoRequested value) profileInfoRequested,
    required TResult Function(_PasswordChangeRequested value)
    passwordChangeRequested,
    required TResult Function(_ProfileUpdateRequested value)
    profileUpdateRequested,
  }) {
    return profileInfoRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult? Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult? Function(_ProfileUpdateRequested value)? profileUpdateRequested,
  }) {
    return profileInfoRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult Function(_ProfileUpdateRequested value)? profileUpdateRequested,
    required TResult orElse(),
  }) {
    if (profileInfoRequested != null) {
      return profileInfoRequested(this);
    }
    return orElse();
  }
}

abstract class _ProfileInfoRequested implements ProfileEvent {
  const factory _ProfileInfoRequested() = _$ProfileInfoRequestedImpl;
}

/// @nodoc
abstract class _$$PasswordChangeRequestedImplCopyWith<$Res> {
  factory _$$PasswordChangeRequestedImplCopyWith(
    _$PasswordChangeRequestedImpl value,
    $Res Function(_$PasswordChangeRequestedImpl) then,
  ) = __$$PasswordChangeRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String oldPassword, String newPassword});
}

/// @nodoc
class __$$PasswordChangeRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$PasswordChangeRequestedImpl>
    implements _$$PasswordChangeRequestedImplCopyWith<$Res> {
  __$$PasswordChangeRequestedImplCopyWithImpl(
    _$PasswordChangeRequestedImpl _value,
    $Res Function(_$PasswordChangeRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oldPassword = null, Object? newPassword = null}) {
    return _then(
      _$PasswordChangeRequestedImpl(
        oldPassword: null == oldPassword
            ? _value.oldPassword
            : oldPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PasswordChangeRequestedImpl implements _PasswordChangeRequested {
  const _$PasswordChangeRequestedImpl({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  final String oldPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ProfileEvent.passwordChangeRequested(oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangeRequestedImpl &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldPassword, newPassword);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangeRequestedImplCopyWith<_$PasswordChangeRequestedImpl>
  get copyWith =>
      __$$PasswordChangeRequestedImplCopyWithImpl<
        _$PasswordChangeRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileInfoRequested,
    required TResult Function(String oldPassword, String newPassword)
    passwordChangeRequested,
    required TResult Function(String name, String email) profileUpdateRequested,
  }) {
    return passwordChangeRequested(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? profileInfoRequested,
    TResult? Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult? Function(String name, String email)? profileUpdateRequested,
  }) {
    return passwordChangeRequested?.call(oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileInfoRequested,
    TResult Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult Function(String name, String email)? profileUpdateRequested,
    required TResult orElse(),
  }) {
    if (passwordChangeRequested != null) {
      return passwordChangeRequested(oldPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileInfoRequested value) profileInfoRequested,
    required TResult Function(_PasswordChangeRequested value)
    passwordChangeRequested,
    required TResult Function(_ProfileUpdateRequested value)
    profileUpdateRequested,
  }) {
    return passwordChangeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult? Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult? Function(_ProfileUpdateRequested value)? profileUpdateRequested,
  }) {
    return passwordChangeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult Function(_ProfileUpdateRequested value)? profileUpdateRequested,
    required TResult orElse(),
  }) {
    if (passwordChangeRequested != null) {
      return passwordChangeRequested(this);
    }
    return orElse();
  }
}

abstract class _PasswordChangeRequested implements ProfileEvent {
  const factory _PasswordChangeRequested({
    required final String oldPassword,
    required final String newPassword,
  }) = _$PasswordChangeRequestedImpl;

  String get oldPassword;
  String get newPassword;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangeRequestedImplCopyWith<_$PasswordChangeRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileUpdateRequestedImplCopyWith<$Res> {
  factory _$$ProfileUpdateRequestedImplCopyWith(
    _$ProfileUpdateRequestedImpl value,
    $Res Function(_$ProfileUpdateRequestedImpl) then,
  ) = __$$ProfileUpdateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class __$$ProfileUpdateRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileUpdateRequestedImpl>
    implements _$$ProfileUpdateRequestedImplCopyWith<$Res> {
  __$$ProfileUpdateRequestedImplCopyWithImpl(
    _$ProfileUpdateRequestedImpl _value,
    $Res Function(_$ProfileUpdateRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? email = null}) {
    return _then(
      _$ProfileUpdateRequestedImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ProfileUpdateRequestedImpl implements _ProfileUpdateRequested {
  const _$ProfileUpdateRequestedImpl({required this.name, required this.email});

  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'ProfileEvent.profileUpdateRequested(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpdateRequestedImplCopyWith<_$ProfileUpdateRequestedImpl>
  get copyWith =>
      __$$ProfileUpdateRequestedImplCopyWithImpl<_$ProfileUpdateRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() profileInfoRequested,
    required TResult Function(String oldPassword, String newPassword)
    passwordChangeRequested,
    required TResult Function(String name, String email) profileUpdateRequested,
  }) {
    return profileUpdateRequested(name, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? profileInfoRequested,
    TResult? Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult? Function(String name, String email)? profileUpdateRequested,
  }) {
    return profileUpdateRequested?.call(name, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? profileInfoRequested,
    TResult Function(String oldPassword, String newPassword)?
    passwordChangeRequested,
    TResult Function(String name, String email)? profileUpdateRequested,
    required TResult orElse(),
  }) {
    if (profileUpdateRequested != null) {
      return profileUpdateRequested(name, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProfileInfoRequested value) profileInfoRequested,
    required TResult Function(_PasswordChangeRequested value)
    passwordChangeRequested,
    required TResult Function(_ProfileUpdateRequested value)
    profileUpdateRequested,
  }) {
    return profileUpdateRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult? Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult? Function(_ProfileUpdateRequested value)? profileUpdateRequested,
  }) {
    return profileUpdateRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProfileInfoRequested value)? profileInfoRequested,
    TResult Function(_PasswordChangeRequested value)? passwordChangeRequested,
    TResult Function(_ProfileUpdateRequested value)? profileUpdateRequested,
    required TResult orElse(),
  }) {
    if (profileUpdateRequested != null) {
      return profileUpdateRequested(this);
    }
    return orElse();
  }
}

abstract class _ProfileUpdateRequested implements ProfileEvent {
  const factory _ProfileUpdateRequested({
    required final String name,
    required final String email,
  }) = _$ProfileUpdateRequestedImpl;

  String get name;
  String get email;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUpdateRequestedImplCopyWith<_$ProfileUpdateRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> user, String? message)
    loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> user, String? message)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> user, String? message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
    ProfileState value,
    $Res Function(ProfileState) then,
  ) = _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> user, String? message)
    loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> user, String? message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> user, String? message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> user, String? message)
    loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> user, String? message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> user, String? message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProfileState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> user, String? message});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? message = freezed}) {
    return _then(
      _$LoadedImpl(
        user: null == user
            ? _value._user
            : user // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required final Map<String, dynamic> user, this.message})
    : _user = user;

  final Map<String, dynamic> _user;
  @override
  Map<String, dynamic> get user {
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_user);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'ProfileState.loaded(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_user),
    message,
  );

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> user, String? message)
    loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> user, String? message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> user, String? message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ProfileState {
  const factory _Loaded({
    required final Map<String, dynamic> user,
    final String? message,
  }) = _$LoadedImpl;

  Map<String, dynamic> get user;
  String? get message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic> user, String? message)
    loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic> user, String? message)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic> user, String? message)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProfileState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
