import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalizationProvider extends ChangeNotifier {
  //listing all the variables that will affect something outside of the personalization file
  Color accentColor;
  Color accent2Color;
  Color backgroundColor;
  Color textColor;
  var textFont;
  //gives each variable a default value because they need it.
  PersonalizationProvider({
    this.accentColor = Colors.blue,
    this.accent2Color = Colors.grey,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.textFont = GoogleFonts.gantari,
  });

  void setAccentColor(Color newColor) {
    accentColor = newColor;
    //Tells all the parts of the app using this variable that something has changed
    notifyListeners();
  }

  void setAccent2Color(Color newColor) {
    accent2Color = newColor;
    notifyListeners();
  }

  void setBackgroundColor(Color newColor) {
    backgroundColor = newColor;
    notifyListeners();
  }

  void setTextColor(Color newColor) {
    textColor = newColor;
    notifyListeners();
  }

  void setTextFont(newFont) {
    textFont = newFont;
    notifyListeners();
  }
}
