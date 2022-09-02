// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';

class ConditionalBuilder extends StatefulWidget {
bool condition;
Widget builder;
Widget fallBack;

ConditionalBuilder({super.key,  required this.condition, required this.builder, required this.fallBack});

  @override
  State<ConditionalBuilder> createState() => _ConditionalBuilderState(condition,builder ,fallBack);
}

class _ConditionalBuilderState extends State<ConditionalBuilder> {
  bool condition;
  Widget builder;
  Widget fallBack;

  _ConditionalBuilderState(this.condition, this.builder, this.fallBack);

  @override
  Widget build(BuildContext context) {
    return condition?builder:fallBack;
  }
}
