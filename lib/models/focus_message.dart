/// Un modèle représente la structure de nos données.
/// Ici, une phrase de focus contient : un titre, un message, et un auteur (optionnel).

class FocusMessage {
  final String title;    // Titre de la phrase
  final String message;  // Le message complet
  final String? author;  // Auteur (optionnel, d'où le "?")

  /// Constructeur : "required" = obligatoire, "this.author" = optionnel
  const FocusMessage({
    required this.title,
    required this.message,
    this.author,
  });
}