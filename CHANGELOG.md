# Observer core

## 🚀 0.18.0 - 17/10/2024
### Nouveautés

- Création d'un model et d'un DTO pour les skills.
- Création d'un bloc pour gérer le state management.
- Configuration des requêtes HTTP afin d'avoir le CRUD.

### Changements

- Ajout de deux fichiers supplémentaires dans le gitignore.

### Correctifs

- Pas de correctifs.


## 🚀 0.17.0 - 15/10/2024
### Nouveautés

- Création d'un model et d'un DTO pour le service.
- Création d'un bloc pour gérer le state management.
- Configuration des requêtes HTTP afin d'avoir le CRUD.

### Changements

- Ajout de messages d'érreurs pour un cas de failure de la feature document.
- Suppression du mot clé `this` inutile pour les extensions.

### Correctifs

- Remise en place d'un override manquant.

## 🚀 0.16.0 - 11/10/2024
### Nouveautés

- Pas de nouveautés.

### Changements

- Ajout d'un message obligatoire quand le token est invalide.
- Ajout d'un nouveau state `DocumentWithErrorPage` pour montrer les érreurs dans une page.
- Les failures seront gérer uniquement pour les listeners.
- Ajout des states loading au début des méthodes.

### Correctifs

- Mise à jour du selector. Le state `CategoriesAreFilteredSuccessfully` n'était géré et causait des érreurs en front.


## 🚀 0.15.0 - 07/10/2024
### Nouveautés

- Ajout d'un bloc pour gérer les requêtes HTTP des documents.
- Ajout d'un bloc pour gérer les actions sur la pages des documents.
- Ajout d'un bloc pour gérer l'affichage des infos complémentaire des documents.
- Création d'un sélector qui retourne le total des documents.
- Création d'un sélector qui gère la modification des documents.

### Changements

- Changement des paths pour les documents, parce qu'il y avait une confusion entre `upsert` et `upload`.

### Correctifs

- Pas de fixes.


## 🚀 0.14.0 - 24/09/2024
### Nouveautés

- Ajout de l'étape de suppression d'un projet dans la source.
- Ajout de deux états supplémentaires afin de savoir si le formulaire est en mode create ou update.
- Ajout de deux états supplémentaires afin de savoir la page est en mode édition ou non.

### Changements

- Modification du selector catégory afin de selectionner la catégorie du project afficher.
- Documentation du code.
- Gestion des états lors de la suppression d'un projet.

### Correctifs

- Pas de fixes.


## 🚀 0.13.1 - 24/09/2024
### Nouveautés

- Pas de nouveautés.

### Changements

- Ajout d'un fichier d'exemple dans le project DTO.

### Correctifs

- Mise à jour des models oubliés avec freezed.


## 🚀 0.13.0 - 17/09/2024
### Nouveautés

- Ajout de la dépendance `freezed` et `freezed_annotation`.

### Changements

- Documentation du pubspec.yaml.
- Mise à jour des models et dtos avec freezed.

### Correctifs

- Fix typo sur les noms dtos.


## 🚀 0.12.0 - 16/09/2024
### Nouveautés

- Création d'une ci pour proteger la branche main des PR inappropriées.

### Changements

- Mise à jour de la version de le ci qui test le changement de numéro de version.
- Renommage de fichier et de job pour les autres fichiers.

### Correctifs

- Pas de fixes.

## 🚀 0.11.0 - 16/09/2024
### Nouveautés

- Ajout d'un DTO pour la gestion des dates des projets.
- Création d'un utils pour facilement formatter les dates.
- Ajout du logger dans le core pour être directement utilisable dans les projets front.
- Ajout d'une extension pour mettre en majuscule les jours et mois d'une date.
- Ajout d'un DTO pour le formulaire upsert des projets. (Uniquement la création à été tester).
- Gestion du formulaire de création de projet (bloc/dio).
- Ajout de selector pour les catégories afin de fournir les catégories depuis le core.

### Changements

- Ajout d'un path vers une image par défaut dans le picture_model.dart pour les projets qui n'ont pas de photo.

### Correctifs

- Ajout des méthodes oubliées pour les documents.
- Fix divers chemins.


## 🚀 0.10.0 - 16/09/2024
### Nouveautés

- Ajout d'un DTO one_document pour le formulaire en front
- Ajout d'un DTO multiple_document pour le formulaire en front.
- Ajout d'un model pour les documents.
- Création d'un param spécifique pour la gestion des documents.
- Ajout d'une méthode spécifique pour la gestion des documents dans la source et service.
- Création des requêtes `upsertOneDocument`, `upsertMultipleDocuments` pour la requete HTTP Dio.
- Ajout du systeme de state management pour les documents.

### Changements

- Rename du fichier export DTO.

### Correctifs

- Pas de fixes.


## 🚀 0.9.0 - 05/09/2024
### Nouveautés

- Ajout d'un bloc/state/event pour la gestion des projets uniquement pour l'affiche pour le moment.

### Changements

- Ajout d'une gestion des propriétés nulles pour le model `ProjectModel`.

### Correctifs

- Pas de fixes.


## 🚀 0.8.0 - 05/09/2024
### Nouveautés

- Pas de nouveautés.

### Changements

- Création du model `EnvironementAssociatedModel` pour l'ajouter aux catégories.
- Ajout de propriétés supplémentaires pour les states des catégories afin de gérer le filtrage.
- Ajout d'un event supplémentaire pour une catégorie selectionner (Ex: Angular qui montre que les projets Angular).

### Correctifs

- Pas de fixes.


## 🚀 0.7.0 - 29/08/2024
### Nouveautés

- Création d'un endpoint search.
- Création d'un bloc search environnement.
- Ajout de la gestion du search pour les environnements.
- Ajout de la fonctionnalité pour delete une catégorie.

### Changements

- Ajout de la possibilité de supprimer les id quand ils sont null dans les models.
- Suppression des fichiers inutiles.

### Correctifs

- Pas de fixes.


## 🚀 0.6.0 - 12/08/2024
### Nouveautés

- Création d'un bloc pour gérer la validité des tokens à partir des érreurs 401 et 403 des calls HTTP.

### Changements

- Changement de port par défaut pour le serveur local.
- Suppression de `refresh_expires_in` qui sert à rien.
- Rangement des exports tokens et users.

### Correctifs

- Pas de fixes.


## 🚀 0.5.1 - 08/08/2024
### Nouveautés

- Pas de nouveautés.

### Changements

- Mise à jour du readme sur au passage du projet en publique.

### Correctifs

- Pas de fixes.

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