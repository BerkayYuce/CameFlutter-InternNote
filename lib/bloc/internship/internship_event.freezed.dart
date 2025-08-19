// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internship_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$InternshipEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEntries,
    required TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )
    addEntry,
    required TResult Function(String id) deleteEntry,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEntries,
    TResult? Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult? Function(String id)? deleteEntry,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEntries,
    TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult Function(String id)? deleteEntry,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEntries value) fetchEntries,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(DeleteEntry value) deleteEntry,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEntries value)? fetchEntries,
    TResult? Function(AddEntry value)? addEntry,
    TResult? Function(DeleteEntry value)? deleteEntry,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEntries value)? fetchEntries,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(DeleteEntry value)? deleteEntry,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternshipEventCopyWith<$Res> {
  factory $InternshipEventCopyWith(
    InternshipEvent value,
    $Res Function(InternshipEvent) then,
  ) = _$InternshipEventCopyWithImpl<$Res, InternshipEvent>;
}

/// @nodoc
class _$InternshipEventCopyWithImpl<$Res, $Val extends InternshipEvent>
    implements $InternshipEventCopyWith<$Res> {
  _$InternshipEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchEntriesImplCopyWith<$Res> {
  factory _$$FetchEntriesImplCopyWith(
    _$FetchEntriesImpl value,
    $Res Function(_$FetchEntriesImpl) then,
  ) = __$$FetchEntriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchEntriesImplCopyWithImpl<$Res>
    extends _$InternshipEventCopyWithImpl<$Res, _$FetchEntriesImpl>
    implements _$$FetchEntriesImplCopyWith<$Res> {
  __$$FetchEntriesImplCopyWithImpl(
    _$FetchEntriesImpl _value,
    $Res Function(_$FetchEntriesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchEntriesImpl implements FetchEntries {
  const _$FetchEntriesImpl();

  @override
  String toString() {
    return 'InternshipEvent.fetchEntries()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchEntriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEntries,
    required TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )
    addEntry,
    required TResult Function(String id) deleteEntry,
  }) {
    return fetchEntries();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEntries,
    TResult? Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult? Function(String id)? deleteEntry,
  }) {
    return fetchEntries?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEntries,
    TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult Function(String id)? deleteEntry,
    required TResult orElse(),
  }) {
    if (fetchEntries != null) {
      return fetchEntries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEntries value) fetchEntries,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(DeleteEntry value) deleteEntry,
  }) {
    return fetchEntries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEntries value)? fetchEntries,
    TResult? Function(AddEntry value)? addEntry,
    TResult? Function(DeleteEntry value)? deleteEntry,
  }) {
    return fetchEntries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEntries value)? fetchEntries,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(DeleteEntry value)? deleteEntry,
    required TResult orElse(),
  }) {
    if (fetchEntries != null) {
      return fetchEntries(this);
    }
    return orElse();
  }
}

abstract class FetchEntries implements InternshipEvent {
  const factory FetchEntries() = _$FetchEntriesImpl;
}

/// @nodoc
abstract class _$$AddEntryImplCopyWith<$Res> {
  factory _$$AddEntryImplCopyWith(
    _$AddEntryImpl value,
    $Res Function(_$AddEntryImpl) then,
  ) = __$$AddEntryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, String description, int hours, DateTime date});
}

/// @nodoc
class __$$AddEntryImplCopyWithImpl<$Res>
    extends _$InternshipEventCopyWithImpl<$Res, _$AddEntryImpl>
    implements _$$AddEntryImplCopyWith<$Res> {
  __$$AddEntryImplCopyWithImpl(
    _$AddEntryImpl _value,
    $Res Function(_$AddEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? hours = null,
    Object? date = null,
  }) {
    return _then(
      _$AddEntryImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        hours: null == hours
            ? _value.hours
            : hours // ignore: cast_nullable_to_non_nullable
                  as int,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$AddEntryImpl implements AddEntry {
  const _$AddEntryImpl({
    required this.title,
    required this.description,
    required this.hours,
    required this.date,
  });

  @override
  final String title;
  @override
  final String description;
  @override
  final int hours;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'InternshipEvent.addEntry(title: $title, description: $description, hours: $hours, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddEntryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, hours, date);

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddEntryImplCopyWith<_$AddEntryImpl> get copyWith =>
      __$$AddEntryImplCopyWithImpl<_$AddEntryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEntries,
    required TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )
    addEntry,
    required TResult Function(String id) deleteEntry,
  }) {
    return addEntry(title, description, hours, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEntries,
    TResult? Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult? Function(String id)? deleteEntry,
  }) {
    return addEntry?.call(title, description, hours, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEntries,
    TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult Function(String id)? deleteEntry,
    required TResult orElse(),
  }) {
    if (addEntry != null) {
      return addEntry(title, description, hours, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEntries value) fetchEntries,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(DeleteEntry value) deleteEntry,
  }) {
    return addEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEntries value)? fetchEntries,
    TResult? Function(AddEntry value)? addEntry,
    TResult? Function(DeleteEntry value)? deleteEntry,
  }) {
    return addEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEntries value)? fetchEntries,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(DeleteEntry value)? deleteEntry,
    required TResult orElse(),
  }) {
    if (addEntry != null) {
      return addEntry(this);
    }
    return orElse();
  }
}

abstract class AddEntry implements InternshipEvent {
  const factory AddEntry({
    required final String title,
    required final String description,
    required final int hours,
    required final DateTime date,
  }) = _$AddEntryImpl;

  String get title;
  String get description;
  int get hours;
  DateTime get date;

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddEntryImplCopyWith<_$AddEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteEntryImplCopyWith<$Res> {
  factory _$$DeleteEntryImplCopyWith(
    _$DeleteEntryImpl value,
    $Res Function(_$DeleteEntryImpl) then,
  ) = __$$DeleteEntryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteEntryImplCopyWithImpl<$Res>
    extends _$InternshipEventCopyWithImpl<$Res, _$DeleteEntryImpl>
    implements _$$DeleteEntryImplCopyWith<$Res> {
  __$$DeleteEntryImplCopyWithImpl(
    _$DeleteEntryImpl _value,
    $Res Function(_$DeleteEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$DeleteEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteEntryImpl implements DeleteEntry {
  const _$DeleteEntryImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'InternshipEvent.deleteEntry(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteEntryImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteEntryImplCopyWith<_$DeleteEntryImpl> get copyWith =>
      __$$DeleteEntryImplCopyWithImpl<_$DeleteEntryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchEntries,
    required TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )
    addEntry,
    required TResult Function(String id) deleteEntry,
  }) {
    return deleteEntry(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchEntries,
    TResult? Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult? Function(String id)? deleteEntry,
  }) {
    return deleteEntry?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchEntries,
    TResult Function(
      String title,
      String description,
      int hours,
      DateTime date,
    )?
    addEntry,
    TResult Function(String id)? deleteEntry,
    required TResult orElse(),
  }) {
    if (deleteEntry != null) {
      return deleteEntry(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchEntries value) fetchEntries,
    required TResult Function(AddEntry value) addEntry,
    required TResult Function(DeleteEntry value) deleteEntry,
  }) {
    return deleteEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchEntries value)? fetchEntries,
    TResult? Function(AddEntry value)? addEntry,
    TResult? Function(DeleteEntry value)? deleteEntry,
  }) {
    return deleteEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchEntries value)? fetchEntries,
    TResult Function(AddEntry value)? addEntry,
    TResult Function(DeleteEntry value)? deleteEntry,
    required TResult orElse(),
  }) {
    if (deleteEntry != null) {
      return deleteEntry(this);
    }
    return orElse();
  }
}

abstract class DeleteEntry implements InternshipEvent {
  const factory DeleteEntry({required final String id}) = _$DeleteEntryImpl;

  String get id;

  /// Create a copy of InternshipEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteEntryImplCopyWith<_$DeleteEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
