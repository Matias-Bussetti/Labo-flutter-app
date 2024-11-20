
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static bool _darkmode = false;
  static String _apellido = '';
  static String _nombre = '';
  static String _email = '';
  static String _telefono = '';
  static List<String> _favs = [];

  static late SharedPreferences _prefs;

  static Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get darkmode {
    return _prefs.getBool('darkmode') ?? _darkmode;
  }

  static set darkmode(bool value) {
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }

  static set apellido(String value) {
    _apellido = value;
    _prefs.setString('apellido', value);
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  static set email(String value) {
    _email = value;
    _prefs.setString('email', value);
  }

  static set telefono(String value) {
    _telefono = value;
    _prefs.setString('telefono', value);
  }

  static set setFav(String value) {
    if (_favs.contains(value)) {
      _favs.remove(value);
    } else {
      _favs.add(value);
    }
    _prefs.setStringList('favs', _favs);
  }

  static String get apellido {
    return _prefs.getString('apellido') ?? _apellido;
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static String get email {
    return _prefs.getString('email') ?? _email;
  }

  static String get telefono {
    return _prefs.getString('telefono') ?? _telefono;
  }

  static List<String> get favs {
    return _prefs.getStringList('favs') ?? _favs;
  }
}
