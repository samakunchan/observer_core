# Observer core

## 🚀 0.5.1 - 08/08/2024
### Nouveautés

- Pas de nouveautés.

### Changements

- Mise à jour du readme sur au passage du projet en publique.

### Correctifs

- Pas de fixes

## 🚀 0.5.0 - 08/08/2024
### Nouveautés

- Ajout de la fonctionnalité pour lire et sauvegarder les tokens.
- Ajout de la fonctionnalité pour lire et sauvegarder les infos utilisateur.
- Ajout des singleton pour le token et l'utilisateur, ainsi que l'injection de dépendance.

### Changements

- Suppression de la variable `access_token` pour la remplacer avec l'instance sauvegarder en local storage dans toutes les requêtes HTTP.
- Renommage des Abstractions pour plus de clarté.
- Initialisation de la fonctionnalité en même temps que le serverNestjs.

### Correctifs

- Fix: Changement de port pour le serveur local situer sur docker.


## 🚀 0.4.0 - 08/08/2024
### Nouveautés

- Ajout d'un workflow pour test si mon tag existe déjà afin d'eviter les oublies d'incrémentation de version.
- Ajout d'un workflow our les tests sur les features et dev (test pas encore écris).

### Changements

- Renommage du fichier de création automatique de tag.

### Correctifs

- Pas de fixes


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