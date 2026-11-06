import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/delivery_service.dart';
class DeliveryScreen extends StatefulWidget { const DeliveryScreen({super.key}); @override State<DeliveryScreen> createState()=>_DState(); }
class _DState extends State<DeliveryScreen> {
  String _receiverName = '';
  String _receiverPhone = '';
  String _address = 'ACI 2000, Bamako';
  bool _sent = false;
  String _status = 'En attente...';
  @override Widget build(BuildContext context){
    var agent = DeliveryService.findNearestAgent(_address);
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('Livraison EARN OS', style: TextStyle(color: EarnTheme.gold))),
    body: ListView(padding: EdgeInsets.all(16), children:[
      // EXPLICATION COMME UBER
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Text('🚀  EARN OS S\'OCCUPE DE LA LIVRAISON', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:15)),
        Text('Toi tu commandes seulement. EARN OS envoie la notification au livreur. Le livreur livre.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize:12)),
      ])),
      SizedBox(height:16),
      Text('Pour qui tu commandes ?', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:16)),
      Text('Même si la personne n\'a PAS l\'application, elle sera livrée. Tu mets juste son nom et numéro.', style: TextStyle(color: Colors.white60, fontSize:12)),
      SizedBox(height:12),
      TextField(onChanged: (v)=>_receiverName=v, decoration: InputDecoration(labelText: 'Nom du destinataire - Ex: Maman à Sikasso', labelStyle: TextStyle(color: EarnTheme.gold), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: EarnTheme.gold)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: EarnTheme.gold)))),
      SizedBox(height:12),
      TextField(onChanged: (v)=>_receiverPhone=v, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: 'Numéro du destinataire - Ex: +223 70 00 00 00', labelStyle: TextStyle(color: EarnTheme.gold), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: EarnTheme.gold)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: EarnTheme.gold)))),
      SizedBox(height:12),
      TextField(onChanged: (v)=>_address=v, decoration: InputDecoration(labelText: 'Adresse de livraison - Ex: ACI 2000, Bamako', labelStyle: TextStyle(color: EarnTheme.gold), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: EarnTheme.gold)), focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: EarnTheme.gold)))),
      SizedBox(height:16),
      // BOUTON COMMANDER + ENVOYER AU LIVREUR
      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold, padding: EdgeInsets.symmetric(vertical:16)), onPressed: (){
        setState((){ _sent=true; _status='📲 Notification envoyée à ${agent['name']}... Il arrive !'; });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('EARN OS a envoyé la notification au livreur ${agent['name']} !')));
      }, child: Text(_sent ? 'Commande Envoyée au Livreur ✅' : 'Commander & Envoyer au Livreur 🚀', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:16))),
      SizedBox(height:16),
      if(_sent) Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Text('📲  NOTIFICATION ENVOYÉE PAR EARN OS', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        SizedBox(height:10),
        Row(children:[CircleAvatar(backgroundColor: EarnTheme.gold, child: Text('M', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))), SizedBox(width:10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text('${agent['name']} - ${agent['vehicle']}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text('${agent['quartier']} - ${agent['distance']} - ⭐ ${agent['rating']} - ${agent['status']}', style: TextStyle(color: EarnTheme.gold, fontSize:11)),
        ])), Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)), child: Text('ACCEPTÉ ✅', style: TextStyle(color: Colors.white, fontSize:11, fontWeight: FontWeight.bold)))]),
        SizedBox(height:10),
        Text(_status, style: TextStyle(color: Colors.white)),
        SizedBox(height:8),
        Text('Destinataire: ${_receiverName.isEmpty ? 'Toi' : _receiverName} - ${_receiverPhone.isEmpty ? '+223...' : _receiverPhone}', style: TextStyle(color: Colors.white70, fontSize:12)),
        Text('Adresse: $_address', style: TextStyle(color: Colors.white70, fontSize:12)),
        SizedBox(height:8),
        Text('Le livreur appelle le destinataire même s\'il n\'a pas l\'app. Il livre et tu reçois: "Livré ✅"', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold)),
        SizedBox(height:10),
        LinearProgressIndicator(value: 0.6, backgroundColor: Colors.white24, color: EarnTheme.gold),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Text('Commande', style: TextStyle(color: Colors.white60, fontSize:10)), Text('Livreur en route', style: TextStyle(color: EarnTheme.gold, fontSize:10, fontWeight: FontWeight.bold)), Text('Livré', style: TextStyle(color: Colors.white60, fontSize:10))]),
      ])),
      SizedBox(height:16),
      Text('Autres livreurs EARN OS disponibles à Bamako', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      SizedBox(height:8),
      Column(children: DeliveryService.agents.map((a)=>Container(margin: EdgeInsets.only(bottom:8), padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(12)), child: Row(children:[
        CircleAvatar(backgroundColor: EarnTheme.gold, child: Text(a['name'][0], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
        SizedBox(width:10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(a['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('${a['quartier']} - ${a['distance']} - ${a['vehicle']} - ⭐ ${a['rating']}', style: TextStyle(color: Colors.white60, fontSize:11))])),
        Text(a['status'], style: TextStyle(color: Colors.green, fontSize:11, fontWeight: FontWeight.bold)),
      ]))).toList()),
    ]));
  }
}
