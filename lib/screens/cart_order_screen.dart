import 'package:flutter/material.dart';
import '../theme.dart';
class CartOrderScreen extends StatelessWidget {
  const CartOrderScreen({super.key});
  @override Widget build(BuildContext context){
    return Scaffold(backgroundColor: EarnTheme.black, appBar: AppBar(backgroundColor: EarnTheme.black, leading: IconButton(icon: Icon(Icons.arrow_back, color: EarnTheme.gold), onPressed: ()=>Navigator.pop(context)), title: Text('Commander', style: TextStyle(color: EarnTheme.gold, fontWeight: FontWeight.bold))),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
        Text('🛍️', style: TextStyle(fontSize:60)),
        SizedBox(height:12),
        Text('Commande EARN OS', style: TextStyle(color: EarnTheme.gold, fontSize:20, fontWeight: FontWeight.bold)),
        Text('Tu commandes, on te livre à Bamako', style: TextStyle(color: Colors.white70)),
        SizedBox(height:16),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: EarnTheme.gold), onPressed: (){}, child: Text('Confirmer - Orange Money', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      ])));
  }
}
