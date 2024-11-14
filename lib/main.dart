import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/MainRouter.dart';
import 'package:flutter_application_1/helpers/preferences.dart';
import 'package:flutter_application_1/pages/PatientMapPage.dart';
import 'package:flutter_application_1/pages/PatientPage.dart';
import 'package:flutter_application_1/pages/ProfilePage.dart';
import 'package:flutter_application_1/pages/SinglePatientPage.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      theme = Provider.of<ThemeProvider>(context, listen: false).temaActual;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grupo 15',
      theme: theme,
      home: const HomePage(title: 'Grupo 15'),
      routes: MainRouter.generateRoutes(context),
    );
  }
}
