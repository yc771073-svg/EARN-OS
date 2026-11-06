import 'package:flutter/material.dart';
import '../theme.dart';
class MarketplaceScreen extends StatelessWidget { const MarketplaceScreen({super.key});
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Row(children:[Text('◆ ', style: TextStyle(color: EarnTheme.gold)), Text('EARN OS', style: TextStyle(color: EarnTheme.gold, letterSpacing:2))]), actions:[Icon(Icons.notifications_none, color: EarnTheme.gold), SizedBox(width:14), Icon(Icons.favorite_border, color: EarnTheme.gold), SizedBox(width:12)]),
    body: ListView(padding: EdgeInsets.all(14), children:[
      Center(child: Text('Global Brands Marketplace', style: TextStyle(color: EarnTheme.gold, fontSize:18, fontWeight: FontWeight.bold))),
      Center(child: Text('Fashion • Electronics • Beauty • Luxury • Art • Food — from Paris, Dubai, USA, Mali & beyond', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold.withOpacity(0.8), fontSize:11))),
      SizedBox(height:12),
      Container(padding: EdgeInsets.symmetric(horizontal:12), decoration: EarnTheme.goldBorder, child: TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(border: InputBorder.none, hintText: 'Search brands, products, countries...', hintStyle: TextStyle(color: EarnTheme.gold.withOpacity(0.6)), icon: Icon(Icons.search, color: EarnTheme.gold)))),
      SizedBox(height:14),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Text('Shop by Category', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)), Text('See all >', style: TextStyle(color: EarnTheme.gold))]),
      SizedBox(height:10),
      SizedBox(height:70, child: ListView(scrollDirection: Axis.horizontal, children: [
        _cat('👗','Fashion'), _cat('📱','Electronics'), _cat('💄','Beauty'), _cat('💎','Luxury'), _cat('🍽️','Food'), _cat('🎨','Art'),
      ])),
      SizedBox(height:14), Text('Featured for You — Global Picks', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      SizedBox(height:10),
      GridView.count(crossAxisCount:2, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), childAspectRatio:0.72, crossAxisSpacing:10, mainAxisSpacing:10, children:[
        _prod('Paris • Fashion','👗','Haute Couture Collection','Designer • France','€280'),
        _prod('Dubai • Luxury','⌚','Luxury Watch & Perfume','Premium Brands • UAE','AED 1,250'),
        _prod('USA • Tech','🎧','Noise-Cancelling Headphones','Apple • Samsung Tech','\$199'),
        _prod('Mali • Art','🎭','Handcrafted Textile Art','Artisan • Mali','\$85'),
      ]),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(12), decoration: EarnTheme.goldBox, child: Column(children:[Text('Just For You', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)), Text('Discover curated luxury from 120+ countries', style: TextStyle(color: EarnTheme.gold, fontSize:11)), SizedBox(height:8), Wrap(spacing:6, runSpacing:6, children: ['CHANEL','SAMSUNG','SEPHORA','BOSS','SONY'].map((b)=>Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:6), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: Text(b, style: TextStyle(color: EarnTheme.gold, fontSize:10)))) .toList())])),
    ]));
  }
  Widget _cat(String e, String l)=>Container(width:70, margin: EdgeInsets.only(right:8), decoration: EarnTheme.goldBorder, child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[Text(e, style: TextStyle(fontSize:22)), SizedBox(height:4), Text(l, style: TextStyle(color: Colors.white, fontSize:10))])); 
  Widget _prod(String tag, String emoji, String title, String sub, String price)=>Container(decoration: EarnTheme.goldBorder, child: Column(children:[Container(height:110, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.vertical(top: Radius.circular(16))), child: Stack(children:[Center(child: Text(emoji, style: TextStyle(fontSize:60))), Positioned(left:6, top:6, child: Container(padding: EdgeInsets.symmetric(horizontal:6, vertical:3), color: EarnTheme.gold, child: Text(tag, style: TextStyle(color: Colors.black, fontSize:9, fontWeight: FontWeight.bold))))])), Padding(padding: EdgeInsets.all(8), child: Column(children:[Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:12)), Text(sub, style: TextStyle(color: EarnTheme.gold, fontSize:10)), Text(price, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))]))]));
}
