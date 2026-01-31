import '../models/focus_message.dart';

/// Liste des phrases de focus
/// Plus tard, ces données pourront venir d'une API ou base de données
const List<FocusMessage> focusMessages = [
  FocusMessage(
    title: "Commence petit",
    message: "Un voyage de mille kilomètres commence par un simple pas.",
    author: "Lao Tseu",
  ),
  FocusMessage(
    title: "Persévérance",
    message: "Ce n'est pas grave d'avancer lentement, tant que tu ne t'arrêtes pas.",
    author: "Confucius",
  ),
  FocusMessage(
    title: "Action",
    message: "Le meilleur moment pour planter un arbre était il y a 20 ans. Le deuxième meilleur moment, c'est maintenant.",
  ),
  FocusMessage(
    title: "Courage",
    message: "Tu n'as pas besoin d'être parfait pour commencer, mais tu dois commencer pour devenir meilleur.",
  ),
  FocusMessage(
    title: "Focus",
    message: "Concentre-toi sur le prochain pas, pas sur tout l'escalier.",
  ),
];