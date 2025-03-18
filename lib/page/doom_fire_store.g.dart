// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doom_fire_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DoomFireStore on _DoomFireStoreBase, Store {
  late final _$canvaSizeAtom =
      Atom(name: '_DoomFireStoreBase.canvaSize', context: context);

  @override
  int get canvaSize {
    _$canvaSizeAtom.reportRead();
    return super.canvaSize;
  }

  @override
  set canvaSize(int value) {
    _$canvaSizeAtom.reportWrite(value, super.canvaSize, () {
      super.canvaSize = value;
    });
  }

  late final _$fireForceAtom =
      Atom(name: '_DoomFireStoreBase.fireForce', context: context);

  @override
  int get fireForce {
    _$fireForceAtom.reportRead();
    return super.fireForce;
  }

  @override
  set fireForce(int value) {
    _$fireForceAtom.reportWrite(value, super.fireForce, () {
      super.fireForce = value;
    });
  }

  late final _$fireSpeedAtom =
      Atom(name: '_DoomFireStoreBase.fireSpeed', context: context);

  @override
  int get fireSpeed {
    _$fireSpeedAtom.reportRead();
    return super.fireSpeed;
  }

  @override
  set fireSpeed(int value) {
    _$fireSpeedAtom.reportWrite(value, super.fireSpeed, () {
      super.fireSpeed = value;
    });
  }

  late final _$startFireAtom =
      Atom(name: '_DoomFireStoreBase.startFire', context: context);

  @override
  bool get startFire {
    _$startFireAtom.reportRead();
    return super.startFire;
  }

  @override
  set startFire(bool value) {
    _$startFireAtom.reportWrite(value, super.startFire, () {
      super.startFire = value;
    });
  }

  late final _$_DoomFireStoreBaseActionController =
      ActionController(name: '_DoomFireStoreBase', context: context);

  @override
  void setStartFire() {
    final _$actionInfo = _$_DoomFireStoreBaseActionController.startAction(
        name: '_DoomFireStoreBase.setStartFire');
    try {
      return super.setStartFire();
    } finally {
      _$_DoomFireStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFireForce({required int value}) {
    final _$actionInfo = _$_DoomFireStoreBaseActionController.startAction(
        name: '_DoomFireStoreBase.setFireForce');
    try {
      return super.setFireForce(value: value);
    } finally {
      _$_DoomFireStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFireSpeed({required int value}) {
    final _$actionInfo = _$_DoomFireStoreBaseActionController.startAction(
        name: '_DoomFireStoreBase.setFireSpeed');
    try {
      return super.setFireSpeed(value: value);
    } finally {
      _$_DoomFireStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCanvaSize({required int value}) {
    final _$actionInfo = _$_DoomFireStoreBaseActionController.startAction(
        name: '_DoomFireStoreBase.setCanvaSize');
    try {
      return super.setCanvaSize(value: value);
    } finally {
      _$_DoomFireStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createFireDataStructure() {
    final _$actionInfo = _$_DoomFireStoreBaseActionController.startAction(
        name: '_DoomFireStoreBase.createFireDataStructure');
    try {
      return super.createFireDataStructure();
    } finally {
      _$_DoomFireStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createFireSource() {
    final _$actionInfo = _$_DoomFireStoreBaseActionController.startAction(
        name: '_DoomFireStoreBase.createFireSource');
    try {
      return super.createFireSource();
    } finally {
      _$_DoomFireStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateFireIntensityOfPixel(dynamic currentPixelIndex) {
    final _$actionInfo = _$_DoomFireStoreBaseActionController.startAction(
        name: '_DoomFireStoreBase.calculateFireIntensityOfPixel');
    try {
      return super.calculateFireIntensityOfPixel(currentPixelIndex);
    } finally {
      _$_DoomFireStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
canvaSize: ${canvaSize},
fireForce: ${fireForce},
fireSpeed: ${fireSpeed},
startFire: ${startFire}
    ''';
  }
}
