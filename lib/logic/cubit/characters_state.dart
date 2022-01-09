part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characters;

  CharactersLoaded({required this.characters});
}

class QuotesLoaded extends CharactersState {
  final List<QuoteModel> quotes;

  QuotesLoaded(this.quotes);
}

class DeathLoaded extends CharactersState {
  final List<DeathModel> death;

  DeathLoaded(this.death);
}
