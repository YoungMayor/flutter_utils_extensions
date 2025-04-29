import 'package:flutter/material.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const ExampleScreen());
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: const Text('Extensions Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// BuildContext Extensions
            Text('MediaQuery width: ${context.widgetWidth}'),
            Text('Is dark mode: ${context.platformInDarkMode}'),

            const SizedBox(height: 20),

            /// String Extensions
            Text('Camel Case: ${"hello world".camelCase}'), // helloWorld
            Text('Snake Case: ${"hello world".snakeCase}'), // hello_world
            Text('Mask: ${"08012345678".mask()}'), // 08********8
            Text('Is Email: ${"test@example.com".isEmail}'), // true

            const SizedBox(height: 20),

            /// Number Extensions
            Text('Clamp Min: ${5.clampMin(10)}'), // 10
            Text('Clamp Max: ${20.clampMax(15)}'), // 15
            Text('Days to Duration: ${3.days.inHours} hours'), // 72 hours

            const SizedBox(height: 20),

            /// DateTime Extensions
            Text('Is Today: ${now.isToday}'), // true
            Text('Is Morning: ${now.isMorning}'), // true/false
            Text(
              'Add 5 days: ${now.addDays(5).format(MayrDateTimeFormats.usDate)}',
            ), // formatted future date

            const SizedBox(height: 20),

            /// Duration Extensions
            ElevatedButton(
              onPressed: () {
                2.seconds.delay(() {
                  context.showSnackBar("Delayed by 2secs");
                });
              },
              child: const Text('Delay Example'),
            ),

            const SizedBox(height: 20),

            /// Widget Extensions
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ).paddingAll(8).opacity(0.8).center(),

            const SizedBox(height: 20),

            /// InkWellManager Example
            Text('Tap Me', style: TextStyle(fontSize: 18)).inkWellManager(() {
              context.showSnackBar("I have been tapped");
            }, color: Colors.redAccent).onTap(),
          ],
        ),
      ),
    );
  }
}
