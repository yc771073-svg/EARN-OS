import 'package:flutter/material.dart';
import '../theme.dart';
class SettingsScreen extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  const SettingsScreen({super.key, required this.onLocaleChange});
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Profile', style: TextStyle(color: EarnTheme.gold))),
    body: ListView(padding: EdgeInsets.all(16), children: [
      CircleAvatar(radius: 40, backgroundColor: EarnTheme.gold, child: Text('Y', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold))),
      SizedBox(height: 12), Text('Youssouf - Bamako', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(height: 16), Text('Langue', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      ListTile(title: Text('Français', style: TextStyle(color: Colors.white)), onTap: () => onLocaleChange(Locale('fr'))),
      ListTile(title: Text('English', style: TextStyle(color: Colors.white)), onTap: () => onLocaleChange(Locale('en'))),
      ListTile(title: Text('Bambara', style: TextStyle(color: Colors.white)), onTap: () => onLocaleChange(Locale('bm'))),
      ListTile(title: Text('العربية', style: TextStyle(color: Colors.white)), onTap: () => onLocaleChange(Locale('ar'))),
      Divider(color: EarnTheme.gold),
      ListTile(title: Text('Commission: 5% / 8% / 10% / 15%', style: TextStyle(color: Colors.white)), subtitle: Text('Selon montant commande', style: TextStyle(color: EarnTheme.gold))),
      ListTile(title: Text('Livreur: 10% par livraison', style: TextStyle(color: Colors.white))),
    ]));
  }
}
