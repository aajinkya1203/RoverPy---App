import 'package:flutter/material.dart';

class ControlButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  ControlButton({this.onTap, this.icon, this.isActive});

  @override
  _ControlButtonState createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.isActive?Theme.of(context).splashColor:Theme.of(context).primaryColor,
      elevation: 8.0,
      child: InkWell(
        onTap: widget.onTap,
        child: Icon(widget.icon, size: 50.0, color: Colors.black,),
      ),
    );
  }
}
