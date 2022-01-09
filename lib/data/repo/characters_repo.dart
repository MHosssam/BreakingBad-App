import 'package:breaking_bad/common.dart';

class CharactersRepo {
  final CharacterServices characterServices;

  CharactersRepo({required this.characterServices});

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await characterServices.getAllCharacters();
    final value = characters
        .map((character) => CharacterModel.fromJson(character))
        .toList();
    return value;
  }

  Future<List<QuoteModel>> getCharacterQuotes(String charName) async {
    final qoutes = await characterServices.getCharacterQuotes(charName);
    final value =
        qoutes.map((charQuotes) => QuoteModel.fromJson(charQuotes)).toList();
    return value;
  }

  Future<List<DeathModel>> getCharacterDeath(String charName) async {
    final death = await characterServices.getCharacterDeath(charName);
    final value =
        death.map((chardeath) => DeathModel.fromJson(chardeath)).toList();
    return value;
  }
}
