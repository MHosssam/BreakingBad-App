import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/common.dart';
import 'package:breaking_bad/logic/cubit/characters_cubit.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetails({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context)
        .getCharacterQuotes(character.name);
    // BlocProvider.of<CharactersCubit>(context).getCharacterDeath(character.name);
    return Scaffold(
      backgroundColor: AppUi.colors.appLightYellow,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            stretch: true,
            backgroundColor: AppUi.colors.appGrey,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: TextWidget(
                character.nickName,
                color: AppUi.colors.appWhite,
              ),
              background: Hero(
                tag: character.charId,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<CharactersCubit, CharactersState>(
                    builder: (context, state) {
                      if (state is QuotesLoaded) {
                        var quotes = (state).quotes;
                        if (quotes.isNotEmpty) {
                          return DefaultTextStyle(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppUi.colors.appBlack,
                              shadows: [
                                Shadow(
                                  blurRadius: 7,
                                  color: AppUi.colors.appGrey,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              repeatForever: true,
                              animatedTexts: [
                                TyperAnimatedText(
                                  quotes[0].quote,
                                  speed: const Duration(milliseconds: 120),
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppUi.colors.appGreen,
                          ),
                        );
                      }
                    },
                  ),
                  AppUi.shared.h10,
                  TextRich(
                    title: 'Job : ',
                    value: character.jobs.join(' / '),
                  ),
                  const DividerWidget(endIndent: 315),
                  TextRich(
                    title: 'Appeared in : ',
                    value: character.categoryForTwoSeries,
                  ),
                  const DividerWidget(endIndent: 250),
                  TextRich(
                    title: 'Seasons : ',
                    value: character.appearanceOfSeasons.join(' / '),
                  ),
                  const DividerWidget(endIndent: 280),
                  TextRich(
                    title: 'Status : ',
                    value: character.statusIfDeadOrAlive,
                  ),
                  const DividerWidget(endIndent: 300),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : TextRich(
                          title: 'Better Call Saul Seasons : ',
                          value: character.betterCallSaulAppearance.join(" / "),
                        ),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : const DividerWidget(endIndent: 150),
                  TextRich(
                    title: 'Actor/Actress : ',
                    value: character.acotrName,
                  ),
                  const DividerWidget(endIndent: 235),
                  AppUi.shared.h10,
                  // BlocBuilder<CharactersCubit, CharactersState>(
                  //   builder: (context, state) {
                  //     if (state is DeathLoaded) {
                  //       var death = (state).death;
                  //       return Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           TextRich(
                  //             title: 'Death Cause : ',
                  //             value: death[0].cause,
                  //           ),
                  //           const DividerWidget(endIndent: 235),
                  //           TextRich(
                  //             title: 'Last Words : ',
                  //             value: death[0].lastWords,
                  //           ),
                  //           const DividerWidget(endIndent: 250),
                  //           TextRich(
                  //             title: 'Number Of Death : ',
                  //             value: death[0].numberOfDeaths.toString(),
                  //           ),
                  //           const DividerWidget(endIndent: 205),
                  //           TextRich(
                  //             title: 'Death In Season : ',
                  //             value: death[0].season.toString(),
                  //           ),
                  //           const DividerWidget(endIndent: 215),
                  //           TextRich(
                  //             title: 'Death In Episode : ',
                  //             value: death[0].episode.toString(),
                  //           ),
                  //           const DividerWidget(endIndent: 215),
                  //         ],
                  //       );
                  //     } else {
                  //       return Center(
                  //         child: CircularProgressIndicator(
                  //           color: AppUi.colors.appGreen,
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  // AppUi.shared.h10,
                  BlocBuilder<CharactersCubit, CharactersState>(
                    builder: (context, state) {
                      if (state is QuotesLoaded) {
                        var quotes = (state).quotes;
                        if (quotes.isNotEmpty) {
                          return Column(
                            children: [
                              TextWidget(
                                'popular quotes',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppUi.colors.appBlack,
                              ),
                              const DividerWidget(endIndent: 0),
                              ...quotes
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                      ),
                                      child: TextWidget(
                                        e.quote,
                                        fontSize: 16,
                                        color: AppUi.colors.appBlack,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              const DividerWidget(endIndent: 0),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppUi.colors.appGreen,
                          ),
                        );
                      }
                    },
                  ),
                  AppUi.shared.h40,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
