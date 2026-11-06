import 'package:flutter/material.dart';
import '../theme.dart';
class SettingsScreen extends StatefulWidget { final Function(Locale) onLocaleChange; const SettingsScreen({super.key, required this.onLocaleChange}); @override State<SettingsScreen> createState()=>_SState(); }
class _SState extends State<SettingsScreen> {
  bool notif = true;
  bool darkMode = true;
  String lang = 'Français';
  String name = 'Youssouf';
  String phone = '+223 70 00 00 00';
  String email = 'youssouf@earnos.io';
  String address = 'ACI 2000, Bamako, Mali';
  String payment = 'Orange Money • +223 70 00 00 00';
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black,
      body: SingleChildScrollView(padding: EdgeInsets.all(14), child: Column(children:[
        // CARTE EARN OS - PETITE, PROPRE
        Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(16)), child: Column(children:[
          Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:22, fontWeight: FontWeight.bold, letterSpacing:3)),
          Text('Global • Luxe • Bamako', style: TextStyle(color: Colors.white70, fontSize:12)),
          SizedBox(height:6), Text('🌍 PARLE TOUTES LES LANGUES • 🇪🇸 Español inclus', style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold)),
        ])),
        SizedBox(height:14),
        // PROFIL - TAILLE NORMALE, PAS ENORME
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
          Stack(children:[CircleAvatar(radius:30, backgroundColor: EarnTheme.gold, child: Text('Y', style: TextStyle(color: Colors.black, fontSize:22, fontWeight: FontWeight.bold))), Positioned(bottom:0, right:0, child: CircleAvatar(radius:10, backgroundColor: Colors.green, child: Icon(Icons.check, color: Colors.white, size:12)))]),
          SizedBox(width:10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Text(name, style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)),
            Text('$address', style: TextStyle(color: Colors.white60, fontSize:11), maxLines:1, overflow: TextOverflow.ellipsis),
            Text(email, style: TextStyle(color: Colors.white60, fontSize:11)),
            SizedBox(height:5),
            Row(children:[
              Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text('PRO MEMBER ✨', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:10))),
              SizedBox(width:5),
              Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text('⭐ 4.9', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:10))),
            ]),
          ])),
          Icon(Icons.edit, color: EarnTheme.gold, size:20),
        ])),
        SizedBox(height:14),
        Align(alignment: Alignment.centerLeft, child: Text('MON COMPTE', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:14, letterSpacing:1))),
        SizedBox(height:8),
        // PARAMETRES REMPLIS - TOUT EST LA
        _row(Icons.person, 'Mon Profil', 'Nom: $name • Tel: $phone', (){}),
        _row(Icons.notifications, 'Notifications', notif ? 'Activées - Tu reçois les livraisons' : 'Désactivées', null, isSwitch: true),
        _row(Icons.payment, 'Paiement', payment, (){}),
        _row(Icons.location_on, 'Mes Adresses', address, (){}),
        _row(Icons.history, 'Mes Commandes', '12 commandes • Voir l\'historique', (){}),
        _row(Icons.language, 'Langue', '$lang • Français, Bambara, English, Español, Arabe, Turc...', (){}),
        _row(Icons.dark_mode, 'Mode Sombre', darkMode ? 'Activé - Noir & Or' : 'Désactivé', null, isSwitch2: true),
        _row(Icons.help, 'Aide - EARN AI ✨', 'Parler à EARN AI, il répond en Bambara aussi', (){}),
        _row(Icons.shield, 'Confidentialité', 'Tes données restent à Bamako, privées', (){}),
        _row(Icons.info, 'À propos EARN OS', 'Version V3.6 • Le luxe du monde, livré à Bamako', (){}),
        SizedBox(height:10),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(12)), child: Center(child: Text('Déconnexion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
        SizedBox(height:8),
        Text('EARN OS V3.6 - Tu commandes seulement. Pas de boutique à gérer ici.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize:11)),
      ]))),
    );
  }
  Widget _row(IconData icon, String title, String sub, VoidCallback? onTap, {bool isSwitch=false, bool isSwitch2=false}){
    return GestureDetector(onTap: onTap, child: Container(margin: EdgeInsets.only(bottom:8), padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(12)), child: Row(children:[
      Container(padding: EdgeInsets.all(7), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: Icon(icon, color: EarnTheme.gold, size:20)),
      SizedBox(width:10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(title, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:14)), SizedBox(height:2), Text(sub, style: TextStyle(color: Colors.white60, fontSize:11), maxLines:2, overflow: TextOverflow.ellipsis)])),
      if(isSwitch) Switch(value: notif, activeColor: EarnTheme.gold, onChanged: (v)=>setState(()=>notif=v))
      else if(isSwitch2) Switch(value: darkMode, activeColor: EarnTheme.gold, onChanged: (v)=>setState(()=>darkMode=v))
      else Icon(Icons.arrow_forward_ios, color: EarnTheme.gold, size:14),
    ])));
  }
}
