import 'package:flutter/material.dart';
import '../theme.dart';
class WorldSelectorScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const WorldSelectorScreen({super.key, required this.onLocaleChange});
  @override State<WorldSelectorScreen> createState()=>_WorldState();
}
class _WorldState extends State<WorldSelectorScreen> {
  String selected='Mali'; String lang='English (EN)';
  final countries=[
    {'flag':'🇲🇱','name':'Mali','city':'Bamako — West Africa','code':'ML'},
    {'flag':'🇫🇷','name':'France','city':'Paris — Europe','code':'FR'},
    {'flag':'🇺🇸','name':'United States','city':'New York — North America','code':'US'},
    {'flag':'🇦🇪','name':'United Arab Emirates','city':'Dubai — Middle East','code':'AE'},
    {'flag':'🇹🇷','name':'Türkiye','city':'Istanbul — Europe/Asia','code':'TR'},
  ];
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black,
    appBar: AppBar(backgroundColor: EarnTheme.black, title: Row(children:[Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: Text('EARN\nOS', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold, fontSize:9, fontWeight: FontWeight.bold))), SizedBox(width:10), Text('E A R N  O S', style: TextStyle(color: EarnTheme.gold, letterSpacing: 4, fontWeight: FontWeight.w300))]), actions:[Icon(Icons.notifications, color: EarnTheme.gold), SizedBox(width:14), Icon(Icons.settings, color: EarnTheme.gold), SizedBox(width:14), CircleAvatar(backgroundColor: EarnTheme.black, child: Text('JS', style: TextStyle(color: EarnTheme.gold))), SizedBox(width:12)]),
    body: SingleChildScrollView(padding: EdgeInsets.all(14), child: Column(children:[
      Text('WORLD SELECTOR', style: TextStyle(color: EarnTheme.gold, fontSize:28, fontWeight: FontWeight.bold, letterSpacing: 2)),
      Text('Choose a region to launch your earning environment • Live • Secure • Global', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold.withOpacity(0.8), fontSize:12)),
      SizedBox(height:14),
      // CARTE MONDE LUXE
      Container(padding: EdgeInsets.all(14), decoration: EarnTheme.goldBox, child: Column(children:[
        Text('🌍  CARTE DU MONDE  •  5 Locations Active', style: TextStyle(color: EarnTheme.gold, fontSize:11)),
        SizedBox(height:10),
        Container(height:180, decoration: BoxDecoration(color: Colors.black, border: Border.all(color: EarnTheme.gold.withOpacity(0.4)), borderRadius: BorderRadius.circular(12)), child: Stack(children:[
          Center(child: Text('🗺️  WORLD MAP\nNew York • Paris • Dubai\nBamako • Istanbul', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold, fontSize:16, fontWeight: FontWeight.bold))),
          Positioned(left:20, top:60, child: _pin('New York • USA')),
          Positioned(left:130, top:40, child: _pin('Paris • France')),
          Positioned(left:180, top:70, child: _pin('Dubai • UAE')),
          Positioned(left:110, top:110, child: _pin('Bamako • Mali')),
        ])),
        SizedBox(height:8), Text('5 Locations Active • Real-time Data • Synced', style: TextStyle(color: EarnTheme.gold, fontSize:11)),
      ])),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(14), decoration: EarnTheme.goldBox, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Center(child: Text('COUNTRY SELECTOR', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))),
        SizedBox(height:10),
        Container(padding: EdgeInsets.symmetric(horizontal:12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: DropdownButton<String>(value: 'Global', isExpanded:true, dropdownColor: EarnTheme.blackCard, underline: SizedBox(), items: [DropdownMenuItem(value:'Global', child: Text('Global / All Regions', style: TextStyle(color: Colors.white)))], onChanged: (_){})),
        SizedBox(height:10),
        ...countries.map((c)=>GestureDetector(onTap:(){ setState(()=>selected=c['name']!); if(c['code']=='ML') widget.onLocaleChange(Locale('fr')); if(c['code']=='FR') widget.onLocaleChange(Locale('fr')); if(c['code']=='US') widget.onLocaleChange(Locale('en')); }, child: Container(margin: EdgeInsets.only(bottom:8), padding: EdgeInsets.all(10), decoration: BoxDecoration(color: selected==c['name']?EarnTheme.gold.withOpacity(0.2):Colors.transparent, border: Border.all(color: selected==c['name']?EarnTheme.gold:Colors.transparent), borderRadius: BorderRadius.circular(10)), child: Row(children:[Text(c['flag']!, style: TextStyle(fontSize:26)), SizedBox(width:10), Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(c['name']!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(c['city']!, style: TextStyle(color: EarnTheme.gold, fontSize:11))]), Spacer(), if(selected==c['name']!) Icon(Icons.check_circle, color: EarnTheme.gold)])))),
      ])),
      SizedBox(height:14),
      Container(padding: EdgeInsets.all(14), decoration: EarnTheme.goldBox, child: Column(children:[
        Text('LANGUAGE SELECTOR', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
        SizedBox(height:10),
        Container(padding: EdgeInsets.symmetric(horizontal:12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: DropdownButton<String>(value: lang, isExpanded:true, dropdownColor: EarnTheme.blackCard, underline: SizedBox(), items: ['English (EN)','Français','العربية','Türkçe','Bambara'].map((e)=>DropdownMenuItem(value:e, child: Text(e, style: TextStyle(color: Colors.white)))).toList(), onChanged: (v){ setState(()=>lang=v!); })),
        SizedBox(height:8), Text('Additional: Français • العربية • Türkçe', style: TextStyle(color: EarnTheme.gold, fontSize:11)),
        SizedBox(height:12),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('LAUNCH WORLD', style: TextStyle(fontWeight: FontWeight.bold)))),
        SizedBox(height:8),
        SizedBox(width: double.infinity, child: OutlinedButton(onPressed: (){}, style: OutlinedButton.styleFrom(side: BorderSide(color: EarnTheme.gold)), child: Text('BACK TO PORTAL', style: TextStyle(color: EarnTheme.gold)))),
      ])),
      SizedBox(height:14), Text('EARN OS v2.1 • SECURE CONNECTION • 256-BIT ENCRYPTION • © 2024 EARN OS', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold, fontSize:10)),
    ])));
  }
  Widget _pin(String l)=>Column(children:[Icon(Icons.location_on, color: EarnTheme.gold, size:30), Text(l, style: TextStyle(color: Colors.white, fontSize:8))]);
}
