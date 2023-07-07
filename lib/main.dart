import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neumorphism_calculator_app/calculator_screen.dart';
import 'package:neumorphism_calculator_app/themes.dart';

import 'colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeNotifierProvider),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

void change_theme(WidgetRef ref) {
  ref.read(themeNotifierProvider.notifier).toggleTheme();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool ispressed = false;

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      ispressed = false;
    });
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      ispressed = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => CalculatorScreen())));
  }

  @override
  Widget build(BuildContext context) {
    //change_theme(ref);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final customColors = Theme.of(context).extension<CustomColors>()!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Icon(
                Icons.android,
                size: 100,
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.normal,
                        blurRadius: 20,
                        spreadRadius: 1,
                        color: customColors.shadowBelow!,
                        offset: const Offset(5.0, 5.0)),
                    BoxShadow(
                        blurStyle: BlurStyle.normal,
                        blurRadius: 20,
                        spreadRadius: 1,
                        color: customColors.shadowAbove!,
                        offset: const Offset(-5.0, -5.0))
                  ]),
            ),
            // ElevatedButton(
            //     onPressed: () => change_theme(ref), child: Text("change theme"))
          ],
        ),
      ),
    );
  }
}
