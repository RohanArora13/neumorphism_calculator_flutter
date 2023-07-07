import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:neumorphism_calculator_app/colors.dart';

import 'neuContainer.dart';

class CalculatorScreen extends ConsumerStatefulWidget {
  const CalculatorScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CalculatorScreenState();
}

class _CalculatorScreenState extends ConsumerState<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // button column
            Column(
              children: [
                Row(
                  children: [
                    _buttonRounded(title: "0"),
                    _buttonRounded(title: ','),
                    _buttonRounded(icon: Icons.backspace_outlined),
                    _buttonRounded(title: "=")
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget _buttonRounded({
    String? title,
    double padding = 17,
    IconData? icon,
    //Color? iconColor,
    //Color? textColor
  }) {
    CustomColors CustomColor = Theme.of(context).extension<CustomColors>()!;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NeuContainer(
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                      '$title',
                      style: TextStyle(
                          color: CustomColor.textColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    )
                  : Icon(
                      icon,
                      color: CustomColor.iconColor,
                      size: 30,
                    )),
        ),
      ),
    );
  }
}
