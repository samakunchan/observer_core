enum MenuTextType {
  /// Value : 'environnements'
  environments(value: 'environnements'),

  /// Value : 'categories'
  categories(value: 'categories'),

  /// Value : 'projets'
  projects(value: 'projets'),

  /// Value : 'articles'
  articles(value: 'articles'),

  /// Value : 'organisation'
  organisation(value: 'organisation'),

  /// Value : 'juridiques'
  legals(value: 'juridiques'),

  /// Value : 'documents'
  documents(value: 'documents'),

  /// Value : 'images'
  images(value: 'images'),

  /// Value : 'PDF'
  pdf(value: 'PDF'),

  /// Value : 'paramètres'
  settings(value: 'paramètres'),

  /// Value : 'authentification'
  auth(value: 'authentification'),

  /// Value : 'Services'
  services(value: 'Services'),

  /// Value : 'Technos'
  skills(value: 'Technos'),

  /// Value : 'Arguments'
  reasons(value: 'Arguments'),

  /// Value : ''A propos de moi''
  aboutme(value: 'A propos de moi'),
  ;

  const MenuTextType({required this.value});
  final String value;
}
