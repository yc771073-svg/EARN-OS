import 'package:flutter/material.dart';

class WorldSelector extends StatelessWidget {
  final countries = [
    {"flag":"ML", "name":"Mali", "city":"Bamako - West Africa"},
    {"flag":"FR", "name":"France", "city":"Paris - Europe"},
    {"flag":"US", "name":"United States", "city":"New York - North America"},
    {"flag":"AE", "name":"UAE", "city":"Dubai - Middle East"},
    {"flag":"TR", "name":"Turkiye", "city":"Istanbul - Europe/Asia"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: (){},
          child: Text("LAUNCH WORLD"),
        ),
      ),
    );
  }
}
