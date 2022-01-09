import 'package:breaking_bad/common.dart';

class AppUi {
  static _AppColors get colors => _AppColors();
  static _AppFonts get fonts => _AppFonts();
  static _AppAssets get assets => _AppAssets();
  static _AppThemes get themes => _AppThemes();
  static _Others get shared => _Others();
}

class _AppColors {
  // final mainColor = const Color(0xff834C9E);
  final appRed = Colors.red;
  final appBlue = const Color(0xff3A96AD);
  final appGreen = const Color(0xff65A090);
  final appYellow = const Color(0xffFFC229);
  final appLightYellow = const Color(0xffFFF6DF);
  final appBlack = const Color(0xff000000);
  final appLightBlack = Colors.black54;
  final transparent = Colors.transparent;
  final appWhite = const Color(0xffFFFFFF);
  final appGrey = Colors.grey.withOpacity(.8);
  final darkGrey = Colors.grey[800];
  final apptransparent = Colors.transparent;
}

class _AppFonts {
  final arabicFont = 'cairo';
  final englishFont = 'Poppins';
}

class _AppAssets {
  final loading = 'assets/animations/loading.json';

  final logo = 'assets/images/logo.jpg';
  final splash = 'assets/images/breaking-bad-splash.jpg';

  final noInternet = 'assets/animations/no-internet.json';

  final banner1 = 'assets/images/banner1.jpg';
  final banner2 = 'assets/images/banner2.jpg';
  final banner3 = 'assets/images/banner3.jpg';
  final banner4 = 'assets/images/banner4.jpg';
  final banner5 = 'assets/images/banner5.png';
}

class _AppThemes {
  static IconThemeData get primaryIconTheme => IconThemeData(
        color: AppUi.colors.appGreen,
        size: 34,
      );
  static IconThemeData get whiteIconTheme => IconThemeData(
        color: AppUi.colors.appWhite,
        size: 34,
      );
  ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.light(
          primary: AppUi.colors.appGreen,
          secondary: AppUi.colors.appYellow,
          onSecondary: AppUi.colors.appWhite,
          surface: AppUi.colors.appLightYellow,
          onSurface: AppUi.colors.appGreen,
          background: AppUi.colors.appLightYellow,
        ),
        iconTheme: primaryIconTheme,
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        primaryTextTheme: Typography().black.apply(
              bodyColor: AppUi.colors.appGreen,
              displayColor: AppUi.colors.appGreen,
            ),
        textTheme: Typography().black.apply(
              bodyColor: AppUi.colors.appGreen,
              displayColor: AppUi.colors.appGreen,
            ),
        appBarTheme: AppBarTheme(
          iconTheme: primaryIconTheme,
        ),
        fontFamily: AppUi.fonts.englishFont,
      );
  ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.dark(
          onPrimary: AppUi.colors.appWhite,
          secondary: const Color(0xffbb86fc),
          onSecondary: AppUi.colors.appWhite,
          secondaryVariant: const Color(0xffbb86fc),
        ),
        iconTheme: whiteIconTheme,
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        primaryTextTheme: Typography().white,
        textTheme: Typography().white,
        appBarTheme: AppBarTheme(
          iconTheme: whiteIconTheme,
        ),
        fontFamily: AppUi.fonts.englishFont,
      );
}

class _Others {
  final h10 = const SizedBox(height: 10);
  final h20 = const SizedBox(height: 20);
  final h40 = const SizedBox(height: 40);
}
