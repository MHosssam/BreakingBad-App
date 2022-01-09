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
}
