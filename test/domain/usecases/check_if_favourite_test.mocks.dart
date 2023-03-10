// Mocks generated by Mockito 5.2.0 from annotations
// in pokedex/test/domain/usecases/check_if_favourite_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokemon/domain/entities/pokemon_detail_entity.dart' as _i3;
import 'package:pokemon/domain/entities/pokemon_response_entity.dart' as _i2;
import 'package:pokemon/domain/repositories/pokemon_repository.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakePokemonResponseEntity_0 extends _i1.Fake
    implements _i2.PokemonResponseEntity {}

class _FakePokemonDetailEntity_1 extends _i1.Fake
    implements _i3.PokemonDetailEntity {}

/// A class which mocks [PokemonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonRepository extends _i1.Mock implements _i4.PokemonRepository {
  MockPokemonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.PokemonResponseEntity> getPokemons(String? url) =>
      (super.noSuchMethod(Invocation.method(#getPokemons, [url]),
              returnValue: Future<_i2.PokemonResponseEntity>.value(
                  _FakePokemonResponseEntity_0()))
          as _i5.Future<_i2.PokemonResponseEntity>);
  @override
  _i5.Future<_i3.PokemonDetailEntity> getPokemonByName(String? name) =>
      (super.noSuchMethod(Invocation.method(#getPokemonByName, [name]),
              returnValue: Future<_i3.PokemonDetailEntity>.value(
                  _FakePokemonDetailEntity_1()))
          as _i5.Future<_i3.PokemonDetailEntity>);
  @override
  List<String> fetchFavourites() =>
      (super.noSuchMethod(Invocation.method(#fetchFavourites, []),
          returnValue: <String>[]) as List<String>);
  @override
  bool checkIfFavourite(String? id) =>
      (super.noSuchMethod(Invocation.method(#checkIfFavourite, [id]),
          returnValue: false) as bool);
  @override
  _i5.Future<bool> saveToFavouritesList(String? id) =>
      (super.noSuchMethod(Invocation.method(#saveToFavouritesList, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<bool> removeFromFavourites(String? id) =>
      (super.noSuchMethod(Invocation.method(#removeFromFavourites, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}
