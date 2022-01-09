import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/common.dart';
import 'package:breaking_bad/logic/cubit/characters_cubit.dart';

void main() {
  runApp(BreakingBadApp(appRouter: AppRouter()));
}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;

  const BreakingBadApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersCubit>(
          create: (context) => CharactersCubit(
            charactersRepo: CharactersRepo(
              characterServices: CharacterServices(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Breaking Bad',
        debugShowCheckedModeBanner: false,
        darkTheme: AppUi.themes.darkTheme,
        theme: AppUi.themes.lightTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
