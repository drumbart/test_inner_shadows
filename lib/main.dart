import 'package:flutter/material.dart';
import 'package:test_inner_shadows/widgets/embossed_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F****** Inner Shadows!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'F****** Inner Shadows!'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: EmbossedSwitch(
          size: const Size(100, 50),
          borderRadius: 30,
          onChanged: (bool isOn) {
            print('isOn? $isOn');
          },
          isOn: true,
        ),
      ),
    );
  }
}
