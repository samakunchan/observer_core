[![Owner](https://img.shields.io/badge/Owner-Samakunchan%20Technology-blue)](https://samakunchan-technology.com/)
[![Owner](https://img.shields.io/badge/OBSERVER--CORE-v0.22.0-orange)](https://samakunchan-technology.com/)
## Features

Ceci est le core de mon projet dashboard.

## Getting started

Pré-requis:

- `sdk: '>=3.1.5 <4.0.0'`
- Régulièrement mettre à jour la version `intl` (pour les dates).
- Etre utiliser pour le projet **Papangue**.

## Usage

```dart
Future<void> main() async {
  await ServerFeature.initServerNestJs(wsBaseUrl: '${MainProject.apiUrl}/');
  runApp(const MyApp());
}
```

## Role

Ce qu'il fera ✅ :

- Enregistrer les infos tokens. ✅
- Enregistrer les infos utilisateurs. ✅
- Effectuer les requêtes HTTP vers mon API. ✅
- Grâce à `flutter_bloc`, il fournis tout les states nécessaires à la vue pour construire les pages. ✅

Ce qu'il ne fera pas ❌ :

- Faire la connexion utilisateur afin de créer un token de connexion. C'est une autre librairie, **Observer_auth**, qui aura cette responsabilité. ❌
- Vérifier la validité du token. Si le token n'est plus valide, il renverra le code d'érreur et c'est **Observer_auth** qui en regénérera un nouveau. ❌


## Additional information

Pas d'information supplémentaire.