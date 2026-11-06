import 'package:flutter/material.dart';
import '../theme.dart';
import '../services/ai_service.dart';
class AIAssistantScreen extends StatefulWidget { const AIAssistantScreen({super.key}); @override State<AIAssistantScreen> createState() => _AIAssistantScreenState(); }
class _AIAssistantScreenState extends State<AIAssistantScreen> {
  final TextEditingController _ctrl = TextEditingController();
  final List<Map<String,String>> _messages = [{'role':'ai','text':'Salut! Je suis EARN AI. Essaie: Combien jai gagne ?'}];
  void _send(String text) async {
    if (text.trim().isEmpty) return;
    setState((){ _messages.add({'role':'user','text':text}); });
    _ctrl.clear();
    await Future.delayed(Duration(milliseconds: 700));
    setState((){ _messages.add({'role':'ai','text':EarnAI.repondre(text)}); });
  }
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, title: Text('EARN AI', style: TextStyle(color: EarnTheme.gold))),
      body: Column(children: [
        Container(height: 48, padding: EdgeInsets.symmetric(horizontal: 12), child: ListView(scrollDirection: Axis.horizontal, children: [
          _quick('Combien jai gagne ?'), _quick('Mes commandes'), _quick('Publier Nike'), _quick('Conseil vente'),
        ])),
        Expanded(child: ListView.builder(padding: EdgeInsets.all(16), itemCount: _messages.length, itemBuilder: (ctx,i){
          final m=_messages[i]; final isUser=m['role']=='user';
          return Align(alignment: isUser?Alignment.centerRight:Alignment.centerLeft, child: Container(margin: EdgeInsets.only(bottom:12), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: isUser?EarnTheme.gold:EarnTheme.blackCard, borderRadius: BorderRadius.circular(16), border: Border.all(color: EarnTheme.gold.withOpacity(0.4))), child: Text(m['text']!, style: TextStyle(color: isUser?Colors.black:Colors.white))));
        })),
        Container(padding: EdgeInsets.all(12), child: Row(children: [
          Expanded(child: Container(decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(25)), child: TextField(controller: _ctrl, style: TextStyle(color: Colors.white), decoration: InputDecoration(hintText: 'Demande a EARN AI...', hintStyle: TextStyle(color: EarnTheme.gold.withOpacity(0.5)), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal:16)), onSubmitted: _send))),
          SizedBox(width:8), GestureDetector(onTap: (){ _send(_ctrl.text); }, child: Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.gold, shape: BoxShape.circle), child: Icon(Icons.send, color: Colors.black))),
        ])),
      ]),
    );
  }
  Widget _quick(String l)=>GestureDetector(onTap: (){ _send(l); }, child: Container(margin: EdgeInsets.only(right:8), padding: EdgeInsets.symmetric(horizontal:12, vertical:8), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(20)), child: Text(l, style: TextStyle(color: EarnTheme.gold, fontSize:11))));
}
