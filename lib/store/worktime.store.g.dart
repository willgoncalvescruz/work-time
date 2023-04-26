// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worktime.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkTimeStore on _WorkTimeStore, Store {
  late final _$iniciadoAtom =
      Atom(name: '_WorkTimeStore.iniciado', context: context);

  @override
  bool get iniciado {
    _$iniciadoAtom.reportRead();
    return super.iniciado;
  }

  @override
  set iniciado(bool value) {
    _$iniciadoAtom.reportWrite(value, super.iniciado, () {
      super.iniciado = value;
    });
  }

  late final _$minutosAtom =
      Atom(name: '_WorkTimeStore.minutos', context: context);

  @override
  int get minutos {
    _$minutosAtom.reportRead();
    return super.minutos;
  }

  @override
  set minutos(int value) {
    _$minutosAtom.reportWrite(value, super.minutos, () {
      super.minutos = value;
    });
  }

  late final _$segundosAtom =
      Atom(name: '_WorkTimeStore.segundos', context: context);

  @override
  int get segundos {
    _$segundosAtom.reportRead();
    return super.segundos;
  }

  @override
  set segundos(int value) {
    _$segundosAtom.reportWrite(value, super.segundos, () {
      super.segundos = value;
    });
  }

  late final _$tempoTrabalhoAtom =
      Atom(name: '_WorkTimeStore.tempoTrabalho', context: context);

  @override
  int get tempoTrabalho {
    _$tempoTrabalhoAtom.reportRead();
    return super.tempoTrabalho;
  }

  @override
  set tempoTrabalho(int value) {
    _$tempoTrabalhoAtom.reportWrite(value, super.tempoTrabalho, () {
      super.tempoTrabalho = value;
    });
  }

  late final _$tempoDescansoAtom =
      Atom(name: '_WorkTimeStore.tempoDescanso', context: context);

  @override
  int get tempoDescanso {
    _$tempoDescansoAtom.reportRead();
    return super.tempoDescanso;
  }

  @override
  set tempoDescanso(int value) {
    _$tempoDescansoAtom.reportWrite(value, super.tempoDescanso, () {
      super.tempoDescanso = value;
    });
  }

  late final _$tipoIntervaloAtom =
      Atom(name: '_WorkTimeStore.tipoIntervalo', context: context);

  @override
  TipoIntervalo get tipoIntervalo {
    _$tipoIntervaloAtom.reportRead();
    return super.tipoIntervalo;
  }

  @override
  set tipoIntervalo(TipoIntervalo value) {
    _$tipoIntervaloAtom.reportWrite(value, super.tipoIntervalo, () {
      super.tipoIntervalo = value;
    });
  }

  late final _$_WorkTimeStoreActionController =
      ActionController(name: '_WorkTimeStore', context: context);

  @override
  void iniciar() {
    final _$actionInfo = _$_WorkTimeStoreActionController.startAction(
        name: '_WorkTimeStore.iniciar');
    try {
      return super.iniciar();
    } finally {
      _$_WorkTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void parar() {
    final _$actionInfo = _$_WorkTimeStoreActionController.startAction(
        name: '_WorkTimeStore.parar');
    try {
      return super.parar();
    } finally {
      _$_WorkTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reiniciar() {
    final _$actionInfo = _$_WorkTimeStoreActionController.startAction(
        name: '_WorkTimeStore.reiniciar');
    try {
      return super.reiniciar();
    } finally {
      _$_WorkTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementarTempoTrabalho() {
    final _$actionInfo = _$_WorkTimeStoreActionController.startAction(
        name: '_WorkTimeStore.incrementarTempoTrabalho');
    try {
      return super.incrementarTempoTrabalho();
    } finally {
      _$_WorkTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementarTempoTrabalho() {
    final _$actionInfo = _$_WorkTimeStoreActionController.startAction(
        name: '_WorkTimeStore.decrementarTempoTrabalho');
    try {
      return super.decrementarTempoTrabalho();
    } finally {
      _$_WorkTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementarTempoDescanso() {
    final _$actionInfo = _$_WorkTimeStoreActionController.startAction(
        name: '_WorkTimeStore.incrementarTempoDescanso');
    try {
      return super.incrementarTempoDescanso();
    } finally {
      _$_WorkTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementarTempoDescanso() {
    final _$actionInfo = _$_WorkTimeStoreActionController.startAction(
        name: '_WorkTimeStore.decrementarTempoDescanso');
    try {
      return super.decrementarTempoDescanso();
    } finally {
      _$_WorkTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
iniciado: ${iniciado},
minutos: ${minutos},
segundos: ${segundos},
tempoTrabalho: ${tempoTrabalho},
tempoDescanso: ${tempoDescanso},
tipoIntervalo: ${tipoIntervalo}
    ''';
  }
}
