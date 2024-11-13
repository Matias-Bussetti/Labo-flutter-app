import 'package:flutter/material.dart';

class FadeContainer extends StatefulWidget {
  final Widget child;

  const FadeContainer({super.key, required this.child});

  @override
  State<FadeContainer> createState() => FadeContainerState();
}

class FadeContainerState extends State<FadeContainer> {
  double opacityLevel = 0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _changeOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          child: widget.child,
        ),
      ],
    );
  }
}
