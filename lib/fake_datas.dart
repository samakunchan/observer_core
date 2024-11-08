import 'package:observer_core/models/models_export.dart';

class FakeDatas {
  /// ```json
  /// [
  ///    {
  ///       "id": 1,
  ///       "title": "mon titre",
  ///       "slug": "mon-titre",
  ///       "shortDescription": "une description",
  ///       "fullDescription": "une description",
  ///       "client": "le client",
  ///       "dateDebutProjet": "date de début de projet",
  ///       "dateFinProjet": "date de début de projet",
  ///       "createdAt": "2023-08-14T17:51:11.442Z",
  ///       "updatedAt": "2023-08-14T17:51:11.442Z",
  ///       "deletedAt": null,
  ///       "picturesProject": [
  ///         {
  ///           "src": "XXXX-XXXXX-XXXXX-XXXXX-XXXXX-files/images/image.jpg",
  ///           "alt": "Description de mon image"
  ///         },
  ///       ]
  ///       "category": {
  ///         "id": 1,
  ///         "title": "Titre de la categorie",
  ///         "content": "Une description de la catégorie"
  ///       }
  ///     },
  ///     ...
  /// ]
  /// ```
  static List<ProjectModel> projects = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 1,
      'title': 'Mon site web',
      'slug': 'mon-site-web',
      'shortDescription': 'Refonte de site web',
      'fullDescription': "Refonte de site web qui était à l'origine sous Symfony et refais en Angular",
      'client': 'Samakunchan Technology',
      'dateDebutProjet': '01/01/2023',
      'dateFinProjet': '01/01/2023',
      'createdAt': '2023-08-14T17:51:25.291Z',
      'updatedAt': '2023-08-14T17:51:25.291Z',
      'deletedAt': null,
      'picturesProject': [
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/about.jpg', 'alt': 'Hello world'},
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/aboutus.png', 'alt': "Image du projet 'Mon site web 6 n° 3'"},
        {
          'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/apple-touch-icon.png',
          'alt': "Image du projet 'Mon site web 6 n° 4'",
        },
      ],
      'category': {'id': 1, 'title': 'Angular', 'content': 'Framework créé par la team Google. Ma technologie principale'},
    },
    <String, dynamic>{
      'id': 2,
      'title': 'Comlink',
      'slug': 'comlink',
      'shortDescription': 'ERP pour une agence immobilière',
      'fullDescription': "Refonte d'une ERP sous Angular, avec une API CodeIgniter dans un environnement docker",
      'client': 'Samakunchan Technology',
      'dateDebutProjet': '01/01/2023',
      'dateFinProjet': '01/01/2023',
      'createdAt': '2023-08-14T17:51:28.286Z',
      'updatedAt': '2023-08-14T17:51:28.286Z',
      'deletedAt': null,
      'picturesProject': [
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/about.jpg', 'alt': 'Hello world'},
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/aboutus.png', 'alt': "Image du projet 'Mon site web 6 n° 3'"},
        {
          'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/apple-touch-icon.png',
          'alt': "Image du projet 'Mon site web 6 n° 4'",
        }
      ],
      'category': {'id': 1, 'title': 'Angular', 'content': 'Framework créé par la team Google. Ma technologie principale'},
    },
    <String, dynamic>{
      'id': 3,
      'title': 'Pss web',
      'slug': 'pss-web',
      'shortDescription': 'Site fournisseur de service sémantique',
      'fullDescription': 'Maintenance et développement des services autour de la sémantique',
      'client': 'Samakunchan Technology',
      'dateDebutProjet': '01/01/2023',
      'dateFinProjet': '01/01/2023',
      'createdAt': '2023-08-14T17:51:33.730Z',
      'updatedAt': '2023-08-14T17:51:33.730Z',
      'deletedAt': null,
      'picturesProject': [
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/blogs-details.jpg', 'alt': 'Hello world'},
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/blogs.jpg', 'alt': "Image du projet 'Mon site web 6 n° 3'"},
        {
          'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/common-page.jpg',
          'alt': "Image du projet 'Mon site web 6 n° 4'",
        }
      ],
      'category': {'id': 1, 'title': 'Angular', 'content': 'Framework créé par la team Google. Ma technologie principale'},
    },
    <String, dynamic>{
      'id': 4,
      'title': 'Lexicon UI',
      'slug': 'lexicon-ui',
      'shortDescription': "Site d'annotation sémantique",
      'fullDescription':
          "Site d'annotation sémantique permettant aux chercheurs IA d'alimenter le système afin d'affiner les résultats des modèles.",
      'client': 'Samakunchan Technology',
      'dateDebutProjet': '01/01/2023',
      'dateFinProjet': '01/01/2023',
      'createdAt': '2023-08-14T17:51:37.551Z',
      'updatedAt': '2023-08-14T17:51:37.551Z',
      'deletedAt': null,
      'picturesProject': [
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/contact.jpg', 'alt': 'Hello world'},
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/cta-bg.jpg', 'alt': "Image du projet 'Mon site web 6 n° 3'"},
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/faq.jpg', 'alt': "Image du projet 'Mon site web 6 n° 4'"},
      ],
      'category': {'id': 1, 'title': 'Angular', 'content': 'Framework créé par la team Google. Ma technologie principale'},
    },
    <String, dynamic>{
      'id': 5,
      'title': 'Prevyo',
      'slug': 'prevyo',
      'shortDescription': "Interface graphique d'analyse d'emails",
      'fullDescription':
          "Interface graphique d'analyse d'emails permettant aux utilisateurs de connecter leurs comptes emails (google, outlook), de lancer des analyser et effectuer des actions (configurer par l'utilisateur) si un résultat est trouvé.",
      'client': 'Samakunchan Technology',
      'dateDebutProjet': '01/01/2023',
      'dateFinProjet': '01/01/2023',
      'createdAt': '2023-08-14T17:51:43.802Z',
      'updatedAt': '2023-08-14T17:51:43.802Z',
      'deletedAt': null,
      'picturesProject': [
        {'src': '75a534fc-6617-4877-bce9-3649bf5d38e8-842127201-files/images/services.jpg', 'alt': 'Hello world'},
      ],
      'category': {
        'id': 2,
        'title': 'Flutter',
        'content': 'Framework créé par la team Google. Avec le langage dart, cette techno est très utilisé pour les applications mobiles',
      },
    },
  ].map(ProjectModel.fromJson).toList();

  /// ```json
  /// [
  ///   {
  ///     'id': 1,
  ///     'title': 'Titre de la categorie',
  ///     'content': 'Une description de la catégorie',
  ///   },
  ///   ...
  /// ]
  /// ```
  static List<CategoryModel> categories = <Map<String, dynamic>>[
    <String, dynamic>{'id': 1, 'title': 'Angular', 'content': 'Framework créé par la team Google. Ma technologie principale'},
    <String, dynamic>{
      'id': 2,
      'title': 'Flutter',
      'content': 'Framework créé par la team Google. Avec le langage dart, cette techno est très utilisé pour les applications mobiles',
    },
    <String, dynamic>{
      'id': 3,
      'title': 'Symfony',
      'content': 'Framework créé par la Sensio labs permettant des créés des sites webs avec une structure moderne.',
    },
    <String, dynamic>{
      'id': 4,
      'title': 'Shopify',
      'content': 'CMS e-commerce Canadien permettant de créer des sites e-commerce contre un abonnement mensuel.',
    },
    <String, dynamic>{
      'id': 5,
      'title': 'Web',
      'content': 'Cette catégorie présente tout les articles convernant le web, les bonnes pratiques ainsi que les nouveautés.',
    },
    <String, dynamic>{
      'id': 6,
      'title': 'Web marketing',
      'content': "Cette catégorie présente les bonnes pratiques de promotion d'un site web ou d'une application web",
    },
    <String, dynamic>{
      'id': 7,
      'title': 'Outils',
      'content': "Cette catégorie présente les outils utiles pour faciliter le développement d'une application ou site web.",
    },
    <String, dynamic>{
      'id': 8,
      'title': 'Générale',
      'content': 'Cette catégorie présente mes annonces concernant les applications et sites web produit',
    },
    <String, dynamic>{
      'id': 9,
      'title': 'Devis',
      'content': "Choisissez cette catégorie si vous avez un projet et que vous souhaitez l'estimer",
    },
    <String, dynamic>{
      'id': 10,
      'title': 'Informations',
      'content': 'Choisissez cette catégorie si vous souhaitez en savoir plus sur les services que je propose',
    },
    <String, dynamic>{
      'id': 11,
      'title': 'Autres',
      'content': 'Choisissez cette catégorie si vous avez une demande spécifique qui ne se trouve pas dans les catégories par défaut',
    }
  ].map(CategoryModel.fromJson).toList();

  /// ```json
  /// [
  ///   {
  ///     'id': 1,
  ///     'title': 'Titre de l'environnement',
  ///     'categories': [
  ///       {
  ///         'id': 1,
  ///         'title': 'Titre de la categorie 1',
  ///         'content': 'Une description de la catégorie 1'
  ///       },
  ///       {
  ///         'id': 2,
  ///         'title': 'Titre de la categorie 2',
  ///         'content': 'Une description de la catégorie 2'
  ///       },
  ///     ]
  ///   }
  ///   ...
  /// ]
  /// ```
  static List<EnvironmentModel> environments = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 3,
      'title': 'Portfolio',
      'categories': [
        {'id': 1, 'title': 'Angular', 'content': 'Framework créé par la team Google. Ma technologie principale'},
        {
          'id': 2,
          'title': 'Flutter',
          'content': 'Framework créé par la team Google. Avec le langage dart, cette techno est très utilisé pour les applications mobiles',
        },
        {
          'id': 3,
          'title': 'Symfony',
          'content': 'Framework créé par la Sensio labs permettant des créés des sites webs avec une structure moderne.',
        },
        {
          'id': 4,
          'title': 'Shopify',
          'content': 'CMS e-commerce Canadien permettant de créer des sites e-commerce contre un abonnement mensuel.',
        }
      ],
    },
    <String, dynamic>{
      'id': 2,
      'title': 'Blog',
      'categories': [
        {
          'id': 5,
          'title': 'Web',
          'content': 'Cette catégorie présente tout les articles convernant le web, les bonnes pratiques ainsi que les nouveautés.',
        },
        {
          'id': 6,
          'title': 'Web marketing',
          'content': "Cette catégorie présente les bonnes pratiques de promotion d'un site web ou d'une application web",
        },
        {
          'id': 7,
          'title': 'Outils',
          'content': "Cette catégorie présente les outils utiles pour faciliter le développement d'une application ou site web.",
        },
        {'id': 8, 'title': 'Générale', 'content': 'Cette catégorie présente mes annonces concernant les applications et sites web produit'},
      ],
    },
    <String, dynamic>{
      'id': 1,
      'title': 'Email',
      'categories': [
        {'id': 9, 'title': 'Devis', 'content': "Choisissez cette catégorie si vous avez un projet et que vous souhaitez l'estimer"},
        {
          'id': 10,
          'title': 'Informations',
          'content': 'Choisissez cette catégorie si vous souhaitez en savoir plus sur les services que je propose',
        },
        {
          'id': 11,
          'title': 'Autres',
          'content': 'Choisissez cette catégorie si vous avez une demande spécifique qui ne se trouve pas dans les catégories par défaut',
        },
      ],
    }
  ].map(EnvironmentModel.fromJson).toList();

  static OrganisationModel organisation = OrganisationModel.fromJson(<String, dynamic>{
    'id': 1,
    'siren': 842127201,
    'nom_entreprise': 'DevPapangue',
    'code_naf': '99999',
    'libelle_code_naf': 'Informatique',
    'domaine_activite': 'Informatique',
    'date_creation': '2018-09-12',
    'categorie_juridique': 1000,
    'forme_juridique': 'Entreprise individuel',
    'entreprise_employeuse': false,
    'capital': 10000,
    'derniere_mise_a_jour_sirene': '2018-09-12',
    'dernier_traitement': '2018-09-10',
    'numero_tva_intracommunautaire': 'FR984194984',
    'representants': [
      {
        'uuid': '75a534fc-6617-4877-bce9-3649bf5d38e8',
        'qualite': 'M',
        'personne_morale': false,
        'date_prise_de_poste': '2018-09-10',
        'titre': 'Monsieur',
        'nom': 'Badjah',
        'prenom': 'Cédric',
        'nom_complet': 'Cédric BADJAH',
      }
    ],
    'siege': {
      'id': 1,
      'siret': '84212720100015',
      'numero_voie': 537,
      'indice_repetition': null,
      'type_voie': 'Rue',
      'libelle_voie': 'du pré aux clercs',
      'complement_adresse': '',
      'adresse_ligne_1': '537 rue du pré aux clercs',
      'adresse_ligne_2': '',
      'code_postal': '34090',
      'ville': 'Montpellier',
      'pays': 'France',
      'code_pays': 'FR',
      'latitude': '43.610769',
      'longitude': '3.876716',
    },
  });
}
