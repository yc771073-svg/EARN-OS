import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/country_service.dart';
import '../services/food_service.dart';
import 'cart_order_screen.dart';
class MarketplaceScreen extends StatefulWidget { const MarketplaceScreen({super.key}); @override State<MarketplaceScreen> createState()=>_MState(); }
class _MState extends State<MarketplaceScreen> {
  String selectedCat = 'Food';
  @override Widget build(BuildContext context){
    var locals = CountryService.localProducts('ML');
    var globals = CountryService.globalBrands;
    var foods = FoodService.restaurantsBamako;
    // Categories comme ta photo - Shop by Category
    var cats = [
      {'name':'Fashion','icon':'👗','emoji':'👗'},
      {'name':'Electronics','icon':'📱','emoji':'📱'},
      {'name':'Beauty','icon':'💄','emoji':'💄'},
      {'name':'Luxury','icon':'💎','emoji':'💎'},
      {'name':'Food','icon':'🍽️','emoji':'🍽️'},
      {'name':'Art','icon':'🎨','emoji':'🎨'},
    ];
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
      SizedBox(height:16),
      // SHOP BY CATEGORY - EXACTEMENT COMME TA PHOTO
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
        Text('Shop by Category', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:16)),
        GestureDetector(onTap: (){}, child: Text('See all >', style: TextStyle(color: EarnTheme.gold, fontSize:14))),
      ]),
      SizedBox(height:10),
      SizedBox(height: 105, child: ListView(scrollDirection: Axis.horizontal, children: cats.map((c){
        bool sel = selectedCat == c['name'];
        return GestureDetector(onTap: ()=>setState(()=>selectedCat=c['name']!), child: Container(width: 92, margin: EdgeInsets.only(right:10), decoration: BoxDecoration(color: sel ? EarnTheme.gold.withOpacity(0.15) : Colors.transparent, border: Border.all(color: EarnTheme.gold, width: 1.2), borderRadius: BorderRadius.circular(12)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
          // Icone fine comme ta photo - on utilise emoji grand et fin
          Text(c['emoji']!, style: TextStyle(fontSize:32, color: EarnTheme.gold)),
          SizedBox(height:8),
          Text(c['name']!, style: TextStyle(color: Colors.white, fontSize:12, fontWeight: FontWeight.w500)),
          if(sel) Container(margin: EdgeInsets.only(top:4), width:20, height:3, decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(2))),
        ])));
      }).toList())),
      SizedBox(height:6),
      Text('Tu as choisi: $selectedCat - Clique sur une case pour changer', style: TextStyle(color: Colors.white60, fontSize:11)),
      SizedBox(height:16),
      // SI TU CLIQUES FOOD, TU VOIS MANGER - SI TU CLIQUES FASHION, TU VOIS MODE, ETC.
      if(selectedCat=='Food') Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('🍔  Commander à Manger - Bamako', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
        Text('Comme Uber Eats - Poulet, Dibi, Pizza, Tô, Burger - Livré chaud', style: TextStyle(color: Colors.white60, fontSize:11)),
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
      ]) else if(selectedCat=='Fashion') Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('👗  Fashion - Bamako', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
        Text('Bogolan, Tissu Wax, Nike, Chanel...', style: TextStyle(color: Colors.white60, fontSize:11)),
        SizedBox(height:10),
        Column(children: locals.map((p)=>Container(margin: EdgeInsets.only(bottom:10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
          ClipRRect(borderRadius: BorderRadius.horizontal(left: Radius.circular(13)), child: Image.network(p['img']!, width:90, height:90, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(width:90, height:90, color: Colors.black, child: Center(child: Text('🇲🇱', style: TextStyle(fontSize:28)))))),
          Expanded(child: Padding(padding: EdgeInsets.all(8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(p['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:13)), Text(p['city']!, style: TextStyle(color: EarnTheme.gold, fontSize:11)), Text(p['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]))),
          Padding(padding: EdgeInsets.only(right:8), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11)))),
        ]))).toList()),
      ]) else Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('🌍  $selectedCat - Marques Mondiales', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
        Text('Tu commandes, EARN OS te livre à Bamako', style: TextStyle(color: Colors.white60, fontSize:11)),
        SizedBox(height:10),
        GridView.count(crossAxisCount:2, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), childAspectRatio:0.85, crossAxisSpacing:10, mainAxisSpacing:10, children: globals.map((b)=>Container(decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
          Padding(padding: EdgeInsets.all(10), child: Text(b['emoji']!, style: TextStyle(fontSize:32))),
          Text(b['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(b['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
          SizedBox(height:6),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11))),
        ]))).toList()),
      ]),
      SizedBox(height:14),
      Text('🇲🇱  Près de toi à Bamako', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15)),
      SizedBox(height:10),
      Column(children: locals.map((p)=>Container(margin: EdgeInsets.only(bottom:10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Row(children:[
        ClipRRect(borderRadius: BorderRadius.horizontal(left: Radius.circular(13)), child: Image.network(p['img']!, width:90, height:90, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(width:90, height:90, color: Colors.black, child: Center(child: Text('🇲🇱', style: TextStyle(fontSize:28)))))),
        Expanded(child: Padding(padding: EdgeInsets.all(8), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(p['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:13)), Text(p['city']!, style: TextStyle(color: EarnTheme.gold, fontSize:11)), Text(p['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]))),
        Padding(padding: EdgeInsets.only(right:8), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartOrderScreen())), child: Text('Commander', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:11)))),
      ]))).toList()),
    ]);
  }
}
