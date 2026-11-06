import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/ai_service.dart';
import '../widgets/earn_logo.dart';
class AIAssistantScreen extends StatefulWidget { const AIAssistantScreen({super.key}); @override State<AIAssistantScreen> createState()=>_AIState(); }
class _AIState extends State<AIAssistantScreen> {
  final TextEditingController _ctrl = TextEditingController();
  final List<Map<String,String>> _msg = [{'role':'ai','text':'Bonjour Youssouf 👋\nJe suis EARN AI, ton assistant personnel.\nJe peux t\'aider à vendre, suivre tes commandes, et gagner plus.\n\nQue veux-tu faire aujourd\'hui ?'}];
  bool _typing=false;
  void _send(String text) async {
    if(text.trim().isEmpty) return;
    setState((){ _msg.add({'role':'user','text':text}); _typing=true; }); _ctrl.clear();
    await Future.delayed(Duration(milliseconds: 900));
    setState((){ _typing=false; _msg.add({'role':'ai','text':EarnAI.repondre(text)}); });
  }
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black,
    appBar: AppBar(backgroundColor: EarnTheme.black, title: Row(children:[Container(width:36, height:36, decoration: BoxDecoration(color: EarnTheme.gold, shape: BoxShape.circle), child: Icon(Icons.smart_toy, color: Colors.black)), SizedBox(width:10), Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text('EARN AI', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold)), Row(children:[Container(width:8, height:8, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle)), SizedBox(width:4), Text('En ligne • Répond en 1s', style: TextStyle(color: Colors.white70, fontSize:11))])])]), actions:[Icon(Icons.mic, color: EarnTheme.gold), SizedBox(width:12), Icon(Icons.more_vert, color: EarnTheme.gold), SizedBox(width:10)]),
    body: Column(children:[
      // CARTE ASSISTANT EN HAUT
      Container(margin: EdgeInsets.all(12), padding: EdgeInsets.all(14), decoration: EarnTheme.goldBox, child: Row(children:[EarnLogo(size:44), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal:10, vertical:6), decoration: BoxDecoration(color: EarnTheme.gold, borderRadius: BorderRadius.circular(20)), child: Text('PRO ✨', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))])),
      // BOUTONS RAPIDES
      Container(height:42, padding: EdgeInsets.symmetric(horizontal:12), child: ListView(scrollDirection: Axis.horizontal, children:[_quick('💰 Combien j\'ai gagné ?'), _quick('📦 Mes commandes'), _quick('👗 Publier Nike'), _quick('📈 Conseil vente'), _quick('🌍 Meilleur pays ?')])),
      Expanded(child: ListView.builder(padding: EdgeInsets.all(14), itemCount: _msg.length + (_typing?1:0), itemBuilder: (ctx,i){
        if(_typing && i==_msg.length) return Row(children:[Container(width:36, height:36, decoration: BoxDecoration(color: EarnTheme.gold, shape: BoxShape.circle), child: Icon(Icons.smart_toy, color: Colors.black, size:20)), SizedBox(width:8), Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.blackCard, borderRadius: BorderRadius.circular(16)), child: Text('EARN AI est en train d\'écrire... •••', style: TextStyle(color: EarnTheme.gold)))]);
        final m=_msg[i]; final isUser=m['role']=='user';
        return Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: isUser?MainAxisAlignment.end:MainAxisAlignment.start, children:[
          if(!isUser) Container(width:36, height:36, decoration: BoxDecoration(color: EarnTheme.gold, shape: BoxShape.circle), child: Icon(Icons.smart_toy, color: Colors.black, size:20)),
          SizedBox(width:6),
          Flexible(child: Container(margin: EdgeInsets.only(bottom:12), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: isUser?EarnTheme.gold:EarnTheme.blackCard, border: Border.all(color: EarnTheme.gold.withOpacity(0.5)), borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomLeft: Radius.circular(isUser?16:4), bottomRight: Radius.circular(isUser?4:16))), child: Text(m['text']!, style: TextStyle(color: isUser?Colors.black:Colors.white)))),
          if(isUser) SizedBox(width:6), if(isUser) CircleAvatar(radius:16, backgroundColor: EarnTheme.gold, child: Text('Y', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
        ]);
      })),
      // BARRE DE MESSAGE COMME WHATSAPP / CHATGPT
      Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.blackCard, border: Border(top: BorderSide(color: EarnTheme.gold.withOpacity(0.4)))), child: Row(children:[
        Icon(Icons.attach_file, color: EarnTheme.gold), SizedBox(width:8),
        Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(25)), child: TextField(controller: _ctrl, style: TextStyle(color: Colors.white), decoration: InputDecoration(hintText: 'Demande à EARN AI...', hintStyle: TextStyle(color: EarnTheme.gold.withOpacity(0.5)), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal:16)), onSubmitted: _send))),
        SizedBox(width:8), GestureDetector(onTap: ()=>_send(_ctrl.text), child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.gold, shape: BoxShape.circle), child: Icon(Icons.send, color: Colors.black))),
        SizedBox(width:6), Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), shape: BoxShape.circle), child: Icon(Icons.mic, color: EarnTheme.gold, size:18)),
      ])),
    ]));
  }
  Widget _quick(String l)=>GestureDetector(onTap: ()=>_send(l), child: Container(margin: EdgeInsets.only(right:8), padding: EdgeInsets.symmetric(horizontal:12, vertical:8), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(20)), child: Text(l, style: TextStyle(color: EarnTheme.gold, fontSize:12))));
}
