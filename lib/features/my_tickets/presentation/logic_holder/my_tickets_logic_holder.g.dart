// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_tickets_logic_holder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyTicketsLogicHolder on _MyTicketsLogicHolderBase, Store {
  late final _$isMyTicketsLoadingAtom = Atom(
      name: '_MyTicketsLogicHolderBase.isMyTicketsLoading', context: context);

  @override
  bool get isMyTicketsLoading {
    _$isMyTicketsLoadingAtom.reportRead();
    return super.isMyTicketsLoading;
  }

  @override
  set isMyTicketsLoading(bool value) {
    _$isMyTicketsLoadingAtom.reportWrite(value, super.isMyTicketsLoading, () {
      super.isMyTicketsLoading = value;
    });
  }

  @override
  String toString() {
    return '''
isMyTicketsLoading: ${isMyTicketsLoading}
    ''';
  }
}
