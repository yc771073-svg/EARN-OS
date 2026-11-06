import 'package:flutter/material.dart';
import '../theme.dart';
class DeliveryScreen extends StatelessWidget { const DeliveryScreen({super.key}); @override Widget build(BuildContext context) {
  return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Delivery 🛵', style: TextStyle(color: EarnTheme.gold))),
  body: ListView(padding: EdgeInsets.all(16), children: [
    Text('Tes livraisons', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
    ListTile(leading: Text('🛵', style: TextStyle(fontSize: 28)), title: Text('#123 Nike - En livraison', style: TextStyle(color: Colors.white)), subtitle: Text('Livreur: Moussa - Bamako', style: TextStyle(color: EarnTheme.gold))),
    ListTile(leading: Text('✅', style: TextStyle(fontSize: 28)), title: Text('#124 Montre Dubai - Livrée', style: TextStyle(color: Colors.white)), subtitle: Text('Livrée à 14:30', style: TextStyle(color: EarnTheme.gold))),
    SizedBox(height: 16), Text('Devenir Livreur EARN OS - Gagne 10% par livraison', style: TextStyle(color: Colors.white)),
    SizedBox(height: 8), ElevatedButton(onPressed: (){}, child: Text('DEVENIR LIVREUR')),
  ]));
}}
