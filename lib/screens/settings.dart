import 'package:flutter/material.dart';
import '../theme.dart';
class SettingsScreen extends StatefulWidget { final Function(Locale) onLocaleChange; const SettingsScreen({super.key, required this.onLocaleChange}); @override State<SettingsScreen> createState()=>_SState(); }
class _SState extends State<SettingsScreen> {
  bool notif=true;
  String lang='Français';
  @override Widget build(BuildContext context){
    return ListView(padding: EdgeInsets.all(16), children:[
      // CARTE EARN OS - SANS BOUTIQUE
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(16)), child: Column(children:[
        Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:28, fontWeight: FontWeight.bold, letterSpacing:4)),
        Text('Global • Luxe • Bamako', style: TextStyle(color: Colors.white70)),
        SizedBox(height:8), Text('🌍 PARLE TOUTES LES LANGUES • 🇪🇸 Español inclus', style: TextStyle(color: EarnTheme.gold, fontSize:12, fontWeight: FontWeight.bold)),
      ])),
      SizedBox(height:16),
      // PROFIL - SANS VENTES / SANS BOUTIQUE / SANS CHIFFRE D'AFFAIRES
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(16)), child: Row(children:[
        Stack(children:[CircleAvatar(radius:36, backgroundColor: EarnTheme.gold, child: Text('Y', style: TextStyle(color: Colors.black, fontSize:28, fontWeight: FontWeight.bold))), Positioned(bottom:0, right:0, child: CircleAvatar(radius:12, backgroundColor: Colors.green, child: Icon(Icons.check, color: Colors.white, size:14)))]),
        SizedBox(width:12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text('Youssouf', style: TextStyle(color: Colors.white, fontSize:22, fontWeight: FontWeight.bold)),
          Text('Bamako, Mali • youssouf@earnos.io', style: TextStyle(color: Colors.white60, fontSize:12)),
          SizedBox(height:6),
          Row(children:[Container(padding: EdgeInsets.symmetric(horizontal:10, vertical:4), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text('PRO MEMBER ✨', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11))), SizedBox(width:6), Container(padding: EdgeInsets.symmetric(horizontal:10, vertical:4), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text('⭐ 4.9', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11)))]),
        ])),
        Icon(Icons.edit, color: EarnTheme.gold),
      ])),
      SizedBox(height:16),
      // PAS DE 2.5M / 128 VENTES / 12 PAYS - C'ETAIT POUR LA BOUTIQUE, ON L'A ENLEVE
      Text('MON COMPTE', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:16, letterSpacing:2)),
      SizedBox(height:10),
      _row(Icons.person, 'Mon Profil', 'Nom, photo, téléphone'),
      _row(Icons.notifications, 'Notifications', 'ON', isSwitch: true),
      _row(Icons.payment, 'Paiement', 'Orange Money • Visa •••• 4242'),
      _row(Icons.location_on, 'Mes Adresses', 'ACI 2000, Bamako'),
      _row(Icons.history, 'Mes Commandes', 'Voir mes commandes'),
      _row(Icons.language, 'Langue', lang),
      _row(Icons.help, 'Aide - EARN AI ✨', 'Parler à EARN AI'),
      SizedBox(height:16),
      Text('EARN OS - Tu commandes seulement. Pas de boutique à gérer ici.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize:11)),
    ]);
  }
  Widget _row(IconData icon, String title, String sub, {bool isSwitch=false}){
    return Container(margin: EdgeInsets.only(bottom:10), padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(12)), child: Row(children:[
      Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: Icon(icon, color: EarnTheme.gold)),
      SizedBox(width:12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(title, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)), Text(sub, style: TextStyle(color: Colors.white60, fontSize:12))])),
      if(isSwitch) Switch(value: notif, activeColor: EarnTheme.gold, onChanged: (v)=>setState(()=>notif=v)) else Icon(Icons.arrow_forward_ios, color: EarnTheme.gold, size:16),
    ]));
  }
}
