import 'package:flutter/material.dart';
import '../theme.dart';
class SettingsScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const SettingsScreen({super.key, required this.onLocaleChange});
  @override State<SettingsScreen> createState()=>_SetState();
}
class _SetState extends State<SettingsScreen> {
  bool notif=true; bool dark=true;
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, leading: Icon(Icons.arrow_back_ios, color: EarnTheme.gold), title: Text('Settings', style: TextStyle(color: EarnTheme.gold, fontSize:26, fontWeight: FontWeight.bold))),
    body: ListView(padding: EdgeInsets.all(14), children:[
      Container(padding: EdgeInsets.all(16), decoration: EarnTheme.goldBox, child: Row(children:[
        CircleAvatar(radius:38, backgroundColor: Colors.black, child: Icon(Icons.person_outline, color: EarnTheme.gold, size:40)),
        SizedBox(width:14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text('Youssouf', style: TextStyle(color: EarnTheme.gold, fontSize:20, fontWeight: FontWeight.bold)), Text('youssouf@earnos.io', style: TextStyle(color: Colors.white70)), SizedBox(height:6), Container(padding: EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(20)), child: Text('PRO MEMBER ✨', style: TextStyle(color: EarnTheme.gold, fontSize:10)))])),
        Icon(Icons.arrow_forward_ios, color: EarnTheme.gold, size:16),
      ])),
      SizedBox(height:16), Text('ACCOUNT', style: TextStyle(color: EarnTheme.gold, letterSpacing:2)),
      SizedBox(height:8),
      Container(decoration: EarnTheme.goldBox, child: Column(children:[
        _row('🔔','Notifications', trailing: _switch(notif, (v)=>setState(()=>notif=v))),
        _row('💳','Payment', sub:'•••• 4242 • Visa'),
        _row('🚚','Delivery', sub:'Bamako, Mali'),
      ])),
      SizedBox(height:16), Text('PREFERENCES', style: TextStyle(color: EarnTheme.gold, letterSpacing:2)),
      SizedBox(height:8),
      Container(decoration: EarnTheme.goldBox, child: Column(children:[
        _row('🌍','Language', sub:'Français', onTap: ()=>widget.onLocaleChange(Locale('fr'))),
        _row('🌙','Dark Mode', trailing: _switch(dark, (v)=>setState(()=>dark=v))),
      ])),
      SizedBox(height:16), Text('SECURITY & SUPPORT', style: TextStyle(color: EarnTheme.gold, letterSpacing:2)),
      SizedBox(height:8),
      Container(decoration: EarnTheme.goldBox, child: Column(children:[
        _row('🛡️','Security & Privacy'),
        _row('❓','Help & Support'),
        _row('💰','Commission: 5% / 8% / 10% / 15%', sub:'Livreur: 10% par livraison'),
      ])),
      SizedBox(height:16), Center(child: Text('EARN OS • Version 2.1.4 • Build 214.9', style: TextStyle(color: EarnTheme.gold, fontSize:11))),
    ]));
  }
  Widget _switch(bool v, Function(bool) on)=>GestureDetector(onTap: ()=>on(!v), child: Container(padding: EdgeInsets.symmetric(horizontal:14, vertical:6), decoration: BoxDecoration(color: v?EarnTheme.gold:Colors.grey, borderRadius: BorderRadius.circular(20)), child: Text(v?'ON':'OFF', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))));
  Widget _row(String icon, String title, {String? sub, Widget? trailing, VoidCallback? onTap})=>GestureDetector(onTap: onTap, child: Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: EarnTheme.gold.withOpacity(0.2)))), child: Row(children:[Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold)), child: Text(icon)), SizedBox(width:12), Expanded(child: Text(title, style: TextStyle(color: EarnTheme.gold, fontSize:16, fontWeight: FontWeight.bold))), if(sub!=null) Text(sub, style: TextStyle(color: EarnTheme.gold, fontSize:12)), if(trailing!=null) trailing else Icon(Icons.arrow_forward_ios, color: EarnTheme.gold, size:14)])));
}
