import 'package:flutter/material.dart';
// SERVICE LIVRAISON EARN OS - C'EST EARN OS QUI ENVOIE AU LIVREUR
class DeliveryService {
  // Liste des agents livreurs EARN OS à Bamako (dans la vraie version, c'est GPS auto)
  static List<Map<String, dynamic>> agents = [
    {'name':'Moussa D.','phone':'+223 70 00 00 01','quartier':'ACI 2000','distance':'0.8 km','rating':'4.9','vehicle':'Moto 🏍️','status':'Disponible'},
    {'name':'Aïcha K.','phone':'+223 76 00 00 02','quartier':'Hamdallaye','distance':'1.2 km','rating':'4.8','vehicle':'Moto 🏍️','status':'Disponible'},
    {'name':'Ibrahim S.','phone':'+223 65 00 00 03','quartier':'Badalabougou','distance':'2.1 km','rating':'5.0','vehicle':'Voiture 🚗','status':'Disponible'},
    {'name':'Fatoumata T.','phone':'+223 77 00 00 04','quartier':'Sikasso','distance':'5 km','rating':'4.9','vehicle':'Moto 🏍️','status':'Disponible'},
  ];
  // Quand tu commandes, EARN OS choisit le plus proche et lui envoie notification
  static Map<String, dynamic> findNearestAgent(String quartier){
    // Pour l'instant, on prend le plus proche - Moussa à ACI 2000
    return agents[0];
  }
  // EARN OS envoie notification au livreur
  static String sendNotificationToAgent(Map<String, dynamic> agent, String product, String address){
    return "📲 NOTIFICATION ENVOYÉE à ${agent['name']} : Nouvelle livraison EARN OS ! Produit: $product -> Livrer à: $address - Tu gagnes 5,000 FCFA - Clique ACCEPTER";
  }
}
