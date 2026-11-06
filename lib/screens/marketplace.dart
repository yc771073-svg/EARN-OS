import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/country_service.dart';
class MarketplaceScreen extends StatelessWidget { const MarketplaceScreen({super.key});
  @override Widget build(BuildContext context){
    // PAYS AUTO: Pour toi, c'est Mali - Bamako. Si un Français ouvre, c'est France auto.
    String myCountry = 'ML'; // Détecté auto par GPS dans la vraie version
    var info = CountryService.countries[myCountry]!;
    var locals = CountryService.localProducts(myCountry);
    var globals = CountryService.globalBrands;
    return ListView(padding: EdgeInsets.all(14), children:[
      // BANDE PAYS AUTO
      Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(14)), child: Row(children:[
        Text(info['flag']!, style: TextStyle(fontSize:28)),
        SizedBox(width:10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text('Tu es à ${info['city']} - ${info['name']}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:15)),
          Text('On te montre d\'abord les produits de ton pays 🇲🇱 + les marques mondiales', style: TextStyle(color: Colors.black, fontSize:11)),
        ])),
        Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)), child: Text('AUTO 📍', style: TextStyle(color: Colors.white, fontSize:10, fontWeight: FontWeight.bold))),
      ])),
      SizedBox(height:14),
      Center(child: Column(children:[
        Text('Global Brands Marketplace', style: TextStyle(color: EarnTheme.gold, fontSize:20, fontWeight: FontWeight.bold)),
        Text('Fashion • Electronics • Beauty • Luxury • Art • Food', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold.withOpacity(0.8), fontSize:12)),
      ])),
      SizedBox(height:14),
      Container(padding: EdgeInsets.symmetric(horizontal:14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children:[Icon(Icons.search, color: EarnTheme.gold), SizedBox(width:8), Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Search brands, products, countries...', hintStyle: TextStyle(color: Colors.white38)))), Icon(Icons.tune, color: EarnTheme.gold)])),
      SizedBox(height:16),
      // SECTION 1: PRODUITS DE TON PAYS EN PREMIER - AUTO
      Row(children:[Text('${info['flag']}  Pour Toi au ${info['name']} - Produits Locaux', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15))]),
      Text('Parce que tu es à ${info['city']}, on te montre ça en premier', style: TextStyle(color: Colors.white60, fontSize:11)),
      SizedBox(height:10),
      SizedBox(height:220, child: ListView(scrollDirection: Axis.horizontal, children: locals.map((p)=>Container(width:170, margin: EdgeInsets.only(right:12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Expanded(child: ClipRRect(borderRadius: BorderRadius.vertical(top: Radius.circular(13)), child: Image.network(p['img']!, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(color: Colors.black, child: Center(child: Text('🇲🇱', style: TextStyle(fontSize:40))))))),
        Padding(padding: EdgeInsets.all(8), child: Column(children:[Text(p['name']!, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:12)), Text(p['city']!, style: TextStyle(color: EarnTheme.gold, fontSize:10)), Text(p['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))])),
      ]))).toList())),
      SizedBox(height:18),
      // SECTION 2: MARQUES MONDIALES - TOUT LE MONDE LES VOIT
      Row(children:[Text('🌍  Marques Mondiales - Pour Tout Le Monde', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15))]),
      Text('Tesla, Nike, Apple, Chanel... visibles au Mali, en France, à Dubai, partout. Tu peux commander.', style: TextStyle(color: Colors.white60, fontSize:11)),
      SizedBox(height:10),
      GridView.count(crossAxisCount:2, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), childAspectRatio:0.85, crossAxisSpacing:12, mainAxisSpacing:12, children: globals.map((b)=>Container(decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Container(padding: EdgeInsets.all(14), child: Text(b['emoji']!, style: TextStyle(fontSize:36))),
        Text(b['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:14)),
        Text(b['cat']!, style: TextStyle(color: EarnTheme.gold, fontSize:11)),
        SizedBox(height:4), Text(b['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        SizedBox(height:4), Padding(padding: EdgeInsets.symmetric(horizontal:8), child: Text(b['desc']!, textAlign: TextAlign.center, style: TextStyle(color: Colors.white60, fontSize:10))),
        SizedBox(height:8),
        Container(padding: EdgeInsets.symmetric(horizontal:14, vertical:6), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11))),
      ]))).toList()),
      SizedBox(height:14),
      // EXEMPLE TESLA
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(16)), child: Column(children:[
        Text('🚗  EXEMPLE TESLA', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:16)),
        Text('Tu es à Bamako, tu vois Tesla. Un Français à Paris voit aussi Tesla. Un Américain aussi.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize:12)),
        Text('Tu commandes Tesla depuis Bamako -> EARN OS organise la livraison internationale + dédouanement + livreur à Bamako.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize:12, fontWeight: FontWeight.bold)),
        SizedBox(height:8), Text('Tesla Model 3 - €45,000 - Livraison Mondiale 🌍', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ])),
      SizedBox(height:10),
      Center(child: Text('📍 Pays Auto: Mali 🇲🇱 pour toi • Change auto si tu voyages • ✨ EARN AI en haut à droite', style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold))),
    ]);
  }
}
