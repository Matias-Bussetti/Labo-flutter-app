import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Clientes/ClientesListPage.dart';
import 'package:flutter_application_1/pages/clientes/ClienteInfoPage.dart';
import 'package:flutter_application_1/pages/marvelchars/MarvelCharsInfoPage.dart';
import 'package:flutter_application_1/pages/marvelchars/MarvelCharsListPage.dart';
import 'package:flutter_application_1/pages/patients/PatientsMapPage.dart';
import 'package:flutter_application_1/pages/patients/PatientsListPage.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart';
import 'package:flutter_application_1/pages/patients/PatientInfoPage.dart';
import 'package:flutter_application_1/widgets/marvelchars/SpidermanGame.dart';
import 'package:flutter_application_1/pages/pokemon/PokemonListPage.dart';
import 'package:flutter_application_1/pages/pokemon/PokemonInfoPage.dart';

class MainRouter {
  static List<Route> routes = <Route>[
    Route(
        id: "profile",
        path: '/profile',
        widget: const ProfilePage(),
        icon: const Icon(Icons.settings),
        title: "Perfil de Usuario",
        show: true),
    //Rutas Matias Bussetti
    Route(
        id: "patientsList",
        path: '/patients',
        widget: const PatientsPage(),
        icon: const Icon(Icons.person_search_rounded),
        title: "Lista de Pacientes",
        show: true),

    Route(
        id: "patientsMap",
        path: '/patients/map',
        widget: const PatientsMapPage(),
        icon: const Icon(Icons.map),
        title: "Mapa de Pacientes",
        show: true),
    Route(
        id: "patientInfo",
        path: '/paciente/id',
        widget: const PatientInfoPage(),
        icon: const Icon(Icons.accessibility_new_rounded),
        title: "Paciente",
        show: false),
    //Rutas Otro
    Route(
        id: "marvelCharsList",
        path: '/marvelchars/',
        widget: const MarvelCharsListPage(),
        icon: const Icon(Icons.star_border),
        title: "Personajes de Marvel",
        show: true),
    Route(
        id: "marvelCharsSpidermanGame",
        path: '/marvelchars/game',
        widget: const SpidermanCatchGame(),
        icon: const Icon(Icons.star_border),
        title: "Juego de Marvel Spider-Man - Atrapá a Venom",
        show: true),
    Route(
            id: "marvelCharsInfo",
            path: '/marvelchars/id',
            widget: const MarvelCharsInfoPage(),
            icon: const Icon(Icons.star_border),
            title: "Personajes de Marvel",
            show: false),
    Route(
        id: "pokemonList",
        path: '/pokemon/list',
        widget: const PokemonListPage(),
        icon: const Icon(Icons.catching_pokemon),
        title: "Lista de Pokémon",
        show: true),

    Route(
        id: "pokemonInfo",
        path: '/pokemon-info',
        widget: const PokemonInfoPage(),
        icon: const Icon(Icons.info),
        title: "Detalle de Pokémon",
        show: false),
  ];

  static Map<String, WidgetBuilder> generateRoutes(BuildContext context) {
    return {
      for (var route in routes) route.path: (context) => route.widget,
    };
  }

  static getRoute(String) {}
}

class Route {
  final String id;
  final String path;
  final Widget widget;
  final String title;
  final bool show;
  final Icon icon;

  Route({
    required this.id,
    required this.path,
    required this.widget,
    required this.title,
    required this.icon,
    required this.show,
  });
}
