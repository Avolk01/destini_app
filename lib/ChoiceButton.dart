

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String buttonText;
  final Color _color;
  final VoidCallback onPressed;

  ChoiceButton.red(this.buttonText, this.onPressed) : _color = Colors.red;

  ChoiceButton.green(this.buttonText, this.onPressed) : _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: FlatButton(
        onPressed: onPressed,
        color: _color,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}