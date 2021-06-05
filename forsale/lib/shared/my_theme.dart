part of 'shared.dart';

class MyTheme {
  static ThemeData myTheme() {
    return ThemeData(
      primarySwatch: Colors.grey,
      backgroundColor: Color(0xFFf4f4f4),
      scaffoldBackgroundColor: Color(0xFFf4f4f4),
      primaryColor: Colors.black,
      accentColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.rubik().fontFamily,



    );
  }
}
