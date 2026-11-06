import 'package:flutter/material.dart';
import '../theme.dart';
class DeliveryScreen extends StatelessWidget { const DeliveryScreen({super.key});
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: Color(0xFF0A1A3A), appBar: AppBar(backgroundColor: Color(0xFF0A1A3A), title: Text('EARN OS - Global Delivery OS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
    body: ListView(padding: EdgeInsets.all(14), children:[
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(16)), child: Column(children:[Text('Commandez • Suivez • Recevez', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:18)), Text('plus rapidement !', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), SizedBox(height:8), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[_badge('🛵','Livraison rapide'), _badge('📍','Suivi GPS'), _badge('💳','E-Wallet EARN'), _badge('🛡️','Paiement sécurisé')])])),
      SizedBox(height:14),
      Text('Bonjour Youssouf 👋  Bamako, Mali', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      SizedBox(height:10),
      Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Row(children:[Icon(Icons.check_circle, color: Colors.green), SizedBox(width:8), Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text('Commande confirmée', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), Text('#EARN12345 • 12 oct. 2026 • 14:30', style: TextStyle(color: Colors.grey))])]),
        SizedBox(height:12), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[Text('✅ Confirmée', style: TextStyle(color: Colors.green)), Text('🛵 En livraison', style: TextStyle(color: Colors.black)), Text('✅ Livrée', style: TextStyle(color: Colors.grey))]),
        SizedBox(height:12), Container(height:120, decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(12)), child: Center(child: Text('🗺️  Bamako • Livreur à 2.3 km\nMoussa Traoré • ★ 4.9 • Arrivée: 5 min', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
        SizedBox(height:10), Row(children:[Expanded(child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A1A3A)), child: Text('Voir sur la carte', style: TextStyle(color: Colors.white)))), SizedBox(width:8), Expanded(child: OutlinedButton(onPressed: (){}, child: Text('Contacter le livreur')))]),
      ])),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('Espace Marchand • Ma Boutique', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(height:10), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[_stat('128','Commandes'), _stat('2.5M','FCFA Ventes'), _stat('4.9★','Note')]),
        SizedBox(height:10), Text('Mon chiffre d\'affaires: 2 500 000 FCFA  +12%', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ])),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Column(children:[
        Text('Livreur • En ligne', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        Text('Nouvelle mission #EARN12345 • À 2.3 km', style: TextStyle(color: Colors.grey)),
        Text('Gain estimé: 2 500 FCFA', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:18)),
        SizedBox(height:8), SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow), child: Text('Accepter', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
      ])),
    ]));
  }
  Widget _badge(String e, String l)=>Column(children:[Text(e, style: TextStyle(fontSize:22)), Text(l, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize:9, fontWeight: FontWeight.bold))]);
  Widget _stat(String v, String l)=>Column(children:[Text(v, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:18)), Text(l, style: TextStyle(color: Colors.grey, fontSize:11))]);
}
