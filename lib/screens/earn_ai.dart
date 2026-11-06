import 'package:flutter/material.dart';
import '../theme.dart';
class EarnAIScreen extends StatelessWidget {
  const EarnAIScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, leading: IconButton(icon: Icon(Icons.arrow_back, color: EarnTheme.gold), onPressed: ()=>Navigator.pop(context)), title: Text('EARN AI', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))),
      body: Padding(padding: EdgeInsets.all(16), child: Column(children:[
        Text('✨ EARN AI', style: TextStyle(color: EarnTheme.gold, fontSize:26, fontWeight: FontWeight.bold)),
        SizedBox(height:8),
        Text('Bambara - Francais - English - Turc - Arabe', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
        SizedBox(height:16),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: EarnTheme.blackCard, borderRadius: BorderRadius.circular(12)), child: Text('Salut ! Tu veux commander quoi a Bamako ? Dibi ? Pizza ? Poulet Bicyclette ? Dis-moi, je commande pour toi.', style: TextStyle(color: Colors.white))),
        SizedBox(height:16),
        TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(hintText: 'Parle a EARN AI...', hintStyle: TextStyle(color: Colors.white38), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), suffixIcon: Icon(Icons.send, color: EarnTheme.gold))),
      ])));
  }
}
