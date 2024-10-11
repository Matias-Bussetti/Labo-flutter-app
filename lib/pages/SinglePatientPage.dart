import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/SinglePatientPageArguments.dart';

class SinglePatientPage extends StatelessWidget {
  const SinglePatientPage({
    super.key,
  });

  static const routeName = '/paciente/id';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context)!.settings.arguments
        as SinglePatientPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Paciente"),
      ),
      body: Center(
        child: Text(args.id),
      ),
    );
  }
}
