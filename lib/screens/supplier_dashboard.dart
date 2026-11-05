import 'package:flutter/material.dart';
import '../theme.dart';
class SupplierDashboardScreen extends StatelessWidget { const SupplierDashboardScreen({super.key}); @override Widget build(BuildContext context) {
  return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Brands - Espace Vendeur', style: TextStyle(color: EarnTheme.gold))),
    body: ListView(padding: EdgeInsets.all(16), children: [
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('👋 Bonjour, Nike Store', style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)), Text('Publie tes produits et gagne', style: TextStyle(color: EarnTheme.gold))])),
      SizedBox(height:16),
      ElevatedButton(onPressed: (){}, child: Text('+ PUBLIER UN PRODUIT')),
      SizedBox(height:16),
      Text('Tes produits', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      ListTile(title: Text('Nike Air Force', style: TextStyle(color: Colors.white)), subtitle: Text('50.000 FCFA - 12 ventes', style: TextStyle(color: EarnTheme.gold)), leading: Text('👟', style: TextStyle(fontSize:30))),
      ListTile(title: Text('Nike Jordan', style: TextStyle(color: Colors.white)), subtitle: Text('75.000 FCFA - 8 ventes', style: TextStyle(color: EarnTheme.gold)), leading: Text('👟', style: TextStyle(fontSize:30))),
    ]));
}}
