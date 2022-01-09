import 'package:breaking_bad/common.dart';
import 'package:breaking_bad/logic/cubit/characters_cubit.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharacterModel> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget gridViewBody() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (ctx, index) {
        final character = allCharacters[index];
        return Container(
          width: double.infinity,
          margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          padding: const EdgeInsetsDirectional.all(4),
          decoration: BoxDecoration(
            color: AppUi.colors.appWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              characterDetailsScreen,
              arguments: character,
            ),
            child: GridTile(
              child: Hero(
                tag: character.charId,
                child: Container(
                  color: AppUi.colors.appGrey,
                  child: character.image.isNotEmpty
                      ? Image.network(
                          character.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(AppUi.assets.logo),
                ),
              ),
              footer: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                child: TextWidget(
                  character.name,
                  fontSize: 16,
                  color: AppUi.colors.appWhite,
                  fontWeight: FontWeight.bold,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUi.colors.appLightYellow,
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget('Characters'),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Column(
              children: [
                AppUi.shared.h10,
                CardSwiperWidget(
                  images: [
                    AppUi.assets.banner1,
                    AppUi.assets.banner2,
                    AppUi.assets.banner3,
                    AppUi.assets.banner4,
                    AppUi.assets.banner5,
                  ],
                ),
                AppUi.shared.h10,
                AppUi.shared.h10,
                Expanded(
                  child: BlocBuilder<CharactersCubit, CharactersState>(
                    builder: (context, state) {
                      if (state is CharactersLoaded) {
                        allCharacters = (state).characters;
                        return gridViewBody();
                      } else {
                        return const CircularProgressIndicatorWidget();
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return const NoInternet();
          }
        },
        child: const CircularProgressIndicatorWidget(),
      ),
    );
  }
}
