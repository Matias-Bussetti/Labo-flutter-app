import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Clientes/ClientesListPage.dart';
import 'package:flutter_application_1/pages/clientes/ClienteInfoPage.dart';
import 'package:flutter_application_1/pages/harry_potter/harry_potter_screens.dart';
import 'package:flutter_application_1/pages/marvelchars/MarvelCharsInfoPage.dart';
import 'package:flutter_application_1/pages/marvelchars/MarvelCharsListPage.dart';
import 'package:flutter_application_1/pages/patients/PatientsMapPage.dart';
import 'package:flutter_application_1/pages/patients/PatientsListPage.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart';
import 'package:flutter_application_1/pages/patients/PatientInfoPage.dart';
<<<<<<< HEAD
import 'package:flutter_application_1/pages/pokemons/PokemonsPage.dart';
import 'package:flutter_application_1/widgets/pokemons/PokemonsList.dart';
=======
import 'package:flutter_application_1/widgets/harry_potter/harry_potter_widgets.dart';
import 'package:flutter_application_1/widgets/marvelchars/SpidermanGame.dart';
import 'package:flutter_application_1/pages/pokemon/PokemonListPage.dart';
import 'package:flutter_application_1/pages/pokemon/PokemonInfoPage.dart';
>>>>>>> origin/dev

class MainRouter {
  static List<Route> routes = <Route>[
    Route(
        id: "profile",
        path: '/profile',
        widget: const ProfilePage(),
        icon: const Icon(Icons.settings),
        title: "Perfil de Usuario",
        subtitle: "",
        show: true),
    //Rutas Matias Bussetti
    Route(
        id: "patientsList",
        path: '/patients',
        widget: const PatientsPage(),
        icon: const Icon(Icons.person_search_rounded),
        title: "Lista de Pacientes",
        subtitle: "Matias Bussetti",
        show: true),

    Route(
        id: "patientsMap",
        path: '/patients/map',
        widget: const PatientsMapPage(),
        icon: const Icon(Icons.map),
        title: "Mapa de Pacientes",
        subtitle: "Matias Bussetti",
        show: true),
    Route(
        id: "patientInfo",
        path: '/paciente/id',
        widget: const PatientInfoPage(),
        icon: const Icon(Icons.accessibility_new_rounded),
        title: "Paciente",
        subtitle: "",
        show: false),
    Route(
        id: "pokemonsList",
        path: '/pokemons',
        widget: PokemonsPage(),
        icon: Icon(Icons.wheelchair_pickup_rounded),
        title: "Pokemon",
        show: true),
    //Rutas Otro
    Route(
        id: "marvelCharsList",
        path: '/marvelchars/',
        widget: const MarvelCharsListPage(),
        icon: const Icon(Icons.star_border),
        title: "Lista de Personajes de Marvel",
        subtitle: "Juan Chaparro",
        show: true),
    Route(
        id: "marvelCharsSpidermanGame",
        path: '/marvelchars/game',
        widget: const SpidermanCatchGame(),
        icon: const Icon(Icons.star_border),
        title: "Juego de Marvel Spider-Man - Atrapá a Venom",
        subtitle: "Juan Chaparro",
        show: true),
    Route(
        id: "marvelCharsInfo",
        path: '/marvelchars/id',
        widget: const MarvelCharsInfoPage(),
        icon: const Icon(Icons.star_border),
        title: "Personajes de Marvel",
        subtitle: "",
        show: false),
    Route(
        id: "pokemonList",
        path: '/pokemon/list',
        widget: const PokemonListPage(),
        icon: const Icon(Icons.catching_pokemon),
        title: "Lista de Pokémon",
        subtitle: "Diego Bruno",
        show: true),
    Route(
        id: "pokemonInfo",
        path: '/pokemon-info',
        widget: const PokemonInfoPage(),
        icon: const Icon(Icons.info),
        title: "Detalle de Pokémon",
        subtitle: "",
        show: false),
    Route(
        id: "harryPotterList",
        path: '/harryPotterList',
        widget: const HarryPotterListPage(),
        icon: const Icon(Icons.school),
        title: "Lista de Personajes de Harry Potter",
        subtitle: "Eugenia Losada",
        show: true),
    Route(
        id: "harryPotterGuessColor",
        path: '/harryPotter/guessColor',
        widget: const AdivinaElColor(),
        icon: const Icon(Icons.palette),
        title: "Juego: Adivina el Color",
        subtitle: "Eugenia Losada",
        show: true),
    Route(
        id: "harryPotterInfo",
        path: '/harryPotterInfo',
        widget: const HarryPotterInfoPage(),
        icon: const Icon(Icons.info),
        title: "Detalles del Personaje",
        subtitle: "",
        show: false),
    Route(
        id: "clientesList",
        path: '/clientes',
        widget: const ClientesListPage(),
        icon: const Icon(Icons.people),
        title: "Lista de Clientes",
        subtitle: "Ponin Eric",
        show: true),
    Route(
        id: "clienteInfo",
        path: '/cliente/buscar',
        widget: const ClienteInfoPage(),
        icon: const Icon(Icons.person),
        title: "Detalle del Cliente",
        subtitle: "",
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
  final String subtitle;
  final bool show;
  final Icon icon;

  Route({
    required this.id,
    required this.path,
    required this.widget,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.show,
  });
}
