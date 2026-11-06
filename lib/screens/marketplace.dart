import 'package:flutter/material.dart';
import '../theme.dart';
class MarketplaceScreen extends StatelessWidget { const MarketplaceScreen({super.key}); @override Widget build(BuildContext context) {
  return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Explore 🌍', style: TextStyle(color: EarnTheme.gold))),
  body: ListView(padding: EdgeInsets.all(16), children: [
    Text('Produits du Monde', style: TextStyle(color: EarnTheme.gold, fontSize: 20, fontWeight: FontWeight.bold)),
    SizedBox(height: 12),
    _card('👗', 'Haute Couture Paris', '€280', 'Paris'), _card('🎧', 'Headphones USA', '\$199', 'USA'), _card('🎭', 'Art Mali', '\$85', 'Bamako'), _card('👟', 'Nike Air Force', '50.000 FCFA', 'Bamako'), _card('⌚', 'Montre Dubai', 'AED 1,250', 'Dubai'),
  ]));
}
Widget _card(String e, String n, String p, String c) => Container(margin: EdgeInsets.only(bottom: 12), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: EarnTheme.blackCard, border: Border.all(color: EarnTheme.gold.withOpacity(0.4)), borderRadius: BorderRadius.circular(12)), child: Row(children: [Text(e, style: TextStyle(fontSize: 32)), SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(n, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(c, style: TextStyle(color: EarnTheme.gold))])), Text(p, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]));
}
