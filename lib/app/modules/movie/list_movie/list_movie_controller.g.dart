// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movie_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListMovieController = BindInject(
  (i) => ListMovieController(i<IMovieRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListMovieController on _ListMovieControllerBase, Store {
  final _$loadingAtom = Atom(name: '_ListMovieControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$inResearchAtom = Atom(name: '_ListMovieControllerBase.inResearch');

  @override
  bool get inResearch {
    _$inResearchAtom.reportRead();
    return super.inResearch;
  }

  @override
  set inResearch(bool value) {
    _$inResearchAtom.reportWrite(value, super.inResearch, () {
      super.inResearch = value;
    });
  }

  final _$queryAtom = Atom(name: '_ListMovieControllerBase.query');

  @override
  String get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
  }

  final _$typeAtom = Atom(name: '_ListMovieControllerBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$paginatorAtom = Atom(name: '_ListMovieControllerBase.paginator');

  @override
  Paginator<Movie> get paginator {
    _$paginatorAtom.reportRead();
    return super.paginator;
  }

  @override
  set paginator(Paginator<Movie> value) {
    _$paginatorAtom.reportWrite(value, super.paginator, () {
      super.paginator = value;
    });
  }

  final _$findAsyncAction = AsyncAction('_ListMovieControllerBase.find');

  @override
  Future find() {
    return _$findAsyncAction.run(() => super.find());
  }

  final _$_ListMovieControllerBaseActionController =
      ActionController(name: '_ListMovieControllerBase');

  @override
  dynamic setTypeMovie(String type) {
    final _$actionInfo = _$_ListMovieControllerBaseActionController.startAction(
        name: '_ListMovieControllerBase.setTypeMovie');
    try {
      return super.setTypeMovie(type);
    } finally {
      _$_ListMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInResearch(bool inResearch) {
    final _$actionInfo = _$_ListMovieControllerBaseActionController.startAction(
        name: '_ListMovieControllerBase.setInResearch');
    try {
      return super.setInResearch(inResearch);
    } finally {
      _$_ListMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuery(String query) {
    final _$actionInfo = _$_ListMovieControllerBaseActionController.startAction(
        name: '_ListMovieControllerBase.setQuery');
    try {
      return super.setQuery(query);
    } finally {
      _$_ListMovieControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
inResearch: ${inResearch},
query: ${query},
type: ${type},
paginator: ${paginator}
    ''';
  }
}
