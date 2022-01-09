import 'package:breaking_bad/common.dart';
import 'package:breaking_bad/logic/cubit/characters_cubit.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(
      characterServices: CharacterServices(),
    );
    charactersCubit = CharactersCubit(charactersRepo: charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case charactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const CharacterDetails(),
        );
    }
  }
}
