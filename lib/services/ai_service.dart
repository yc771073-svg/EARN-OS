class EarnAI {
  static String repondre(String question, {String country = 'ML', double totalVentes = 125000, int nbCommandes = 12}) {
    final q = question.toLowerCase();
    if (q.contains('gagn') || q.contains('commission') || q.contains('argent')) {
      double taux = totalVentes < 50 ? 0.05 : totalVentes < 150 ? 0.08 : totalVentes < 500 ? 0.10 : 0.15;
      return "💰 Tu as gagné ${(totalVentes*taux).toStringAsFixed(0)} FCFA sur $nbCommandes ventes. Taux: ${(taux*100).round()}% (5%/8%/10%/15%).";
    }
    if (q.contains('commande') || q.contains('livraison')) return "📦 Tu as $nbCommandes commandes. #123 Nike - En livraison 🛵, #124 Montre Dubai - Confirmée ✅";
    if (q.contains('nike') || q.contains('publier') || q.contains('produit')) return "👟 Pour publier: Onglet Brands > Publier. Ex: Nike Jordan 75.000 FCFA = 7.500 FCFA commission pour toi.";
    if (q.contains('conseil') || q.contains('vendre') || q.contains('mieux')) return "📊 Top Bamako: 1. Sneakers Nike 50.000 FCFA, 2. Montres Dubai AED 1,250, 3. Art Mali \$85";
    return "👋 Salut! Je suis EARN AI. Essaie: 'Combien j'ai gagné ?' ou 'Mes commandes' ou 'Conseil vente'";
  }
}
