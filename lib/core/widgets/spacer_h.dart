import 'package:flutter/material.dart';
import 'package:woudy_customers_app/core/resources/resources.dart';

class SpacerH extends StatelessWidget {
  const SpacerH({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(width: value ?? Dimens.space8);
  }
}
