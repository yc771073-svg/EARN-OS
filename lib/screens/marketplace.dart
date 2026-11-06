import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/country_service.dart';
import '../services/food_service.dart';
import 'earn_ai.dart';
import 'settings.dart';
import 'cart_order_screen.dart';
class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});
  @override Widget build(BuildContext context) {
    final cats = ['Fashion','Electronics','Beauty','Luxury','Food','Art'];
    final catEmojis = ['👗','📱','💄','💎','🍔','🎨'];
    final foods = FoodService.restaurantsBamako;
    final locals = CountryService.localProducts('ML');
    return Scaffold(backgroundColor: EarnTheme.black,
      appBar: AppBar(backgroundColor: EarnTheme.black, leading: IconButton(icon: Icon(Icons.settings, color: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingsScreen()))), title: Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, letterSpacing: 3)), centerTitle: true, actions: [
        IconButton(icon: Icon(Icons.shopping_cart, color: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CartOrderScreen()))),
        IconButton(icon: Icon(Icons.star, color: EarnTheme.gold), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>EarnAIScreen()))),
      ]),
      body: ListView(padding: EdgeInsets.all(16), children:[
        Text('Shop by Category', style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)),
        SizedBox(height:10),
        SizedBox(height:80, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: cats.length, itemBuilder: (c,i)=>Container(width:70, margin: EdgeInsets.only(right:10), decoration: BoxDecoration(color: EarnTheme.blackCard, borderRadius: BorderRadius.circular(12), border: Border.all(color: EarnTheme.gold)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[Text(catEmojis[i], style: TextStyle(fontSize:24)), Text(cats[i], style: TextStyle(color: Colors.white, fontSize:11))])))),
        SizedBox(height:16),
        Text('Commander a Manger - Bamako', style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)),
        SizedBox(height:10),
        ...foods.map((f)=>Container(margin: EdgeInsets.only(bottom:10), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.blackCard, borderRadius: BorderRadius.circular(12)), child: Row(children:[Text(f['emoji']!, style: TextStyle(fontSize:28)), SizedBox(width:10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(f['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('${f['dish']} - ${f['quartier']} - ${f['time']} - ${f['rating']} ⭐', style: TextStyle(color: Colors.white54, fontSize:11))])), Text(f['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]))),
        SizedBox(height:16),
        Text('Produits Locaux - Mali', style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold)),
        SizedBox(height:10),
        ...locals.map((p)=>Container(margin: EdgeInsets.only(bottom:10), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.blackCard, borderRadius: BorderRadius.circular(12)), child: Row(children:[Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(p['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(p['city']!, style: TextStyle(color: Colors.white54, fontSize:11))])), Text(p['price']!, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]))),
      ]));
  }
}
