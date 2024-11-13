import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Favorite {
  final String id;
  final bool isFavorite;

  Favorite(this.isFavorite, {required this.id});

  // Convertir un objeto Favorite a Map para JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'isFavorite': isFavorite,
      };

  // Crear un objeto Favorite desde un Map
  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      json['isFavorite'] as bool,
      id: json['id'] as String,
    );
  }
}

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

// Obtener un favorito por ID
  static Favorite? getFav(String id) {
    // Recuperar la lista de favoritos almacenada como JSON
    List<String>? favsJson = _prefs.getStringList('favs');

    if (favsJson != null) {
      // Convertir cada JSON en un objeto Favorite y buscar por ID
      List<Favorite> prefFavs = favsJson
          .map((favJson) => Favorite.fromJson(jsonDecode(favJson)))
          .toList();
      return prefFavs.firstWhere((fav) => fav.id == id,
          orElse: () => throw Exception("Favorito no encontrado"));
    } else {
      return null;
    }
  }

  // Guardar la lista de favoritos
  static Future<void> saveFavorites(List<Favorite> favorites) async {
    List<String> favsJson =
        favorites.map((fav) => jsonEncode(fav.toJson())).toList();
    await _prefs.setStringList('favs', favsJson);
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
}
