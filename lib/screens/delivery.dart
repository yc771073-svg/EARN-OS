import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text("EARN OS", style: TextStyle(color: Color(0xFFD4AF37))), actions: [Icon(Icons.notifications, color: Color(0xFFD4AF37)), SizedBox(width: 10), CircleAvatar(child: Text("JS"))]),
      body: ListView(children: [
        Padding(padding: EdgeInsets.all(8), child: Row(children: [Icon(Icons.location_on, color: Color(0xFFD4AF37)), Text(" Delivered to • Golden District, Unit 22A", style: TextStyle(color: Colors.white70)), Spacer(), Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(border: Border.all(color: Color(0xFFD4AF37))), child: Text("Wallet • 1,250 EARN", style: TextStyle(color: Color(0xFFD4AF37))))])),
        Padding(padding: EdgeInsets.all(8), child: TextField(decoration: InputDecoration(hintText: "Search for food, groceries, pharmacy...", prefixIcon: Icon(Icons.search, color: Color(0xFFD4AF37)), border: OutlineInputBorder()))),
        Padding(padding: EdgeInsets.all(8), child: Text("Categories", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18))),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Text("Food", style: TextStyle(color: Colors.white)), Text("Groceries", style: TextStyle(color: Colors.white)), Text("Pharmacy", style: TextStyle(color: Colors.white)), Text("Flowers", style: TextStyle(color: Colors.white)), Text("Convenience", style: TextStyle(color: Colors.white)), Text("Pets", style: TextStyle(color: Colors.white)), Text("Gifts", style: TextStyle(color: Colors.white))]),
        Container(margin: EdgeInsets.all(12), padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(12)), child: Row(children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("30% OFF", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 28, fontWeight: FontWeight.bold)), Text("Premium Delivery • First Order", style: TextStyle(color: Colors.white)), Text("Use code: WELCOME30 • Ends Tonight", style: TextStyle(color: Colors.white70, fontSize: 10))]), Spacer(), Icon(Icons.airplanemode_active, color: Color(0xFFD4AF37), size: 50)])),
        Padding(padding: EdgeInsets.all(8), child: Text("Trending Now", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 18))),
        GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: [
          _food("Sushi Delight", "Japanese • 25-35 min • 4.8★", "\$24.99"),
          _food("Artisanal Croissant", "Bakery • 15-25 min • 4.7★", "\$12.50"),
          _food("Organic Greens Box", "Groceries • 30-40 min • 4.9★", "\$18.00"),
          _food("Premium Coffee Roast", "Coffee • 20-30 min • 4.6★", "\$16.75"),
        ])
      ]),
    );
  }
  Widget _food(String name, String sub, String price) => Card(color: Colors.black, shape: RoundedRectangleBorder(side: BorderSide(color: Color(0xFFD4AF37))), child: Padding(padding: EdgeInsets.all(8), child: Column(children: [Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(sub, style: TextStyle(color: Colors.white54, fontSize: 10)), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(price, style: TextStyle(color: Color(0xFFD4AF37))), Icon(Icons.add_circle, color: Color(0xFFD4AF37))])])));
}
