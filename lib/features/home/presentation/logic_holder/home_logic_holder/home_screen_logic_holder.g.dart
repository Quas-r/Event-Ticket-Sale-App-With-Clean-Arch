// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_logic_holder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenLogicHolder on _HomeScreenLogicHolderBase, Store {
  late final _$isEventsLoadingAtom = Atom(
      name: '_HomeScreenLogicHolderBase.isEventsLoading', context: context);

  @override
  bool get isEventsLoading {
    _$isEventsLoadingAtom.reportRead();
    return super.isEventsLoading;
  }

  @override
  set isEventsLoading(bool value) {
    _$isEventsLoadingAtom.reportWrite(value, super.isEventsLoading, () {
      super.isEventsLoading = value;
    });
  }

  late final _$isEventsLoading2Atom = Atom(
      name: '_HomeScreenLogicHolderBase.isEventsLoading2', context: context);

  @override
  bool get isEventsLoading2 {
    _$isEventsLoading2Atom.reportRead();
    return super.isEventsLoading2;
  }

  @override
  set isEventsLoading2(bool value) {
    _$isEventsLoading2Atom.reportWrite(value, super.isEventsLoading2, () {
      super.isEventsLoading2 = value;
    });
  }

  late final _$isEventDatesLoadingAtom = Atom(
      name: '_HomeScreenLogicHolderBase.isEventDatesLoading', context: context);

  @override
  bool get isEventDatesLoading {
    _$isEventDatesLoadingAtom.reportRead();
    return super.isEventDatesLoading;
  }

  @override
  set isEventDatesLoading(bool value) {
    _$isEventDatesLoadingAtom.reportWrite(value, super.isEventDatesLoading, () {
      super.isEventDatesLoading = value;
    });
  }

  @override
  String toString() {
    return '''
isEventsLoading: ${isEventsLoading},
isEventsLoading2: ${isEventsLoading2},
isEventDatesLoading: ${isEventDatesLoading}
    ''';
  }
}
