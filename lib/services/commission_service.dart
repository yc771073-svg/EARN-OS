// FICHIER POUR TOI SEUL - CREATRICE - PAS VISIBLE DANS L'APP CLIENT
// Comment l'argent est partagé - EARN OS
class CommissionService {
  // Exemple: Pizza 6500 FCFA
  // Client paie 6500 -> EARN OS garde 15% -> Marque 70% -> Livreur 15%
  static double earnOSCommission(double total) => total * 0.15; // TOI - 15%
  static double brandAmount(double total) => total * 0.70; // MARQUE - 70%
  static double driverAmount(double total) => total * 0.15; // LIVREUR - 15%

  // Exemple: Nike 50000 FCFA - Marque mondiale
  // Toi: 7500 FCFA - Marque: 35000 FCFA - Livreur: 7500 FCFA
  // Exemple: Dibi 5000 FCFA
  // Toi: 750 FCFA - Marque: 3500 FCFA - Livreur: 750 FCFA

  // PAIEMENT:
  // Client -> Orange Money / Stripe -> Coffre EARN OS
  // -> Vendredi: Toi tu reçois ta commission sur ton compte
  // -> 48h après livraison: Marque reçoit son 70%
  // -> Soir même 20h: Livreur reçoit son 15%
}
