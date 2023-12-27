// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_logic_holder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventsLogicHolder on _EventsLogicHolderBase, Store {
  late final _$isEventDetailsLoadingAtom = Atom(
      name: '_EventsLogicHolderBase.isEventDetailsLoading', context: context);

  @override
  bool get isEventDetailsLoading {
    _$isEventDetailsLoadingAtom.reportRead();
    return super.isEventDetailsLoading;
  }

  @override
  set isEventDetailsLoading(bool value) {
    _$isEventDetailsLoadingAtom.reportWrite(value, super.isEventDetailsLoading,
        () {
      super.isEventDetailsLoading = value;
    });
  }

  @override
  String toString() {
    return '''
isEventDetailsLoading: ${isEventDetailsLoading}
    ''';
  }
}
