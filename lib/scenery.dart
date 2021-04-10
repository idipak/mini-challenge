import 'package:flutter/material.dart';

import 'SceneryPainter.dart';

class Scenery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  // You can adjust this, if you like, but it should not toggle with light/dark mode.
  final _textAreaHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomPaint(
            foregroundPainter: SceneryPainter(
              skyColor: _skyColor,
              petalFillColor: _petalColor,
              petalStrokeColor: _petalStrokeColor,
              stemColor: _stemColor,
              groundColor: _groundColor,
              midPointX: constraints.maxWidth / 2,
              textHeight: _textAreaHeight,
              drawSun: _drawSun,
              drawMoon: _drawMoon,
            ),
            child: Container(
              color: _groundColor,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: _textAreaHeight,
              width: constraints.maxWidth,
              color: _textBackgroundColor,
              child: const SomeText(),
            ),
          ),
        ],
      ),
    );
  }

  //todo(you) - Optional - Can you find a way to toggle these values with light mode and dark mode?
  //hint: use InheritedTheme.
  final _petalColor = Colors.pinkAccent.shade100;
  final _petalStrokeColor = Colors.pink.shade50;
  final _stemColor = Colors.green.shade400;
  final _skyColor = Colors.lightBlueAccent;
  final _groundColor = Colors.green.shade800;
  final _textBackgroundColor = Colors.blueGrey.shade50;
  final _drawMoon = true;
  final _drawSun = true;
}

class SomeText extends StatelessWidget {
  const SomeText();
  @override
  Widget build(BuildContext context) {
    //todo(you) - Required - Can you make this text more interesting with a custom AppTheme?
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Flaiku',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Anonymous',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8),
        Text(
          'Hello, Flutter Friend!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'Welcome to Flutter Challenge',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'We hope you have fun :)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
