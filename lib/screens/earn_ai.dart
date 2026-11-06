import 'package:flutter/material.dart';
import '../theme.dart';

// FICHIER MANQUANT QUI FAISAIT PLANTER V3.8 / V3.9 / V4.0
// main.dart cherche EarnAIScreen ici, on le met ici
// Si ai_assistant.dart a déjà EarnAIScreen, on le réutilise. Sinon on crée un écran simple.

class EarnAIScreen extends StatelessWidget {
  const EarnAIScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EarnTheme.black,
      appBar: AppBar(backgroundColor: EarnTheme.black, leading: IconButton(icon: Icon(Icons.arrow_back, color: EarnTheme.gold), onPressed: ()=>Navigator.pop(context)), title: Text('EARN AI ✨', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(children:[
        Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(16)), child: Column(children:[
          Text('✨', style: TextStyle(fontSize:48)),
          Text('EARN AI', style: TextStyle(color: EarnTheme.gold, fontSize:24, fontWeight: FontWeight.bold, letterSpacing:3)),
          Text('Ton assistant qui parle toutes les langues', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize:13)),
          SizedBox(height:8),
          Text('🇲🇱 Bambara • 🇫🇷 Français • 🇬🇧 English • 🇪🇸 Español • 🇹🇷 Turc • 🇸🇦 Arabe', textAlign: TextAlign.center, style: TextStyle(color: EarnTheme.gold, fontSize:11, fontWeight: FontWeight.bold)),
        ])),
        SizedBox(height:16),
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children:[
          CircleAvatar(backgroundColor: EarnTheme.gold, child: Text('AI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
          SizedBox(width:10),
          Expanded(child: Text('Salut Youssouf ! Tu veux commander quoi à Bamako ? Dibi ? Pizza ? Poulet Bicyclette ? Dis-moi, je commande pour toi.', style: TextStyle(color: Colors.white, fontSize:13))),
        ])),
        SizedBox(height:14),
        Row(children:[
          _chip('🍔 Commander à manger'),
          _chip('👗 Fashion'),
          _chip('💎 Luxury'),
        ]),
        SizedBox(height:14),
        Container(padding: EdgeInsets.symmetric(horizontal:12), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(12)), child: Row(children:[Expanded(child: TextField(style: TextStyle(color: Colors.white), decoration: InputDecoration(border: InputBorder.none, hintText: 'Parle à EARN AI...', hintStyle: TextStyle(color: Colors.white38)))), Icon(Icons.send, color: EarnTheme.gold)])),
        SizedBox(height:10),
        Text('EARN AI va t\'aider à commander, traduire, et suivre ta livraison à Bamako.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize:11)),
      ])),
    );
  }
  Widget _chip(String t){ return Container(margin: EdgeInsets.only(right:8), padding: EdgeInsets.symmetric(horizontal:10, vertical:6), decoration: BoxDecoration(border: Border.all(color: EarnTheme.gold), borderRadius: BorderRadius.circular(20)), child: Text(t, style: TextStyle(color: Colors.white, fontSize:11))); }
}
