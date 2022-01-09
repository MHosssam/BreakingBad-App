import 'package:breaking_bad/common.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<CharacterModel> characters = [];

  CharactersCubit({required this.charactersRepo}) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });
    return characters;
  }
}
