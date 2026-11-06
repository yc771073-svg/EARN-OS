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

  // POUR LES MARQUES SEULEMENT - PAR DEFAUT, C'EST CLIENT, DONC CACHÉ
  bool isBrand = false; // false = Client normal, ne voit rien. true = Marque, voit Carte Commerce + Bancaire
  String brandName = '';
  String commerceCardNumber = '';
  String bankRIB = '';
  String bankCardLast4 = '';
  bool commerceCardUploaded = false;
  bool bankVerified = false;

  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black,
      appBar: AppBar(backgroundColor: EarnTheme.black, elevation: 0, leading: IconButton(icon: Icon(Icons.arrow_back, color: EarnTheme.gold), onPressed: ()=>Navigator.pop(context)), title: Text('Paramètres', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(padding: EdgeInsets.all(14), child: Column(children:[
        Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(16)), child: Column(children:[
          Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:22, fontWeight: FontWeight.bold, letterSpacing:3)),
          Text('Global • Luxe • Bamako', style: TextStyle(color: Colors.white70, fontSize:12)),
          SizedBox(height:6), Text('🌍 PARLE TOUTES LES LANGUES • 🇪🇸 Español inclus', style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold)),
        ])),
        SizedBox(height:14),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
          CircleAvatar(radius:30, backgroundColor: EarnTheme.gold, child: Text('Y', style: TextStyle(color: Colors.black, fontSize:22, fontWeight: FontWeight.bold))),
          SizedBox(width:10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Text(name, style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)),
            Text(address, style: TextStyle(color: Colors.white60, fontSize:11), maxLines:1, overflow: TextOverflow.ellipsis),
            Text(email, style: TextStyle(color: Colors.white60, fontSize:11)),
            SizedBox(height:5),
            Row(children:[
              Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text(isBrand ? 'MARQUE VÉRIFIÉE ✅' : 'PRO MEMBER ✨', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:10))),
              SizedBox(width:5),
              Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text('⭐ 4.9', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:10))),
            ]),
          ])),
          Icon(Icons.edit, color: EarnTheme.gold, size:20),
        ])),
        SizedBox(height:14),
        Align(alignment: Alignment.centerLeft, child: Text('MON COMPTE', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:14, letterSpacing:1))),
        SizedBox(height:8),
        _row(Icons.person, 'Mon Profil', 'Nom: $name • Tel: $phone', (){}),
        _row(Icons.notifications, 'Notifications', notif ? 'Activées - Tu reçois les livraisons' : 'Désactivées', null, isSwitch: true),
        _row(Icons.payment, 'Paiement', payment, (){}),
        _row(Icons.location_on, 'Mes Adresses', address, (){}),
        _row(Icons.history, 'Mes Commandes', '12 commandes • Voir l\'historique', (){}),
        _row(Icons.language, 'Langue', '$lang • Français, Bambara, English, Español...', (){}),
        _row(Icons.dark_mode, 'Mode Sombre', darkMode ? 'Activé - Noir & Or' : 'Désactivé', null, isSwitch2: true),
        _row(Icons.help, 'Aide - EARN AI ✨', 'Parler à EARN AI, il répond en Bambara aussi', (){}),
        SizedBox(height:14),
        // -------------------------------------------------
        // SECTION MARQUE - SEULEMENT POUR LES MARQUES - DANS PARAMETRES
        // -------------------------------------------------
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
          Row(children:[
            Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: Icon(Icons.store, color: EarnTheme.gold)),
            SizedBox(width:10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
              Text('Tu es une Marque ?', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:14)),
              Text('Seulement pour les marques inscrites. Les clients ne voient pas ça.', style: TextStyle(color: Colors.white60, fontSize:11)),
            ])),
            Switch(value: isBrand, activeColor: EarnTheme.gold, onChanged: (v)=>setState(()=>isBrand=v)),
          ]),
          if(isBrand) Column(children:[
            SizedBox(height:12),
            Divider(color: EarnTheme.gold),
            SizedBox(height:8),
            Align(alignment: Alignment.centerLeft, child: Text('🏪  COMPTE MARQUE - VÉRIFICATION', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:13))),
            Text('Pour recevoir ton argent (70%), EARN OS doit vérifier que tu es une vraie marque.', style: TextStyle(color: Colors.white60, fontSize:11)),
            SizedBox(height:12),
            // 1. NOM DE LA MARQUE
            _brandField('Nom de ta Marque / Boutique', 'Ex: Pizza Bamako, Dibi Grill...', Icons.store, (v)=>brandName=v),
            SizedBox(height:10),
            // 2. CARTE DE COMMERCE - PHOTO
            Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(12)), child: Column(children:[
              Row(children:[Icon(Icons.badge, color: EarnTheme.gold), SizedBox(width:8), Expanded(child: Text('1. Carte de Commerce', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:14))), if(commerceCardUploaded) Icon(Icons.check_circle, color: Colors.green)]),
              SizedBox(height:6),
              Text('Prends en photo ta Carte de Commerce / Registre de Commerce du Mali. Obligatoire pour vendre sur EARN OS.', style: TextStyle(color: Colors.white60, fontSize:11)),
              SizedBox(height:10),
              _brandField('Numéro Carte de Commerce', 'Ex: RC/BKO/2024/12345', Icons.numbers, (v)=>commerceCardNumber=v),
              SizedBox(height:10),
              GestureDetector(onTap: ()=>setState(()=>commerceCardUploaded=true), child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: commerceCardUploaded ? Colors.green.withOpacity(0.2) : EarnTheme.gold, borderRadius: BorderRadius.circular(10)), child: Row(mainAxisAlignment: MainAxisAlignment.center, children:[Icon(commerceCardUploaded ? Icons.check : Icons.camera_alt, color: commerceCardUploaded ? Colors.green : Colors.black), SizedBox(width:8), Text(commerceCardUploaded ? 'Photo Ajoutée ✅ - En vérification' : '📸 Prendre en Photo ma Carte de Commerce', style: TextStyle(color: commerceCardUploaded ? Colors.green : Colors.black, fontWeight: FontWeight.bold, fontSize:12))]))),
            ])),
            SizedBox(height:10),
            // 3. CARTE BANCAIRE / RIB - POUR RECEVOIR L'ARGENT
            Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(12)), child: Column(children:[
              Row(children:[Icon(Icons.credit_card, color: EarnTheme.gold), SizedBox(width:8), Expanded(child: Text('2. Carte Bancaire / RIB - Pour recevoir ton argent', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:14))), if(bankVerified) Icon(Icons.check_circle, color: Colors.green)]),
              SizedBox(height:6),
              Text('C\'est ici que EARN OS t\'enverra tes 70% après chaque livraison. Sécurisé, personne ne voit ton numéro complet.', style: TextStyle(color: Colors.white60, fontSize:11)),
              SizedBox(height:10),
              Row(children:[
                Expanded(child: GestureDetector(onTap: ()=>setState(()=>bankVerified=false), child: Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(10)), child: Column(children:[Text('🏦', style: TextStyle(fontSize:22)), Text('RIB / Compte Bancaire', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11))])))),
                SizedBox(width:8),
                Expanded(child: GestureDetector(onTap: ()=>setState(()=>bankVerified=false), child: Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(10)), child: Column(children:[Text('💳', style: TextStyle(fontSize:22)), Text('Carte Bancaire', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:11))])))),
                SizedBox(width:8),
                Expanded(child: GestureDetector(onTap: ()=>setState(()=>bankVerified=false), child: Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(10)), child: Column(children:[Text('📱', style: TextStyle(fontSize:22)), Text('Orange Money Pro', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:11))])))),
              ]),
              SizedBox(height:10),
              _brandField('RIB / IBAN - Compte pour recevoir l\'argent', 'Ex: ML... - Banque: BIM, BDM, Ecobank...', Icons.account_balance, (v)=>bankRIB=v),
              SizedBox(height:8),
              _brandField('Numéro Orange Money Pro (si tu choisis Orange)', 'Ex: +223 70 00 00 00', Icons.phone, (v)=>bankCardLast4=v),
              SizedBox(height:10),
              GestureDetector(onTap: ()=>setState(()=>bankVerified=true), child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: bankVerified ? Colors.green.withOpacity(0.2) : EarnTheme.gold, borderRadius: BorderRadius.circular(10)), child: Center(child: Text(bankVerified ? '✅ Compte Vérifié - Tu peux recevoir ton argent' : 'Vérifier Mon Compte Bancaire', style: TextStyle(color: bankVerified ? Colors.green : Colors.black, fontWeight: FontWeight.bold))))),
            ])),
            SizedBox(height:12),
            Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(10)), child: Row(children:[Icon(Icons.lock, color: EarnTheme.gold, size:18), SizedBox(width:8), Expanded(child: Text('Sécurisé: Ton numéro de carte est caché. Seul EARN OS le voit pour t\'envoyer ton argent. Les clients ne le voient jamais.', style: TextStyle(color: Colors.white60, fontSize:11)))])),
            SizedBox(height:10),
            Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(10)), child: Center(child: Text('Envoyer pour Vérification - EARN OS va vérifier en 24h', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:13)))),
          ]),
        ])),
        SizedBox(height:14),
        _row(Icons.shield, 'Confidentialité', 'Tes données restent à Bamako, privées', (){}),
        _row(Icons.info, 'À propos EARN OS', 'Version V3.9 • Le luxe du monde, livré à Bamako', (){}),
        SizedBox(height:10),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(12)), child: Center(child: Text('Déconnexion', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
        SizedBox(height:8),
        Text('EARN OS V3.9 - Tu commandes seulement. Pas de boutique à gérer ici.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize:11)),
      ]))),
    );
  }
  Widget _brandField(String label, String hint, IconData icon, Function(String) onChanged){
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
      Text(label, style: TextStyle(color: EarnTheme.gold, fontSize:12, fontWeight: FontWeight.bold)),
      SizedBox(height:4),
      Container(padding: EdgeInsets.symmetric(horizontal:10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(10)), child: Row(children:[Icon(icon, color: EarnTheme.gold, size:18), SizedBox(width:8), Expanded(child: TextField(onChanged: onChanged, style: TextStyle(color: Colors.white, fontSize:13), decoration: InputDecoration(border: InputBorder.none, hintText: hint, hintStyle: TextStyle(color: Colors.white38, fontSize:12))))])),
    ]);
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
