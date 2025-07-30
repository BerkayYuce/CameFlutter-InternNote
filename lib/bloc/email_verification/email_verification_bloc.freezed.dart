// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EmailVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )
    verifyEmailRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    resendVerificationCodeRequested,
    required TResult Function(int remainingSeconds) cooldownUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult? Function(int remainingSeconds)? cooldownUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult Function(int remainingSeconds)? cooldownUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyEmailRequested value) verifyEmailRequested,
    required TResult Function(ResendVerificationCodeRequested value)
    resendVerificationCodeRequested,
    required TResult Function(CooldownUpdated value) cooldownUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult? Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult? Function(CooldownUpdated value)? cooldownUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult Function(CooldownUpdated value)? cooldownUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationEventCopyWith<$Res> {
  factory $EmailVerificationEventCopyWith(
    EmailVerificationEvent value,
    $Res Function(EmailVerificationEvent) then,
  ) = _$EmailVerificationEventCopyWithImpl<$Res, EmailVerificationEvent>;
}

/// @nodoc
class _$EmailVerificationEventCopyWithImpl<
  $Res,
  $Val extends EmailVerificationEvent
>
    implements $EmailVerificationEventCopyWith<$Res> {
  _$EmailVerificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VerifyEmailRequestedImplCopyWith<$Res> {
  factory _$$VerifyEmailRequestedImplCopyWith(
    _$VerifyEmailRequestedImpl value,
    $Res Function(_$VerifyEmailRequestedImpl) then,
  ) = __$$VerifyEmailRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String name,
    String email,
    String password,
    String passwordConfirmation,
    String code,
    String deviceName,
  });
}

/// @nodoc
class __$$VerifyEmailRequestedImplCopyWithImpl<$Res>
    extends
        _$EmailVerificationEventCopyWithImpl<$Res, _$VerifyEmailRequestedImpl>
    implements _$$VerifyEmailRequestedImplCopyWith<$Res> {
  __$$VerifyEmailRequestedImplCopyWithImpl(
    _$VerifyEmailRequestedImpl _value,
    $Res Function(_$VerifyEmailRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? code = null,
    Object? deviceName = null,
  }) {
    return _then(
      _$VerifyEmailRequestedImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        passwordConfirmation: null == passwordConfirmation
            ? _value.passwordConfirmation
            : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyEmailRequestedImpl implements VerifyEmailRequested {
  const _$VerifyEmailRequestedImpl({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.code,
    required this.deviceName,
  });

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirmation;
  @override
  final String code;
  @override
  final String deviceName;

  @override
  String toString() {
    return 'EmailVerificationEvent.verifyEmailRequested(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, code: $code, deviceName: $deviceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    email,
    password,
    passwordConfirmation,
    code,
    deviceName,
  );

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailRequestedImplCopyWith<_$VerifyEmailRequestedImpl>
  get copyWith =>
      __$$VerifyEmailRequestedImplCopyWithImpl<_$VerifyEmailRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )
    verifyEmailRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    resendVerificationCodeRequested,
    required TResult Function(int remainingSeconds) cooldownUpdated,
  }) {
    return verifyEmailRequested(
      name,
      email,
      password,
      passwordConfirmation,
      code,
      deviceName,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult? Function(int remainingSeconds)? cooldownUpdated,
  }) {
    return verifyEmailRequested?.call(
      name,
      email,
      password,
      passwordConfirmation,
      code,
      deviceName,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult Function(int remainingSeconds)? cooldownUpdated,
    required TResult orElse(),
  }) {
    if (verifyEmailRequested != null) {
      return verifyEmailRequested(
        name,
        email,
        password,
        passwordConfirmation,
        code,
        deviceName,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyEmailRequested value) verifyEmailRequested,
    required TResult Function(ResendVerificationCodeRequested value)
    resendVerificationCodeRequested,
    required TResult Function(CooldownUpdated value) cooldownUpdated,
  }) {
    return verifyEmailRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult? Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult? Function(CooldownUpdated value)? cooldownUpdated,
  }) {
    return verifyEmailRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult Function(CooldownUpdated value)? cooldownUpdated,
    required TResult orElse(),
  }) {
    if (verifyEmailRequested != null) {
      return verifyEmailRequested(this);
    }
    return orElse();
  }
}

abstract class VerifyEmailRequested implements EmailVerificationEvent {
  const factory VerifyEmailRequested({
    required final String name,
    required final String email,
    required final String password,
    required final String passwordConfirmation,
    required final String code,
    required final String deviceName,
  }) = _$VerifyEmailRequestedImpl;

  String get name;
  String get email;
  String get password;
  String get passwordConfirmation;
  String get code;
  String get deviceName;

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEmailRequestedImplCopyWith<_$VerifyEmailRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendVerificationCodeRequestedImplCopyWith<$Res> {
  factory _$$ResendVerificationCodeRequestedImplCopyWith(
    _$ResendVerificationCodeRequestedImpl value,
    $Res Function(_$ResendVerificationCodeRequestedImpl) then,
  ) = __$$ResendVerificationCodeRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String name,
    String email,
    String password,
    String passwordConfirmation,
    String deviceName,
  });
}

/// @nodoc
class __$$ResendVerificationCodeRequestedImplCopyWithImpl<$Res>
    extends
        _$EmailVerificationEventCopyWithImpl<
          $Res,
          _$ResendVerificationCodeRequestedImpl
        >
    implements _$$ResendVerificationCodeRequestedImplCopyWith<$Res> {
  __$$ResendVerificationCodeRequestedImplCopyWithImpl(
    _$ResendVerificationCodeRequestedImpl _value,
    $Res Function(_$ResendVerificationCodeRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? deviceName = null,
  }) {
    return _then(
      _$ResendVerificationCodeRequestedImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        passwordConfirmation: null == passwordConfirmation
            ? _value.passwordConfirmation
            : passwordConfirmation // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceName: null == deviceName
            ? _value.deviceName
            : deviceName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResendVerificationCodeRequestedImpl
    implements ResendVerificationCodeRequested {
  const _$ResendVerificationCodeRequestedImpl({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.deviceName,
  });

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String passwordConfirmation;
  @override
  final String deviceName;

  @override
  String toString() {
    return 'EmailVerificationEvent.resendVerificationCodeRequested(name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, deviceName: $deviceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendVerificationCodeRequestedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    email,
    password,
    passwordConfirmation,
    deviceName,
  );

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendVerificationCodeRequestedImplCopyWith<
    _$ResendVerificationCodeRequestedImpl
  >
  get copyWith =>
      __$$ResendVerificationCodeRequestedImplCopyWithImpl<
        _$ResendVerificationCodeRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )
    verifyEmailRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    resendVerificationCodeRequested,
    required TResult Function(int remainingSeconds) cooldownUpdated,
  }) {
    return resendVerificationCodeRequested(
      name,
      email,
      password,
      passwordConfirmation,
      deviceName,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult? Function(int remainingSeconds)? cooldownUpdated,
  }) {
    return resendVerificationCodeRequested?.call(
      name,
      email,
      password,
      passwordConfirmation,
      deviceName,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult Function(int remainingSeconds)? cooldownUpdated,
    required TResult orElse(),
  }) {
    if (resendVerificationCodeRequested != null) {
      return resendVerificationCodeRequested(
        name,
        email,
        password,
        passwordConfirmation,
        deviceName,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyEmailRequested value) verifyEmailRequested,
    required TResult Function(ResendVerificationCodeRequested value)
    resendVerificationCodeRequested,
    required TResult Function(CooldownUpdated value) cooldownUpdated,
  }) {
    return resendVerificationCodeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult? Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult? Function(CooldownUpdated value)? cooldownUpdated,
  }) {
    return resendVerificationCodeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult Function(CooldownUpdated value)? cooldownUpdated,
    required TResult orElse(),
  }) {
    if (resendVerificationCodeRequested != null) {
      return resendVerificationCodeRequested(this);
    }
    return orElse();
  }
}

abstract class ResendVerificationCodeRequested
    implements EmailVerificationEvent {
  const factory ResendVerificationCodeRequested({
    required final String name,
    required final String email,
    required final String password,
    required final String passwordConfirmation,
    required final String deviceName,
  }) = _$ResendVerificationCodeRequestedImpl;

  String get name;
  String get email;
  String get password;
  String get passwordConfirmation;
  String get deviceName;

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendVerificationCodeRequestedImplCopyWith<
    _$ResendVerificationCodeRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CooldownUpdatedImplCopyWith<$Res> {
  factory _$$CooldownUpdatedImplCopyWith(
    _$CooldownUpdatedImpl value,
    $Res Function(_$CooldownUpdatedImpl) then,
  ) = __$$CooldownUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int remainingSeconds});
}

/// @nodoc
class __$$CooldownUpdatedImplCopyWithImpl<$Res>
    extends _$EmailVerificationEventCopyWithImpl<$Res, _$CooldownUpdatedImpl>
    implements _$$CooldownUpdatedImplCopyWith<$Res> {
  __$$CooldownUpdatedImplCopyWithImpl(
    _$CooldownUpdatedImpl _value,
    $Res Function(_$CooldownUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remainingSeconds = null}) {
    return _then(
      _$CooldownUpdatedImpl(
        null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CooldownUpdatedImpl implements CooldownUpdated {
  const _$CooldownUpdatedImpl(this.remainingSeconds);

  @override
  final int remainingSeconds;

  @override
  String toString() {
    return 'EmailVerificationEvent.cooldownUpdated(remainingSeconds: $remainingSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CooldownUpdatedImpl &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remainingSeconds);

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CooldownUpdatedImplCopyWith<_$CooldownUpdatedImpl> get copyWith =>
      __$$CooldownUpdatedImplCopyWithImpl<_$CooldownUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )
    verifyEmailRequested,
    required TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )
    resendVerificationCodeRequested,
    required TResult Function(int remainingSeconds) cooldownUpdated,
  }) {
    return cooldownUpdated(remainingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult? Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult? Function(int remainingSeconds)? cooldownUpdated,
  }) {
    return cooldownUpdated?.call(remainingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String code,
      String deviceName,
    )?
    verifyEmailRequested,
    TResult Function(
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String deviceName,
    )?
    resendVerificationCodeRequested,
    TResult Function(int remainingSeconds)? cooldownUpdated,
    required TResult orElse(),
  }) {
    if (cooldownUpdated != null) {
      return cooldownUpdated(remainingSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyEmailRequested value) verifyEmailRequested,
    required TResult Function(ResendVerificationCodeRequested value)
    resendVerificationCodeRequested,
    required TResult Function(CooldownUpdated value) cooldownUpdated,
  }) {
    return cooldownUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult? Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult? Function(CooldownUpdated value)? cooldownUpdated,
  }) {
    return cooldownUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyEmailRequested value)? verifyEmailRequested,
    TResult Function(ResendVerificationCodeRequested value)?
    resendVerificationCodeRequested,
    TResult Function(CooldownUpdated value)? cooldownUpdated,
    required TResult orElse(),
  }) {
    if (cooldownUpdated != null) {
      return cooldownUpdated(this);
    }
    return orElse();
  }
}

abstract class CooldownUpdated implements EmailVerificationEvent {
  const factory CooldownUpdated(final int remainingSeconds) =
      _$CooldownUpdatedImpl;

  int get remainingSeconds;

  /// Create a copy of EmailVerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CooldownUpdatedImplCopyWith<_$CooldownUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmailVerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds) cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds)? cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds)? cooldown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationStateCopyWith<$Res> {
  factory $EmailVerificationStateCopyWith(
    EmailVerificationState value,
    $Res Function(EmailVerificationState) then,
  ) = _$EmailVerificationStateCopyWithImpl<$Res, EmailVerificationState>;
}

/// @nodoc
class _$EmailVerificationStateCopyWithImpl<
  $Res,
  $Val extends EmailVerificationState
>
    implements $EmailVerificationStateCopyWith<$Res> {
  _$EmailVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailVerificationState
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
    extends _$EmailVerificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EmailVerificationState.initial()';
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
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds) cooldown,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds)? cooldown,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds)? cooldown,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements EmailVerificationState {
  const factory Initial() = _$InitialImpl;
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
    extends _$EmailVerificationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'EmailVerificationState.loading()';
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
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds) cooldown,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds)? cooldown,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds)? cooldown,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements EmailVerificationState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SuccessImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'EmailVerificationState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds) cooldown,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds)? cooldown,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds)? cooldown,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements EmailVerificationState {
  const factory Success({required final String message}) = _$SuccessImpl;

  String get message;

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$EmailVerificationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationState
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

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'EmailVerificationState.error(message: $message)';
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

  /// Create a copy of EmailVerificationState
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
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds) cooldown,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds)? cooldown,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds)? cooldown,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements EmailVerificationState {
  const factory Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CooldownImplCopyWith<$Res> {
  factory _$$CooldownImplCopyWith(
    _$CooldownImpl value,
    $Res Function(_$CooldownImpl) then,
  ) = __$$CooldownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int remainingSeconds});
}

/// @nodoc
class __$$CooldownImplCopyWithImpl<$Res>
    extends _$EmailVerificationStateCopyWithImpl<$Res, _$CooldownImpl>
    implements _$$CooldownImplCopyWith<$Res> {
  __$$CooldownImplCopyWithImpl(
    _$CooldownImpl _value,
    $Res Function(_$CooldownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remainingSeconds = null}) {
    return _then(
      _$CooldownImpl(
        remainingSeconds: null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CooldownImpl implements Cooldown {
  const _$CooldownImpl({required this.remainingSeconds});

  @override
  final int remainingSeconds;

  @override
  String toString() {
    return 'EmailVerificationState.cooldown(remainingSeconds: $remainingSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CooldownImpl &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remainingSeconds);

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CooldownImplCopyWith<_$CooldownImpl> get copyWith =>
      __$$CooldownImplCopyWithImpl<_$CooldownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds) cooldown,
  }) {
    return cooldown(remainingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds)? cooldown,
  }) {
    return cooldown?.call(remainingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds)? cooldown,
    required TResult orElse(),
  }) {
    if (cooldown != null) {
      return cooldown(remainingSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) {
    return cooldown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) {
    return cooldown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) {
    if (cooldown != null) {
      return cooldown(this);
    }
    return orElse();
  }
}

abstract class Cooldown implements EmailVerificationState {
  const factory Cooldown({required final int remainingSeconds}) =
      _$CooldownImpl;

  int get remainingSeconds;

  /// Create a copy of EmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CooldownImplCopyWith<_$CooldownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
