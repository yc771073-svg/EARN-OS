import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/delivery_service.dart';
class CartOrderScreen extends StatefulWidget { const CartOrderScreen({super.key}); @override State<CartOrderScreen> createState()=>_CState(); }
class _CState extends State<CartOrderScreen> {
  bool _ordered=false;
  @override Widget build(BuildContext context){
    var agent = DeliveryService.findNearestAgent('Bamako');
    return ListView(padding: EdgeInsets.all(16), children:[
      Text('Mon Panier', style: TextStyle(color: EarnTheme.gold, fontSize:20, fontWeight: FontWeight.bold)),
      SizedBox(height:12),
      Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
        Text('🚗', style: TextStyle(fontSize:30)), SizedBox(width:10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text('Tesla Model 3', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('Marque Mondiale - Livraison EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:11))])),
        Text('€45,000', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      ])),
      SizedBox(height:12),
      Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
        Text('👟', style: TextStyle(fontSize:30)), SizedBox(width:10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text('Nike Air Max', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('Marque Mondiale', style: TextStyle(color: EarnTheme.gold, fontSize:11))])),
        Text('€120', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      ])),
      SizedBox(height:16),
      // PAIEMENT SIMPLE - PAS D'ONGLET PAY
      Text('Paiement', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      SizedBox(height:8),
      Row(children:[
        Expanded(child: Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(10)), child: Center(child: Text('Orange Money', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))),
        SizedBox(width:8),
        Expanded(child: Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(10)), child: Center(child: Text('Visa •••• 4242', style: TextStyle(color: Colors.white))))),
      ]),
      SizedBox(height:16),
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold, padding: EdgeInsets.symmetric(vertical:16)), onPressed: (){
        setState(()=>_ordered=true);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Commande confirmée ! EARN OS a envoyé au livreur en arrière-plan.')));
      }, child: Text(_ordered ? 'Commande Confirmée ✅' : 'Commander - EARN OS s\'occupe de la livraison', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      SizedBox(height:16),
      // APRES COMMANDE - TU VOIS JUSTE QUE LE LIVREUR ARRIVE - PAS DE PAGE DELIVERY
      if(_ordered) Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Row(children:[Icon(Icons.check_circle, color: Colors.green), SizedBox(width:8), Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text('Commande confirmée #EARN12345', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), Text('12 oct. 2026 • 14:30', style: TextStyle(color: Colors.black54, fontSize:12))])]),
        SizedBox(height:10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[Text('✅ Confirmée', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), Text('🛵 En livraison', style: TextStyle(color: Colors.black)), Text('✅ Livrée', style: TextStyle(color: Colors.black38))]),
        SizedBox(height:10),
        Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Color(0xFFE8F4FF), borderRadius: BorderRadius.circular(10)), child: Center(child: Text('🗺️ Bamako • Livreur à 2.3 km\n${agent['name']} • ⭐ ${agent['rating']} • Arrivée: 5 min', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
        SizedBox(height:10),
        Row(children:[Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A1A3A)), onPressed: (){}, child: Text('Voir sur la carte', style: TextStyle(color: Colors.white)))), SizedBox(width:8), Text('Contacter le livreur', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]),
        SizedBox(height:8),
        Text('EARN OS a envoyé la notification au livreur automatiquement. Tu n\'as rien à faire.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize:11)),
      ])),
    ]);
  }
}
