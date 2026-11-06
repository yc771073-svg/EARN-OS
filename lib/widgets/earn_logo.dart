import 'package:flutter/material.dart';
import '../theme.dart';
class EarnLogo extends StatelessWidget {
  final double size;
  const EarnLogo({super.key, this.size=40});
  @override Widget build(BuildContext context){
    return Row(mainAxisSize: MainAxisSize.min, children:[
      // LOGO MOTO JAUNE COMME SUR LA PHOTO - PAS DIAMANT
      Container(width: size+6, height: size+6, decoration: BoxDecoration(color: Color(0xFFFFD600), shape: BoxShape.circle, border: Border.all(color: EarnTheme.gold, width:2)), child: Center(child: Text('🛵', style: TextStyle(fontSize: size*0.55)))),
      SizedBox(width:8),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        RichText(text: TextSpan(children:[
          TextSpan(text:'EARN ', style: TextStyle(color: Colors.white, fontSize: size*0.45, fontWeight: FontWeight.bold, letterSpacing:1)),
          TextSpan(text:'OS', style: TextStyle(color: Color(0xFFFFD600), fontSize: size*0.45, fontWeight: FontWeight.bold)),
        ])),
        Text('Global Delivery OS', style: TextStyle(color: EarnTheme.gold.withOpacity(0.9), fontSize: size*0.20, fontWeight: FontWeight.bold)),
      ]),
    ]);
  }
}
class EarnLogoBig extends StatelessWidget {
  const EarnLogoBig({super.key});
  @override Widget build(BuildContext context){
    return Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: EarnTheme.blackCard, border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(20)), child: Column(children:[
      Container(width:90, height:90, decoration: BoxDecoration(color: Color(0xFFFFD600), shape: BoxShape.circle, border: Border.all(color: EarnTheme.gold, width:2)), child: Center(child: Text('🛵', style: TextStyle(fontSize:50)))),
      SizedBox(height:10),
      RichText(text: TextSpan(children:[TextSpan(text:'EARN ', style: TextStyle(color: Colors.white, fontSize:32, fontWeight: FontWeight.bold)), TextSpan(text:'OS', style: TextStyle(color: Color(0xFFFFD600), fontSize:32, fontWeight: FontWeight.bold))])),
      Text('Global Delivery OS', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)),
      Text('Commandez • Suivez • Recevez plus rapidement !', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize:12)),
      SizedBox(height:8), Text('🗣️  PARLE TOUTES LES LANGUES  •  🌍  120+ PAYS', style: TextStyle(color: EarnTheme.gold, fontSize:10, fontWeight: FontWeight.bold)),
    ]));
  }
}
