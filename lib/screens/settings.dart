import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/earn_logo.dart';
class SettingsScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const SettingsScreen({super.key, required this.onLocaleChange});
  @override State<SettingsScreen> createState()=>_SetState();
}
class _SetState extends State<SettingsScreen> {
  bool notif=true; bool dark=true; bool bio=false;
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black,
    appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Paramètres', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))),
    body: ListView(padding: EdgeInsets.all(14), children:[
      // LOGO + PROFIL EN HAUT
      EarnLogoBig(),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(16), decoration: EarnTheme.goldBox, child: Row(children:[
        Stack(children:[CircleAvatar(radius:36, backgroundColor: EarnTheme.gold, child: Text('Y', style: TextStyle(color: Colors.black, fontSize:28, fontWeight: FontWeight.bold))), Positioned(bottom:0, right:0, child: Container(padding: EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle), child: Icon(Icons.check, color: Colors.white, size:12)))]),
        SizedBox(width:14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text('Youssouf', style: TextStyle(color: Colors.white, fontSize:20, fontWeight: FontWeight.bold)), Text('Bamako, Mali • youssouf@earnos.io', style: TextStyle(color: Colors.white70, fontSize:12)), SizedBox(height:6), Row(children:[_badge('PRO MEMBER ✨'), SizedBox(width:6), _badge('⭐ 4.9')])])),
        Icon(Icons.edit, color: EarnTheme.gold),
      ])),
      SizedBox(height:14),
      // STATS
      Row(children:[_stat('2.5M','FCFA Gagné'), _stat('128','Ventes'), _stat('12','Pays')]),
      SizedBox(height:16), Text('MON COMPTE', style: TextStyle(color: EarnTheme.gold, letterSpacing:2, fontWeight: FontWeight.bold)),
      SizedBox(height:8),
      Container(decoration: EarnTheme.goldBox, child: Column(children:[
        _row('👤','Mon Profil', sub:'Nom, photo, téléphone'),
        _row('🔔','Notifications', trailing: _switch(notif, (v)=>setState(()=>notif=v))),
        _row('💳','Paiement', sub:'Orange Money • Visa ••• 4242'),
        _row('🚚','Adresse Livraison', sub:'Bamako, Mali'),
        _row('🏪','Ma Boutique', sub:'Devenir vendeur'),
        _row('🛵','Devenir Livreur', sub:'Gagne 10% par livraison'),
      ])),
      SizedBox(height:16), Text('PRÉFÉRENCES', style: TextStyle(color: EarnTheme.gold, letterSpacing:2, fontWeight: FontWeight.bold)),
      SizedBox(height:8),
      Container(decoration: EarnTheme.goldBox, child: Column(children:[
        _row('🌍','Langue', sub:'Français', onTap: ()=>widget.onLocaleChange(Locale('fr'))),
        _row('🌙','Mode Sombre', trailing: _switch(dark, (v)=>setState(()=>dark=v))),
        _row('🔐','Biométrie / Face ID', trailing: _switch(bio, (v)=>setState(()=>bio=v))),
        _row('💱','Devise', sub:'FCFA • EUR • USD • AED'),
      ])),
      SizedBox(height:16), Text('EARN OS BUSINESS', style: TextStyle(color: EarnTheme.gold, letterSpacing:2, fontWeight: FontWeight.bold)),
      SizedBox(height:8),
      Container(decoration: EarnTheme.goldBox, child: Column(children:[
        _row('💰','Mes Gains & Commissions', sub:'5% / 8% / 10% / 15%'),
        _row('📊','Statistiques', sub:'Ventes, vues, clients'),
        _row('🤖','EARN AI Pro', sub:'Assistant illimité'),
      ])),
      SizedBox(height:16), Text('SÉCURITÉ & AIDE', style: TextStyle(color: EarnTheme.gold, letterSpacing:2, fontWeight: FontWeight.bold)),
      SizedBox(height:8),
      Container(decoration: EarnTheme.goldBox, child: Column(children:[
        _row('🛡️','Sécurité & Confidentialité'),
        _row('❓','Aide & Support', sub:'Chat 24/7'),
        _row('📜','Conditions & Vie privée'),
        _row('🚪','Déconnexion', isRed:true),
      ])),
      SizedBox(height:16), Center(child: Text('EARN OS • Version 2.2.0 • Build 220 • © 2026 EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:11))),
    ]));
  }
  Widget _badge(String t)=>Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text(t, style: TextStyle(color: Colors.black, fontSize:10, fontWeight: FontWeight.bold)));
  Widget _stat(String v, String l)=>Expanded(child: Container(margin: EdgeInsets.only(right:8), padding: EdgeInsets.all(12), decoration: EarnTheme.goldBox, child: Column(children:[Text(v, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:16)), Text(l, style: TextStyle(color: Colors.white70, fontSize:11))])));
  Widget _switch(bool v, Function(bool) on)=>GestureDetector(onTap: ()=>on(!v), child: Container(padding: EdgeInsets.symmetric(horizontal:14, vertical:6), decoration: BoxDecoration(color: v?EarnTheme.gold:Colors.grey, borderRadius: BorderRadius.circular(20)), child: Text(v?'ON':'OFF', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))));
  Widget _row(String icon, String title, {String? sub, Widget? trailing, VoidCallback? onTap, bool isRed=false})=>GestureDetector(onTap: onTap, child: Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: EarnTheme.gold.withOpacity(0.2)))), child: Row(children:[Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: Text(icon)), SizedBox(width:12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(title, style: TextStyle(color: isRed?Colors.red:EarnTheme.gold, fontWeight: FontWeight.bold)), if(sub!=null) Text(sub, style: TextStyle(color: Colors.white70, fontSize:12))])), if(trailing!=null) trailing else Icon(Icons.arrow_forward_ios, color: EarnTheme.gold, size:14)])));
}
