import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/country_service.dart';
import 'cart_order_screen.dart';
class MarketplaceScreen extends StatelessWidget { const MarketplaceScreen({super.key});
  @override Widget build(BuildContext context){
    String myCountry = 'ML';
    var info = CountryService.countries[myCountry]!;
    var locals = CountryService.localProducts(myCountry);
    var globals = CountryService.globalBrands;
    return ListView(padding: EdgeInsets.all(14), children:[
      Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(14)), child: Row(children:[
        Text('📍', style: TextStyle(fontSize:24)), SizedBox(width:8),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text('Livrer à Bamako - Mali 🇲🇱', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:15)),
          Text('Comme Uber - Tu commandes, on te livre', style: TextStyle(color: Colors.black, fontSize:11)),
        ])),
      ])),
      SizedBox(height:14),
      Text('Global Brands Marketplace', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold, fontSize:20, fontWeight: FontWeight.bold)),
      Text('Fashion • Electronics • Beauty • Luxury • Art • Food', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold.withOpacity(0.8), fontSize:12)),
      SizedBox(height:14),
      Container(padding: EdgeInsets.symmetric(horizontal:14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children:[Icon(Icons.search, color: EarnTheme.gold), SizedBox(width:8), Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Que veux-tu commander ?', hintStyle: TextStyle(color: Colors.white38))))])),
      SizedBox(height:16),
      Text('🇲🇱  Près de toi à Bamako', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
      Text('Boutiques de ton pays - Commande comme Uber Eats', style: TextStyle(color: Colors.white60, fontSize:11)),
      SizedBox(height:10),
      Column(children: locals.map((p)=>Container(margin: EdgeInsets.only(bottom:12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
        ClipRRect(borderRadius: BorderRadius.horizontal(left: Radius.circular(13)), child: Image.network(p['img']!, width:100, height:100, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(width:100, height:100, color: Colors.black, child: Center(child: Text('🇲🇱', style: TextStyle(fontSize:30)))))),
        Expanded(child: Padding(padding: EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text(p['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(p['city']!, style: TextStyle(color: EarnTheme.gold, fontSize:11)),
          Text(p['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        ]))),
        Padding(padding: EdgeInsets.only(right:10), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
      ]))).toList()),
      SizedBox(height:10),
      Text('🌍  Marques Mondiales - Commande Aussi', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
      Text('Tesla, Nike, Chanel... Tu commandes comme tu commandes un Uber', style: TextStyle(color: Colors.white60, fontSize:11)),
      SizedBox(height:10),
      GridView.count(crossAxisCount:2, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), childAspectRatio:0.85, crossAxisSpacing:12, mainAxisSpacing:12, children: globals.map((b)=>Container(decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Padding(padding: EdgeInsets.all(12), child: Text(b['emoji']!, style: TextStyle(fontSize:36))),
        Text(b['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(b['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        SizedBox(height:8),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11))),
      ]))).toList()),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Text('COMME UBER - SIMPLE', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:16)),
        Text('1. Tu choisis  2. Tu commandes  3. Tu paies  4. On te livre à Bamako', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize:12, fontWeight: FontWeight.bold)),
        Text('Pas de boutique à gérer. Tu es client, toujours.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize:11)),
      ])),
    ]);
  }
}
