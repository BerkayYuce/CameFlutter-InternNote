// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PasswordResetEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) sendPasswordResetCodeRequested,
    required TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )
    resetPasswordWithCodeRequested,
    required TResult Function(int remainingSeconds)
    passwordResetCooldownUpdated,
    required TResult Function() loadPasswordResetCooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? sendPasswordResetCodeRequested,
    TResult? Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult? Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult? Function()? loadPasswordResetCooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? sendPasswordResetCodeRequested,
    TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult Function()? loadPasswordResetCooldown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendPasswordResetCodeRequested value)
    sendPasswordResetCodeRequested,
    required TResult Function(ResetPasswordWithCodeRequested value)
    resetPasswordWithCodeRequested,
    required TResult Function(PasswordResetCooldownUpdated value)
    passwordResetCooldownUpdated,
    required TResult Function(LoadPasswordResetCooldown value)
    loadPasswordResetCooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult? Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult? Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult? Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetEventCopyWith<$Res> {
  factory $PasswordResetEventCopyWith(
    PasswordResetEvent value,
    $Res Function(PasswordResetEvent) then,
  ) = _$PasswordResetEventCopyWithImpl<$Res, PasswordResetEvent>;
}

/// @nodoc
class _$PasswordResetEventCopyWithImpl<$Res, $Val extends PasswordResetEvent>
    implements $PasswordResetEventCopyWith<$Res> {
  _$PasswordResetEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendPasswordResetCodeRequestedImplCopyWith<$Res> {
  factory _$$SendPasswordResetCodeRequestedImplCopyWith(
    _$SendPasswordResetCodeRequestedImpl value,
    $Res Function(_$SendPasswordResetCodeRequestedImpl) then,
  ) = __$$SendPasswordResetCodeRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SendPasswordResetCodeRequestedImplCopyWithImpl<$Res>
    extends
        _$PasswordResetEventCopyWithImpl<
          $Res,
          _$SendPasswordResetCodeRequestedImpl
        >
    implements _$$SendPasswordResetCodeRequestedImplCopyWith<$Res> {
  __$$SendPasswordResetCodeRequestedImplCopyWithImpl(
    _$SendPasswordResetCodeRequestedImpl _value,
    $Res Function(_$SendPasswordResetCodeRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$SendPasswordResetCodeRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SendPasswordResetCodeRequestedImpl
    implements SendPasswordResetCodeRequested {
  const _$SendPasswordResetCodeRequestedImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'PasswordResetEvent.sendPasswordResetCodeRequested(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendPasswordResetCodeRequestedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendPasswordResetCodeRequestedImplCopyWith<
    _$SendPasswordResetCodeRequestedImpl
  >
  get copyWith =>
      __$$SendPasswordResetCodeRequestedImplCopyWithImpl<
        _$SendPasswordResetCodeRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) sendPasswordResetCodeRequested,
    required TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )
    resetPasswordWithCodeRequested,
    required TResult Function(int remainingSeconds)
    passwordResetCooldownUpdated,
    required TResult Function() loadPasswordResetCooldown,
  }) {
    return sendPasswordResetCodeRequested(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? sendPasswordResetCodeRequested,
    TResult? Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult? Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult? Function()? loadPasswordResetCooldown,
  }) {
    return sendPasswordResetCodeRequested?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? sendPasswordResetCodeRequested,
    TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult Function()? loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (sendPasswordResetCodeRequested != null) {
      return sendPasswordResetCodeRequested(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendPasswordResetCodeRequested value)
    sendPasswordResetCodeRequested,
    required TResult Function(ResetPasswordWithCodeRequested value)
    resetPasswordWithCodeRequested,
    required TResult Function(PasswordResetCooldownUpdated value)
    passwordResetCooldownUpdated,
    required TResult Function(LoadPasswordResetCooldown value)
    loadPasswordResetCooldown,
  }) {
    return sendPasswordResetCodeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult? Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult? Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult? Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
  }) {
    return sendPasswordResetCodeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (sendPasswordResetCodeRequested != null) {
      return sendPasswordResetCodeRequested(this);
    }
    return orElse();
  }
}

abstract class SendPasswordResetCodeRequested implements PasswordResetEvent {
  const factory SendPasswordResetCodeRequested({required final String email}) =
      _$SendPasswordResetCodeRequestedImpl;

  String get email;

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendPasswordResetCodeRequestedImplCopyWith<
    _$SendPasswordResetCodeRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordWithCodeRequestedImplCopyWith<$Res> {
  factory _$$ResetPasswordWithCodeRequestedImplCopyWith(
    _$ResetPasswordWithCodeRequestedImpl value,
    $Res Function(_$ResetPasswordWithCodeRequestedImpl) then,
  ) = __$$ResetPasswordWithCodeRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String email,
    String code,
    String newPassword,
    String confirmPassword,
  });
}

/// @nodoc
class __$$ResetPasswordWithCodeRequestedImplCopyWithImpl<$Res>
    extends
        _$PasswordResetEventCopyWithImpl<
          $Res,
          _$ResetPasswordWithCodeRequestedImpl
        >
    implements _$$ResetPasswordWithCodeRequestedImplCopyWith<$Res> {
  __$$ResetPasswordWithCodeRequestedImplCopyWithImpl(
    _$ResetPasswordWithCodeRequestedImpl _value,
    $Res Function(_$ResetPasswordWithCodeRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
  }) {
    return _then(
      _$ResetPasswordWithCodeRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        confirmPassword: null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetPasswordWithCodeRequestedImpl
    implements ResetPasswordWithCodeRequested {
  const _$ResetPasswordWithCodeRequestedImpl({
    required this.email,
    required this.code,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  final String email;
  @override
  final String code;
  @override
  final String newPassword;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'PasswordResetEvent.resetPasswordWithCodeRequested(email: $email, code: $code, newPassword: $newPassword, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordWithCodeRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, code, newPassword, confirmPassword);

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordWithCodeRequestedImplCopyWith<
    _$ResetPasswordWithCodeRequestedImpl
  >
  get copyWith =>
      __$$ResetPasswordWithCodeRequestedImplCopyWithImpl<
        _$ResetPasswordWithCodeRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) sendPasswordResetCodeRequested,
    required TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )
    resetPasswordWithCodeRequested,
    required TResult Function(int remainingSeconds)
    passwordResetCooldownUpdated,
    required TResult Function() loadPasswordResetCooldown,
  }) {
    return resetPasswordWithCodeRequested(
      email,
      code,
      newPassword,
      confirmPassword,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? sendPasswordResetCodeRequested,
    TResult? Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult? Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult? Function()? loadPasswordResetCooldown,
  }) {
    return resetPasswordWithCodeRequested?.call(
      email,
      code,
      newPassword,
      confirmPassword,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? sendPasswordResetCodeRequested,
    TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult Function()? loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (resetPasswordWithCodeRequested != null) {
      return resetPasswordWithCodeRequested(
        email,
        code,
        newPassword,
        confirmPassword,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendPasswordResetCodeRequested value)
    sendPasswordResetCodeRequested,
    required TResult Function(ResetPasswordWithCodeRequested value)
    resetPasswordWithCodeRequested,
    required TResult Function(PasswordResetCooldownUpdated value)
    passwordResetCooldownUpdated,
    required TResult Function(LoadPasswordResetCooldown value)
    loadPasswordResetCooldown,
  }) {
    return resetPasswordWithCodeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult? Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult? Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult? Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
  }) {
    return resetPasswordWithCodeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (resetPasswordWithCodeRequested != null) {
      return resetPasswordWithCodeRequested(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordWithCodeRequested implements PasswordResetEvent {
  const factory ResetPasswordWithCodeRequested({
    required final String email,
    required final String code,
    required final String newPassword,
    required final String confirmPassword,
  }) = _$ResetPasswordWithCodeRequestedImpl;

  String get email;
  String get code;
  String get newPassword;
  String get confirmPassword;

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordWithCodeRequestedImplCopyWith<
    _$ResetPasswordWithCodeRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordResetCooldownUpdatedImplCopyWith<$Res> {
  factory _$$PasswordResetCooldownUpdatedImplCopyWith(
    _$PasswordResetCooldownUpdatedImpl value,
    $Res Function(_$PasswordResetCooldownUpdatedImpl) then,
  ) = __$$PasswordResetCooldownUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int remainingSeconds});
}

/// @nodoc
class __$$PasswordResetCooldownUpdatedImplCopyWithImpl<$Res>
    extends
        _$PasswordResetEventCopyWithImpl<
          $Res,
          _$PasswordResetCooldownUpdatedImpl
        >
    implements _$$PasswordResetCooldownUpdatedImplCopyWith<$Res> {
  __$$PasswordResetCooldownUpdatedImplCopyWithImpl(
    _$PasswordResetCooldownUpdatedImpl _value,
    $Res Function(_$PasswordResetCooldownUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remainingSeconds = null}) {
    return _then(
      _$PasswordResetCooldownUpdatedImpl(
        remainingSeconds: null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$PasswordResetCooldownUpdatedImpl
    implements PasswordResetCooldownUpdated {
  const _$PasswordResetCooldownUpdatedImpl({required this.remainingSeconds});

  @override
  final int remainingSeconds;

  @override
  String toString() {
    return 'PasswordResetEvent.passwordResetCooldownUpdated(remainingSeconds: $remainingSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetCooldownUpdatedImpl &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remainingSeconds);

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetCooldownUpdatedImplCopyWith<
    _$PasswordResetCooldownUpdatedImpl
  >
  get copyWith =>
      __$$PasswordResetCooldownUpdatedImplCopyWithImpl<
        _$PasswordResetCooldownUpdatedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) sendPasswordResetCodeRequested,
    required TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )
    resetPasswordWithCodeRequested,
    required TResult Function(int remainingSeconds)
    passwordResetCooldownUpdated,
    required TResult Function() loadPasswordResetCooldown,
  }) {
    return passwordResetCooldownUpdated(remainingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? sendPasswordResetCodeRequested,
    TResult? Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult? Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult? Function()? loadPasswordResetCooldown,
  }) {
    return passwordResetCooldownUpdated?.call(remainingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? sendPasswordResetCodeRequested,
    TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult Function()? loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (passwordResetCooldownUpdated != null) {
      return passwordResetCooldownUpdated(remainingSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendPasswordResetCodeRequested value)
    sendPasswordResetCodeRequested,
    required TResult Function(ResetPasswordWithCodeRequested value)
    resetPasswordWithCodeRequested,
    required TResult Function(PasswordResetCooldownUpdated value)
    passwordResetCooldownUpdated,
    required TResult Function(LoadPasswordResetCooldown value)
    loadPasswordResetCooldown,
  }) {
    return passwordResetCooldownUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult? Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult? Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult? Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
  }) {
    return passwordResetCooldownUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (passwordResetCooldownUpdated != null) {
      return passwordResetCooldownUpdated(this);
    }
    return orElse();
  }
}

abstract class PasswordResetCooldownUpdated implements PasswordResetEvent {
  const factory PasswordResetCooldownUpdated({
    required final int remainingSeconds,
  }) = _$PasswordResetCooldownUpdatedImpl;

  int get remainingSeconds;

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetCooldownUpdatedImplCopyWith<
    _$PasswordResetCooldownUpdatedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadPasswordResetCooldownImplCopyWith<$Res> {
  factory _$$LoadPasswordResetCooldownImplCopyWith(
    _$LoadPasswordResetCooldownImpl value,
    $Res Function(_$LoadPasswordResetCooldownImpl) then,
  ) = __$$LoadPasswordResetCooldownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPasswordResetCooldownImplCopyWithImpl<$Res>
    extends
        _$PasswordResetEventCopyWithImpl<$Res, _$LoadPasswordResetCooldownImpl>
    implements _$$LoadPasswordResetCooldownImplCopyWith<$Res> {
  __$$LoadPasswordResetCooldownImplCopyWithImpl(
    _$LoadPasswordResetCooldownImpl _value,
    $Res Function(_$LoadPasswordResetCooldownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadPasswordResetCooldownImpl implements LoadPasswordResetCooldown {
  const _$LoadPasswordResetCooldownImpl();

  @override
  String toString() {
    return 'PasswordResetEvent.loadPasswordResetCooldown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPasswordResetCooldownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) sendPasswordResetCodeRequested,
    required TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )
    resetPasswordWithCodeRequested,
    required TResult Function(int remainingSeconds)
    passwordResetCooldownUpdated,
    required TResult Function() loadPasswordResetCooldown,
  }) {
    return loadPasswordResetCooldown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? sendPasswordResetCodeRequested,
    TResult? Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult? Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult? Function()? loadPasswordResetCooldown,
  }) {
    return loadPasswordResetCooldown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? sendPasswordResetCodeRequested,
    TResult Function(
      String email,
      String code,
      String newPassword,
      String confirmPassword,
    )?
    resetPasswordWithCodeRequested,
    TResult Function(int remainingSeconds)? passwordResetCooldownUpdated,
    TResult Function()? loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (loadPasswordResetCooldown != null) {
      return loadPasswordResetCooldown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendPasswordResetCodeRequested value)
    sendPasswordResetCodeRequested,
    required TResult Function(ResetPasswordWithCodeRequested value)
    resetPasswordWithCodeRequested,
    required TResult Function(PasswordResetCooldownUpdated value)
    passwordResetCooldownUpdated,
    required TResult Function(LoadPasswordResetCooldown value)
    loadPasswordResetCooldown,
  }) {
    return loadPasswordResetCooldown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult? Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult? Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult? Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
  }) {
    return loadPasswordResetCooldown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendPasswordResetCodeRequested value)?
    sendPasswordResetCodeRequested,
    TResult Function(ResetPasswordWithCodeRequested value)?
    resetPasswordWithCodeRequested,
    TResult Function(PasswordResetCooldownUpdated value)?
    passwordResetCooldownUpdated,
    TResult Function(LoadPasswordResetCooldown value)?
    loadPasswordResetCooldown,
    required TResult orElse(),
  }) {
    if (loadPasswordResetCooldown != null) {
      return loadPasswordResetCooldown(this);
    }
    return orElse();
  }
}

abstract class LoadPasswordResetCooldown implements PasswordResetEvent {
  const factory LoadPasswordResetCooldown() = _$LoadPasswordResetCooldownImpl;
}

/// @nodoc
mixin _$PasswordResetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message, String email) codeSentSuccess,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds, String cooldownEmail)
    cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, String email)? codeSentSuccess,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds, String cooldownEmail)? cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, String email)? codeSentSuccess,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds, String cooldownEmail)? cooldown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CodeSentSuccess value) codeSentSuccess,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CodeSentSuccess value)? codeSentSuccess,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetStateCopyWith<$Res> {
  factory $PasswordResetStateCopyWith(
    PasswordResetState value,
    $Res Function(PasswordResetState) then,
  ) = _$PasswordResetStateCopyWithImpl<$Res, PasswordResetState>;
}

/// @nodoc
class _$PasswordResetStateCopyWithImpl<$Res, $Val extends PasswordResetState>
    implements $PasswordResetStateCopyWith<$Res> {
  _$PasswordResetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetState
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
    extends _$PasswordResetStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PasswordResetState.initial()';
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
    required TResult Function(String message, String email) codeSentSuccess,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds, String cooldownEmail)
    cooldown,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, String email)? codeSentSuccess,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds, String cooldownEmail)? cooldown,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, String email)? codeSentSuccess,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds, String cooldownEmail)? cooldown,
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
    required TResult Function(CodeSentSuccess value) codeSentSuccess,
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
    TResult? Function(CodeSentSuccess value)? codeSentSuccess,
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
    TResult Function(CodeSentSuccess value)? codeSentSuccess,
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

abstract class Initial implements PasswordResetState {
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
    extends _$PasswordResetStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PasswordResetState.loading()';
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
    required TResult Function(String message, String email) codeSentSuccess,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds, String cooldownEmail)
    cooldown,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, String email)? codeSentSuccess,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds, String cooldownEmail)? cooldown,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, String email)? codeSentSuccess,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds, String cooldownEmail)? cooldown,
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
    required TResult Function(CodeSentSuccess value) codeSentSuccess,
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
    TResult? Function(CodeSentSuccess value)? codeSentSuccess,
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
    TResult Function(CodeSentSuccess value)? codeSentSuccess,
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

abstract class Loading implements PasswordResetState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$CodeSentSuccessImplCopyWith<$Res> {
  factory _$$CodeSentSuccessImplCopyWith(
    _$CodeSentSuccessImpl value,
    $Res Function(_$CodeSentSuccessImpl) then,
  ) = __$$CodeSentSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, String email});
}

/// @nodoc
class __$$CodeSentSuccessImplCopyWithImpl<$Res>
    extends _$PasswordResetStateCopyWithImpl<$Res, _$CodeSentSuccessImpl>
    implements _$$CodeSentSuccessImplCopyWith<$Res> {
  __$$CodeSentSuccessImplCopyWithImpl(
    _$CodeSentSuccessImpl _value,
    $Res Function(_$CodeSentSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? email = null}) {
    return _then(
      _$CodeSentSuccessImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
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

class _$CodeSentSuccessImpl implements CodeSentSuccess {
  const _$CodeSentSuccessImpl({required this.message, required this.email});

  @override
  final String message;
  @override
  final String email;

  @override
  String toString() {
    return 'PasswordResetState.codeSentSuccess(message: $message, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeSentSuccessImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, email);

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeSentSuccessImplCopyWith<_$CodeSentSuccessImpl> get copyWith =>
      __$$CodeSentSuccessImplCopyWithImpl<_$CodeSentSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message, String email) codeSentSuccess,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds, String cooldownEmail)
    cooldown,
  }) {
    return codeSentSuccess(message, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, String email)? codeSentSuccess,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds, String cooldownEmail)? cooldown,
  }) {
    return codeSentSuccess?.call(message, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, String email)? codeSentSuccess,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds, String cooldownEmail)? cooldown,
    required TResult orElse(),
  }) {
    if (codeSentSuccess != null) {
      return codeSentSuccess(message, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CodeSentSuccess value) codeSentSuccess,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
    required TResult Function(Cooldown value) cooldown,
  }) {
    return codeSentSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(CodeSentSuccess value)? codeSentSuccess,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? error,
    TResult? Function(Cooldown value)? cooldown,
  }) {
    return codeSentSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(CodeSentSuccess value)? codeSentSuccess,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    TResult Function(Cooldown value)? cooldown,
    required TResult orElse(),
  }) {
    if (codeSentSuccess != null) {
      return codeSentSuccess(this);
    }
    return orElse();
  }
}

abstract class CodeSentSuccess implements PasswordResetState {
  const factory CodeSentSuccess({
    required final String message,
    required final String email,
  }) = _$CodeSentSuccessImpl;

  String get message;
  String get email;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeSentSuccessImplCopyWith<_$CodeSentSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$PasswordResetStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetState
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
    return 'PasswordResetState.success(message: $message)';
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

  /// Create a copy of PasswordResetState
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
    required TResult Function(String message, String email) codeSentSuccess,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds, String cooldownEmail)
    cooldown,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, String email)? codeSentSuccess,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds, String cooldownEmail)? cooldown,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, String email)? codeSentSuccess,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds, String cooldownEmail)? cooldown,
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
    required TResult Function(CodeSentSuccess value) codeSentSuccess,
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
    TResult? Function(CodeSentSuccess value)? codeSentSuccess,
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
    TResult Function(CodeSentSuccess value)? codeSentSuccess,
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

abstract class Success implements PasswordResetState {
  const factory Success({required final String message}) = _$SuccessImpl;

  String get message;

  /// Create a copy of PasswordResetState
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
    extends _$PasswordResetStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetState
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
    return 'PasswordResetState.error(message: $message)';
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

  /// Create a copy of PasswordResetState
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
    required TResult Function(String message, String email) codeSentSuccess,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds, String cooldownEmail)
    cooldown,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, String email)? codeSentSuccess,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds, String cooldownEmail)? cooldown,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, String email)? codeSentSuccess,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds, String cooldownEmail)? cooldown,
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
    required TResult Function(CodeSentSuccess value) codeSentSuccess,
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
    TResult? Function(CodeSentSuccess value)? codeSentSuccess,
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
    TResult Function(CodeSentSuccess value)? codeSentSuccess,
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

abstract class Error implements PasswordResetState {
  const factory Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of PasswordResetState
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
  $Res call({int remainingSeconds, String cooldownEmail});
}

/// @nodoc
class __$$CooldownImplCopyWithImpl<$Res>
    extends _$PasswordResetStateCopyWithImpl<$Res, _$CooldownImpl>
    implements _$$CooldownImplCopyWith<$Res> {
  __$$CooldownImplCopyWithImpl(
    _$CooldownImpl _value,
    $Res Function(_$CooldownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remainingSeconds = null, Object? cooldownEmail = null}) {
    return _then(
      _$CooldownImpl(
        remainingSeconds: null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        cooldownEmail: null == cooldownEmail
            ? _value.cooldownEmail
            : cooldownEmail // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CooldownImpl implements Cooldown {
  const _$CooldownImpl({
    required this.remainingSeconds,
    required this.cooldownEmail,
  });

  @override
  final int remainingSeconds;
  @override
  final String cooldownEmail;

  @override
  String toString() {
    return 'PasswordResetState.cooldown(remainingSeconds: $remainingSeconds, cooldownEmail: $cooldownEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CooldownImpl &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.cooldownEmail, cooldownEmail) ||
                other.cooldownEmail == cooldownEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remainingSeconds, cooldownEmail);

  /// Create a copy of PasswordResetState
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
    required TResult Function(String message, String email) codeSentSuccess,
    required TResult Function(String message) success,
    required TResult Function(String message) error,
    required TResult Function(int remainingSeconds, String cooldownEmail)
    cooldown,
  }) {
    return cooldown(remainingSeconds, cooldownEmail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, String email)? codeSentSuccess,
    TResult? Function(String message)? success,
    TResult? Function(String message)? error,
    TResult? Function(int remainingSeconds, String cooldownEmail)? cooldown,
  }) {
    return cooldown?.call(remainingSeconds, cooldownEmail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, String email)? codeSentSuccess,
    TResult Function(String message)? success,
    TResult Function(String message)? error,
    TResult Function(int remainingSeconds, String cooldownEmail)? cooldown,
    required TResult orElse(),
  }) {
    if (cooldown != null) {
      return cooldown(remainingSeconds, cooldownEmail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(CodeSentSuccess value) codeSentSuccess,
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
    TResult? Function(CodeSentSuccess value)? codeSentSuccess,
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
    TResult Function(CodeSentSuccess value)? codeSentSuccess,
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

abstract class Cooldown implements PasswordResetState {
  const factory Cooldown({
    required final int remainingSeconds,
    required final String cooldownEmail,
  }) = _$CooldownImpl;

  int get remainingSeconds;
  String get cooldownEmail;

  /// Create a copy of PasswordResetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CooldownImplCopyWith<_$CooldownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
