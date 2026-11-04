import 'package:flutter/material.dart';
class MarketplaceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("EARN OS - Global Brands", style: TextStyle(color: Color(0xFFD4AF37))), backgroundColor: Colors.black),
      body: GridView.count(crossAxisCount: 2, shrinkWrap: true, children: [
        Card(color: Colors.black, child: Column(children: [Text("Paris • Fashion €280", style: TextStyle(color: Color(0xFFD4AF37))), Text("Haute Couture", style: TextStyle(color: Colors.white)) ])),
        Card(color: Colors.black, child: Column(children: [Text("Dubai • Luxury AED 1,250", style: TextStyle(color: Color(0xFFD4AF37))), Text("Watch", style: TextStyle(color: Colors.white)) ])),
        Card(color: Colors.black, child: Column(children: [Text("USA • Tech \$199", style: TextStyle(color: Color(0xFFD4AF37))), Text("Headphones", style: TextStyle(color: Colors.white)) ])),
        Card(color: Colors.black, child: Column(children: [Text("Mali • Art \$85", style: TextStyle(color: Color(0xFFD4AF37))), Text("Textile", style: TextStyle(color: Colors.white)) ])),
      ]),
    );
  }
}
