# Observer core

## 🚀 0.3.0 - 08/08/2024
### Nouveautés

- Création d'un workflow pour la création de tag automatiser.
- Ajout de la fonctionnalité gérer les requêtes vers l'API avec le système de singleton.
- Création des Exceptions et Failures personnalisés pour les requêtes HTTP.
- Ajout des constantes pour les textes.
- Création des models : article, category, environement, http_error, organisation, picture, project, representant, siege.
- Création de FakeData baser sur les models créer.
- Création du statemanagement uniquer pour : article, category, environment avec `flutter_bloc`.
- Création de DTO pour : upsert les categories, upsert les environments

### Changements

- Renommage des Abstractions pour plus de clarté.
- Ajout de la librairie `flutter_bloc` dans le `pubspec.yaml`.
- Modification et documentation des fichiers export.

### Correctifs

- Fix: Bug de retrofit.
- Fix: version Intl.

## 🚀 0.2.0 - 03/11/2023
### Nouveautés

- Ajout de tout les enums
- Ajout de tout les extensions
- Ajout de flutter bloc pour le `back for front` de observer
- Ajout de mon fichier shell pour refresh les models
- Ajout des badges dans le README

### Changements

- Ajout de plus de règles de linter

### Correctifs

- Pas de fixes


## 🚀 0.1.0 - 01/11/2023
### Nouveautés

- Ajout du core de l'ancien projet

### Changements

- Pas de changement

### Correctifs

- Pas de fixes