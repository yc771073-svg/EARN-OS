import 'package:flutter/material.dart';
import '../theme.dart';
// LOGO OFFICIEL EARN OS - EOS OR SUR NOIR + CERCLE OR
// Comme sur ta photo: EOS en or luxe, cercle fin ouvert
class EarnLogo extends StatelessWidget {
  final double size;
  const EarnLogo({super.key, this.size=40});
  @override Widget build(BuildContext context){
    return Row(mainAxisSize: MainAxisSize.min, children:[
      Container(width: size+4, height: size+4, decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle, border: Border.all(color: EarnTheme.gold, width:1.5)), child: Center(child: Text('EOS', style: TextStyle(color: EarnTheme.gold, fontSize: size*0.32, fontWeight: FontWeight.w300, letterSpacing:1, fontFamily: 'serif')))),
      SizedBox(width:8),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize: size*0.42, fontWeight: FontWeight.bold, letterSpacing:2)),
        Text('Le luxe du monde, livré à Bamako', style: TextStyle(color: Colors.white70, fontSize: size*0.18)),
      ]),
    ]);
  }
}
class EarnLogoBig extends StatelessWidget {
  const EarnLogoBig({super.key});
  @override Widget build(BuildContext context){
    return Container(padding: EdgeInsets.all(22), decoration: BoxDecoration(color: Colors.black, border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(24)), child: Column(children:[
      // LE LOGO DE TA PHOTO
      Container(width:140, height:140, decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle, border: Border.all(color: EarnTheme.gold, width:3)), child: Center(child: Text('EOS', style: TextStyle(color: EarnTheme.gold, fontSize:58, fontWeight: FontWeight.w300, letterSpacing:0, fontFamily: 'serif')))),
      SizedBox(height:12),
      Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:28, fontWeight: FontWeight.bold, letterSpacing:4)),
      Text('Global • Luxe • Bamako', style: TextStyle(color: Colors.white70)),
      SizedBox(height:8), Text('🌍  PARLE TOUTES LES LANGUES  •  🇪🇸 Español inclus', style: TextStyle(color: EarnTheme.gold, fontSize:10, fontWeight: FontWeight.bold)),
    ]));
  }
}
