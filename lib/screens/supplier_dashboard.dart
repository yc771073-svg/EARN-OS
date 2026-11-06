import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/earn_logo.dart';
class SupplierDashboardScreen extends StatefulWidget { const SupplierDashboardScreen({super.key}); @override State<SupplierDashboardScreen> createState()=>_SupState(); }
class _SupState extends State<SupplierDashboardScreen> {
  bool authorized=false; bool subscribed=false; String plan='60€ / mois';
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('PUBLIC - Marques & Fournisseurs', style: TextStyle(color: EarnTheme.gold, fontSize:16, fontWeight: FontWeight.bold))),
    body: ListView(padding: EdgeInsets.all(14), children:[
      EarnLogoBig(),
      SizedBox(height:14),
      // AUTORISATION
      Container(padding: EdgeInsets.all(16), decoration: EarnTheme.goldBox, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Row(children:[Icon(authorized?Icons.verified:Icons.shield, color: EarnTheme.gold), SizedBox(width:8), Text(authorized?'✅ MARQUE AUTORISÉE':'🔒 AUTORISATION REQUISE', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]),
        SizedBox(height:8),
        Text('Pour vendre sur EARN OS en PUBLIC, chaque marque / fournisseur doit être autorisée par EARN OS.', style: TextStyle(color: Colors.white)),
        Text('• Vérification identité / boutique\n• Vérification produits (pas de faux)\n• Acceptation des règles EARN OS\n• Paiement abonnement 60€ / mois', style: TextStyle(color: EarnTheme.gold, fontSize:12)),
        SizedBox(height:10),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>setState(()=>authorized=true), child: Text(authorized?'AUTORISATION OBTENUE ✅':'DEMANDER AUTORISATION'))),
      ])),
      SizedBox(height:14),
      // ABONNEMENT 60€
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(16)), child: Column(children:[
        Text('ABONNEMENT MARQUE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        Text('60€ par mois', style: TextStyle(color: Colors.black, fontSize:28, fontWeight: FontWeight.bold)),
        Text('= 39.000 FCFA / mois', style: TextStyle(color: Colors.black)),
        SizedBox(height:8), Text('✅ Boutique publique illimitée\n✅ Vendre dans 120+ pays\n✅ EARN AI pour tes clients\n✅ Livreur EARN OS inclus\n✅ Paiement mondial (Orange, Wave, Visa, PayPal)', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize:12)),
        SizedBox(height:10),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>setState(()=>subscribed=true), style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: Text(subscribed?'ABONNÉ ✅ - 60€ / MOIS':'S\'ABONNER - 60€ / MOIS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
        if(!authorized) Text('⚠️ Il faut d\'abord l\'autorisation', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      ])),
      SizedBox(height:14),
      // COMMENT ILS RECOIVENT L'ARGENT
      Text('💰 COMMENT LES MARQUES ET LIVREURS REÇOIVENT LEUR ARGENT', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      SizedBox(height:10),
      Container(padding: EdgeInsets.all(14), decoration: EarnTheme.goldBox, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('EXEMPLE: Client paie 50.000 FCFA pour Nike', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(height:8),
        _money('🛒 Client paie', '50.000 FCFA', 'Orange Money / Visa / PayPal'),
        _money('🏪 Marque reçoit', '40.000 FCFA (80%)', 'Chaque lundi - Orange Money / Banque / PayPal'),
        _money('🛵 Livreur reçoit', '5.000 FCFA (10%)', 'Dès livraison terminée - E-Wallet EARN'),
        _money('👑 EARN OS garde', '5.000 FCFA (10%)', 'Commission + Abonnement 60€ / mois'),
        SizedBox(height:8), Text('• Marque: virement automatique chaque semaine\n• Livreur: argent instantané sur son portefeuille EARN, il peut retirer en Orange Money / Wave\n• Tout est tracé dans l\'app: Mes Gains', style: TextStyle(color: EarnTheme.gold, fontSize:12)),
      ])),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(14), decoration: EarnTheme.goldBox, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('📍 COMMENT EARN OS TROUVE LE LIVREUR ?', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        Text('1. GPS: cherche livreurs à moins de 3 km\n2. Note: choisit 4.9★ comme Moussa à 2.3 km\n3. Envoie mission: "Gain 2 500 FCFA"\n4. Livreur clique ACCEPTER\n5. Tu suis sur la carte en temps réel', style: TextStyle(color: Colors.white, fontSize:12)),
      ])),
      SizedBox(height:14),
      Text('🌍 LANGUES: Français • English • Bambara • العربية • Türkçe • Español 🇪🇸 • Português • Deutsch • Italiano • 中文 • Wolof • Hausa', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold)),
    ]));
  }
  Widget _money(String t, String v, String sub)=>Container(margin: EdgeInsets.only(bottom:8), padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.4)), borderRadius: BorderRadius.circular(10)), child: Row(children:[Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(t, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(sub, style: TextStyle(color: EarnTheme.gold, fontSize:11))])), Text(v, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]));
}
