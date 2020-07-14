import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ControlItem {
  final IconData icon;
  final VoidCallback command;

  ControlItem({this.icon, this.command});
}

List<ControlItem> roverControls = [
  ControlItem(icon: Icons.arrow_drop_up),
  ControlItem(icon: Icons.arrow_left),
  ControlItem(icon: Icons.arrow_right),
  ControlItem(icon: Icons.arrow_drop_down),
];

List<ControlItem> beltControls = [
  ControlItem(icon: Icons.arrow_drop_up),
  ControlItem(icon: Icons.arrow_drop_down),
];