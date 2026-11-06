import 'package:flutter/material.dart';
import '../theme.dart';
class EarnLogo extends StatelessWidget {
  final double size;
  const EarnLogo({super.key, this.size=40});
  @override Widget build(BuildContext context){
    return Row(mainAxisSize: MainAxisSize.min, children:[
      Container(width: size, height: size, decoration: BoxDecoration(color: Colors.black, border: Border.all(color: EarnTheme.gold, width:2), shape: BoxShape.circle), child: Center(child: Text('◆', style: TextStyle(color: EarnTheme.gold, fontSize: size*0.5)))),
      SizedBox(width:8),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
        Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize: size*0.45, fontWeight: FontWeight.bold, letterSpacing: 2)),
        Text('LUXE • GLOBAL • BAMAKO', style: TextStyle(color: EarnTheme.gold.withOpacity(0.7), fontSize: size*0.18)),
      ]),
    ]);
  }
}
class EarnLogoBig extends StatelessWidget {
  const EarnLogoBig({super.key});
  @override Widget build(BuildContext context){
    return Container(padding: EdgeInsets.all(20), decoration: BoxDecoration(color: EarnTheme.blackCard, border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(20)), child: Column(children:[
      Container(width:80, height:80, decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold, width:2), shape: BoxShape.circle), child: Center(child: Text('◆', style: TextStyle(color: EarnTheme.gold, fontSize:40)))),
      SizedBox(height:10), Text('EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:32, fontWeight: FontWeight.bold, letterSpacing:3)),
      Text('Le luxe du monde, livré à Bamako', style: TextStyle(color: Colors.white)),
      SizedBox(height:6), Text('◆  EARN AI  •  WORLD  •  PAY  •  DELIVERY  ◆', style: TextStyle(color: EarnTheme.gold, fontSize:10)),
    ]));
  }
}
