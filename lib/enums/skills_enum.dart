enum SkillType {
  learning(label: 'learning', value: 'Apprentissage'),
  basic(label: 'basic', value: 'Débutant'),
  intermediate(label: 'intermediate', value: 'Niveau moyen'),
  advanced(label: 'advanced', value: 'Niveau avancé'),
  expert(label: 'expert', value: 'Expert');

  const SkillType({required this.label, required this.value});

  final String label;
  final String value;
}

enum PositionType {
  front(label: 'front', value: 'front'),
  back(label: 'back', value: 'back');

  const PositionType({required this.label, required this.value});

  final String label;
  final String value;
}
