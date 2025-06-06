// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtc.code.list.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DtcCodeListController on DtcCodeListControllerBase, Store {
  Computed<List<DtcCode>>? _$listFilteredComputed;

  @override
  List<DtcCode> get listFiltered =>
      (_$listFilteredComputed ??= Computed<List<DtcCode>>(
        () => super.listFiltered,
        name: 'DtcCodeListControllerBase.listFiltered',
      )).value;

  late final _$codeCtrlAtom = Atom(
    name: 'DtcCodeListControllerBase.codeCtrl',
    context: context,
  );

  @override
  TextEditingController get codeCtrl {
    _$codeCtrlAtom.reportRead();
    return super.codeCtrl;
  }

  @override
  set codeCtrl(TextEditingController value) {
    _$codeCtrlAtom.reportWrite(value, super.codeCtrl, () {
      super.codeCtrl = value;
    });
  }

  late final _$isHidedButtonAtom = Atom(
    name: 'DtcCodeListControllerBase.isHidedButton',
    context: context,
  );

  @override
  bool get isHidedButton {
    _$isHidedButtonAtom.reportRead();
    return super.isHidedButton;
  }

  @override
  set isHidedButton(bool value) {
    _$isHidedButtonAtom.reportWrite(value, super.isHidedButton, () {
      super.isHidedButton = value;
    });
  }

  late final _$codesAtom = Atom(
    name: 'DtcCodeListControllerBase.codes',
    context: context,
  );

  @override
  ObservableList<dynamic> get codes {
    _$codesAtom.reportRead();
    return super.codes;
  }

  @override
  set codes(ObservableList<dynamic> value) {
    _$codesAtom.reportWrite(value, super.codes, () {
      super.codes = value;
    });
  }

  late final _$_dtcCodeRepoAtom = Atom(
    name: 'DtcCodeListControllerBase._dtcCodeRepo',
    context: context,
  );

  @override
  DtcCodeRepo get _dtcCodeRepo {
    _$_dtcCodeRepoAtom.reportRead();
    return super._dtcCodeRepo;
  }

  @override
  set _dtcCodeRepo(DtcCodeRepo value) {
    _$_dtcCodeRepoAtom.reportWrite(value, super._dtcCodeRepo, () {
      super._dtcCodeRepo = value;
    });
  }

  late final _$futureAtom = Atom(
    name: 'DtcCodeListControllerBase.future',
    context: context,
  );

  @override
  Future<List<DtcCode>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<DtcCode>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$filterAtom = Atom(
    name: 'DtcCodeListControllerBase.filter',
    context: context,
  );

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$DtcCodeListControllerBaseActionController = ActionController(
    name: 'DtcCodeListControllerBase',
    context: context,
  );

  @override
  bool setButtonVisibilty() {
    final _$actionInfo = _$DtcCodeListControllerBaseActionController
        .startAction(name: 'DtcCodeListControllerBase.setButtonVisibilty');
    try {
      return super.setButtonVisibilty();
    } finally {
      _$DtcCodeListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<DtcCode>> findAll() {
    final _$actionInfo = _$DtcCodeListControllerBaseActionController
        .startAction(name: 'DtcCodeListControllerBase.findAll');
    try {
      return super.findAll();
    } finally {
      _$DtcCodeListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$DtcCodeListControllerBaseActionController
        .startAction(name: 'DtcCodeListControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$DtcCodeListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
codeCtrl: ${codeCtrl},
isHidedButton: ${isHidedButton},
codes: ${codes},
future: ${future},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
