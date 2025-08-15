// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawer_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DrawerMenuState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DrawerMenuState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DrawerMenuState<$T>()';
}


}

/// @nodoc
class $DrawerMenuStateCopyWith<T,$Res>  {
$DrawerMenuStateCopyWith(DrawerMenuState<T> _, $Res Function(DrawerMenuState<T>) __);
}


/// Adds pattern-matching-related methods to [DrawerMenuState].
extension DrawerMenuStatePatterns<T> on DrawerMenuState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( _Open<T> value)?  open,TResult Function( _Close<T> value)?  close,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Open() when open != null:
return open(_that);case _Close() when close != null:
return close(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( _Open<T> value)  open,required TResult Function( _Close<T> value)  close,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Open():
return open(_that);case _Close():
return close(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( _Open<T> value)?  open,TResult? Function( _Close<T> value)?  close,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Open() when open != null:
return open(_that);case _Close() when close != null:
return close(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  open,TResult Function()?  close,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Open() when open != null:
return open();case _Close() when close != null:
return close();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  open,required TResult Function()  close,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Open():
return open();case _Close():
return close();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  open,TResult? Function()?  close,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Open() when open != null:
return open();case _Close() when close != null:
return close();case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements DrawerMenuState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DrawerMenuState<$T>.initial()';
}


}




/// @nodoc


class _Open<T> implements DrawerMenuState<T> {
  const _Open();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Open<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DrawerMenuState<$T>.open()';
}


}




/// @nodoc


class _Close<T> implements DrawerMenuState<T> {
  const _Close();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Close<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DrawerMenuState<$T>.close()';
}


}




// dart format on
