import 'package:flutter/material.dart';
import '../theme.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, leading: IconButton(icon: Icon(Icons.arrow_back, color: EarnTheme.gold), onPressed: ()=>Navigator.pop(context)), title: Text('Parametres', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))),
      body: ListView(padding: EdgeInsets.all(16), children:[
        Text('MON COMPTE', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        ListTile(leading: Icon(Icons.person, color: EarnTheme.gold), title: Text('Youssouf', style: TextStyle(color: Colors.white)), subtitle: Text('Bamako, Mali', style: TextStyle(color: Colors.white54))),
        Divider(color: Colors.white24),
        Text('COMPTE MARQUE - POUR LES VENDEURS SEULEMENT', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        ListTile(leading: Icon(Icons.business, color: EarnTheme.gold), title: Text('Carte de Commerce', style: TextStyle(color: Colors.white)), subtitle: Text('Numero RC - Bamako', style: TextStyle(color: Colors.white54))),
        ListTile(leading: Icon(Icons.confirmation_number, color: EarnTheme.gold), title: Text('Carte Bancaire / RIB', style: TextStyle(color: Colors.white)), subtitle: Text('Pour recevoir 70% - Orange Money Pro / Bank', style: TextStyle(color: Colors.white54))),
        ListTile(leading: Icon(Icons.percent, color: EarnTheme.gold), title: Text('Commission', style: TextStyle(color: Colors.white)), subtitle: Text('Toi 15% - Marque 70% - Livreur 15%', style: TextStyle(color: Colors.white54))),
        Divider(color: Colors.white24),
        Text('PAYS / LANGUE', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        ListTile(leading: Icon(Icons.language, color: EarnTheme.gold), title: Text('Langue: Francais / Bambara', style: TextStyle(color: Colors.white))),
        ListTile(leading: Icon(Icons.location_on, color: EarnTheme.gold), title: Text('Pays: Mali - Bamako', style: TextStyle(color: Colors.white))),
        ListTile(leading: Icon(Icons.notifications, color: EarnTheme.gold), title: Text('Notifications', style: TextStyle(color: Colors.white))),
        ListTile(leading: Icon(Icons.help, color: EarnTheme.gold), title: Text('Aide / Support', style: TextStyle(color: Colors.white))),
      ]));
  }
}
