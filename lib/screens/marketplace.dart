import 'package:flutter/material.dart';
import '../theme.dart';
class MarketplaceScreen extends StatelessWidget { const MarketplaceScreen({super.key});
  @override Widget build(BuildContext context){
    return ListView(padding: EdgeInsets.all(14), children:[
      // TITRE COMME TA PHOTO - UNE SEULE FOIS
      Center(child: Column(children:[
        Text('Global Brands Marketplace', style: TextStyle(color: EarnTheme.gold, fontSize:20, fontWeight: FontWeight.bold)),
        SizedBox(height:4), Text('Fashion • Electronics • Beauty • Luxury • Art • Food — from Paris, Dubai, USA, Mali & beyond', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold.withOpacity(0.8), fontSize:12)),
      ])),
      SizedBox(height:14),
      Container(padding: EdgeInsets.symmetric(horizontal:14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children:[Icon(Icons.search, color: EarnTheme.gold), SizedBox(width:8), Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: 'Search brands, products, countries...', hintStyle: TextStyle(color: Colors.white38)))), Icon(Icons.tune, color: EarnTheme.gold)])),
      SizedBox(height:16),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Text('Shop by Category', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:16)), Text('See all >', style: TextStyle(color: EarnTheme.gold))]),
      SizedBox(height:10),
      SizedBox(height:78, child: ListView(scrollDirection: Axis.horizontal, children:[
        _cat('👗','Fashion'), _cat('📱','Electronics'), _cat('💄','Beauty'), _cat('💎','Luxury'), _cat('🍽️','Food'), _cat('🎨','Art'),
      ])),
      SizedBox(height:16),
      Text('Featured for You — Global Picks', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:16)),
      SizedBox(height:10),
      GridView.count(crossAxisCount:2, shrinkWrap:true, physics: NeverScrollableScrollPhysics(), childAspectRatio:0.72, crossAxisSpacing:12, mainAxisSpacing:12, children:[
        _prod('Paris • Fashion','Haute Couture Collection','Designer • France','€280','https://images.unsplash.com/photo-1509631179647-0177331693ae?w=400'),
        _prod('Dubai • Luxury','Luxury Watch & Perfume','Premium Brands • UAE','AED 1,250','https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400'),
        _prod('USA • Tech','Noise-Cancelling Headphones','Apple • Samsung Tech','\$199','https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400'),
        _prod('Mali • Art','Handcrafted Textile Art','Artisan • Mali','\$85','https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?w=400'),
      ]),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(16)), child: Column(children:[
        Text('Just For You', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        Text('Discover curated luxury from 120+ countries', style: TextStyle(color: Colors.white70, fontSize:12)),
        SizedBox(height:10), Wrap(spacing:8, runSpacing:8, children:['CHANEL','SAMSUNG','SEPHORA','BOSS','SONY'].map((e)=>Container(padding: EdgeInsets.symmetric(horizontal:10, vertical:6), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)), child: Text(e, style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold)))).toList()),
      ])),
      SizedBox(height:10),
      Center(child: Text('🌍 EARN AI en haut à droite ✨ - Clique sur ✨ pour parler - Toutes langues • Español 🇪🇸', style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold))),
    ]);
  }
  Widget _cat(String e, String t)=>Container(width:90, margin: EdgeInsets.only(right:10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[Text(e, style: TextStyle(fontSize:26)), SizedBox(height:4), Text(t, style: TextStyle(color: Colors.white, fontSize:12))])); 
  Widget _prod(String tag, String title, String sub, String price, String img)=>Container(decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(14)), child: Column(children:[
    Expanded(child: ClipRRect(borderRadius: BorderRadius.vertical(top: Radius.circular(13)), child: Stack(children:[Image.network(img, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s)=>Container(color: Colors.black, child: Center(child: Text('✨', style: TextStyle(fontSize:40))))), Positioned(top:8, left:8, child: Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:4), color: EarnTheme.gold, child: Text(tag, style: TextStyle(color: Colors.black, fontSize:10, fontWeight: FontWeight.bold))))]))),
    Padding(padding: EdgeInsets.all(10), child: Column(children:[Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:12)), Text(sub, style: TextStyle(color: EarnTheme.gold, fontSize:10)), SizedBox(height:4), Text(price, style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold, fontSize:15))])),
  ]));
}
