import 'package:breaking_bad/common.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppUi.colors.appLightYellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(AppUi.assets.noInternet),
            AppUi.shared.h20,
            TextWidget(
              'Can\'t connect .. check internet',
              fontSize: 22,
              color: AppUi.colors.appGrey,
            ),
          ],
        ),
      ),
    );
  }
}
