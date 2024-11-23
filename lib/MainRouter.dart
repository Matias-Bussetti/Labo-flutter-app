import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/marvelchars/MarvelCharsInfoPage.dart';
import 'package:flutter_application_1/pages/marvelchars/MarvelCharsListPage.dart';
import 'package:flutter_application_1/pages/patients/PatientsMapPage.dart';
import 'package:flutter_application_1/pages/patients/PatientsListPage.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart';
import 'package:flutter_application_1/pages/patients/PatientInfoPage.dart';
import 'package:flutter_application_1/widgets/marvelchars/SpidermanGame.dart';

class MainRouter {
  static List<Route> routes = <Route>[
    Route(
        id: "profile",
        path: '/profile',
        widget: ProfilePage(),
        icon: Icon(Icons.settings),
        title: "Perfil de Usuario",
        show: true),
    //Rutas Matias Bussetti
    Route(
        id: "patientsList",
        path: '/patients',
        widget: PatientsPage(),
        icon: Icon(Icons.person_search_rounded),
        title: "Lista de Pacientes",
        show: true),

    Route(
        id: "patientsMap",
        path: '/patients/map',
        widget: PatientsMapPage(),
        icon: Icon(Icons.map),
        title: "Mapa de Pacientes",
        show: true),
    Route(
        id: "patientInfo",
        path: '/paciente/id',
        widget: PatientInfoPage(),
        icon: Icon(Icons.accessibility_new_rounded),
        title: "Paciente",
        show: false),
    //Rutas Otro
    Route(
        id: "marvelCharsList",
        path: '/marvelchars',
        widget: MarvelCharsListPage(),
        icon: Icon(Icons.menu), 
        title: "Marvel - Lista de Personajes",
        show: true),
    Route(
        id: "marvelCharsInfo",
        path: '/marvelchars/id',
        widget: MarvelCharsInfoPage(),
        icon: Icon(Icons.supervised_user_circle),
        title: "Detalle de Personaje",
        show: false),
    Route(
        id: "marvelCharsSpidermanGame",
        path: '/marvelchars/game',
        widget: SpidermanCatchGame(),
        icon: Icon(Icons.star), 
        title: "Marvel Spider-Man - Atrapá a Venom",
        show: true),

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
