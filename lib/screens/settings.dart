import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Settings", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 28)), backgroundColor: Colors.black, leading: Icon(Icons.arrow_back, color: Colors.white)),
      body: ListView(children: [
        Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Color(0xFFD4AF37))), child: Row(children: [CircleAvatar(radius: 40, backgroundColor: Color(0xFFD4AF37)), SizedBox(width: 10), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Alex Chen", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 20)), Text("alex.chen@earnos.io", style: TextStyle(color: Colors.white70)), Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(border: Border.all(color: Color(0xFFD4AF37)), borderRadius: BorderRadius.circular(12)), child: Text("PRO MEMBER", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 10)))])])),
        _section("ACCOUNT"),
        _tile("Notifications", "ON"), _tile("Payment", "•••• 4242 • Visa"), _tile("Delivery", "123 Nova St, Neo District"),
        _section("PREFERENCES"),
        _tile("Language", "English (US)"), _tile("Dark Mode", "ON"),
        _section("SECURITY & SUPPORT"),
        _tile("Security & Privacy", ""), _tile("Help & Support", ""),
        Center(child: Text("EARN OS • Version 2.1.4 • Build 214.9", style: TextStyle(color: Colors.white54, fontSize: 12)))
      ]),
    );
  }
  Widget _section(String t) => Padding(padding: EdgeInsets.fromLTRB(16, 20, 16, 8), child: Text(t, style: TextStyle(color: Colors.white54, letterSpacing: 2)));
  Widget _tile(String title, String value) => ListTile(title: Text(title, style: TextStyle(color: Color(0xFFD4AF37))), trailing: Text(value, style: TextStyle(color: Colors.white70)), onTap: (){});
}
