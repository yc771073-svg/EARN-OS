import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/country_service.dart';
import '../services/food_service.dart';
import 'cart_order_screen.dart';
class MarketplaceScreen extends StatelessWidget { const MarketplaceScreen({super.key});
  @override Widget build(BuildContext context){
    var locals = CountryService.localProducts('ML');
    var globals = CountryService.globalBrands;
    var foods = FoodService.restaurantsBamako;
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
      Container(padding: EdgeInsets.symmetric(horizontal:14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children:[Icon(Icons.search, color: EarnTheme.gold), SizedBox(width:8), Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Que veux-tu commander ? Pizza, Dibi, Nike...', hintStyle: TextStyle(color: Colors.white38))))])),
      SizedBox(height:14),
      // CATEGORIES - COMME UBER EATS
      Row(children:[
        _cat('🍔', 'Manger', true),
        _cat('👟', 'Mode', false),
        _cat('📱', 'Tech', false),
        _cat('💄', 'Beauté', false),
        _cat('🚗', 'Tesla', false),
      ]),
      SizedBox(height:16),
      // SECTION MANGER - NOUVEAU - OUI TU PEUX COMMANDER A MANGER
      Row(children:[Text('🍔  Commander à Manger - Bamako', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15))]),
      Text('Oui ! Comme Uber Eats - Poulet, Dibi, Pizza, Tô, Burger - Livré chaud à Bamako', style: TextStyle(color: Colors.white60, fontSize:11)),
      SizedBox(height:10),
      Column(children: foods.map((f)=>Container(margin: EdgeInsets.only(bottom:10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
        Container(width:80, height:80, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.horizontal(left: Radius.circular(13))), child: Center(child: Text(f['emoji']!, style: TextStyle(fontSize:32)))),
        Expanded(child: Padding(padding: EdgeInsets.all(8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          Text(f['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:13)),
          Text(f['dish']!, style: TextStyle(color: Colors.white70, fontSize:11)),
          Row(children:[Text('⭐ ${f['rating']!}  •  ', style: TextStyle(color: EarnTheme.gold, fontSize:11)), Text('${f['time']!}  •  ${f['quartier']!}', style: TextStyle(color: Colors.white60, fontSize:11))]),
          Text(f['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        ]))),
        Padding(padding: EdgeInsets.only(right:8), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold, padding: EdgeInsets.symmetric(horizontal:10, vertical:8)), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11)))),
      ]))).toList()),
      SizedBox(height:14),
      Text('🇲🇱  Près de toi à Bamako', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
      SizedBox(height:10),
      Column(children: locals.map((p)=>Container(margin: EdgeInsets.only(bottom:10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
        ClipRRect(borderRadius: BorderRadius.horizontal(left: Radius.circular(13)), child: Image.network(p['img']!, width:90, height:90, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(width:90, height:90, color: Colors.black, child: Center(child: Text('🇲🇱', style: TextStyle(fontSize:28)))))),
        Expanded(child: Padding(padding: EdgeInsets.all(8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(p['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:13)), Text(p['city']!, style: TextStyle(color: EarnTheme.gold, fontSize:11)), Text(p['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]))),
        Padding(padding: EdgeInsets.only(right:8), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11)))),
      ]))).toList()),
      SizedBox(height:14),
      Text('🌍  Marques Mondiales', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
      SizedBox(height:10),
      GridView.count(crossAxisCount:2, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), childAspectRatio:0.85, crossAxisSpacing:10, mainAxisSpacing:10, children: globals.map((b)=>Container(decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
        Padding(padding: EdgeInsets.all(10), child: Text(b['emoji']!, style: TextStyle(fontSize:32))),
        Text(b['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(b['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        SizedBox(height:6),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11))),
      ]))).toList()),
    ]);
  }
  Widget _cat(String e, String t, bool sel){ return Container(margin: EdgeInsets.only(right:8), padding: EdgeInsets.symmetric(horizontal:10, vertical:6), decoration: BoxDecoration(color: sel ? EarnTheme.gold : Colors.transparent, border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(20)), child: Text('$e $t', style: TextStyle(color: sel ? Colors.black : Colors.white, fontWeight: FontWeight.bold, fontSize:11))); }
}
