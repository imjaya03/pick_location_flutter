import 'package:flutter/material.dart';
import 'package:pick_location/pick_location.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await pickLocation(
                    context: context,
                    googleApiKey: "---> YOUR GOOGLE API KEY  <---",
                  );
                },
                child: const Text("Pick Location"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
